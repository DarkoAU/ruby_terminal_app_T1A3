require 'csv'
require 'tty-prompt'
require_relative 'methods'

prompt = TTY::Prompt.new

while true
    system "clear"
    loop do
        banner
        menu_select = prompt.select("Welcome to the Melbourne Import Calculator. Please select from one of the folllowing options: \n\n", ['Instruction to Use', 'Run the Shipping Calculator', 'Quit Application'])
        case menu_select
            when 'Instruction to Use'
                how_to_use
            when 'Run the Shipping Calculator'
                shipping_calculator_running = true
                while shipping_calculator_running
                    system "clear"
                    banner
                    puts "Please provide total cargo volume"
                    cargo_volume = gets.chomp.to_f
                    containers = calculate_containers_number(cargo_volume)
                    puts "\n\n3Now, please tell us your origin port"
                    port = origin_port("./docs/pricing.csv")
                    cost = calculate_shipping_costs(containers, port)
                    puts "\nThe total Freight cost for your shipment of will be US$ #{cost}"
                    puts "\n\ndo you want to do another caculation? Press 1 for yes, and press 2 to go back"
                    shipping_calculator_choice = gets.chomp.to_i
                    if shipping_calculator_choice == 1
                        shipping_calculator_running = true
                    else 
                        shipping_calculator_running = false
                        system "clear"
                    end
                end
            when 'Quit Application'
                system "clear"
                banner
                quit
        end
    end
end

