class AddInvestorProfileToMeeting < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :investor_profile, foreign_key: true
  end
end
