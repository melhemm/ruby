require './main_menu'
require './manufacturer'
require './instance_counter'
require './station'
require './route'
require './train'
require './wagon'
require './cargo_train'
require './cargo_wagon'
require './passenger_train'
require './passenger_wagon'

# load 'main.rb'
controller = MainMenu.new
controller.start_program
