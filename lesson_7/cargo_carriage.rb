class CargoCarriage < Carriage



  def initialize(volume,number)
    super(volume,number)
  end

  def take_volume(arg)
    return "There is no empty volume!" if free_place.zero?
    @used_place = @used_place + arg
  end

  def type
    "cargo"
  end
end
