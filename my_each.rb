module Enumerable
    def my_each
       for i in 0..self.length-1
        yield(self[i]) if block_given?
       end
       self
    end

    def my_each_with_index
       i = 0
        arr = []
        loop do
            arr << yield(self[i], i)
            i += 1            
            break if i > self.length-1
        end
        arr
    end

    def my_select
        if block_given?
        arr = []
            for i in 0..self.size-1
                if yield(self[i])
                arr << self[i]
                end  
            end
                return arr
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
            false
        end
    end

    def my_none?
        if block_given?
            self.my_each{|x| return false if yield(x) == true}
            true
        else
            false
        end
    end

    def my_count
       return self.size unless block_given?
        number = 0
            self.my_each { |x| number += 1 if yield x }
        number
    end



    def my_map(&proc)
        if block_given?
            arr = []
            self.my_each{|x| arr << yield(x)}
            arr
        else
            puts "not block given"
        end
    end

    def my_inject
     arr = self.to_a
        until arr.length == 1
            arr[0] = yield(arr[0], arr[1])
            arr.delete_at(1)
        end
        arr[0]
    end

end

def multiply_els(array)
    array.my_inject{|total, number| total * number}
end


