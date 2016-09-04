class EnterpriseUser < ApplicationRecord
  include RailsAdmin::EnterpriseUserAdmin
  include RailsAdminCharts

  belongs_to :user, :foreign_key => 'user_email', :primary_key => 'email'
  belongs_to :enterprise


  def email
    user_email
  end
end
