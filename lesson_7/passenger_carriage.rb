class PassengerCarriage < Carriage

  def initialize(seats, number)
    super(seats,number)
  end

  def take_seat
    return "All seats are taken!" if free_place.zero?
    @used_place += 1
  end

  def type
    "passenger"
  end
end
