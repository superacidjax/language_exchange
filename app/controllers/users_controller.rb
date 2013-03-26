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

  def index
    search_params
  end

  def search
    search_params
    if params[:location]
      location = params[:location]
      @near_users = User.near(location, 20)
      @newresults = @near_users & @users
      @onlineusers = []
      @users.each do |u|
        @onlineusers << u if u.meets_online? || u.meets_telephone?
      end
    else
    end
    unless params[:min_age].blank? && params[:max_age].blank?
      @rightage = []
      @onlineusers.each do |u|
        if (u.birthday_age <= params[:max_age].to_i)
          if (u.birthday_age >= params[:min_age].to_i)
            @rightage << u
          else
          end
        else
        end
      end
    else
      # Task.find(:all, :conditions => ["complete=? and priority IS ?", false, nil])
    end
    if !@rightage.blank?
      @newresults = @rightage & @users
      @onlineusers = @rightage & @onlineusers
    else
    end

  end

  def search_params
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
