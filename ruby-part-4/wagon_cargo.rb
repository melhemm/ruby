class WagonCargo < Wagon
  def initialize(id)
    super
    @type = "cargo"
  end
end