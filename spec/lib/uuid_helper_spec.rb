require 'spec_helper'
require 'uuid_helper'
require 'securerandom'
require 'errors/uuid_not_found_error'

RSpec.describe UUIDHelper do

  describe "assign_to" do
    before(:each) do
      @uuid = SecureRandom.uuid
      allow(SecureRandom).to receive(:uuid).and_return(@uuid)
    end

    after(:each) do
      @uuid = nil
    end

    it 'should assign a uuid on a data object having uuid field' do
      object_having_uuid = {
          uuid: ""
      }

      UUIDHelper.assign_to(object_having_uuid)
      expect(object_having_uuid[:uuid]).not_to be_empty
      expect(object_having_uuid[:uuid]).to eq(@uuid)
    end

    it 'should throw error for the data object which does not have any uuid field' do
      object_without_uuid = {}
      expect { UUIDHelper.assign_to(object_without_uuid) }.to raise_error(UUIDNotFoundError)
    end
  end
end