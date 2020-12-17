require 'csv'
require 'tty-prompt'
require_relative 'methods'

while true
    case menu_select
        when 1 
            how_to_use
        when 2
            shipping_calculator_running = true
            while shipping_calculator_running
                system "clear"
                banner
                puts "Please provide total cargo volume"
                cargo_volume = gets.chomp.to_f
                containers = calculate_containers_number(cargo_volume)
                puts "Now, please tell us your origin port"
                load_port = gets.chomp.capitalize
                port = origin_port(load_port, "./docs/pricing.csv")
                cost = calculate_shipping_costs(containers, port)
                puts "Total cost for your shipping will be USD #{cost}"
                puts "do you want to do another caculation? Press 1 for yes, and press 2 to go back"
                shipping_calculator_choice = gets.chomp.to_i
                if shipping_calculator_choice == 1
                    shipping_calculator_running = true
                else 
                    shipping_calculator_running = false
                end
            end
        when 3
            system "clear"
            banner
            quit
    end
end



# puts "\n\nWelcome to the Melbourne Import FOB calculator"
# puts "This calculator will allow you to enter your cargo volume, \nthen determine whether you will need to use a containerized service or ship \nas less than container load"
# "\n"
# puts "Please let us know your cargo volume"

# cargo_volume = gets.chomp.to_f

# puts calculate_containers_number(cargo_volume)


# puts "now please tell us what is the load port / origin of your goods"

# load_port = gets.chomp.capitalize

# origin_port(load_port, "./docs/pricing.csv")

