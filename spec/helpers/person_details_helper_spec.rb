require 'rails_helper'

RSpec.describe PersonDetailsHelper, type: :helper do
  let(:user) { FactoryGirl.create(:user) }
  let(:person) { FactoryGirl.create(:person, :created_by => user.id) }

  after(:each) do
  end

  describe "#create" do
    before(:each) do
      @person = {
          :personal_info => {
              :date_of_birth => Faker::Date.between(18.years.ago, Date.today),
              :gender => 'Male'
          }
      }
      @parameters = ActionController::Parameters.new(@person)
    end

    after(:each) do
      @parameters = nil
      PersonName.delete_all
    end
    it 'should create a person\'s details for a valid person and arguments' do
      person_name = PersonDetailsHelper.create(@parameters, user.id, person.id)
      expect(person_name[:date_of_birth]).to eq(@person[:personal_info][:date_of_birth])
      expect(person_name[:gender]).to eq(@person[:personal_info][:gender])
      expect(person_name[:created_by]).to eq(user.id)
    end
    it 'should not create person\'s details for invalid person' do
      expect {
        PersonDetailsHelper.create(@parameters, user.id, nil)
      }.to raise_error(MandatoryFieldsAreNotFilledError)
    end

    it 'should not create person\'s details for invalid user' do
      expect {
        PersonDetailsHelper.create(@parameters, user.id, nil)
      }.to raise_error(MandatoryFieldsAreNotFilledError)
    end

    it 'should not create person\'s details for invalid parameters' do
      student = {}
      parameters = ActionController::Parameters.new(student)
      expect {
        PersonDetailsHelper.create(parameters, user.id, person.id)
      }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
