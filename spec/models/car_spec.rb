require 'rails_helper'

RSpec.describe Car, :type => :model do
    subject(:user1) {FactoryBot.create(:user)}

    subject(:car1) {FactoryBot.create(:car, user_id: user1.id)}

    context "Association" do
        it { should belong_to(:user) }
        it { should have_many(:appointments) }
        it { should have_many(:notifications) }
    end

    context "Validation." do
        it "Car is invalid without city." do
            expect(car1).to be_valid
            car1.city = nil
            expect(car1).to_not be_valid
        end
        it "Car is invalid without brand." do
            expect(car1).to be_valid
            car1.brand = nil
            expect(car1).to_not be_valid
        end
        it "Car is invalid without model." do
            expect(car1).to be_valid
            car1.model = nil
            expect(car1).to_not be_valid
        end
        it "Car is invalid without registration year." do
            expect(car1).to be_valid
            car1.year = nil
            expect(car1).to_not be_valid
        end
        it "Car is invalid without variant type." do
            expect(car1).to be_valid
            car1.variant = nil
            expect(car1).to_not be_valid
        end
        it "Car is invalid without registered state." do
            expect(car1).to be_valid
            car1.state = nil
            expect(car1).to_not be_valid
        end
        it "Car is invalid without total kms covered." do
            expect(car1).to be_valid
            car1.km = nil
            expect(car1).to_not be_valid
        end
        it "Car is invalid without condition." do
            expect(car1).to be_valid
            car1.condition = nil
            expect(car1).to_not be_valid
        end
    end
    
    context "Scope" do
        it "filter by city is not working properly." do
            car1.city = 'BBSR'
            expect(Car.filter_by_city('Cuttack').select("city").to_a[0][:city]).to_not eq(car1.city)
            car1.city = 'Cuttack'
            expect(Car.filter_by_city('Cuttack').select("city").to_a[0][:city]).to eq(car1.city)
        end 
        it "filter by brand is not working properly." do
            car1.brand = 'Maruti'
            expect(Car.filter_by_brand('TATA').select("brand").to_a[0][:brand]).to_not eq(car1.brand)
            car1.brand = 'TATA'
            expect(Car.filter_by_brand('TATA').select("brand").to_a[0][:brand]).to eq(car1.brand)
        end 
        it "filter by model is not working properly." do
            car1.model = '800'
            expect(Car.filter_by_model('Tiago').select("model").to_a[0][:model]).to_not eq(car1.model)
            car1.model = 'Tiago'
            expect(Car.filter_by_model('Tiago').select("model").to_a[0][:model]).to eq(car1.model)
        end 
        it "filter by year is not working properly." do
            car1.year = '2002'
            expect(Car.filter_by_year('2017').select("year").to_a[0][:year]).to_not eq(car1.year)
            car1.year = '2017'
            expect(Car.filter_by_year('2017').select("year").to_a[0][:year]).to eq(car1.year)
        end 
        it "filter by variant is not working properly." do
            car1.variant = 'Disel'
            expect(Car.filter_by_variant('Petrol').select("variant").to_a[0][:variant]).to_not eq(car1.variant)
            car1.variant = 'Petrol'
            expect(Car.filter_by_variant('Petrol').select("variant").to_a[0][:variant]).to eq(car1.variant)
        end 
        it "filter by state is not working properly." do
            car1.state = 'UP'
            expect(Car.filter_by_state('Odisha').select("state").to_a[0][:state]).to_not eq(car1.state)
            car1.state = 'Odisha'
            expect(Car.filter_by_state('Odisha').select("state").to_a[0][:state]).to eq(car1.state)
        end 
        it "filter by km is not working properly." do
            car1.km = 'Above 1,20,000 Km'
            expect(Car.filter_by_km('10,000 - 20,000 Km').select("km").to_a[0][:km]).to_not eq(car1.km)
            car1.km = '10,000 - 20,000 Km'
            expect(Car.filter_by_km('10,000 - 20,000 Km').select("km").to_a[0][:km]).to eq(car1.km)
        end 
    end
end