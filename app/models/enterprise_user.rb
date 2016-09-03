class EnterpriseUser < ApplicationRecord
  include RailsAdmin::EnterpriseUserAdmin

  belongs_to :user, :foreign_key => 'user_email', :primary_key => 'email'
  belongs_to :enterprise
end
