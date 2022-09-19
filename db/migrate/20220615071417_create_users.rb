class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :first_name, null: false
      t.text :last_name
      t.text :email, null: false
      t.text :password_digest, null: false
      t.bigint :mobile_no, null: false

      t.timestamps
    end
  end
end
