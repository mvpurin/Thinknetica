# frozen_string_literal: true

# This class describes carriages and contains information
# about their types, numbers and volume / places
class Carriage
  require './manufacturer.rb'
  require './accessors.rb'
  require './validation.rb'
  include Manufacturer
  include Validation
  extend Accessors

  attr_reader :type, :total_place, :used_place, :number

  attr_accessor_with_history :used_place
  strong_attr_accessor :type, String

  validate :total_place, :presence
  validate :total_place, :tipe, Integer
  validate :total_place, :format, /^\d/i

  def initialize(total_place, number)
    @type = self.carriage_type
    @total_place = total_place
    @used_place = 0
    @number = number
    #self.valid?
  end

  def free_place
    @total_place - @used_place
  end
end
