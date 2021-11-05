class PassengerCarriage < Carriage
  attr_reader :seats, :all_seats, :number
  attr_writer :seats
  
  #@@number = 1

  def initialize(seats)
    @all_seats = seats.to_i
    @seats = seats.to_i
    #@number = @@number
    #@@number += 1
  end

  def type
    "passenger"
  end

  def take_seat
    if seats == 0
      raise "All seats are taken!"
    else
      self.seats -= 1
    end
  rescue StandardError => e
    puts e.message
  end

  def taken_seats
    all_seats - seats
  end
end
