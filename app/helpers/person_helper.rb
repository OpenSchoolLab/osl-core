module PersonHelper
    def self.create(parameters, user_id)
        if user_id.nil?
            raise MandatoryFieldsAreNotFilledError
        end
        person = Person.create(:created_by => user_id)
        if person.valid?
            person.save
            return person
        end
    end
end
