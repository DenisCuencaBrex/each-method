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
        if block_given?
            number = 0
            self.my_each{|x| number += 1 if yield(x)}
            number
        else
            puts "not block given"
        end
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
        if nil
            total = nil
        else
            total = self[0]
    end
    for i in 1..self.length
        total = yield(total, i)
    end
    total
    end

end

def multiply_els(array)
    array.my_inject{|total, number| total * number}
end

#TEST

#my_each
[3, 4, 10, 2, 6, 9].my_each {|x| p x }

#my_each_with_index
hash = {
  "Hey" => 0,
  "hello" => 1,
  "Hi" => 2,
  "bye" => 3
}

hash.my_each_with_index{|x, index|hash[x] = index}

puts hash

#my_select
arr = [1,3,4,5,6,7]
arr.my_select{ |num| num.even?}  

#my_all?
arr1 = ["hi", "Hello", "Hey", "goodbye"]
puts arr1.my_all?{|item| item.length > 1}

#my_any?
puts arr1.my_any?{|item| item.length == 2}

#my_none
puts arr1.my_none?{|item| item.length < 10}

#my_count
arr2 = [1, 3, 4, 8, 10]
puts arr2.my_count{ |x| x%4==0 }  

#my_map
puts arr2.my_map{|x| x*x}

#my_inject
arr3 = [2,4,4]
puts arr3.my_inject{|sum, n| sum + n}
puts arr3.my_inject{|mul, n| mul * n}

#multiply_els
p multiply_els([2, 4, 5])  

