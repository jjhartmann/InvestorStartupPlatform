class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :offer_title
      t.string :text
      t.text :description
      t.integer :amount_to_offer
      t.references :user, foreign_key: true
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
