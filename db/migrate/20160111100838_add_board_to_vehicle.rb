class AddBoardToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :board, :string
  end
end
