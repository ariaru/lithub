class ChangeReferencesInRevisions < ActiveRecord::Migration
  def change
    remove_reference :revisions, :branch
    add_reference :revisions, :document, index: true, foreign_key: true
  end
end
