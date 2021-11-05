class Carriage
  require './manufacturer.rb'
  include Manufacturer

  attr_reader :type
  @@number = 1

  def initialize
    @type = self.type
    @number = @@number
    @@number += 1
  end
end
