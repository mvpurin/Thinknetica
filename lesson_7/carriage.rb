class Carriage
  require './manufacturer.rb'
  include Manufacturer

  attr_reader :type

  def initialize
    @type = self.type
  end
end
