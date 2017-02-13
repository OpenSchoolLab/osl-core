require 'rails_helper'
require 'securerandom'
require 'faker'

RSpec.describe User, type: :model do
  describe "Save" do
    before(:each) do
      @user_name = Faker::Internet.user_name
    end
    it 'should perform successfully with valid attributes' do
      user = User.new(
                     :email => Faker::Internet.safe_email(@user_name),
                     :password => Faker::Internet.password(20),
                     :username => @user_name
      )
      expect(user).to be_valid
    end
    it 'should not be valid without email' do
      user = User.new(
          :password => Faker::Internet.password(20),
          :username => @user_name
      )
      expect(user).to_not be_valid
    end
    it 'should not be valid without password' do
      user = User.new(
          :email => Faker::Internet.safe_email(@user_name),
          :username => @user_name
      )
      expect(user).to_not be_valid
    end
    it 'should not be valid without uuid' do
      user = User.new(
          :email => Faker::Internet.safe_email(@user_name),
          :password => Faker::Internet.password(20),
      )
      expect(user).to_not be_valid
    end
  end

  describe "generate_uuid" do
    before(:each) do
      @user_name = Faker::Internet.user_name
      @uuid = SecureRandom.uuid
      allow(SecureRandom).to receive(:uuid).and_return(@uuid)
    end

    after(:each) do
      User.delete_all
    end

    it 'should successfully save a user' do
      user = User.new(
          :email => Faker::Internet.safe_email(@user_name),
          :password => Faker::Internet.password(20),
          :username => @user_name
      )

      expect(user.save).to be_truthy
      expect(user.uuid).to eq(@uuid)
      expect(user.uid).not_to be_empty
    end
  end
end
