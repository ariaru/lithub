class AddBranchToRevisions < ActiveRecord::Migration
  def change
    add_reference :revisions, :branch, index: true, foreign_key: true
  end
end
