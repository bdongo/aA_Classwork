require "rspec"
require "tdd"

describe "#uniq" do
    it "removes duplicates from array" do
        arr = []
        expect(my_uniq([1, 1, 1, 2, 3])).to eq([1, 2, 3])
    end
end

