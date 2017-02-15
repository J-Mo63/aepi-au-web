class AddPrivilegeToForums < ActiveRecord::Migration[5.0]
  def change
    add_column :forums, :privilege, :integer, :default => 0
  end
end
