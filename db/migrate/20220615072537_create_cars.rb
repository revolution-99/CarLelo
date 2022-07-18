class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.belongs_to :user
      t.string :city
      t.string :brand
      t.string :model
      t.string :variant
      t.string :state
      t.string :km
      t.string :year
      t.timestamps
    end
  end
end
