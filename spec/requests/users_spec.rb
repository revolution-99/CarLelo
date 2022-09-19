require 'rails_helper'

RSpec.describe "Users", type: :request do
  subject(:user1) { FactoryBot.create(:user)}

  context "GET /users" do
    it "renders the sign up page." do
      get new_users_path
      expect(response).to have_http_status(200)
      expect(response).to_not have_http_status(400)
    end
  end

  describe "POST /users" do
    context "with valid credentials." do
      it "send email for confirmation." do
          expect{
            post users_path, params: {
              user: {
                email: "chand@carlelo.in",
                first_name: "Chand",
                last_name: "Chand Again",
                mobile_no: 1233211233,
                password: 'chand123',
                password_confirmation: 'chand123',
                is_seller: true
            }
          }
        }.to change { ActionMailer::Base.deliveries.size }.by(1)
      end
      
      it "saves the user in database and redirects to login page." do
        post users_path, params: {
                user: {
                  email: "chand@carlelo.in",
                  first_name: "Chand",
                  last_name: "Chand Again",
                  mobile_no: 1233211233,
                  password: 'chand123',
                  password_confirmation: 'chand123',
                  is_seller: true
              }
            }
        # expect(response.body).to have_http_status(201)

        expect(response).to redirect_to(login_path)
        session[:user_id] = 1
        expect(session[:user_id]).to eq(1)
      end
    end

    context "with invalid credentials." do
      it "renders the signup page again." do
        expect {
          post users_path, params: {
            user: {
              email: "chand@carlelo.in",
              first_name: "",
              last_name: "Chand Again",
              mobile_no: 1233211233,
              password: 'chand123',
              password_confirmation: 'chand123',
              is_seller: true
          }
        }
        }.to change(User, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
    
  end
end
