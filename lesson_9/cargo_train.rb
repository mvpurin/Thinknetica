# frozen_string_literal: true

# This class defines cargo trains
class CargoTrain < Train
  require './validation.rb'
  include Validation

  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  def train_type
    'cargo'
  end
end
