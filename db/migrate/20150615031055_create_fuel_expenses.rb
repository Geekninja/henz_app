class CreateFuelExpenses < ActiveRecord::Migration
  def change
    create_table :fuel_expenses do |t|
      t.references :project, index: true#, foreign_key: true
      t.references :vehicle, index: true#, foreign_key: true
      t.integer :km_start
      t.integer :km_end
      t.float :fuel_price_lt, default: 0.00
      t.float :fuel_lt, default: 0.00
      t.date :date
      t.boolean :status
      t.string :note
      t.text :observations
      t.references :supplier, index: true

      t.timestamps null: false
    end
  end
end
