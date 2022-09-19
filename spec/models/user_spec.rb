require 'rails_helper'

# For user1 model
RSpec.describe User, :type => :model do
  subject(:user1) { FactoryBot.create(:user) }


    context "validations." do
        it "It is invalid without an email id" do
            expect(user1).to be_valid
            user1.email = nil
            expect(user1).to_not be_valid
        end
        it "It is invalid without a first name" do
          expect(user1).to be_valid
          user1.first_name = nil
          expect(user1).to_not be_valid
        end
        it "It is invalid without a mobile no." do
          expect(user1).to be_valid
          user1.mobile_no = nil
          expect(user1).to_not be_valid
        end
        it "It is invalid without a password" do
          expect(user1).to be_valid
          user1.password = nil
          expect(user1).to_not be_valid
        end
        it "It is invalid without a role" do
          expect(user1).to be_valid
          user1.is_seller = nil
          user1.is_buyer = nil
          expect(user1).to_not be_valid
        end

        it "Email should have proper format." do
          expect(user1).to be_valid
         user1.email = "s@.in"
          expect(user1).to_not be_valid
        end
        it "Mobile no. should be valid" do
          expect(user1).to be_valid
         user1.mobile_no = 123
          expect(user1).to_not be_valid
        end

        it "Password should be of length 6 to 20." do
          expect(user1).to be_valid
          user1.password = 'sanu'
          expect(user1).to_not be_valid
        end
        
        it "Email id should be unique." do
          user2 = FactoryBot.create(:user)
          user2.email = user1.email 
          expect(user2).to_not be_valid
        end
        it "Email id should be unique." do
          user2 = FactoryBot.create(:user)
          user2.mobile_no = user1.mobile_no 
          expect(user2).to_not be_valid
        end
    end

    context "Associations" do
      it { should have_many(:cars) }
      it { should have_many(:appointments) }
      it { should have_many(:notifications) }
    end

    context "Callback" do
      it "triggers before save" do
        expect(user1).to receive(:confirmation_token)
        user1.save
      end
    end

end

