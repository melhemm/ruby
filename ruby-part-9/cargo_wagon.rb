class CargoWagon < Wagon
  def initialize(id, total_volume)
    super(id)
    @total_volume = total_volume
    @capacity = 0
    @type = 'cargo'
  end

  def show_available_capacity
    @capacity
  end

  def take_up_volume(volume)
    @capacity += volume
  end

  def available_volume
    @total_volume - @capacity
  end
end
