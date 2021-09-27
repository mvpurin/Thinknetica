class Station
  @@trains = []

  def initialize(name)
    @name = name
  end

  #станция принимает поезда
  def add_train(train)
    @@trains << train
  end

  #сортировка по типу поезда
  def trains_by_type(type)
    @@trains.select{ |train| train.type == type}.size
  end

  #станция отправляет поезда
  def send(train)
    @@trains.delete(train)
  end

  #вывод списка поездов, находящихся на станции
  def trains
    @@trains
  end

end
