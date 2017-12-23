class CreateReimbursements < ActiveRecord::Migration[5.0]
  def change
    create_table :reimbursements do |t|
      t.string :title
      t.float :total_value
      t.string :image
      t.string :account_name
      t.string :bsb
      t.string :account_number
      t.boolean :is_processed, default: false
      t.text :description

      t.timestamps
    end
  end
end
