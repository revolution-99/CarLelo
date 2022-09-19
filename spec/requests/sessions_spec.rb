require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "renders the login page." do
      get login_path
      expect(response).to have_http_status(200)
      expect(response).to_not have_http_status(400)
    end
  end

  describe "POST /create" do
    subject(:user1) { FactoryBot.create(:user, email: 'ss@gmail.com') }

    context "with valid credentials" do
      it "redirects to root path" do
        post login_path , params: {
            email: user1.email,
            password: user1.password
        }
      expect(response).to redirect_to(seller_dashboard_path)
      end
    end

    context "with invalid credentials" do
      it "renders the login page again." do
        post login_path , params: {
            email: 'sanu@carlelo.com',
            password: '123456'
        }
      expect(response.body).to include('Invalid email id or password')
      expect(response).to render_template(:new)
      end
    end
    
  end

  describe "DELETE /destroy" do
    it "redirects to login page." do
      delete logout_path
      expect(response).to redirect_to(login_path)
    end
  end

  describe "DELETE /destroy_in_dashboard" do
    it "redirects to login page." do
      delete logout_path
      expect(response).to redirect_to(login_path)
    end
  end
end
