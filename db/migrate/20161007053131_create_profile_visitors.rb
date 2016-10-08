class CreateProfileVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_visitors do |t|
      t.references :visitee
      t.references :visitor

      t.timestamps
    end
  end
end
