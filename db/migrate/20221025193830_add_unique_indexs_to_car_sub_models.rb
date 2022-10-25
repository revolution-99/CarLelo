class AddUniqueIndexsToCarSubModels < ActiveRecord::Migration[6.1]
  def change
    add_index :brands, :name, unique: true
    add_index :cities, :name, unique: true
    add_index :conditions, :condition, unique: true
    add_index :conditions, :cost, unique: true
    add_index :kilometers, :name, unique: true
    add_index :models, :name, unique: true
    add_index :states, :name, unique: true
    add_index :variants, :name, unique: true
  end
end
