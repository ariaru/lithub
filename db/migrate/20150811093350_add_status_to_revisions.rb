class AddStatusToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :status, :string, default: "draft"
  end
end
