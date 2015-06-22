class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :cnpj
      t.string :state_number
      t.string :city_number
      t.string :city
      t.string :state
      t.string :cep
      t.string :contact_name
      t.string :contact_telphone
      t.string :contact_email
      t.string :telphone
      t.string :telphone_optional
      t.string :email
      t.string :email_optional
      t.text :observations
      t.references :supplier_category, index: true
      t.integer :supplier_importance
      t.references :project, index: true

      t.timestamps null: false
    end
  end
end
