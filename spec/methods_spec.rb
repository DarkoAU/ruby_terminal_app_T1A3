
require_relative '../methods'

describe "calculate_containers_number" do 
    it 'should return LCL based on volume when volume is less than 15' do
       containers_hash = calculate_containers_number(13)
       expect(containers_hash[:LCL]).to eq(13)
    end
    it 'should return return twenty_foot when volume is between 15 and 25' do
       containers_hash = calculate_containers_number(20)
       expect(containers_hash[:twenty_foot]).to eq(1)
    end
    it 'should return return fourty_foot when volume is over 25 and 50' do
        containers_hash = calculate_containers_number(30)
        expect(containers_hash[:fourty_foot]).to eq(1)
     end
     it 'should return divide volume by number of containers when volume is over 50' do
        containers_hash = calculate_containers_number(120)
        expect(containers_hash[:twenty_foot]).to eq(1)
        expect(containers_hash[:fourty_foot]).to eq(2)
     end
end

describe "calculate_shipping_costs" do
   it 'should return 161.00 for 2.3 from Hamburg Port' do 
      containers = calculate_containers_number(2.3) 
      port = ['Hamburg',1850,3700,70]
      total_cost = calculate_shipping_costs(containers, port)
      expect(total_cost).to eq(161.00)
   end
   it 'should return 2350.00 for 24 cbm from Hong Kong Port' do 
      containers = calculate_containers_number(24)
      port = ['Hong Kong',2350,4700,56]
      total_cost = calculate_shipping_costs(containers, port)
      expect(total_cost).to eq(2350.00)
   end
   it 'should return 3500.00 for 43 cbm from Durban Port' do 
      containers = calculate_containers_number(43)
      port = ['Durban',1750,3500,94]
      total_cost = calculate_shipping_costs(containers, port)
      expect(total_cost).to eq(3500.00)
   end
end
