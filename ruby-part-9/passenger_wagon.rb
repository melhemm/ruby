class PassengerWagon < Wagon
  def initialize(id, number_of_seats)
    super(id)
    @type = 'passenger'
    @number_of_seats = number_of_seats
    @booked_seats = 0
  end

  attr_reader :booked_seats

  def book_seat
    @booked_seats += 1
  end

  def number_of_free_seats
    @number_of_seats - @booked_seats
  end
end
