class CreateEnterprisePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprise_photos do |t|
      t.string :photo
      t.integer :enterprise_id

      t.timestamps default: Time.now
    end

    add_index :enterprise_photos, :enterprise_id
  end
end
