class CargoCarriage < Carriage
  attr_reader :all_volume, :volume, :number
  attr_writer :volume

  @@number = 1

  def initialize(volume)
    @all_volume = volume.to_f
    @volume = volume.to_f
    @number = @@number
    @@number += 1
  end

  def take_volume(arg)
    if volume == 0
      raise "There is no empty volume!"
    else
      self.volume = volume - arg.to_f
    end
  rescue StandardError => e
    puts e.message
  end

  def taken_volume
    all_volume - volume
  end

  def type
    "cargo"
  end
end
