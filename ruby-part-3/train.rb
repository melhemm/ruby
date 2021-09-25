class Train
  attr_accessor :number , :category , :wagons, :speed
  attr_reader :current_station, :route

  def initialize(number, category, wagons) 
    @number = number
    @category = category
    @wagons = wagons
    @speed = 0
  end

  def increase_speed(given_speed)
    @speed += given_speed 
  end

  def break(given_speed)
    if speed - given_speed < 0
      @speed = 0
    else
      @speed -= given_speed
    end
  end

  def add_wagon   
    @wagons += 1 if speed == 0
  end

  def remove_wagon
    @wagons -= 1 if speed == 0
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
end
