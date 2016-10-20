class AddLogoToHeaderLogo < ActiveRecord::Migration[5.0]
  def change
    add_column :header_logos, :logo, :string
  end
end
