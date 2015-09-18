class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :fav_tweet, index: true
      t.references :fav_user, index: true

      t.timestamps null: false

      t.index [:fav_tweet_id, :fav_user_id], unique: true
    end
  end
end
