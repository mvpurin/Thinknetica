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
      validate!
      true
    rescue StandardError => e
      puts e
      false
    end

    def presence(attribute, bla_bla)
      raise "Attribute '#{attribute}' is nil or empty!" if attribute.nil? || attribute.empty?
    end

    def format(attribute, regexp)
      raise "Wrong format for attribute '#{attribute}'!" if attribute !~ regexp
    end

    def type(attribute, attribute_class)
      raise "Wrong class for '#{attribute}'!" if attribute.class != attribute_class
    end
  end
end


class A
  include Validation

  validate :a, :presence
  validate :a, :format, /[A-Za-z]+/
  validate :a, :type, Integer

  def initialize
    @a = "a"
    @b = 12
    p self.valid?
  end
  p class_variable_get(:@@validation_list)
end

class B
  include Validation

  validate :c, :presence
  validate :c, :format, /[A-Za-z]+/
  validate :c, :type, Integer

  def initialize
    @c = "c"
    @d = 15
    p self.valid?
  end
  p class_variable_get(:@@validation_list)
end

a = A.new
b = B.new

