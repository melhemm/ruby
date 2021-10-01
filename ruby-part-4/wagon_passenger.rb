class WagonPassenger < Wagon
  def initialize(id)
    super
    @type = "passenger"
  end
end