class RenameVersionsToRevisions < ActiveRecord::Migration
  def change
    rename_table :versions, :revisions
  end
end
