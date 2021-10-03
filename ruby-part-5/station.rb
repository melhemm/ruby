class Station
  attr_reader :trains , :name
  include InstanceCounter

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
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
    @trains.each {|train| puts "#{train}"}
  end

  def self.all
    @@stations
  end

end