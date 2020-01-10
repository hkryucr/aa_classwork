require 'rspec'
require "tdd"

describe "#my_uniq" do 
    subject(:test_array) { [1, 2, 1, 3, 3] }
    let(:result){my_uniq(test_array)}
    it "should take in an array as an argument" do 
        my_uniq(test_array) 
        expect(test_array.is_a?(Array)).to eq(true)
    end

    it "should return an array " do         
        expect(result.is_a?(Array)).to eq(true)
    end

    it "should reduce the original array to contain unique elements" do
        expect(result).to eq([1,2,3])
    end
end

describe "Array#two_sum" do
    subject(:test_array) { [-1, 0, 2, -2, 1] }
    let(:result) {test_array.two_sum}
    it "should take in an array as an argument" do 
        test_array.two_sum
        expect(test_array.is_a?(Array)).to eq(true)
    end

    it "should return a 2D array " do
        result.each do |pair|
            expect(pair.length).to eq(2)
            expect(pair.is_a?(Array)).to eq(true)
        end
        
    end

    it "should find all pairs of positions where the elements at those positions sum to zero" do 
        expect(test_array.two_sum).to eq([[0, 4], [2, 3]])
    end

end

describe "#my_transpose" do
    subject(:test_array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]] }
    let(:result) {my_transpose(test_array)}
    it "should take in a 2d array as an argument" do 
        my_transpose(test_array)
        expect(test_array.is_a?(Array)).to eq(true)
        expect(test_array[0].is_a?(Array)).to eq(true)
    end

    it "should return a 2D array " do
        result.each do |pair|
            expect(pair.is_a?(Array)).to eq(true)
        end
    end

    it "should not use builtin Array#transpose" do 
        expect(test_array).to_not receive(:transpose)
        my_transpose(test_array)
    end
    
    it "should convert rows into columns" do 
        expect(my_transpose(test_array)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
end

describe "#stock_picker" do
    subject(:test_array) {[3,2,4,5,7,1,2,3]}
    let(:result) {stock_picker(test_array)}

    it "should take in an array as an argument" do 
        stock_picker(test_array)
        expect(test_array.is_a?(Array)).to eq(true)
    end

    it "should return a 2D array " do
        expect(result.is_a?(Array)).to eq(true)
    end

    it "should return the most profitable pair of days on which to first buy the stock and then sell the stock" do 
        expect(stock_picker(test_array)).to eq([1,4])
    end
end
