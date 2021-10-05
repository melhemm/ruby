class CargoWagon < Wagon
  def initialize(id)
    super
    @type = "cargo"
  end
end