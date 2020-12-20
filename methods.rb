require 'csv'

def banner
    puts "\n\n"   
    puts "                                                                              ███████╗░█████╗░██████╗░  ██╗███╗░░░███╗██████╗░░█████╗░██████╗░████████╗"
    puts "                                                                              ██╔════╝██╔══██╗██╔══██╗  ██║████╗░████║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝"
    puts "                                                                              █████╗░░██║░░██║██████╦╝  ██║██╔████╔██║██████╔╝██║░░██║██████╔╝░░░██║░░░"
    puts "                                                                              ██╔══╝░░██║░░██║██╔══██╗  ██║██║╚██╔╝██║██╔═══╝░██║░░██║██╔══██╗░░░██║░░░"
    puts "                                                                              ██║░░░░░╚█████╔╝██████╦╝  ██║██║░╚═╝░██║██║░░░░░╚█████╔╝██║░░██║░░░██║░░░"
    puts "                                                                              ╚═╝░░░░░░╚════╝░╚═════╝░  ╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░"
    puts "\n"
    puts "                                                                              ░█████╗░░█████╗░██╗░░░░░░█████╗░██╗░░░██╗██╗░░░░░░█████╗░████████╗░█████╗░██████╗░"
    puts "                                                                              ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██║░░░██║██║░░░░░██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗"
    puts "                                                                              ██║░░╚═╝███████║██║░░░░░██║░░╚═╝██║░░░██║██║░░░░░███████║░░░██║░░░██║░░██║██████╔╝"
    puts "                                                                              ██║░░██╗██╔══██║██║░░░░░██║░░██╗██║░░░██║██║░░░░░██╔══██║░░░██║░░░██║░░██║██╔══██╗"
    puts "                                                                              ╚█████╔╝██║░░██║███████╗╚█████╔╝╚██████╔╝███████╗██║░░██║░░░██║░░░╚█████╔╝██║░░██║"
    puts "                                                                              ░╚════╝░╚═╝░░╚═╝╚══════╝░╚════╝░░╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝"
    puts "\n\n\n"
    puts "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
end

def quit 
    loop do 
        puts "Are you sure you want to quit? (Enter Y to quit, Enter any other button to return to Main Menu)"
        response = gets.chomp.downcase
        if response == 'y'
            puts "Thank you for using our calculator and we hope to see you again soon!"
            system "clear"
            exit
        else
            system "clear"
            break
        end
    end
end

def how_to_use 
    system "clear"
    banner
    puts "   1. Enter your cargo volume. This will help us determine whether you will require to ship your goods as Less than Container Load (LCL) or as Full Container Load (FCL)"
    puts "\n                ""*    LCL (Less than Container Load) is the recommended shipping method for any cargo under 15 cubic meters in volume."
    puts "\n                ""*    20' Container Load (FCL) is the recommended shipping method for any cargo between 15 cubic meters and 25 cubic meters in volume."
    puts "\n                ""*    40' Container Load (FCL) is the recommended shipping method for any cargo between 25 cubic meters and 50 cubic meters in volume."
    puts "\n\n   2. Enter your load port. Supported ports are: "
    pricing = CSV.parse(File.read("./docs/pricing.csv", headers: true))
        pricing.each do |row| 
                puts "\n                  "" - #{row[0]}" 
        end
    puts "\n   3. The calculator will display your total price based on the provided cargo volume"
    puts "\n\nEnter any key to return to main menu"
    input = gets.chomp.downcase
    system "clear"
end

def calculate_containers_number(volume)
    containers = {LCL: 0, twenty_foot: 0, fourty_foot: 0}
    if volume < 15
        containers[:LCL] += volume
        containers.delete_if { |key, value| value == 0}
        puts "\n         >>>>  Based on the volume you have provided (#{containers[:LCL]} cbm), the most cost effective method for your shipment is LCL (Less than Container Load) <<<<"
        return containers
    end
    
        while volume > 0 
            if volume <= 25 
                containers[:twenty_foot] +=1 
                volume -= 25
            else 
                containers[:fourty_foot] +=1
                volume -= 50
            end
        end  
    containers.delete_if { |key, value| value == 0}
    puts "\n\n   >>>> Based on the volume you have provided, you will require the following amount of Full Container Loads: <<<<"
    containers.each do |key, value| 
       puts "       " "\n   * #{key} : #{value}"
    end
    return containers
    
end


def origin_port(path)
    begin 
        load_port = gets.chomp.split.map(&:capitalize).join(' ')
        pricing = CSV.parse(File.read(path, headers: true))
        row = pricing.find { |row| row.include? load_port} 
        puts "\nFor this port, the freight price per 20' container is US$#{row[1]}, the freight price per 40' container is US$#{row[2]}, and the LCL price per cubic meter is US$#{row[3]}"
        return row
    rescue NoMethodError
        puts "You have entered and invalid Port. A list of supported ports can be found in the instructions menu.\n\nPlease enter a valid Origin Port:"
        retry 
    end
end

def calculate_shipping_costs(containers, port)
    if containers[:LCL] 
        total_cost = containers[:LCL].to_f * port[3].to_f
    else 
        total_cost = (containers[:twenty_foot].to_f * port[1].to_f) + (containers[:fourty_foot].to_f * port[2].to_f)

    end
    return total_cost.to_f
end
