class Interface
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def interface_new
    loop do
      self.menu

      break if @answer == 0

      case @answer
      when 1
        self.new_station
      when 2
        self.new_train
      when 3
        self.new_route
      when 4
        self.add_station_to_route
      when 5
        self.delete_station_from_route
      when 6
        self.add_route_to_train
      when 7
        self.add_carriage
      when 8
        self.del_carriage
      when 9
        self.move_forward
      when 10
        self.move_back
      when 11
        self.station_train_list
      when 12
        self.station_list
      end
    end
  end

  protected
#Пользователю должен быть доступен только метод interface_new, так как его достаточно для использования программы.
#Доступ к остальным методам должен быть закрыт, так как пользователь программы может вмешаться в ее работоспособность.

  def menu
    puts "To create a station type 1"
    puts "To create a train type 2"
    puts "To create a route type 3"
    puts "To add a station to a route type 4"
    puts "To delete a station from a route type 5"
    puts "To add a route to a train type 6"
    puts "To add a carriage to a train type 7"
    puts "To delete a carriage from a train type 8"
    puts "To move a train forward on a route type 9"
    puts "To move a train back on a route type 10"
    puts "To check the list of trains on station type 11"
    puts "To check list of stations type 12"
    puts "To exit type 0"
    @answer = gets.chomp.to_i
  end

  def new_station
    puts "Enter the station name: "
    name_station = gets.chomp
    stations << Station.new(name_station)
  end

  def new_train
    puts "Enter a number of the train: "
    number = gets.chomp

    puts "Enter a type of the train ('cargo' or 'passenger'): "
    type = gets.chomp.downcase

    if type == "cargo"
      trains << CargoTrain.new(number)
    elsif type == "passenger"
      trains << PassengerTrain.new(number)
    end
  end

  def new_route
    puts "Enter the number of the route:"
    number = gets.chomp

    puts "Enter the first station of the route: "
    first = gets.chomp

    puts "Enter the last station of the route: "
    last = gets.chomp

    route = Route.new(number, first, last)
    routes << route
    stations.push(route.stations.first, route.stations.last)
  end

  def add_station_to_route
    puts "Enter the name of the station: "
    name = gets.chomp

    puts "Enter the number of the route: "
    number = gets.chomp

    station = self.find_station(name)
    route = self.find_route(number)

    if station && route != nil
      route.add_station(station)
    else
      puts "There is no such station or route!"
    end
  end

  def delete_station_from_route
    puts "Enter the name of the station: "
    name = gets.chomp

    puts "Enter the number of the route: "
    number = gets.chomp

    station = self.find_station(name)
    route = self.find_route(number)

    if station && route != nil
      route.del_station(station)
    else
      puts "There is no such station or route!"
    end
  end

  def add_route_to_train
    puts "Enter the train number: "
    train_number = gets.chomp

    puts "Enter the number of the route: "
    route_number = gets.chomp

    train = self.find_train(train_number)
    route = self.find_route(route_number)

    train.add_route(route)
  end

  def add_carriage
    puts "Enter the type of a carriage ('cargo' or 'passenger'): "
    type = gets.chomp.downcase

    puts "Enter the train number: "
    number = gets.chomp

    train = self.find_train(number)

    if train != nil
      if train.type == "cargo"
        carriage = CargoCarriage.new
      elsif train.type == "passenger"
        carriage = PassengerCarriage.new
      end
      train.add_carriage(carriage)
    else
      puts "There is no such train!"
    end
  end

  def del_carriage
    puts "Enter the train number: "
    number = gets.chomp

    train = self.find_train(number)

    if train != nil
      train.del_carriage
    else
      puts "There is no such train!"
    end
  end

  def move_forward
    puts "Enter the train number: "
    number = gets.chomp

    train = self.find_train(number)
    if train != nil
      train.move_forward
    else
      puts "There is no such train!"
    end
  end

  def move_back
    puts "Enter the train number: "
    number = gets.chomp

    train = self.find_train(number)
    if train != nil
      train.move_back
    else
      puts "There is no such train!"
    end
  end

  def station_train_list
    puts "Enter the station name: "
    name = gets.chomp

    station = self.find_station(name)
    station.trains.each {|train| puts "#{train.number}"}
  end

  def station_list
    if stations.any?
      stations.each {|station| puts station.name}
    else
      puts "The station list is empty!"
    end
  end

  def find_route(number)
    routes.find {|route| route.number == number}
  end

  def find_station(name)
    stations.find {|station| station.name == name}
  end

  def find_train(number)
    trains.find {|train| train.number == number}
  end
end
