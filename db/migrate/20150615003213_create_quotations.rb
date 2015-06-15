class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.string :name
      t.text :description
      t.date :date
      t.references :project, index: true, foreign_key: true
      t.references :responsible, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
