class CreateNewsFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.text :body
      t.string link

      t.timestamps
    end
  end
end
