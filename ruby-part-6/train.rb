class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :current_station, :route, :speed, :wagons, :type , :number
  
  @@trains = []
  @counter = 0

  TRAIN_NUMBER_REGEX = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i
  # ^-?[0-9][0-9,\.]+$

  def initialize(number) 
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @@trains[number.to_i] = self
    register_instance
    validate!
  end

  def validate!
    errors = []
    errors << 'check train number' if @number !~ TRAIN_NUMBER_REGEX
    raise errors.join('.') unless errors.empty?
  end

  def valid?
    validate!
    true
   rescue
    false
  end

  def self.find(number)
    @@trains[number]
  end

  def increase_speed(value)
    max_train_speed = 120
    speed + value < max_train_speed ? @speed += value : @speed
  end

  def break(value)
    speed - value < 0 ? @speed = 0 : @speed -= value
  end

  def add_wagon(wagon)
    if @speed.zero? 
      if self.type == wagon.type
        @wagons << wagon
      end
    end
  end

  def remove_wagon(wagon)
    @wagons.delete(wagon) if speed == 0
  end

  def add_route(route)
    @route = route
    @current_station = route.stations.first
  end

  def move_to_next_station
    current_station_index = route.stations.find_index(current_station)
    return current_station if current_station_index >= route.stations.size - 1
    @current_station = route.stations[current_station_index + 1] 
  end

  def move_to_previous_station
    current_station_index = route.stations.find_index(current_station)  
    return current_station  if current_station_index == 0
    @current_station = route.stations[current_station_index - 1]
  end

  def show_next_station
    current_station_index = route.stations.find_index(current_station)
    next_station = route.stations[current_station_index + 1]
    puts "The next station is: #{next_station}"
  end

  def show_prev_station
    current_station_index = route.stations.find_index(current_station)
    prev_station = route.stations[current_station_index - 1]
    puts "The prev station is: #{prev_station}"
  end
end
