class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :answer
      t.string :category
      t.string :file
      t.integer :questionaire_id

      t.timestamps default: Time.now
    end

    add_index :questions, :questionaire_id
    add_index :questions, :category
  end
end
