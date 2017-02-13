require 'errors/uuid_not_found_error'
module UUIDHelper
  require 'securerandom'
  def self.assign_to(klass)
    raise UUIDNotFoundError if klass[:uuid].nil?
    klass[:uuid] = SecureRandom.uuid
  end
end