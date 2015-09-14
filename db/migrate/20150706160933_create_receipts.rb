class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.references :bill_category, index: true#, foreign_key: true
      t.references :project, index: true#, foreign_key: true
      
      t.string :name
      t.text :description
      
      t.boolean :status, default: false
      
      t.string :value
      t.text :observation
      t.date :deadline
      
      t.string :archive
      
      t.date  :date_payment
      t.text  :observation_receipt

      t.timestamps null: false
    end
  end
end
