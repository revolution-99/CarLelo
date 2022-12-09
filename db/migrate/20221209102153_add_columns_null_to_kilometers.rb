class AddColumnsNullToKilometers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :kilometers, :name, false, "km"
    change_column_null :kilometers, :km_start, false, 0
    change_column_null :kilometers, :km_end, false, 1
  end
end
