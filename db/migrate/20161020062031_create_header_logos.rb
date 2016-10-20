class CreateHeaderLogos < ActiveRecord::Migration[5.0]
  def change
    create_table :header_logos do |t|

      t.timestamps
    end
  end
end
