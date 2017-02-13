class UUIDNotFoundError < StandardError
  def initialize(message = "UUID Not found", klass="")
    @message = "#{klass.to_s} #{message}"
  end
end