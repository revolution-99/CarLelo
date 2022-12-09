class AddUniqueIndexToKilometers < ActiveRecord::Migration[6.1]
  def change
    add_index :kilometers, :name, unique: true
  end
end
