require 'rails_helper'

RSpec.describe PersonNameHelper, type: :helper do
  let(:user) { FactoryGirl.create(:user) }
  let(:person) { FactoryGirl.create(:person, :created_by => user.id) }

  after(:each) do
  end

  describe "#create" do
    before(:each) do
        @person = {
            :personal_info => {
                :first_name => Faker::Name.first_name,
                :last_name => Faker::Name.last_name,
            }
        }
        @parameters = ActionController::Parameters.new(@person)
    end

    after(:each) do
        @parameters = nil
        PersonName.delete_all
    end
    it 'should create a person\'s name for a valid person and arguments' do
      person_name = PersonNameHelper.create(@parameters, user.id, person.id)
      expect(person_name[:first_name]).to eq(@person[:personal_info][:first_name])
      expect(person_name[:last_name]).to eq(@person[:personal_info][:last_name])
      expect(person_name[:created_by]).to eq(user.id)
    end
    it 'should not create person\'s name for invalid person' do
      expect {
        PersonNameHelper.create(@parameters, user.id, nil)
      }.to raise_error(MandatoryFieldsAreNotFilledError)
    end

    it 'should not create person\'s name for invalid user' do
      expect {
        PersonNameHelper.create(@parameters, user.id, nil)
      }.to raise_error(MandatoryFieldsAreNotFilledError)
    end

    it 'should not create person\'s name for invalid parameters' do
      student = {}
      parameters = ActionController::Parameters.new(student)
      expect {
        PersonNameHelper.create(parameters, user.id, person.id)
      }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
