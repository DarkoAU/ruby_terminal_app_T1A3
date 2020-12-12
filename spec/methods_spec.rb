
require_relative '../methods'

describe "calculate_containers_number" do 
    it 'should return LCL based on volume when volume is less than 15' do
       containers_hash = calculate_containers_number(13)
       expect(containers_hash[:LCL]).to eq(13)
       expect(containers_hash[:twenty_foot]).to eq(0)
       expect(containers_hash[:fourty_foot]).to eq(0)
    end
    it 'should return return twenty_foot when volume is between 15 and 25' do
       containers_hash = calculate_containers_number(20)
       expect(containers_hash[:LCL]).to eq(0)
       expect(containers_hash[:twenty_foot]).to eq(1)
       expect(containers_hash[:fourty_foot]).to eq(0)
    end
    it 'should return return fourty_foot when volume is over 25 and 50' do
        containers_hash = calculate_containers_number(30)
        expect(containers_hash[:LCL]).to eq(0)
        expect(containers_hash[:twenty_foot]).to eq(0)
        expect(containers_hash[:fourty_foot]).to eq(1)
     end
     it 'should return divide volume by number of containers when volume is over 50' do
        containers_hash = calculate_containers_number(120)
        expect(containers_hash[:LCL]).to eq(0)
        expect(containers_hash[:twenty_foot]).to eq(1)
        expect(containers_hash[:fourty_foot]).to eq(2)
     end
end
