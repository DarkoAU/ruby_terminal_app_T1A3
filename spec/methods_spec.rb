
require_relative '../methods'

describe shipping_mode do 
    it 'should return the required shipping mode' do
        volume = 3
        shipping_mode(volume)
        expect(lcl_vol).to eq(volume)
    end
end