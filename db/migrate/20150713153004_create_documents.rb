class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :initiator, index: true
      t.string :title
      t.string :writing_mode
      t.references :current_version, index: true

      t.timestamps null: false
    end
    add_foreign_key :documents, :current_versions
    add_foreign_key :documents, :initiators
  end
end
