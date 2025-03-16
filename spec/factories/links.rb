FactoryBot.define do
  factory :link do
    from_id { 1 }
    to_id { 1 }
    from_type { "MyString" }
    to_type { "MyString" }
  end
end
