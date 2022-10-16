FactoryBot.define do
    factory :appointment do
        user {association :user}
        car {association :car}
        appointment_date {"01 Jan 2023"}
        status {"Processing"}
    end
end