require 'csv'
require 'tty-prompt'
require_relative 'methods'

prompt = TTY::Prompt.new

while true
    sys_clear 
    loop do
        menu_select = prompt.select("Welcome to the Melbourne Import Calculator. Please select from one of the folllowing options: \n\n", ['Instruction to Use', 'Run the Shipping Calculator', 'Quit Application'])
        case menu_select
            when 'Instruction to Use'
                how_to_use
                sys_clear
            when 'Run the Shipping Calculator'
                shipping_calculator_running = true
                while shipping_calculator_running
                    sys_clear 
                    puts "Please provide total cargo volume"
                    cargo_volume = gets.chomp.to_f
                    containers = calculate_containers_number(cargo_volume)
                    puts "\n\nNow, please tell us your origin port"
                    port = origin_port('./pricing/pricing.csv')
                    cost = calculate_shipping_costs(containers, port)
                    puts "\n\n\n                    *** The TOTAL FREIGHT COST for your shipment will be US$ #{cost} ***"
                    puts "\n\n\n\nDo you want to do another caculation? Enter 1 for yes, Enter any other key to go back"
                    shipping_calculator_choice = gets.chomp.to_i
                    if shipping_calculator_choice == 1
                        shipping_calculator_running = true
                    else 
                        shipping_calculator_running = false
                        sys_clear
                    end
                end
            when 'Quit Application'
                sys_clear 
                quit
        end
    end
end
