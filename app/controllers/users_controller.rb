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
    @ip_address = request.ip
    # @ip_address = "143.93.127.255" #German IP address for testing
    search_params
    ip_detect_users(@users, @ip_address)
    if @newresults
      @newresults = @newresults.sort_by{|e| e[:last_login_at]}
      @newresults.reverse!
      @users = @users - @newresults
      # @newresults.sort! .sort! {|a,b| (a[:meets_face_to_face] == b[:meets_face_to_face]) ? ((a[:id] < b[:id]) ? -1 : 1) : (a[:meets_face_to_face] ? -1 : 1)}
    else
      @newresults = []
    end
    @users.sort! {|a,b| (a[:last_login_at] == b[:last_login_at]) ? ((a[:id] < b[:id]) ? -1 : 1) : (a[:last_login_at] ? -1 : 1)}
  end

  def ip_detect_users(users, ip_address)
    @near_users = User.near(ip_address, 19)
    if @near_users.present?
      @newresults = (@near_users & @users)
      @newresults.sort! {|a,b| (a[:last_login_at] == b[:last_login_at]) ? ((a[:id] < b[:id]) ? -1 : 1) : (a[:last_login_at] ? -1 : 1)}
    else
    end
  end

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
    @newresults = @users
    if params[:location].present?
      location_users(@users)
    else
      country_users(@users) unless params[:country].blank? || params[:country] = ""
    end
    right_age(@newresults) unless params[:min_age].blank? && params[:max_age].blank?
    @newresults = @rightage unless @rightage.nil?
    params[:country] = nil
    params[:location] = nil
    params[:distance] = nil
  end

  def country_users(users)
    country = params[:country][0]
    @country_users = User.where(country: country)
    @locationresults = @country_users & @users
    @newresults = @locationresults & @users
  end

  def location_users(users)
    if params[:distance]
      distance = params[:distance].to_f
    else
      distance = 19
    end
    if params[:country].present?
      country = params[:country][0]
      location = params[:location] + "," + country
    else
      location = params[:location]
    end
    @near_users = User.near(location, distance)
    @locationresults = @near_users & @users
    @newresults = @locationresults & @users
  end

  def search_params
    @search = User.search(params[:q])
    @users = @search.result(distinct: true)
    @users = @users.sort_by{|e| e[:last_login_at]}
    @users.reverse!
  end

  def create
    if user.save
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
