class Route
  attr_reader :stations, :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = Station.new(first_station)
    @last_station = Station.new(last_station)
    @stations = [@first_station, @last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end
end
