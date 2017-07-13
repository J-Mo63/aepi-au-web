class RemoveUniFromContacts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :contacts, :uni
  end
end
