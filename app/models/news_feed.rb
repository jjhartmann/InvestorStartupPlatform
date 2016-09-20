require 'carrierwave'

class NewsFeed < ApplicationRecord

  mount_uploader :photo, PhotoUploader

end
