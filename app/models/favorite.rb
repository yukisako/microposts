class Favorite < ActiveRecord::Base
  belongs_to :fav_tweet, class_name: "Micropost"
  belongs_to :fav_user, class_name: "User"
end
