class AddDetailsToCategory < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :details, :text
  end
end
