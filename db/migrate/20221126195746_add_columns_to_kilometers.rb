class AddColumnsToKilometers < ActiveRecord::Migration[6.1]
  def change
    add_column :kilometers, :km_start, :integer, unique: true
    add_column :kilometers, :km_end, :integer, unique: true
  end
end
