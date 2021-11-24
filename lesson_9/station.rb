# This class describes stations
class Station
  require './instance_counter.rb'
  require './validation.rb'
  include InstanceCounter
  include Validation
  attr_reader :trains, :name

  @@instances = []

  def self.all
    @@instances
  end

  validate :name, :presence
  validate :name, :type, String

  def initialize(name)
    @name = name.to_s
    @trains = []
    register_instance
    self.valid?
  end

  def add_train(train)
    trains << train
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }.size
  end

  def del_train(train)
    trains.delete(train)
  end

  def trains_on_station
    raise 'There are no trains at the station!' if trains.empty?
    trains.each do |train|
      puts "Train number: #{train.number}, type: #{train.type},\
       carriage(s): #{train.carriage_list.size}"
    end
  rescue StandardError => e
    puts e.message
  end
end
