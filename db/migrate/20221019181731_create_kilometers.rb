class CreateKilometers < ActiveRecord::Migration[6.1]
  def change
    create_table :kilometers do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
