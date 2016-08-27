class CreateQuesitons < ActiveRecord::Migration[5.0]
  def change
    create_table :quesitons do |t|
      t.text :question
      t.text :answer
      t.string :category

      t.timestamps default: Time.now
    end
  end
end
