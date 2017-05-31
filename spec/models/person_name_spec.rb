require 'rails_helper'

RSpec.describe PersonName, type: :model do
    let(:user) {FactoryGirl.create(:user)}
    let(:person) {FactoryGirl.create(:person, :created_by => user.id)}

    describe 'Save' do
        after(:each) do
            PersonName.delete_all
            Person.delete_all
            User.delete_all
        end

        it 'should perform successfully with the valid attributes' do
            person_name = PersonName.new(
                :first_name => Faker::Name.first_name,
                :last_name => Faker::Name.last_name,
                :person_id => person.id,
                :created_by => user.id
            )
            expect(person_name).to be_valid
        end
    end
    describe 'generate uuid' do
        before(:each) do
            @uuid = SecureRandom.uuid
            allow(SecureRandom).to receive(:uuid).and_return(@uuid)
        end

        after(:each) do
            PersonName.delete_all
            Person.delete_all
            User.delete_all
        end
        it 'should successfully save a person' do
            person_name = PersonName.new(
                :first_name => Faker::Name.first_name,
                :last_name => Faker::Name.last_name,
                :person_id => person.id,
                :created_by => user.id
            )
            expect(person_name.save).to be_truthy
            expect(person_name.uuid).to eq(@uuid)
        end
    end
end
