class ChangeVersionsParentToParentId < ActiveRecord::Migration
  def change
    rename_column :versions, :parent, :parent_id
  end
end
