class ChangeColorFromCategory < ActiveRecord::Migration[8.0]
  def change
    change_column_default :categories, :color, from: nil, to: "#028A0F"
  end
end
