class CreateProjectFunds < ActiveRecord::Migration
  def change
    create_table :project_funds do |t|
      t.references :project, index: true#, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :status, default: false
      t.float :value, default: 0.00
      t.references :supplier, index: true#, foreign_key: true
      t.text :observation
      t.string :note_payment
      t.date  :date_payment
      t.text  :observation_payment

      t.timestamps null: false
    end
  end
end
