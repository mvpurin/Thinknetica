class Carriage
  require './manufacturer.rb'
  include Manufacturer

  attr_reader :type, :total_place, :used_place, :number

  @@number = 1

  def initialize(total_place)
    @type = self.type
    @total_place = total_place
    @used_place = 0
    @number = @@number
    @@number += 1
  end

  def free_place
    @total_place - @used_place
  end
end
