class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.references :vehicle_service, index: true, foreign_key: true
      t.integer :vehicle_type
      t.references :vehicle_category, index: true, foreign_key: true
      t.text :observations
      t.date :acquired
      t.string :state
      t.string :fuel

      t.timestamps null: false
    end
  end
end
