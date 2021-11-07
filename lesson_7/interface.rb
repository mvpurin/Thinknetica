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
      when 13
        self.train_carriages 
      when 14
        self.take_seat_volume   
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
    puts "To check carriages on the train type 13"
    puts "To take a seat or a volume in the carriage type 14"
    puts "To exit type 0"
    @answer = gets.chomp.to_i
  end

  def new_station
    puts "Enter the station name: "
    name_station = gets.chomp

    if name_station == "exit"
      return
    end

    stations << Station.new(name_station)
  rescue StandardError => e
    puts e.message
    retry
  end

  def new_train
    puts "Enter a number of the train: "
    number = gets.chomp

    if number == ""
  raise "Train number should not be empty! To exit type 'exit'"
    end

    if number == "exit"
      return
    end

    puts "Enter type of the train ('cargo' or 'passenger'): "
    type = gets.chomp.downcase

    if type == "cargo"
      trains << CargoTrain.new(number)
    elsif type == "passenger"
      trains << PassengerTrain.new(number)
    elsif
      raise "Incorrect type of the train! To exit type 'exit'"
    end

    puts "Train number #{number} is added!"

  rescue StandardError => e
    puts e.message
    retry
  end

  def new_route
    puts "Enter the number of the route:"
    number = gets.chomp

    if number == "exit"
      return
    end

    puts "Enter the first station of the route: "
    first = gets.chomp

    puts "Enter the last station of the route: "
    last = gets.chomp

    route = Route.new(number, first, last)
    routes << route
    stations.push(route.stations.first, route.stations.last)

  rescue StandardError => e
    puts e.message
    retry
  end

  def add_station_to_route
    puts "Enter the name of the station: "
    name = gets.chomp

    if name == "exit"
      return
    end

    puts "Enter the number of the route: "
    number = gets.chomp
    station = self.find_station(name)
    route = self.find_route(number)

    if station && route != nil
      route.add_station(station)
    else
      raise "There is no such station or route! To exit type 'exit'"
    end

  rescue StandardError => e
    puts e.message
    retry
  end

  def delete_station_from_route
    puts "Enter the name of the station: "
    name = gets.chomp

    if name == "exit"
      return
    end

    puts "Enter the number of the route: "
    number = gets.chomp

    station = self.find_station(name)
    route = self.find_route(number)

    if route == nil
      raise "There is no such route! To exit type'exit'"
    end

    route.del_station(station)

  rescue StandardError => e
    puts e.message
    retry
  end

  def add_route_to_train
    puts "Enter the train number: "
    train_number = gets.chomp

    if train_number == "exit"
      return
    end

    puts "Enter the number of the route: "
    route_number = gets.chomp
    train = self.find_train(train_number)
    route = self.find_route(route_number)

    if train == nil
      raise "There is no such train! To exit type 'exit'"
    elsif route == nil
      raise "There is no such route! To exit type 'exit'"
    elsif
      train.add_route(route)
    end

  rescue StandardError => e
    puts e.message
    retry
  end

  def add_carriage
    puts "Enter the train number: "
    number = gets.chomp

    if number == "exit"
      return
    end

    puts "Enter the number of the carriage"
    num = gets.chomp

    train = self.find_train(number)

    if train != nil
      if train.type == "cargo"
        puts "Enter the volume of the carriage: "
        volume = gets.chomp.to_f
        carriage = CargoCarriage.new(volume,num)

        #puts "number is nil!!!" if carriage.number.nil?

      elsif train.type == "passenger"
        puts "Enter the number of seats in the carriage: "
        seats = gets.chomp.to_i
        carriage = PassengerCarriage.new(seats,num)
      end
      train.add_carriage(carriage)
    else
      raise "There is no such train! To exit type 'exit'"
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def del_carriage
    puts "Enter the train number: "
    number = gets.chomp

    if number == "exit"
      return
    end

    train = self.find_train(number)

    if train != nil
      train.del_carriage
    else
      raise "There is no such train! To exit type 'exit'"
    end

  rescue StandardError => e
    puts e.message
    retry if number != "exit"
  end

  def move_forward
    puts "Enter the train number: "
    number = gets.chomp

    if number == "exit"
      return
    end

    train = self.find_train(number)
    if train != nil
      train.move_forward
    else
      raise "There is no such train! To exit type 'exit'"
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def move_back
    puts "Enter the train number: "
    number = gets.chomp

    if number == "exit"
      return
    end

    train = self.find_train(number)
    if train != nil
      train.move_back
    else
      raise "There is no such train! To exit type 'exit'"
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def station_train_list
    puts "Enter the station name: "
    name = gets.chomp

    if name == "exit"
      return
    end
    station = self.find_station(name)
    raise "There is no such station! To exit type 'exit" if station.nil?
    #station.trains.each {|train| puts "#{train.number}"}
    station.trains_on_station
  rescue StandardError => e
    puts e.message
    retry
  end

  def station_list
    if stations.any?
      stations.each {|station| puts station.name}
    else
      raise "The station list is empty!"
    end
  rescue StandardError => e
    puts e.message
  end

  def train_carriages
    puts "Enter the number of the train: "
    number = gets.chomp

    train = self.find_train(number)

    if train != nil
      train.carriages_on_train
    else
      raise "There is no such train! To exit type 'exit'"
    end
  rescue StandardError =>e
    puts e.message
  end

  def take_seat_volume
    puts "Enter the train number: "
    number = gets.chomp

    if number == "exit"
      return
    end

    train = self.find_train(number)
    raise "There is no such train. To exit type 'exit'" if train.nil?
    raise "The train does not have any carriages. To exit type 'exit'" if train.carriage_list.empty?

    puts "Enter the number of the carriage: "
    number = gets.chomp.to_i

    carriage = train.carriage_list[number - 1]
    raise "There is no such carriage on this train" if carriage.nil?

    if carriage.type == "cargo"
      puts "Enter the volume which you would like to take: "
      volume = gets.chomp.to_f
      raise "The carriage does not have so much volume!" if volume > carriage.total_place
      carriage.take_volume(volume)
      puts "The carriage number #{carriage.number} has #{carriage.free_place} free volume"
    else
      carriage.take_seat
      raise "the carriage does not have so many free seats!" if carriage.free_place.zero?
      puts "The carriage number #{carriage.number} has #{carriage.free_place} free seats"
    end
  rescue StandardError => e 
    puts e
    retry
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
