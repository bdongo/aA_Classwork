
require "towers"
require "byebug"

describe Towers do 
    subject(:towers) {Towers.new(5)}
    describe "#move" do
        it "moves a element from current to another stack" do
            towers.move(0, 2)
            expect(towers.stack[2].last).to eq(0)
            expect(towers.stack[0].last).to eq(1)
        end
        it "doesn't put larger ring on a smaller ring" do
            # fail = Towers.new(5)
            # fail.move(towers.stack_1, towers.stack_3)
            #  expect{towers.move([2,3,4] ,[1,5])}.to raise_error("invalid move")
            # expect{fail.move(0, 1)}.to raise_error("invalid move")
            towers.move(0,1)
            # towers.move(0,1)
            expect{towers.move(0,1)}.to raise_error("invalid move")
           
        end
    end

end