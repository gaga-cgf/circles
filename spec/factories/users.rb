FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.name }
    style { 'admin' }
  end
end
