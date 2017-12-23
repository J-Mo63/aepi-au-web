class AddBankSignatoryToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :bank_signatory, :boolean, :default => false
  end
end
