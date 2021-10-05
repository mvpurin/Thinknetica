class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [Station.new(first), Station.new(last)]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end
end
