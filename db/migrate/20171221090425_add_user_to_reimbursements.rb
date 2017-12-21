class AddUserToReimbursements < ActiveRecord::Migration[5.0]
  def change
  	add_reference :reimbursements, :user, index: true
  end
end
