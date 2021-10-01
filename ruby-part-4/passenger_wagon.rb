class PassengerWagon < Wagon
  def initialize(id)
    super
    @type = "passenger"
  end
end