class AddIndexToContacts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :contacts, :uni_id
  	add_reference :contacts, :uni, index: true
  end
end
