class CreateProjectFinances < ActiveRecord::Migration
  def change
    create_table :project_finances do |t|
      t.references :project, index: true#, foreign_key: true
      t.integer :finance_type
      t.float :value
      t.boolean :status
      t.string :title
      t.string :description
      t.string :quantity
      t.string :note_payment
      t.date :date

      t.timestamps null: false
    end
  end
end
