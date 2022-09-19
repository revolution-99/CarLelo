FactoryBot.define do
    factory :appointment do
        user {association :user}
        car {association :car}
        appointment_date {"25 Sep 2022"}
        status {"Processing"}
    end
end