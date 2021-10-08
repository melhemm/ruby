class PassengerWagon < Wagon
  def initialize(id, number_of_seats)
    super
    @type = "passenger"
    @booked_seats = 0
  end

  def booked_seats
    @booked_seats
  end

  def book_seat
    @booked_seats += 1
  end

  def number_of_free_seats
    @number_of_seats - @booked_seats
  end


end

# load './main.rb'
#  train = PassengerWagon.new(213, 30)
# train.book_seat
#  train.all_seats
# train.number_of_free_seats
# train.booked_seats