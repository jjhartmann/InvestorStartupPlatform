class CreateQuestionaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionaires do |t|
      t.string :title
      t.text :instruction
      t.text :disclaimer
      t.integer :questions_count

      # Reference for User
      t.references :questionable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :questionaires, :title
  end
end
