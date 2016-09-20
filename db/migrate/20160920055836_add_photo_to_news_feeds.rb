class AddPhotoToNewsFeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :news_feeds, :photo, :string
  end
end
