class Questionaire < ApplicationRecord
  has_many :questions

  include RailsAdmin::QuestionaireAdmin

  attr_readonly :questions_count

  belongs_to :questionable, polymorphic: true, optional: true
end
