class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :itemised_budget
      t.text :runsheet
      t.datetime :start_time
      t.float :budget_total
      t.boolean :is_approved
      t.string :feedback
      t.integer :expected_turnout
      t.integer :user_id

      t.timestamps
    end
  end
end
