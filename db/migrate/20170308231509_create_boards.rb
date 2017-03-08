class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :forum_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
