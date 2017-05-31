class MandatoryFieldsAreNotFilledError < StandardError
    def initialize(message="Mandatory fields are not filled")
        super(message)
    end
end