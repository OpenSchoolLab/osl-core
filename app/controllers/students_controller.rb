class StudentsController < ApplicationController
    before_action :authenticate_user!

    def create
        current_user_id = current_user.id
        @person = PersonHelper.create(get_student_params, current_user_id)
        person_id = @person.id
        @person_name = PersonNameHelper.create(get_student_params, current_user_id, person_id)
        @person_details = PersonDetailsHelper.create(get_student_params, current_user_id, person_id)
        if @person_details.valid?
            render :json => { :message => 'Student Successfully created', :status => 'Success' },
                   :status => :created
        end
    end

    private
    def get_student_params
        params.require(:student)
    end
end
