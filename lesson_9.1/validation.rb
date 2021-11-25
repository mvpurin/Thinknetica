module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validation_list

    def validate(attribute, validation, params = nil)
      @validation_list ||= []
      @validation_list << [attribute, validation, params]
     # p @validation_list
    end
  end

  module InstanceMethods
    def validate!
      #require 'pry'; binding.pry
     # p self.class.instance_variable_get(:@validation_list)
      self.class.superclass.validation_list.each do |value|
        #require 'pry'; binding.pry
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
      puts "Validation: <presence> for attribute value #{attribute}"
      raise "Attribute value is nil or empty!\n\n" if attribute.nil? || attribute.empty?
      puts "Successfully!\n\n"
    end

    def format(attribute, regexp)
      puts "Validation: <format> for attribute value #{attribute}"
      raise "Wrong format for attribute value!\n\n" if attribute !~ regexp
      puts "Successfully!\n\n"
    end

    def tipe(attribute, attribute_class)
      puts "Validation: <type> for attribute value #{attribute}"
      raise "Wrong class for attribute!\n\n" if attribute.class != attribute_class
      puts "Successfully!\n\n"
    end
  end
end
