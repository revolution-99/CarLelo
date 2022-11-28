class AddUniqueIndexToModels < ActiveRecord::Migration[6.1]
  def change
    add_index :conditions, :price_start, unique: true
    add_index :conditions, :price_end, unique: true
    add_index :kilometers, :name, unique: true
    add_index :kilometers, :km_start, unique: true
    add_index :kilometers, :km_end, unique: true
    add_index :maps, :address, unique: true
    add_index :maps, :latitude, unique: true
    add_index :maps, :longitude, unique: true
    add_index :years, :name, unique: true
  end
end
