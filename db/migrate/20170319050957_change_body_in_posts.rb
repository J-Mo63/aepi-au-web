class ChangeBodyInPosts < ActiveRecord::Migration[5.0]
  def change
      change_column :posts, :body, :text
      change_column :comments, :body, :text
  end
end
