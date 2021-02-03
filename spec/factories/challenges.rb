FactoryBot.define do
  factory :challenge do
    title { "MyText" }
    description { "MyDesc" }
    tags { "Mytag" }
    user { nil }
  end
end
