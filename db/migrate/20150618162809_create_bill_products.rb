class CreateBillProducts < ActiveRecord::Migration
  def change
    create_table :bill_products do |t|
      t.references :bill, index: true#, foreign_key: true
      t.string :title
      t.integer :type_product
      t.string :description
      t.float :value
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
