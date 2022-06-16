class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :is_seller, :boolean
    add_column :users, :is_buyer, :boolean
  end
end
