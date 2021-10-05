class Station
attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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
end
