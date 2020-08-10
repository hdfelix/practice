module Methods
  def self.divisible_by(number, divisor1, divisor2)
    (number % divisor1 == 0) && (number % divisor2 == 0)
  end

  def self.even_or_odd(number)
    return 'Even' if number.even?

    return 'Odd' if number.odd?
  end

  def self.chop(target, array)
    return -1 if array.empty?

    raise ArgumentError, 'Array should be an array of integers' unless self.array_of_integers?(array) 

    return -1 unless array.include?(target)

    return array.index(target)
  end

  private

  def self.array_of_integers?(array)
    if array.length > 0 && !array.find { |element| !element.is_a?(Integer) }.nil?
      return false
    else
      return true
    end
  end
end