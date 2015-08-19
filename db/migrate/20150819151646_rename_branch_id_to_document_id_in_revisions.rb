class RenameBranchIdToDocumentIdInRevisions < ActiveRecord::Migration
  def change
    change_table :revisions do |t|
      t.rename :branch_id, :document_id
    end
  end
end
