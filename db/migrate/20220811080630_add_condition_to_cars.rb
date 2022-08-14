class AddConditionToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :condition, :string, :default => "0"
  end
end
