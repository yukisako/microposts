class FavoritesController < ApplicationController
  def create
    @tweet = params[:favorite]
    @user = params[:user_id]
    current_user.favorite(@tweet)
    redirect_to user_path(@user)
  end

  def destroy
    @tweet = params[:favorite]
    @user = params[:user_id]
    current_user.back_favorite(@tweet)
    redirect_to user_path(@user)
  end
  
end
