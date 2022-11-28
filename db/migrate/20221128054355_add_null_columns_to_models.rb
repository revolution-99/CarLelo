class AddNullColumnsToModels < ActiveRecord::Migration[6.1]
  def change
    change_column_null :conditions, :price_start, false
    change_column_null :conditions, :price_end, false
    change_column_null :kilometers, :name, false
    change_column_null :kilometers, :km_start, false
    change_column_null :kilometers, :km_end, false
    change_column_null :maps, :address, false
    change_column_null :maps, :latitude, false
    change_column_null :maps, :longitude, false
    change_column_null :years, :name, false
  end
end
