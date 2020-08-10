# 1. is n divisible by x and y
# 2. Create a function (or write a script in Shell) that takes an integer
# as an argument and returns "Even" for even numbers or "Odd" for odd numbers.

require './lib/methods'

describe '#even_or_odd' do
  it "returns 'Even' for even numbers" do
    expect(even_or_odd(112)).to eq 'Even'
    end

  it "returns 'Odd' for odd numbers" do
    expect(even_or_odd(13)).to eq 'Odd'
  end
end

describe '#divisible_by' do
  context 'when number is divisible by both divisors' do
    it 'returns true for 3 divisible by 1, and 3' do
      expect(divisible_by(3,1,3)).to be true
    end

    it 'returns true for 12, divisible by 3, and 6' do
      expect(divisible_by(12,3,6)).to be true
    end
  end

  context 'a number is divisible by one of two divisor' do
    it 'returns false for 15, 5, 2' do
      expect(divisible_by(15, 5, 2)).to be false
    end
  end

  context 'a number is not divsible by either divisor' do
    it 'returns false for 7, 2, 3' do
      expect(divisible_by(7,2,3)).to be false
    end
  end
end