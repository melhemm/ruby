class Wagon
  attr_reader :id, :type
  attr_accessor :train

  include Manufacturer

  WAGON_ID_REGEX = /(?i)^(?=.*[a-z])[a-z0-9]{8,20}$/

  def initialize(id)
    @id = id
    validation
  end

  def validation
    wagon_id_validation
  end

  def wagon_id_validation
    raise 'Please check wagon id' if @id !~ WAGON_ID_REGEX
  end

  def valid?
    return true if validation
  rescue StandardError
    false
  end
end
