require "rails_helper"

RSpec.describe Notification, :type => :model do

    subject(:user1) {FactoryBot.create(:user)}
    subject(:car1) {FactoryBot.create(:car)}
    subject(:app) {FactoryBot.create(:appointment)}
    subject(:notification1) {FactoryBot.create(:notification, user_id: user1.id, car_id: car1.id, appointment_id: app.id)}
    
    context "association" do
        it{ should belong_to(:user) }
        it{ should belong_to(:car) }
        it{ should belong_to(:appointment) }
    end
end
