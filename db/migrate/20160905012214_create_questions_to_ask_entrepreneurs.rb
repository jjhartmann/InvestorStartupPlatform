class CreateQuestionsToAskEntrepreneurs < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_to_ask_entrepreneurs do |t|
      t.string :question
      t.string :qtype
      t.integer :position

      t.timestamps
    end
  end
end
