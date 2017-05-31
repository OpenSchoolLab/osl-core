class Role < ApplicationRecord
    belongs_to :users, class_name: 'User', foreign_key: 'created_by', optional: true
    belongs_to :users, class_name: 'User', foreign_key: 'voided_by', optional: true

    before_create :generate_uuid

    private
    def generate_uuid
        UUIDHelper.assign_to(self)
    end
end
