FactoryGirl.define do
  factory :person_name do
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
  end
end
