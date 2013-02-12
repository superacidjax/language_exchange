class UsersController < ApplicationController

  expose(:user)
  expose(:users)


  def create
    if user.save
      redirect_to(user)
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

end
