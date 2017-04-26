class AddIsExpiredToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_expired, :boolean, default: false
  end
end
