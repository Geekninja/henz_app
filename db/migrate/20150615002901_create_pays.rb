class CreatePays < ActiveRecord::Migration
  def change
    create_table :pays do |t|
      t.references :bill_category, index: true#, foreign_key: true
      t.references :project, index: true# foreign_key: true
      t.string :name
      t.text :description
      t.boolean :status, default: false
      t.float :value, default: 0.00
      t.references :supplier, index: true#, foreign_key: true
      t.text :observation
      t.date :deadline
      t.string :archive
      t.string :note_payment
      t.date  :date_payment
      t.text  :observation_payment
      t.string :number_note
      t.references :privilege, array: true, index: true


      t.timestamps null: false
    end

    add_index :pays, :number_note, unique: true
  end
end
