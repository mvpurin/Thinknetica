module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    def instances
      @instances ||= 0
    end
    def increse_instances
      @instances = instances + 1
    end
  end
  module InstanceMethods
    def register_instance
      self.class.increse_instances
    end
  end
end

class Carriage
  include InstanceCounter
  def initialize
    register_instance
  end
end

class PassCarriage < Carriage
   def initialize
   end
end

class CargoCarriage < Carriage
   def initialize
   end
end

carriage1 = PassCarriage.new
puts carriage1.register_instance

carriage2 = PassCarriage.new
puts carriage2.register_instance

carriage3 = CargoCarriage.new
puts carriage3.register_instance
