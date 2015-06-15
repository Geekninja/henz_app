class CreateFuelExpenses < ActiveRecord::Migration
  def change
    create_table :fuel_expenses do |t|
      t.references :project, index: true, foreign_key: true
      t.references :vehicle, index: true, foreign_key: true
      t.references :gas_station, index: true, foreign_key: true
      t.integer :km_start
      t.integer :km_end
      t.float :fuel_price_lt
      t.date :date
      t.boolean :status
      t.text :observations

      t.timestamps null: false
    end
  end
end
