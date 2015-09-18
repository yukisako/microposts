class FavoritesController < ApplicationController
  def create
    @tweet = User.find(params[:tweet_id])
    current_user.favorite(@tweet)
  end

  def destroy
    @tweet = current_user.following_relationships.find(params[:tweet_id]).followed
    current_user.unfollow(@tweet)
  end

end
