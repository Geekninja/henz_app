class CreateGasStations < ActiveRecord::Migration
  def change
    create_table :gas_stations do |t|
      t.string :name
      t.string :location
      t.string :city
      t.string :state
      t.string :geolocation
      t.text :observation
      t.references :project, index: true

      t.timestamps null: false
    end
  end
end
