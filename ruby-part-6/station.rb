class Station
  attr_reader :trains , :name
  include InstanceCounter

  @@stations = []

  STATION_NAME_REGEX = /^[А-Я]{1}[а-яё]{1,23}$/

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    validation
    register_instance
  end

  def receive_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_by_category(type)
    @trains.count {|train| train.type == type}
  end

  def show_trains
    @trains.each {|train| train}
  end

  def self.all
    @@stations
  end

  def validation 
    station_name_validation
  end

  def station_name_validation
    if @name !~ STATION_NAME_REGEX
      raise "Please check station name" 
    end
  end

  def valid?
    return true if validation
    rescue
    false
  end

end