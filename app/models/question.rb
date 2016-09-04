class Question < ApplicationRecord
  belongs_to :questionaire, :counter_cache => :questions_count

  include RailsAdmin::QuestionAdmin
end
