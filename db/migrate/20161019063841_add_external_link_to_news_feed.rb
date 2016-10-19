class AddExternalLinkToNewsFeed < ActiveRecord::Migration[5.0]
  def change
    add_column :news_feeds, :external_link, :text
  end
end
