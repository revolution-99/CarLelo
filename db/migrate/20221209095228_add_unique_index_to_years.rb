class AddUniqueIndexToYears < ActiveRecord::Migration[6.1]
  def change
    add_index :years, :name, unique: true
  end
end
