class AddColumnsNullToYears < ActiveRecord::Migration[6.1]
  def change
    change_column_null :years, :name, false, 2000
  end
end
