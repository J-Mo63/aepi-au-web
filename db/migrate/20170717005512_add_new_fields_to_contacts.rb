class AddNewFieldsToContacts < ActiveRecord::Migration[5.0]
  def change
  	add_column :contacts, :added_by, :integer
  	add_index :contacts, :added_by

  	add_column :contacts, :high_school, :string
  	add_column :contacts, :degree, :string
  	add_column :contacts, :priority, :int

  	add_column :contacts, :high_school_graduation_year, :integer
  	add_column :contacts, :uni_commencement_year, :integer
  end
end
