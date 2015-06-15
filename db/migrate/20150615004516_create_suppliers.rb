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
      t.string :contact_name_1
      t.string :contact_name_2
      t.string :contact_name_3
      t.string :contact_telphone_2
      t.string :contact_telphone_2
      t.string :contact_telphone_3
      t.string :contact_email_1
      t.string :contact_email_2
      t.string :contact_email_3
      t.string :telphone
      t.string :telphone_optional
      t.string :email
      t.string :email_optional
      t.string :observations

      t.timestamps null: false
    end
  end
end
