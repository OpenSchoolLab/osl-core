require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
    include Devise::Test::ControllerHelpers

    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
    end

    after(:each) do
        PersonName.delete_all
        PersonDetail.delete_all
        Person.delete_all
    end

    describe "POST create" do
        before(:each) do
            login_with user
            @student_parameter = {
                :personal_info => {
                    :first_name => Faker::Name.first_name,
                    :last_name => Faker::Name.last_name,
                    :gender => "Male",
                    :date_of_birth => Faker::Date.between(21.years.ago, Date.today)
                }
            }
        end
        after(:each) do
            login_with nil
            @student_parameter = nil
        end

        it 'should create a valid student' do
            post :create, student: @student_parameter
            expect(response).to be_success
            expect(response).to have_http_status(:created)
            student_create_response = JSON.parse(response.body)
            expect(student_create_response['message']).to eq( 'Student Successfully created' )
            person = Person.first
            person_name = PersonName.find_by(:person_id => person.id)
            person_details = PersonDetail.find_by(:person_id => person.id)
            expect(person_name[:first_name]).to eq( @student_parameter[:personal_info][:first_name] )
            expect(person_name[:last_name]).to eq( @student_parameter[:personal_info][:last_name] )
            expect(person_details[:gender]).to eq( @student_parameter[:personal_info][:gender] )
            expect(person_details[:date_of_birth]).to eq( @student_parameter[:personal_info][:date_of_birth] )
        end

        it 'should not create student for when the user is not logged in' do
            login_with nil
            post :create, student: @student_parameter
            expect(response).to have_http_status(:unauthorized)
        end
    end
end
