class AddStateIndexToContacts < ActiveRecord::Migration[5.0]
  def change
  	add_reference :contacts, :state, index: true
  end
end
