class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.references :quotation, index: true, foreign_key: true
      t.references :supplier, index: true, foreign_key: true
      t.string  :note
      t.decimal :value
      t.date :date
      t.integer :status

      t.timestamps null: false
    end
  end
end
