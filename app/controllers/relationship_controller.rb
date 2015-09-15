class RelationshipController < ApplicationController
  before_action : logged_in_user

  def create
    @user = User.find(params[:followed?id])
    current_user.follow(@user)
  end

  def destroy
    @user = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@user)
end
