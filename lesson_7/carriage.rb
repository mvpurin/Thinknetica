class Carriage
  require './manufacturer.rb'
  include Manufacturer

  attr_reader :type, :total_place, :used_place, :number

  def initialize(total_place,number)
    @type = self.type
    @total_place = total_place
    @used_place = 0
    @number = number
  end

  def free_place
    @total_place - @used_place
  end
end
