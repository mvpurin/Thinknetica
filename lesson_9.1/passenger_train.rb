# frozen_string_literal: true

# This class defines passenger trains
class PassengerTrain < Train
  # require './validation.rb'
  # include Validation

  # validate :number, :presence
  # validate :number, :type, String
  # validate :number, :format, /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  obj = self.class.superclass
  
  def train_type
    'passenger'
  end
end
