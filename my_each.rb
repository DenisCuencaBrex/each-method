module Enumerable
    def my_each
       if self.is_a? Array
        for i in 0...self.length
            yield self[i]
        end
        elsif self.is_a? Hash
            for key in self.keys
                yield key, self[key]
            end
        else return false
        end
        self
    end

    def my_each_with_index
       index = 0
       if self.is_a? Array
        for i in 0...self.length
            yield self[i], i
        end
        elsif self.is_a? Hash
            for key in self.keys
                yield [key, self[key]], index
                index += 1
            end
        else
            return false
        end
        self
    end

    def my_select
        if self.is_a? Array
            val = []
            self.my_each do |element|
                case yield element
                when true then val << element
                end
            end
            elsif self.is_a? Hash
                val = {}
                self.my_each do |key, element|
                    case yield key, element
                    when true then val[key] = element
                    end
                end
            else return false
            end
            val
        end

    def my_all?
       if self.is_a? Array
        self.my_each do |element|
            case yield element
            when false then return false
            end
        end
        elsif self.is_a? Hash
            self.my_each do |key, element|
                case yield key, element
                when false then return false
                end
            end
        else
            return nil
        end
        true
    end

    def my_any?
        if self.is_a? Array
            self.my_each do |element|
                case yield element
                when true then return true
                end
            end
            elsif self.is_a? Hash
                self.my_each do |key, element|
                    case yield key, element
                    when true then return true
                    end
                end
            else
                return nil
            end
            false
    end

    def my_none?
         if self.is_a? Array
            self.my_each do |element|
                case yield element
                when true then return false
                end
            end
            elsif self.is_a? Hash
                self.my_each do |key, element|
                    case yield key, element
                    when true then return false
                    end
                end
            else
                return nil
            end
            true
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

   def my_inject(result=0)
        self.my_each{|x| result = yield(result, x) }
            result
    end


end

    def multiply_els(array)
        array.my_inject(1){|total, number| total * number}
    end


