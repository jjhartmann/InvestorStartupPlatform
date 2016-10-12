class ChangeDefaultValueOfInvitaionAcceptanceStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default :invitations, :acceptance_status, "requested"
  end
end
