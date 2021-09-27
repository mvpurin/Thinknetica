class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

#добавлем промежуточные станции
  def add(station)
    @stations.insert(-2, station)
  end

#удаляем станцию
  def delete(station)
    @stations.delete(station)
  end

end
