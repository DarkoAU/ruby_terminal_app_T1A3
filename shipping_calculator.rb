require 'csv'
require_relative 'methods'

puts "Welcome to the Melbourne Import FOB calculator"
puts "This calculator will allow you to enter your cargo volume, \nthen determine whether you will need to use a containerized service or ship \nas less than container load"
"\n"
puts "Please let us know your cargo volume"

cargo_volume = gets.chomp.to_f

puts calculate_containers_number(cargo_volume)

puts "now please tell us what is the load port / origin of your goods"

load_port = gets.chomp.capitalize

origin_port(load_port, "./docs/pricing.csv")
