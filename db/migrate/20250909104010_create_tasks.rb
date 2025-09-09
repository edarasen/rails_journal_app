class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :details
      t.date :due_date # yyyy - mm - dd
      t.integer :category_id
      t.timestamps
    end
  end
end
