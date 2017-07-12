class AddColourToBoards < ActiveRecord::Migration[5.0]
  def change
  	add_column :boards, :colour, :string
  end
end
