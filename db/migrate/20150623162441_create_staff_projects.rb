class CreateStaffProjects < ActiveRecord::Migration
  def change
    create_table :staff_projects do |t|
      t.references :project, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
