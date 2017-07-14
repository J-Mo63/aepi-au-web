class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :body

      t.timestamps
    end
    add_reference :notes, :contact, index: true
    add_reference :notes, :user, index: true
  end
end
