class AddUniqueIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
    add_index :users, [:mobile_no, :is_seller, :is_buyer], unique: true
  end
end
