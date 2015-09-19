class FavoritesController < ApplicationController
  def create
    @tweet = params[:favorite]
    @user = params[:user_id]
    current_user.favorite(@tweet)
    #redirect_to user_path(@user) #ホームでお気に入りに追加したときにuser画面に戻られたら困る
    redirect_to :back
  end

  def destroy
    @tweet = params[:favorite]
    @user = params[:user_id]
    current_user.back_favorite(@tweet)
    #redirect_to user_path(@user) #ホームでお気に入りに追加したときにuser画面に戻られたら困る
    redirect_to :back
  end
  
end
