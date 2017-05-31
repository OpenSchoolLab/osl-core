require 'rails_helper'

RSpec.describe PersonHelper, type: :helper do
  let(:user) { FactoryGirl.create(:user) }

  after(:each) do
    Person.delete_all
    User.delete_all
  end

  describe "#create" do
    it 'should create a person having valid arguments passed' do
        params = nil
        person = PersonHelper.create(params, user.id)
        expect(person[:created_by]).to eq(user.id)
    end
    it 'should throw invalid person exception when no user is there' do
      params = nil
      user_id = nil
      expect {
        PersonHelper.create(params, user_id)
      }.to raise_error(MandatoryFieldsAreNotFilledError)
    end
  end
end
