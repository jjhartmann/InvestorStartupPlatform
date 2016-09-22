class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :enterprise, foreign_key: true
      t.references :user, foreign_key: true
      t.string :email
      t.boolean :acceptance_status, default: false

      t.timestamps
    end
  end
end
