module PersonDetailsHelper
    class << self
        def create(parameters, user_id, person_id)
            person_details = PersonDetail.create(person_details_params(parameters, user_id, person_id))
            if person_details.valid?
                person_details.save
                return person_details
            else
                raise MandatoryFieldsAreNotFilledError
            end
        end

        private
        def person_details_params(parameters, user_id, person_id)
            person_details = parameters.require(:personal_info)
                                 .permit(:date_of_birth, :gender)
            person_details[:person_id] = person_id
            person_details[:created_by] = user_id
            person_details
        end
    end
end
