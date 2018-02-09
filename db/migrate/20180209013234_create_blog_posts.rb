class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :body
      t.boolean :is_published, :default => false
      t.string :image

      t.timestamps
    end
  end
end
