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

def menu_select
    system "clear"
    banner
    puts "Press 1 for instructions on how to use this calculator"
    puts "Press 2 to run the calculator"
    puts "Press 3 to exit"
    input = gets.chomp.to_i
    return input
end

def quit 
    puts "Are you sure you want to quit?"
    response = gets.chomp
    while response.downcase == "yes"
        puts "Thank you for using our calculator and we hope to see you again soon!"
        exit
    begin
        puts "invalid input"
    rescue => exception
end

def how_to_use 
    #system "clear"
    banner
    puts "   1. Enter your cargo volume. This will help us determine whether you will require to ship your goods as Less than Container Load (LCL) or as Full Container Load (FCL)"
    puts "\n   2. Enter your load port. Supported ports are: "
    pricing = CSV.parse(File.read("./docs/pricing.csv", headers: true))
        pricing.each do |row| 
                puts "\n                  "" - #{row[0]}"
        end
    puts "\n   3. The calculator will display your total price based on the provided cargo volume"
    puts "\n\nDo you want to return to the main menu? (Type 'Y' and press enter)"
    input = gets.chomp.downcase
        if input == "y"
        menu_select
        else
         puts "you have entered an invalid input"
        end
end

def calculate_containers_number(volume)
    containers = {LCL: 0, twenty_foot: 0, fourty_foot: 0}
    if volume < 15
        containers[:LCL] += volume
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
    return containers
    puts "   The most cost effective way to ship this cosningment is as #{containers}"
end

def origin_port(name, path)
    pricing = CSV.parse(File.read("./docs/pricing.csv", headers: true))
    row = pricing.find { |row| row.include? name} 
    return row
    puts "the freight price per 20' container is US$#{row[1]}, the price freight price per 40' container is US$#{row[2]}, and the LCL price per cubic meter is US$#{row[3]}"
end

def calculate_mode(hash)

end

def calculate_container_cost(hash)

end 