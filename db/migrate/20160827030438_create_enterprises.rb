class CreateEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.text :pitch
      t.integer :funds_to_raise
      t.string :industry
      t.string :enterprise_stage
      t.string :stage_identifier
      t.string :market_identifier
      t.string :location
      t.text :description
      t.string :logo
      t.integer :followers_count, default: 0
      t.integer :followed_count, default: 0
      t.integer :comment_count, default: 0

      t.timestamps default: Time.now
    end

    add_index :enterprises, :name, unique: true
    add_index :enterprises, :location
    add_index :enterprises, [:market_identifier, :location]

  end
end
