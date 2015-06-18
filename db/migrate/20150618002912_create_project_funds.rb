class CreateProjectFunds < ActiveRecord::Migration
  def change
    create_table :project_funds do |t|
      t.references :project, index: true, foreign_key: true
      t.float :value
      t.date :date
      t.integer :month
      t.integer :year
      t.string :title
      t.text :description
      t.text :observations
      t.boolean :status

      t.timestamps null: false
    end
  end
end
