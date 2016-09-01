class Questionaire < ApplicationRecord
  has_many :questions

  attr_readonly :questions_count
end
