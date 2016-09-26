class AddDocumentToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :document, :string
  end
end
