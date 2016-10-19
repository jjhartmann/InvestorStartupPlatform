require 'carrierwave'

class NewsFeed < ApplicationRecord
  include Timming

  validates :description, presence: true
  validates :title, presence: true

  mount_uploader :photo, PhotoUploader
end
