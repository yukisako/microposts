class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  has_many :favorite_relationships, class_name: "Favorite", foreign_key: "fav_tweet_id"
  has_many :favorite_tweets, through: :favorite_tweets, source: :favorite_tweets

end
