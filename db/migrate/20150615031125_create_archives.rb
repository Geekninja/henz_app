class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :observation
      t.string :file_path

      t.timestamps null: false
    end
  end
end
