class Train
  attr_reader :speed, :number
  attr_writer :speed

  def initialize(number)
    @number = number
    @carriage_list = []
    @speed = 0
  end

  def speed
    self.speed = 100
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    carriage_list << carriage if speed == 0 && type == carriage.type
  end

  def del_carriage
    carriage_list.delete_at(0) if speed == 0
  end

  def add_route(route)
    @route = route
    @current_station = @route.stations[0]
    @route.stations[0].add_train(self)
  end

  def move_forward
    @current_station.del_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station)+1] if speed != 0 && @current_station != @route.stations[-1]
    @current_station.add_train(self)
  end

  def move_back
    @current_station.del_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station)-1] if speed != 0 && @current_station != @route.stations[0]
    @current_station.add_train(self)
  end

  def next_station
    @next_station = @route.stations[@route.stations.index(@current_station)+1] if @current_station != @route.stations.last && speed != 0
  end

  def previous_station
    @previous_station = @route.stations[@route.stations.index(@current_station)-1] if @current_station != @route.stations.first && speed != 0
  end
end
