def shipping_mode(volume)
    case volume
    when (0.1..15.00)
        lcl_vol = volume
        puts "Ok, based on your cargo volume of #{lcl_vol} ccubic meters, we suggest using a Less than container load service as the most cost effective option for your shipment"
    when (15.00..25.00) 
        no_20_containers = 1 
        puts "based on your cargo dimenison we suggest shipping your goods in #{no_20_containers} 20' container" 
    when (25.01..50.00)
        no_40_containers = 1
        puts "you will require #{no_40_containers} x 40' container" 
    when (50.01..Float::INFINITY)   
        unless volume%50 != 0 && volume%50 <= 25
            no_40_containers = (volume/50).round
            puts "you will require #{no_40_containers} x 40' containers"
        else
            no_40_containers = (volume/50).round
            no_20_containers = 1 
            puts "you will require #{no_40_containers} x 40' containers and #{no_20_containers} x 20' container"
        end
    else
        system "clear"
        puts "You have entered an invalid value"
    end
end

# def lcl_service (cargo_volume, "./docs/pricing.csv")
#     lcl_freight_cost = cargo_volume * 
# end