class AddUniIdToContacts < ActiveRecord::Migration[5.0]
  def change
  	add_column :contacts, :uni_id, :integer
  end
end
