class CreateOfficeSupports < ActiveRecord::Migration
  def change
    create_table :office_supports do |t|
      t.string :name
      t.string :local
      t.references :responsible, index: true#, foreign_key: true
      t.string :geolocation
      t.string :observation
      t.references :project, index: true#, foreign_key: true
      t.references :office, index: true#, foreign_key: true
      t.string :telphone
      t.string :telphone_optional
      t.string :city
      t.string :state
      t.string :email

      t.timestamps null: false
    end
  end
end
