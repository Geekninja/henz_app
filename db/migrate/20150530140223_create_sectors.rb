class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :description
      t.string :acron
      t.references :responsible, index: true#, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
