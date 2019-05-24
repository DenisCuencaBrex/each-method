module Enumerable
    def my_each
       for i in self
        yield(i)
       end 
    end

    def my_each_with_index
        i = 0
        arr = []
        loop do
            arr << yield(self[i], i)
            i += 1
            break if i > self.length - 1
        end
        arr
    end

    def my_select
        arr = []
        self.my_each{|x| arr << x if yield(x)}
        arr 
    end

    def my_all?
        self.my_each{|x| return false unless yield(x)}
        true
    end

    def my_any?
        
    end

    def my_none?

    end

    def my_count
        
    end

    def my_map

    end

    def my_inject

    end

    
end