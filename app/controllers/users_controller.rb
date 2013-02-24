class UsersController < ApplicationController

  before_filter :require_login, only: [:update, :destroy]
  before_filter :the_right_user,  only: [:edit, :update, :destroy]
  expose(:user)
  expose(:users)
  expose(:autocomplete_items) { LanguageListing.order(:name).map(&:name) }

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
