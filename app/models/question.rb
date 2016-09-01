class Question < ApplicationRecord
  belongs_to :questionaire, :counter_cache => :questions_count

end
