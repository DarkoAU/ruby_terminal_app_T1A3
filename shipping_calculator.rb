require 'CSV'
require_relative 'methods'

puts "Welcome to the Melbourne Import FOB calculator"
puts "This calculator will allow you to enter your cargo volume, \nthen determine whether you will need to use a containerized service or ship \nas less than container load"
"\n"
puts "Please let us know your cargo volume"

load_port = 0
lcl_vol = 0
no_20_container = 0
no_40_containers = 0

cargo_volume = gets.chomp.to_f

puts shipping_mode(cargo_volume)

puts "now please tell us what is the load port / origin of your goods"

load_port = gets.chomp.downcase

