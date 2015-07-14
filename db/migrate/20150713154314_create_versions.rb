class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
#      t.references :author, index: true
      t.boolean :root
      t.integer :parent, index: true, null: true
      t.text :summary
      t.text :body
      t.text :tags

      t.timestamps null: false
    end
#    add_foreign_key :versions, :authors
    add_foreign_key :versions, :versions, column: :parent
  end
end
