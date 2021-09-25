class Route

  attr_reader :stations

  def initialize(station_first, station_last)
    station_first = station_first
    @@station_last = station_last
    @stations = []
    @stations << station_first
    @stations << @@station_last
  end

#добавлем промежуточные станции
  def add_station(station_name)
    @stations[@stations.length-1] = station_name
    @stations << @@station_last
  end

#удаляем станцию
  def delete_station(station_name)
    @stations.delete(station_name)
  end

#Выводим список станций
  #def station_list
    #@stations
  #end

end
