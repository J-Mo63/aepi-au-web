class RemoveForumIdFromBoards < ActiveRecord::Migration[5.0]
  def change
  	remove_column :boards, :forum_id
  end
end
