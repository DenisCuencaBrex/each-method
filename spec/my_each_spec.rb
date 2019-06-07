require "./my_each"

RSpec.describe Enumerable do
    let(:array) { [1,2,3,4] }
    let(:array1) { ["Cat", "Dog", "Tiger"] }
    let(:array_nil) {[true, true, nil]}
    let(:hash) { {a: 1, b: 2} }
    let(:hash1) { {a:"Hello", b:"Hey", c:"Goodbye"} }
    let(:empty_hash) { {} }
    let(:block) { proc {|x| x} }

    describe "#my_each" do
        it "Returns each element of an array" do
            expect(array.my_each {|x| x }).to eql(array)
        end

        it "Works with hash" do
            expect(hash.my_each{|x, val| x}).to eql(hash)
        end

        it "Works with proc" do
            expect(array.my_each{ block }).to eql(array.each{block})
        end

    end   

    describe "#my_each_with_index" do
        it "Returns the index of each element in the array" do
            expect(array.my_each_with_index {|x, index| index}).to eql([0,1,2,3])
        end
    end

    describe "#my_select" do
        it "Returns new array with elements that pass a condition inside a block" do
            expect(array.my_select {|val| val.even?}).to eql([2,4])
        end

        it "Works with hash" do
            expect(hash.my_select{ |key, val| val}).to eql([])
        end

        it "Work with empty hash" do
            expect(empty_hash.my_select {|key, val| value > 2}).to eql([])
        end

        it "Work with procs" do
            expect(array.my_select {block}).to eql(array.my_select{block})
        end
    end

    describe "#my_all?" do
        it "Returns true if the elements in the array pass any condition, if it's not returns false" do
            expect(array1.my_all? {|item| item.length > 1}).to eql(true)
        end
        
        it "Returns true if the elements in the hash pass any condition, if it's not returns false" do
            expect(hash1.my_all?{|key, val| val == 1}).to eql(false)
        end

        it "Returns false if find nil value in array" do
            expect(array_nil.my_all?{|val| val == nil}).to eql(false)
        end
    end

    describe "#my_any?" do
        it "Returns true if it find the value in the array" do
            expect(array1.my_any? {|item| item == 22}).to eql(false)
        end

        it "Returns true if it find the value in the hash" do
            expect(hash.my_any? {|key, value| value == 5}).to eql(false)
        end

        it "Returns false if not block passed" do
            expect(array.my_any?{}).to eql(false)
        end

    end

    describe "#my_none?" do
        it "Returns true if the elements in the array pass any condition, if it's not returns false" do
            expect(["Hi", "Hello", "Hey", "Goodbye"].my_none? {|item| item.length < 10}).to eql(false)
        end
    end

    describe "#my_count" do
        it "Returns the numbers of element in the array" do
            expect([1,2,3,4,5,6].my_count).to eql(6)
        end
    end

        describe "#my_map" do
        it "Returns a new array containing the values of multiply all the elements in the array for itself returned by the block" do
            expect([1,2,3,4].my_map {|x| x * x}).to eql([1,4,9,16])
        end
    end

    describe "#my_inject" do
        it "Returns all the elements in the array into one element"do
            expect([2,2,4].my_inject {|a, b| a + b}).to eql(8)
        end
    end

end



    