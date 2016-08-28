class EnterpriseUser < ApplicationRecord
  belongs_to :user, :foreign_key => 'user_email', :primary_key => 'email'
  belongs_to :enterprise
end
