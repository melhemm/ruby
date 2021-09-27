class Station
  attr_reader :trains , :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def receive_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_by_category(category)
    @trains.count {|train| train.category == category}
  end

  def show_trains
    @trains.each {|train| puts "#{train}"}
  end
  
end