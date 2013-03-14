class RelationshipsController < ApplicationController
  before_filter :require_login

  expose(:user)
  respond_to :html, :js

  def create
    user = User.find(params[:relationship][:followed_id])
    current_user.follow!(user)
    redirect_to user, notice: "Added to your short list"
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow!(user)
    redirect_to user, notice: "Removed from your short list"
  end
end
