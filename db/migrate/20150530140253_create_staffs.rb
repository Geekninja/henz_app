class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :code
      t.string :cpf
      t.string :job_function
    
      t.references :job, index: true#, foreign_key: true
    
      t.boolean :status
    
      t.references :sector, index: true#, foreign_key: true
      t.string :city
      t.string :state
      t.string :address
      t.string :telphone
      t.string :telphone_optional
      t.string :celphone
      t.date :born
      t.float :salary

      t.boolean :driver

      t.timestamps null: false
    end
  end
end
