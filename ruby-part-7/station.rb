class Station
  attr_reader :trains , :name
  include InstanceCounter

  @@stations = []

  STATION_NAME_REGEX = /^[А-Я]{1}[а-яё]{1,23}$/

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    validate!
    register_instance
  end

  def station_block(block)
    @trains.each do |train|
      block.call(train)
    end
  end

  def validate!
    errors = []
    errors << 'check station name' if @name !~ STATION_NAME_REGEX
    raise errors.join('.') unless errors.empty?
  end

  def valid?
    validate!
    true
   rescue
    false
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

end