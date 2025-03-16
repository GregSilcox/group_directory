FactoryBot.define do
  factory :role do
    user_id { 1 }
    group_id { 1 }
    kind { "member" }
    status { "active" }
  end
end
