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
    end
  end

  module InstanceMethods
    def validate!(arg)
      #require 'pry'; binding.pry
      #self.class.superclass.validation_list.each do |value|
        require 'pry'; binding.pry
        if arg == Object #Родительский класс
          self.class.validation_list.each do |value|
            self.send(value[1], self.instance_variable_get("@#{value[0]}"), value[2])
          end
        elsif arg.superclass == Object #классы-наследники
          arg.validation_list.each do |value|
            self.send(value[1], self.instance_variable_get("@#{value[0].to_s}"), value[2])
          end
        end
      end

    def valid?(arg)
      #self.class.send(:arg)
      @arg = arg
      if validate!(arg)
        true
      else
        false
      end
    end

    def presence(attribute, bla_bla)
      puts "Validation: <presence> for attribute value #{attribute}"
      case attribute
      when attribute.class != Float
        raise "Attribute value is nil or empty!\n\n" if attribute.nil? || attribute.empty?
      when attribute.class == Float
        raise "Attribute value is nil or empty!\n\n" if attribute.nil?
      end
      puts "Successfully!\n\n"
    end

    def format(attribute, regexp)
      puts "Validation: <format> for attribute value #{attribute}"
      raise "Wrong format for attribute value!\n\n" if !(attribute =~ regexp)
      puts "Successfully!\n\n"
    end

    def tipe(attribute, attribute_class)
      puts "Validation: <type> for attribute value #{attribute}"
      raise "Wrong class for attribute!\n\n" if attribute.class != attribute_class
      puts "Successfully!\n\n"
    end
  end
end
