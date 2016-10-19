class CreateStartupFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :startup_features do |t|
      t.references :user_profile, foreign_key: true
      t.text :announcement

      t.timestamps
    end
  end
end
