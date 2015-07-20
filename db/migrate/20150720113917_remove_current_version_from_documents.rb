class RemoveCurrentVersionFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :current_version, :integer
  end
end
