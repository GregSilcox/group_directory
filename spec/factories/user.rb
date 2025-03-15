FactoryBot.define do
  factory :user do
    email_address { "greg.silcox+test@gmail.com" }
    password { "Not blank" }
    password_confirmation { "Not blank" }
  end
end
