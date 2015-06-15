class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :bill_type
      t.references :bill_category, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :status
      t.string :value
      t.references :supplier, index: true, foreign_key: true
      t.text :observation
      t.date :deadline

      t.timestamps null: false
    end
  end
end
