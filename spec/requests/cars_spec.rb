require 'rails_helper'


RSpec.describe "Cars", type: :request do

  subject(:admin1) {FactoryBot.create(:admin)}
  subject(:car1) {FactoryBot.create(:car, user_id: admin1.id)}

  describe "GET /cars" do
    it "will render a page to create the car record" do
      post login_path, params: { email: admin1.email, password: admin1.password }
      get "/cars/#{car1.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /cars" do
    context "with valid credentials." do
      it "saves the car record in database and increase the count by 1" do
        post login_path, params: { email: admin1.email, password: admin1.password }
        expect {
          post "/cars", params: {
            car: {
              city: 'Cuttack', 
              brand: 'TATA', 
              model: 'Nano',
              year: '2017', 
              variant: 'CNG', 
              state: 'OD', 
              km: '10,000 - 20,000 Km'
            }
          }
        }.to change(Car, :count).by(1)
        session[:car_id] = 1
        expect(session[:car_id]).to eq(1)
      end
    end

    context "with invalid credentials." do
      it "renders the view page of car again with errors." do
        post login_path, params: { email: admin1.email, password: admin1.password }
        expect {
          post "/cars", params: {
            car: {
              city: '', 
              brand: 'TATA', 
              model: 'Nano',
              year: '2017', 
              variant: 'CNG', 
              state: 'OD', 
              km: '10,000 - 20,000 Km'
            }
          }
        }.to change(User, :count).by(0)
        expect(response).to render_template(:show)
      end
    end
  end
end
