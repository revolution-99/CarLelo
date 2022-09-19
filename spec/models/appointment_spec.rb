require 'rails_helper'

RSpec.describe Appointment, :type => :model do
    subject(:user1){FactoryBot.create(:user)}
    subject(:car1){FactoryBot.create(:car, user_id: user1.id)}
    subject(:app){FactoryBot.create(:appointment, user_id: user1.id, car_id: car1.id)}

    context "Association" do
        it{ should belong_to(:user) }
        it{ should belong_to(:car) }
        it{ should have_many(:notifications) }
    end

    context "Validation" do
        it "Appointment is invalid without date" do
            expect(app).to be_valid
            app.appointment_date = nil
            expect(app).to_not be_valid
        end
    end

    context "Scope" do
        it "filter by status is not working properly." do
            app.status = "Sold"
            expect(Appointment.filter_by_status("Processing").select("status").to_a[0][:status]).to_not eq(app.status)
            app.status = 'Processing'
            expect(Appointment.filter_by_status("Processing").select("status").to_a[0][:status]).to eq(app.status)
        end
    end

    context "Callback" do
        it "triggers after update" do
            expect(app).to receive(:notify_create)
            app.run_callbacks(:create)
        end
        it "triggers after update" do
            expect(app).to receive(:notify_update)
            app.run_callbacks(:update)
        end
    end
end