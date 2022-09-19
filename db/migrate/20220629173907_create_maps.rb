class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
