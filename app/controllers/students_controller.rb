class StudentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @students = Person.select(
            [
                PersonName.arel_table[:first_name], PersonName.arel_table[:last_name], PersonDetail.arel_table[:gender], PersonDetail.arel_table[:date_of_birth], Person.arel_table[:uuid]
            ]
        ).joins(
            Person.arel_table.join(PersonName.arel_table).on(
                PersonName.arel_table[:person_id].eq(Person.arel_table[:id])
            ).join_sources
        ).joins(
            Person.arel_table.join(PersonDetail.arel_table).on(
                PersonDetail.arel_table[:person_id].eq(Person.arel_table[:id])
            ).join_sources
        )
        render json: @students
    end

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
