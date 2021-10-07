class Route
  attr_reader :number, :stations

  def initialize(number, first, last)
    @number = number
    @first = Station.new(first)
    @last = Station.new(last)
    @stations = [@first, @last]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end
end
