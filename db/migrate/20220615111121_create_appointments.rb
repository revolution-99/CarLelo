class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :user

      t.date :appointment_date

      t.timestamps
    end
  end
end
