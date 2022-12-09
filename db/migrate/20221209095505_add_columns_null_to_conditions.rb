class AddColumnsNullToConditions < ActiveRecord::Migration[6.1]
  def change
    change_column_null :conditions, :price_start, false, 0
    change_column_null :conditions, :price_end, false, 1
  end
end
