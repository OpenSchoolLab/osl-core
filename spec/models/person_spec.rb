require 'rails_helper'

RSpec.describe Person, type: :model do
    let(:user) { FactoryGirl.create(:user) }
    describe 'Save' do
        after(:each) do
            Person.delete_all
        end

        it 'should perform successfully with the valid attributes' do
            person = Person.new(
                :created_by => 1
            )
            expect(person).to be_valid
        end
    end
    describe 'generate uuid' do
        before(:each) do
            @uuid = SecureRandom.uuid
            allow(SecureRandom).to receive(:uuid).and_return(@uuid)
        end

        after(:each) do
            Person.delete_all
        end
        it 'should successfully save a person' do
            person = Person.new(
                :created_by => user.id
            )
            expect(person.save).to be_truthy
            expect(person.uuid).to eq(@uuid)
        end
    end
end
