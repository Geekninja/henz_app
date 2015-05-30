class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :cep
      t.references :responsible, index: true#, foreign_key: true
      t.string :geolocation
      t.string :city
      t.string :state
      t.string :telphone
      t.string :telphone_optional
      t.string :email
      t.string :email_optional
      t.references :project, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
