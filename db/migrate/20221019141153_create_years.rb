class CreateYears < ActiveRecord::Migration[6.1]
  def change
    create_table :years do |t|
      t.integer :begin, null: false
      t.integer :end, null: false
      
      t.timestamps
    end
  end
end
