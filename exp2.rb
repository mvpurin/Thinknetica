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

class Cargo
  include InstanceCounter
  def initialize
    register_instance
  end
end
class PassCargo < Cargo
   def initialize
   end
end

pass1 = PassCargo.new
puts pass1.register_instance

pass2 = PassCargo.new
puts pass2.register_instance
