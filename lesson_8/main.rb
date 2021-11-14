# frozen_string_literal: true

require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'interface'
require_relative 'manufacturer'
require_relative 'instance_counter'

interface = Interface.new
interface.interface_new
