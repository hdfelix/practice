# 1. is n divisible by x and y
# 2. Create a function (or write a script in Shell) that takes an integer
# as an argument and returns "Even" for even numbers or "Odd" for odd numbers.

require './lib/methods'

describe '#even_or_odd' do
  it "returns 'Even' for even numbers" do
    # require 'pry'; require 'pry-byebug'; binding.pry
    expect(Methods::even_or_odd(112)).to eq 'Even'
  end

  it "returns 'Odd' for odd numbers" do
    expect(Methods::even_or_odd(13)).to eq 'Odd'
  end
end

describe '#divisible_by' do
  context 'when number is divisible by both divisors' do
    it 'returns true for 3 divisible by 1, and 3' do
      expect(Methods::divisible_by(3,1,3)).to be true
    end

    it 'returns true for 12, divisible by 3, and 6' do
      expect(Methods::divisible_by(12,3,6)).to be true
    end
  end

  context 'a number is divisible by one of two divisor' do
    it 'returns false for 15, 5, 2' do
      expect(Methods::divisible_by(15, 5, 2)).to be false
    end
  end

  context 'a number is not divisible by either divisor' do
    it 'returns false for 7, 2, 3' do
      expect(Methods::divisible_by(7,2,3)).to be false
    end
  end
end

# codekata.com kata02
# Write a binary chop method that takes an integer search target and a sorted array of integers.
# It should return the integer index of the traget in the array, or -1 if the  target is not in the array.
# Assume the array has less than 100,000 elements (time and memory perf are not an issue)
# The signature will logically be:
#    chop(int, array_of_int) -> int
describe '#chop' do
  context 'empty array' do
    it 'returns -1 since there are no elements in an empty array' do
      expect(Methods::chop(2, [])).to eq -1
    end
  end

  context 'array contains an element that is not an integer' do
    it 'raises an error' do
      expect { Methods::chop(2, ['a']) }.to raise_error('Array should be an array of integers')
      expect { Methods::chop(2, [2, 'a']) }.to raise_error(ArgumentError, 'Array should be an array of integers')
    end
  end

  context 'Array of integers' do
    it 'returns -1 if the target integer is not in the array' do
      expect(Methods::chop(2, [3])).to eq -1
    end

    it 'returns the index of the target element in the array' do
      expect(Methods::chop(3,[3])).to eq 0
      expect(Methods::chop(3,[1,3])).to eq 1
    end
  end
end
