class CreateEnterpriseUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprise_users do |t|
      t.integer :enterprise_id
      t.string :user_email
      t.string :role_identifier
      t.string :member_title, default: ''
      t.boolean :confirmed, default: false

      t.timestamps default: Time.now
    end

    add_index :enterprise_users, :enterprise_id
    add_index :enterprise_users, :user_email
    add_index :enterprise_users, [:enterprise_id, :user_email]
    add_index :enterprise_users, :confirmed
    add_index :enterprise_users, [:enterprise_id, :confirmed]

  end
end
