class Train
  require './manufacturer.rb'
  require './instance_counter.rb'
  include Manufacturer
  include InstanceCounter

  attr_reader :speed, :number
  attr_writer :speed

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  @@trains = []

  def initialize(number)
    validate!(number)
    @number = number
    @carriage_list = []
    @speed = 0
    @@trains.push(self)
    register_instance
  end

  def speed
    self.speed = 100
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    @carriage_list << carriage
    puts "The train has #{@carriage_list.size} carriages"
  end

  def del_carriage
    if @carriage_list.empty?
      raise "The train does not have any carriages! To exit type 'exit"
    else
      @carriage_list.delete_at(0)
      puts "The train has #{@carriage_list.size} carriages"
    end
  end

  def add_route(route)
    @route = route
    @current_station = @route.stations[0]
    @route.stations[0].add_train(self)
  end

  def move_forward
    raise "The train is on the last station of the route!" if @current_station == @route.stations[-1]
    @current_station.del_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station)+1] if speed != 0
    @current_station.add_train(self)
  end

  def move_back
    raise "The train is on the first station of the route!" if @current_station == @route.stations[0]
    @current_station.del_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station)-1] if speed != 0
    @current_station.add_train(self)
  end

  def next_station
    @next_station = @route.stations[@route.stations.index(@current_station)+1] if @current_station != @route.stations.last && speed != 0
  end

  def previous_station
    @previous_station = @route.stations[@route.stations.index(@current_station)-1] if @current_station != @route.stations.first && speed != 0
  end

  def find(number)
    @@trains.find{|train| train.number == number}
  end

  def valid?
    validate!
    true
  rescue
      false
  end

  def validate!(number)
    raise RuntimeError, "Train number format is invalid! To exit type 'exit'" if number !~ NUMBER_FORMAT
  end
end
