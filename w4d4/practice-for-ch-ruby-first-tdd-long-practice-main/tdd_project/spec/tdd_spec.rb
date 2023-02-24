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
    it "output is an Array" do
        expect(my_uniq(arr).is_a?(Array)).to be true
    end
end

describe "#two_sum" do
    subject(:arr) {[-1, 0, 2, -2, 1]}
    it "finds a pair of elements that add to zero" do
        expect(two_sum([-1, 1])).to eq([[0,1]])
    end
    it "output is an Array" do
        expect(two_sum(arr).is_a?(Array)).to be true
    end
    it "each pair is sorted with smaller index before bigger index" do
        expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
    end
end

describe "#my_transpose" do
    subject(:matrix) {[
                        [0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8]
                        ]}
    let(:switched) {cols = [
                        [0, 3, 6],
                        [1, 4, 7],
                        [2, 5, 8]
                        ]}
    it "returns a transposed square" do
        expect(my_transpose(matrix)).to eq(switched)
    end
     it "output is an Array" do
        expect(my_transpose(matrix).is_a?(Array)).to be true
    end
    it "doesn't call Array#transpose" do
        expect(matrix).not_to receive(:transpose)
        my_transpose(matrix)
    end
end
    
describe "#stock_picker finds largest delta of elements in array" do
    subject(:prices) {[ 5, 9, 11, 4, 8, 13, 2]}
    it "finds biggest delta that has the smallest integer first" do
        expect(stock_picker(prices)).to eq([3, 5])
    end
    it "doesn't find delta if smaller is after larger index" do
        expect(stock_picker(prices)).not_to eq([5, 6])
    end
 
    it "output is an Array" do
        expect(stock_picker(prices).is_a?(Array)).to be true
    end
end

describe 




