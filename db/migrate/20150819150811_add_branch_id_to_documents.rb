class AddBranchIdToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :branch, index: true, foreign_key: true
  end
end
