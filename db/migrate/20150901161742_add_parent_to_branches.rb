class AddParentToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :parent_id, :integer, index: true
    add_foreign_key :branches, :branches, column: :parent_id
  end
end
