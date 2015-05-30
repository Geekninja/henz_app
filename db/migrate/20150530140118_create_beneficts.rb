class CreateBeneficts < ActiveRecord::Migration
  def change
    create_table :beneficts do |t|
      t.string :name
      t.string :description
      t.decimal :default_value
      t.string :observation
      t.boolean :status

      t.timestamps null: false
    end
  end
end
