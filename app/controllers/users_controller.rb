class UsersController < ApplicationController

  respond_to :html, :json

  before_filter :require_login, only: [:edit, :update, :destroy,
                                      :following, :followers]
  before_filter :the_right_user,  only: [:edit, :update, :destroy]


  expose(:user)
  expose(:users)
  expose(:autocomplete_items) { LanguageListing.order(:name).map(&:name) }

  def show
    recipient = user
    sender = current_user
  end

  def messages
    @received_messages = current_user.received_messages
    @sent_messages = current_user.sent_messages
  end

  def index
    @search = User.search(params[:q])
    @users = @search.result(distinct: true)
  end

  def create
    if user.save
      auto_login(user)
      redirect_to user, :notice => "Your account has been created!"
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to(user)
    else
      render :edit
    end
  end

  def destroy
    if user.delete
      redirect_to root_path, :notice => "Your account has been deleted!"
    else
      render :edit
    end
  end

  def following
    @title = "Following"
    @users = user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def send_message
    recipient = User.find(params[:user].to_i)
    sender = User.find(params[:sender].to_i)
    message = Message.new
    message.body = params[:message]
    message.sender = sender
    message.recipient = recipient
    message.save
    if message.save
      redirect_to user_path(recipient), notice: "Message sent"
      else
      end
    end

  private

    def the_right_user
      if current_user != user
        redirect_to root_path, alert: "You aren't allowed to edit someone else's profile!"
      else
      end
    end

    # def admin_user
    #   redirect_to root_path unless current_user.admin?
    # end

end
