class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :city
      t.string :brand
      t.string :model
      t.string :variant
      t.string :state
      t.string :km
      t.numeric :year
      t.numeric :mobile_no

      t.timestamps
    end
  end
end
