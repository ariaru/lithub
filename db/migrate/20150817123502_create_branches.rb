class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.references :document, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
