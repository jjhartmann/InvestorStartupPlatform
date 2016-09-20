json.extract! news_feed, :id, :title, :description, :created_at, :updated_at
json.url news_feed_url(news_feed, format: :json)