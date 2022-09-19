class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.belongs_to :user
      t.text :city, null: false
      t.text :brand, null: false
      t.text :model, null: false
      t.text :variant, null: false
      t.text :state, null: false
      t.text :km, null: false
      t.text :year, null: false
      t.timestamps
    end
  end
end
