class ChangeConditionFromCars < ActiveRecord::Migration[6.1]
  def change
    change_column :cars, :condition, :string
  end
end
