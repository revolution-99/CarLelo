FactoryBot.define do
    factory :car do
        user{ association :user }
        city {'Cuttack'}
        brand {'TATA'}
        model {'Tiago'}
        year {'2017'}
        variant {'Petrol'}
        #  or variant {'Disel'}
        state {'Odisha'}
        km {'10,000 - 20,000 Km'}
        condition {'Fair'}
    end
end
