class ChangeIntegerLimitInOffer < ActiveRecord::Migration[5.0]
  def change
    change_column :offers, :amount_to_offer, :integer, limit: 8
  end
end
