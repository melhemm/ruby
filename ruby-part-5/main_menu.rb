class MainMenu 
  def initialize()
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def start_program
    loop do
      puts "Please choose an action to continue:
      \n\t1. Create new station
      \n\t2. Create new train
      \n\t3. Create route
      \n\t4. Train route contoller (Remove and Add route)
      \n\t5. Set a route to train
      \n\t6. Create new wagon 
      \n\t7. Add wagon to train
      \n\t8. Remove wagon. 
      \n\t9. Train Controller (Move to the next station or previous).
      \n\t10. Trains List & Stations List 
      \n\t0. Exit"
      
      choice = gets.to_i

      case choice
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4 
        route_contoller
      when 5
        set_route_to_train
      when 6
        create_new_wagon
      when 7
        add_wagon_to_train
      when 8
        remove_wagon
      when 9
        move_train
      when 10
        trains_list
        stations_list
      when 0
        break
      end
    end
  end

  private
  # все методы ниже являются private поскольку они вызываются только в class MainMenu 

  def create_station 
    puts "name of station"
    station_name = gets.strip.capitalize
    @stations << Station.new(station_name)
  end

  def create_train
    puts "please choose the type of train \n\t1.Cargo\n\t2.Passenger"
    type = gets.to_i
    puts "Enter train's number"
    number = gets.to_i
    type == 1 ? train = CargoTrain.new(number) : train = PassengerTrain.new(number)
    @trains << train
  end

  def create_route
    puts "choose start station"
    stations_list
    first_station_index = gets.to_i
    first_station = @stations[first_station_index - 1]
    puts "choose final station"
    final_station_index = gets.to_i
    final_station = @stations[final_station_index - 1]
    route = Route.new(first_station , first_station)
    @routes << route
  end

  def route_contoller
    puts "Choose route to change"
    all_routes_list
    route_index = gets.to_i
    route = @route[route_index - 1]
    puts "\n\t1. Delete station \n\t2. Add new station"
    choice = gets.to_i
    case choice

    when 1
      puts "Which station would you like to remove from route?"
      route.stations_list
      station_index = gets.to_i
      station = @stations[station_index - 1]
      route.delete_station(station)
    when 2
      puts "Which station would you like to add to route?"
      route.stations_list
      station_index = gets.to_i
      station = @stations[station_index - 1]
      route.add_station(station)
    end
  end

  def set_route_to_train 
    create_route
    puts "Choose Train:"
    trains_list
    train_index = gets.to_i
    train = @trains[train_index - 1]
    puts "Choose route"
    all_routes_list
    route_index = gets.to_i
    route = @routes[route_index - 1]
    train.add_route(route)
  end
  
  def create_new_wagon 
    puts "\n\t1. Passenger wagon \n\t2. Cargo wagon"
    type = gets.to_i
    puts "Create an id for wagon:"
    wagon_id = gets.to_i
    type == 1 ? wagon = WagonPass.new(wagon_id) : wagon = WagonCargo.new(wagon_id)
    @wagons << wagon
    wagon
  end

  def add_wagon_to_train
    puts "Choose a train"
    trains_list
    train_index = gets.to_i
    train = @trains[train_index - 1]
    puts "Wagons list choose one"
    wagons_list
    wagon_index = gets.to_i
    wagon = @wagons[wagon_index - 1]
    train.add_wagon(wagon)
  end

  def remove_wagon
    puts "Choose a train"
    trains_list
    train_index = gets.to_i
    train = @trains[train_index - 1]
    puts "All wagons for this trains"
    train.wagons.each.with_index(1) do |wagon, index|
      puts "#{index}, wagon id: #{wagon.id}, type: #{wagon.type}"
    end
    wagon_index = gets.to_i
    wagon = train.wagons[wagon_index - 1]
    train.remove_wagon(wagon)
  end

  def move_train
    puts "Choose a train"
    trains_list
    train_index = gets.to_i
    train = @trains[train_index - 1]
    puts "\n\t1. Next station \n\t2. Previous station"
    move_train = gets.to_i

    if move_train == 1
      train.move_to_next_station
    elsif move_train == 2
      train.move_to_previous_station
    end
    
  end

  def wagons_list
    @wagons.each.with_index(1) do |wagon, index|
      puts "Index #{index}, id: #{wagon.id}, type: #{wagon.type}."
    end
  end

  def stations_list
    @stations.each.with_index(1) do |station, index|
      puts "#{index}, #{station.name}"
    end
  end

  def all_routes_list
    @routes.each.with_index(1) do |route, index|
      puts "#{route.name}. #{index}"
    end
  end

  def trains_list
    @trains.each.with_index(1) do |train, index|
      puts "#{index} TRAIN NUMBER = #{train.number}, TRAIN TYPE = #{train.type} "
    end
  end

end