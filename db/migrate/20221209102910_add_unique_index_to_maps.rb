class AddUniqueIndexToMaps < ActiveRecord::Migration[6.1]
  def change
    add_index :maps, :latitude, unique: true
    add_index :maps, :longitude, unique: true
  end
end
