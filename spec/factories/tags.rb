FactoryBot.define do
  factory :tag do
    name { Faker::ProgrammingLanguage.name }
    challenge { FactoryBot.create(:challenge) }
  end
end
