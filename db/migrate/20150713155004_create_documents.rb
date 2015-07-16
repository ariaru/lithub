class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :user, index: true
      t.string :title
      t.string :writing_mode
      t.integer :current_version, index: true

      t.timestamps null: false
    end
    add_foreign_key :documents, :repositories
    add_foreign_key :documents, :users
  end
end
