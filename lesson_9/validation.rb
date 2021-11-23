module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    self.class_variable_set(:@@validation_list, [])
  end

  module ClassMethods
    def validate(attribute, validation, params = nil)
      class_variable_get(:@@validation_list) << [attribute, validation, params]
    end
  end

  module InstanceMethods
    def validate!
      self.class.class_variable_get(:@@validation_list).each do |value|
        self.send(value[1], self.instance_variable_get("@#{value[0]}"), value[2])
      end
    end

    def valid?
      if validate!
        true
      else
        false
      end
    end

    def presence(attribute, bla_bla)
      raise "Attribute value is nil or empty!" if attribute.nil? || attribute.empty?
    end

    def format(attribute, regexp)
      raise "Wrong format for attribute value!" if attribute !~ regexp
    end

    def type(attribute, attribute_class)
      raise "Wrong class for attribute!" if attribute.class != attribute_class
    end
  end
end
