FactoryBot.define do
    factory :notification do
        user{ association :user }
        car{ association :car }
        appointment{ association :appointment }
        action{ "booked" }
    end
end
