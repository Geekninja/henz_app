class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.float :salary
      t.boolean :status

      t.timestamps null: false
    end
  end
end
