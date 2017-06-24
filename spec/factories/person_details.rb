FactoryGirl.define do
  factory :person_detail do
      gender 'Male'
      date_of_birth Faker::Date.between(18.years.ago, Date.today)
  end
end
