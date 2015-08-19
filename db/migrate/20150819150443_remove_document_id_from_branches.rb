class RemoveDocumentIdFromBranches < ActiveRecord::Migration
  def change
    remove_column :branches, :document_id, :integer
  end
end
