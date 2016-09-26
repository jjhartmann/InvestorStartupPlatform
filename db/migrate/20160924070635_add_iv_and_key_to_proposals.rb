class AddIvAndKeyToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :iv, :binary
    add_column :proposals, :key, :binary
  end
end
