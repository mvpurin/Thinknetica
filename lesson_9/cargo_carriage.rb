# frozen_string_literal: true

# This class defines cargo carriages
class CargoCarriage < Carriage
  def initialize(volume, number)
    super(volume, number)
  end

  def take_volume(arg)
    return 'There is no empty volume!' if free_place.zero?

    @used_place += arg
  end

  def carriage_type
    'cargo'
  end
end
