require "./my_each"

RSpec.describe Enumerable do
    describe "#my_each" do
        it "Returns each element of an array" do
        expect([3, 4, 10, 2, 6, 9].my_each {|x| x }).to eql([3, 4, 10, 2, 6 ,9])
        end
    end   
end

RSpec.describe Enumerable do
    describe "#my_each_with_index" do
        it "Returns the index of each element in the array" do
            expect([1,2,3].my_each_with_index {|x, index| index}).to eql([0,1,2])
        end
    end
end

RSpec.describe Enumerable do
    describe "#my_select" do
        it "Returns new array with elements that pass a condition inside a block" do
            expect([1,3,4,5,6,7].my_select {|num| num.even?}).to eql([4,6])
        end
    end
end

RSpec.describe Enumerable do
    describe "#my_all?" do
        it "Returns true if the elements in the array pass any condition, if it's not returns false"do
            expect(["Hi", "Hello", "Hey", "Goodbye"].my_all? {|item| item.length > 1}).to eql(true)
        end
    end
end

RSpec.describe Enumerable do
    describe "#my_any?" do
        it "Returns true if the elements in the array pass any condition, if it's not returns false" do
            expect(["Hi", "Hello", "Hey", "Goodbye"].my_any? {|item| item.length == 22}).to eql(false)
        end
    end
end

RSpec.describe Enumerable do
    describe "#my_none?" do
        it "Returns true if the elements in the array pass any condition, if it's not returns false" do
            expect(["Hi", "Hello", "Hey", "Goodbye"].my_none? {|item| item.length < 10}).to eql(false)
        end
    end
end