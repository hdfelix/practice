def divisible_by(number, divisor1, divisor2)
  (number % divisor1 == 0) && (number % divisor2 == 0)
end

def even_or_odd(number)
  return 'Even' if number.even?

  return 'Odd' if number.odd?
end
