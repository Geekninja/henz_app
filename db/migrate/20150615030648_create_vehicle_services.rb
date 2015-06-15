class CreateVehicleServices < ActiveRecord::Migration
  def change
    create_table :vehicle_services do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
