class CreateSnaps < ActiveRecord::Migration[5.0]
  def change
    create_table :snaps do |t|
      t.timestamps
    end
    add_reference :snaps, :comment, index: true
    add_reference :snaps, :user, index: true
  end
end
