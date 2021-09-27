class Train
  attr_accessor :speed
  attr_reader :carriages_count, :route, :current_station, :next_station, :previous_station

  def initialize(number, type, carriages_count)
    @number = number
    @type = type
    @carriage = carriages_count
  end

  def speed_up(value) #поезд набирает скорость
    self.speed = value
  end

  def stop #поезд тормозит
    self.speed = 0
  end

  def get_carriage
    @carriage += 1 if @speed == 0
  end

  def del_carriage
    @carriage -= 1 if @speed == 0
  end

  def add_route(route) #поезд принимает маршрут следования
    @route = route
    @current_station = route.stations[0]
  end

  #предыдущая станция
  def previous_station
    if @current_station != @route.stations.first && @speed != 0
      @previous_station = @route.stations[@route.stations.index(@current_station) - 1]
    end
  end

  #Последующая станция
  def next_station
    if @current_station != @route.stations.last && @speed != 0
      @next_station = @route.stations[@route.stations.index(@current_station) + 1]
    end
  end

  #поезд движется вперед
  def forward
    unless self.next_station.nil?
      @current_station = @route.stations[@route.stations.index(@current_station) + 1]
    end
  end

  #поезд движется назад
  def back
    unless self.previous_station.nil?
      @current_station = @route.stations[@route.stations.index(@current_station) - 1]
    end
  end
end
