class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
