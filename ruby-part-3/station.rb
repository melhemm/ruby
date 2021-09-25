class Station
  attr_reader :trains , :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_arrived(train)
    @trains << train
  end

  def train_left(train)
    @trains.delete(train)
  end

  def show_category(category)
    @trains.count {|train| train.category == category}
  end

  def show_trains
    @trains.each {|train| puts "#{train}"}
  end

end