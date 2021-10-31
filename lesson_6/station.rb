class Station
  require './instance_counter.rb'
  include InstanceCounter
  attr_reader :trains, :name

  @@instances = []

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name.to_s
    @trains = []
    register_instance
    validate!
  end

  def add_train(train)
    trains << train
  end

  #возвращает список поездов на станции по типу
  def trains_by_type(type)
    trains.select{|train| train.type == type}.size
  end

  def del_train(train)
    trains.delete(train)
  end

  def valid?
    validate!
    true
    rescue
      false
  end

  def validate!
    raise "Station name should not be empty! To exit type 'exit'" if name.empty?
  end
end
