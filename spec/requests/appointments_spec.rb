require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  subject(:admin1){ FactoryBot.create(:admin) }
  subject(:car1){ FactoryBot.create(:car, user_id: admin1.id) }
  subject(:app1){ FactoryBot.create(:appointment, user_id: admin1.id, car_id: car1.id) }

  describe "GET /appointments" do
    it "will render a page to create the appointment record" do
      post login_path, params: { email: admin1.email, password: admin1.password }
      get "/cars/#{car1.id}/appointment/new"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /appointments" do

    context "with valid credentials" do
      it "saves the car record in database and increase the count by 1" do
        post login_path, params: { email: admin1.email, password: admin1.password }
        expect {
          post "/cars/#{car1.id}/appointment", params: {
            appointment: {
              appointment_date: "01 Jan 2023", 
              status: "Processing"
            }
          }
        }.to change(Appointment, :count).by(1)
        expect(response).to redirect_to(seller_dashboard_appointments_list_path)
        session[:car_id] = 1
        expect(session[:car_id]).to eq(1)
      end
    end

    context "with invalid credentials." do
      it "renders the view page of appointment again with errors." do
        post login_path, params: { email: admin1.email, password: admin1.password }
        expect {
          post "/cars/#{car1.id}/appointment", params: {
            appointment: {
              appointment_date: "25 May 2022", 
              status: "Processing"
            }
          }
        }.to change(User, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
end
end
