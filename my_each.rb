module Enumerable
    def my_each
       for i in 0..self.length-1
        yield(self[i]) if self.is_a? Array
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

    def my_inject(acc="undefined")
     arr = self
        if self.is_a? Array
        if acc == "undefined"
          acc = self[0]
          arr = self[1..-1]
        end
        arr.my_each do |element|
          acc = yield(acc, element)
        end
      elsif self.is_a? Hash
        if acc == "undefined"
          acc = self[self.keys[0]]
          arr.delete(arr.keys[0])
        end
        arr.my_each do |key, element|
          acc = yield(acc, key, element)
        end
      end
      acc
    end
end

def multiply_els(array)
    array.my_inject{|total, number| total * number}
end


