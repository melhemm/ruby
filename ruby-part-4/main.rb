require './main_menu'
require './station'
require './route'
require './train'
require './wagon'
require './cargo_train'
require './cargo_wagon'
require './passenger_train'
require './passenger_wagon'

controller = MainMenu.new
controller.start_program
