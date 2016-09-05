require 'carrierwave'

class Question < ApplicationRecord
  include RailsAdmin::QuestionAdmin

  mount_uploader :file, FileUploader

  belongs_to :questionaire, :counter_cache => :questions_count
end
