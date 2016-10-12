class ChangeFieldTypeInInvitation < ActiveRecord::Migration[5.0]
  def change
    change_column :invitations, :acceptance_status, :string
  end
end
