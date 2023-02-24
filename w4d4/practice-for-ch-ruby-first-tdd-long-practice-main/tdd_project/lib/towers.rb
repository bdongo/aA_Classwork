require "byebug"

class Towers
    attr_accessor :stack
    def initialize(stack_size)
        @temp = (0...stack_size).to_a
        @stack = [@temp.reverse, [], []]
    end

    def move(from, to)
        
     
        if @stack[to].empty? ||  @stack[to].last > @stack[from].last
            @stack[to].push(@stack[from].pop)
        else
            raise "invalid move"
        end

     
    end

end