require 'carrierwave'

class EnterprisePhoto < ApplicationRecord
  include RailsAdmin::EnterprisePhotoAdmin

  mount_uploader :photo, EnterpriseLogoUploader

  belongs_to :enterprise
end