class Questionaire < ApplicationRecord
  has_many :questions

  include RailsAdmin::QuestionaireAdmin

  attr_readonly :questions_count
end
