# frozen_string_literal: true

# This module is used for counting number of objects
# which belong for different classes
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # This module increases the number of instances
  # which belong to a class
  module ClassMethods
    def instances
      @instances ||= 0
    end

    def increse_instances
      @instances = instances + 1
    end
  end

  # This module calls class method increse_instances
  # during the initialize procedure
  module InstanceMethods
    protected

    def register_instance
      self.class.increse_instances
    end
  end
end
