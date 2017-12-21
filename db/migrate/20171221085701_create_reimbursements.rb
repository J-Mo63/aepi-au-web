class CreateReimbursements < ActiveRecord::Migration[5.0]
  def change
    create_table :reimbursements do |t|
      t.string :title
      t.string :image
      t.integer :bsb
      t.integer :account_number
      t.boolean :is_processed
      t.text :description

      t.timestamps
    end
  end
end
