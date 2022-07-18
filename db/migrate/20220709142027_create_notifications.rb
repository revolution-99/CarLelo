class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      # t.integer :recipient_id
      # t.integer :actor_id
      t.belongs_to :user
      t.belongs_to :car
      t.belongs_to :appointment
      t.string :action
      # t.string :notifiable_type
      # t.integer :notifiable_id
      # t.date :notifiable_date
      t.datetime :read_at

      t.timestamps
    end
  end
end
