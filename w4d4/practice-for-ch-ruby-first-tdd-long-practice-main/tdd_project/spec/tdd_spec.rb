require "rspec"
require "tdd"

describe "#uniq" do
    subject(:arr) { [1,1,2,3]}
    it "removes duplicates from array" do
        expect(my_uniq(arr)).to eq([1, 2, 3])
    end
    it "doesn't call Array#uniq" do
        
        expect(arr).not_to receive(:uniq)
        my_uniq(arr)
    end

end





