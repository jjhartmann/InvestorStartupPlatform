class AddCompanyIdTypeFieldToNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :company_id_type, :integer
  end
end
