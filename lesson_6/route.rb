class Route
  require './instance_counter.rb'
  include InstanceCounter

  attr_reader :number, :stations

  NUMBER_FORMAT = /^\d+$/

  def initialize(number, first, last)
    @number = number
    @first = Station.new(first)
    @last = Station.new(last)
    @stations = [@first, @last]
    register_instance
    validate!
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    raise "There is no such station on the route! To exit type 'exit'" unless stations.include?(station)
    raise "You can not delete the first station in the route! To exit type 'exit'" if station == stations.first
    raise "You can not delete the last station in the route! To exit type 'exit'" if station == stations.last
    stations.delete(station)
  end

  def validate!
    raise "Number of the route should not be empty! To exit type 'exit'" if number.empty?
    raise "Number of the route should be numerical! To exit type 'exit'" if number !~ NUMBER_FORMAT
  end
end
