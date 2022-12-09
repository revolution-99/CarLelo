class AddColumnsNullToMaps < ActiveRecord::Migration[6.1]
  def change
    change_column_null :maps, :address, false, 'India'
    change_column_null :maps, :latitude, false, 0
    change_column_null :maps, :longitude, false, 1
  end
end
