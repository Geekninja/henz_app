class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :project_category, index: true#, foreign_key: true
      t.string :name
      t.string :local
      t.references :responsible, index: true#, foreign_key: true
      t.string :geolocation
      t.text :description
      t.text :observation
      t.integer :priority

      t.timestamps null: false
    end
  end
end
