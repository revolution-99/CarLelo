FactoryBot.define do
    factory :user do
      sequence(:first_name)   { |n| "User_#{n}" }
      email { "#{first_name}@carlelo.com".downcase }
      mobile_no {rand(1e9...1e10).to_i}
      password { "sanu123" }
      password_confirmation { "sanu123" }
      is_seller {true} unless is_buyer {true}
      email_confirmed{true}
      confirm_token{nil}
    end

    factory :admin, class: User do
      first_name { 'admin' }
      email { 'admin12@gmail.com' }
      password { 'admin123' }
      password_confirmation { 'admin123' }
      is_seller {true} unless is_buyer {true}
      is_admin { true }
      mobile_no { 1234567890 }
      email_confirmed{true}
      confirm_token{nil}
    end
end