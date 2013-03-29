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

  def location_users(users)
    distance = params[:distance].to_f
    distance = distance * 0.621371
    location = params[:location]
    @near_users = User.near(location, distance)
    @locationresults = @near_users & @users
    @newresults = @locationresults & @users
  end

  # def online(users)
  #   online = params[:meets_online]
  #   @onlineusers = User.where(meets_online: true)
  #   @onlineresults = @onlineusers & @users
  # end

  # def telephone(users)
  #   telephone = params[:meets_telephone]
  #   @telephoneusers = User.where(meets_telephone: true)
  #   @telephoneresults = @telephoneusers & @users
  # end

  # def face_to_face(users)
  #   face_to_face = params[:meets_face_to_face]
  #   @faceusers = User.where(meets_face_to_face: true)
  #   @faceresults = @faceusers & @users
  # end

  def right_age(users)
    @rightage = []
    users.each do |u|
      if params[:max_age].present? && params[:min_age].present?
            if (u.birthday_age <= params[:max_age].to_i)
                  if (u.birthday_age >= params[:min_age].to_i)
                    @rightage << u
                  else
                  end
            else
            end
      elsif params[:max_age].present? && params[:min_age].blank?
            if (u.birthday_age <= params[:max_age].to_i)
              @rightage << u
            else
            end
      elsif params[:min_age].present? && params[:max_age].blank?
            if (u.birthday_age >= params[:min_age].to_i)
              @rightage << u
            else
            end
      else
      end
    end
  end

  def search
    search_params
    location_users(@users) unless params[:location].blank?
    @newresults = @users unless @locationresults
    right_age(@newresults) unless params[:min_age].blank? && params[:max_age].blank?
    @newresults = @rightage unless @rightage.nil?
  end

  def search_params
    @search = User.search(params[:q])
    @users = @search.result(distinct: true)
  end

  def create
    if user.save
      # if params[:user][:photo].present?
      #   render :crop
      # else
      # end
      auto_login(user)
      redirect_to user, notice: "Your account has been created!"
    else
      render :new
    end
  end

  def update
    if user.save
      # if params[:user][:photo].present?
      #   render :crop
      # else
        redirect_to user, notice: "Your account has been updated"
      # end
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
