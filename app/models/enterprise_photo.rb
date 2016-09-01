require 'carrierwave'

class EnterprisePhoto < ApplicationRecord
  mount_uploader :photo, EnterpriseLogoUploader

  belongs_to :enterprise
end