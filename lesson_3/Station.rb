class Station

  @@trains_passenger = []
  @@trains_freight = []
  @@trains = []

  def initialize(station_name)
    @station_name = station_name
  end

  #станция принимает поезда, train_number - номер поезда, #train_type - вид поезда (грузовой, пассажирский)
  def add_train(train_number, train_type)
    if train_type == "пассажирский"
      @@trains_passenger << train_number
    elsif train_type == "грузовой"
      @@trains_freight << train_number
      end
  end

  #станция отправляет поезда
  def delete_train(train_number)
    if @@trains_passenger.include?(train_number)
      @@trains_passenger.delete(train_number)
    else
      @@trains_freight.delete(train_number)
    end
  end

  #вывод списка поездов, находящихся на станции
  def train_list
    @@trains = @@trains_passenger + @@trains_freight
    puts "Все поезда, находящиеся на станции: #{@@trains}"
  end

  #Вывод количества грузовых и пассажирских поездов
  def train_number
    puts "На станции #{@@trains_passenger.length} пассажирских и #{@@trains_freight.length} грузовых поездов"
  end

end
