class PagesController < ApplicationController

  expose(:users)
  expose(:user)

  def home
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
  end

  def about
  end

  def privacy
  end

  def contact
  end

  def terms_of_service
  end
end
