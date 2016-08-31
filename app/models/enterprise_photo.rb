class EnterprisePhoto < ApplicationRecord
  mount_uploader :photo, EnterprisePhotoUploader

  belongs_to :enterprise
end
4