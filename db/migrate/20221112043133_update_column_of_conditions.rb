class UpdateColumnOfConditions < ActiveRecord::Migration[6.1]
  def change
    remove_column :conditions, :cost, :string
    add_column :conditions, :price_start, :integer, unique: true
    add_column :conditions, :price_end, :integer, unique: true
  end
end
