class CreateBudgetProducts < ActiveRecord::Migration
  def change
    create_table :budget_products do |t|
      t.references :budget, index: true, foreign_key: true
      t.string :name
      t.integer :quantity
      t.string :value
      t.text :observation

      t.timestamps null: false
    end
  end
end
