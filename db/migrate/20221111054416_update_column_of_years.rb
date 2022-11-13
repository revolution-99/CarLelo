class UpdateColumnOfYears < ActiveRecord::Migration[6.1]
  def change
    remove_column :years, :begin, :integer 
    remove_column :years, :end, :integer 
    add_column :years, :name, :integer
  end
end
