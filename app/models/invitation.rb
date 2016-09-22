class Invitation < ApplicationRecord
  belongs_to :enterprise
  belongs_to :user
end
