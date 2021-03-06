FactoryGirl.define do
    factory :user, :class => 'User' do
        email Faker::Internet.email
        first_name Faker::Name.first_name
        last_name Faker::Name.last_name
        username Faker::Name.first_name
        password Faker::Internet.password(10, 20)
    end
end