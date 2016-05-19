class CreateBudgetProducts < ActiveRecord::Migration
  def change
    create_table :budget_products do |t|
      t.string :product
      t.string :unit
      t.integer :quantity
      t.float :unit_value
      t.float :total_value
      t.references :budget, index: true
      t.string :observation

      t.timestamps null: false
    end
  end
end
