class EnterprisePhoto < ApplicationRecord
  mount_uploader :photo, StartupPhotoUploader

  belongs_to :enterprise
end
4