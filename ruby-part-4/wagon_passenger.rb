class WagonPass < Wagon
  def initialize(id)
    super
    @type = "passenger"
  end
end