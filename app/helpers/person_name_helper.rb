module PersonNameHelper
    class << self
        def create(parameters, user_id, person_id)
            person_name = PersonName.create(person_name_params(parameters, user_id, person_id))
            if person_name.valid?
                person_name.save
                return person_name
            else
                raise MandatoryFieldsAreNotFilledError
            end
        end

        private
        def person_name_params(parameters, user_id, person_id)
            person_name = parameters.require(:personal_info)
                              .permit(:first_name, :last_name)
            person_name[:person_id] = person_id
            person_name[:created_by] = user_id
            person_name
        end
    end
end
