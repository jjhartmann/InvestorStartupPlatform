module Timming
  extend ActiveSupport::Concern
  include ActionView::Helpers::DateHelper
  

  def created_time
    time_ago_in_words(created_at)
  end
end
