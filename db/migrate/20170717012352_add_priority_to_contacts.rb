class AddPriorityToContacts < ActiveRecord::Migration[5.0]
  def change
  	add_column :contacts, :rush_priority, :integer
  	add_column :contacts, :is_brother, :boolean, default: false
  end
end
