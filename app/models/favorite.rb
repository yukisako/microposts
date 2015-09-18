class Favorite < ActiveRecord::Base
  belongs_to :fav_tweet, class_name "Micropost"
  belongs_to :fav_user, class_name "User"

  #お気に入りに登録
  def favorite(fav_tweet)
    favorite_relationships.create(favorite_tweet_id: fav_tweet.id)
  end

  #お気に入り解除
  def back_favorite(fav_tweet)
    favorite_relationships.find_by(favorite_tweet_id: fav_tweet.id).destroy
  end


  #あるツイートをお気に入りに登録しているかどうか
  def favorite?(fav_tweet)
    favorite_relationships.include?(fav_tweet)
  end



end
