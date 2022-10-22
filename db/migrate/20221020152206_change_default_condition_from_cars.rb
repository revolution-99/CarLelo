class ChangeDefaultConditionFromCars < ActiveRecord::Migration[6.1]
  def change
    change_column_default :cars, :condition, nil
  end
end
