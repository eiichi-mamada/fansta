FactoryBot.define do
  factory :team do
    id { rand(1..100) }
    name { "MyString" }
    icon { nil }
  end
end
