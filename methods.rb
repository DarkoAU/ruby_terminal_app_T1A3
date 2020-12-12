require 'csv'
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
end

def origin_port(name, path)
    pricing = CSV.parse(File.read("./docs/pricing.csv", headers: true))
    row = pricing.find { |row| row.include? name} 
    puts "the freight price per 20' container is US$#{row[1]}, the price freight price per 40' contaienr is US$#{row[2]}, and the LCL price per cubic meter is US$#{row[3]}"
end

def calculate_mode(hash)
    
end

def calculate_container_cost(hash)

end 

# def lcl_service (cargo_volume, "./docs/pricing.csv")
#     lcl_freight_cost = cargo_volume * 
# end