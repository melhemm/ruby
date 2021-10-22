require_relative "accessors"
require_relative "validation"

class Wagon
  attr_reader :id, :type
  

  include Manufacturer
  extend Acсessors
  include Validation

  WAGON_ID_REGEX = /^-?[0-9][0-9,\.]+$/

  attr_accessor_with_history :id , :type
  validates :id , :type, :WAGON_ID_REGEX

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
