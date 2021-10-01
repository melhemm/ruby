require './main_menu'
require './station'
require './route'
require './train'
require './wagon'
require './cargo_train'
require './wagon_cargo'
require './passenger_train'
require './wagon_passenger'

controller = MainMenu.new
controller.start_program
