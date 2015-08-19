class AddBranchIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :branch_id, :integer
  end
end
