module Enumerable
    def my_each
       for i in 0..self.length-1
        yield(self[i]) if block_given?
       end
       self
    end

    def my_each_with_index
       for i in 0..self.length-1
        yield(self[i], i) if block_given?
       end
       self
    end

    def my_select
        if block_given?
            arr = []
            self.my_each{|x| array_new << x if yield(self)}
            arr
        end
    end

    def my_all?
        if block_given?
            self.my_each{|x| return false if yield(x) == false}
            true
        else
            true
        end
    end

    def my_any?
        if block_given?
            self.my_each{|x| return true if yield(x) == true}
            false
        else
            true
        end
    end

    def my_none?
        if block_given?
            self.my_each{|x| return false if yield(x) == true}
            true
        else
            false
    end

    def my_count
        
    end

    def my_map(&block)
    
    end

    def my_inject

    end

    
end