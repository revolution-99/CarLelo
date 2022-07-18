class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :user
      t.belongs_to :car

      t.date :appointment_date
      t.integer :status, :default => 0
      t.boolean :is_approved, :default => false
      t.timestamps
    end
  end
end
