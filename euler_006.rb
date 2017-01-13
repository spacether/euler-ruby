# https://projecteuler.net/problem=6

def sum_squares(num)
  (1..num).map { |n| n*n }.inject(:+)
end

def square_sum(num)
  (1..num).inject(:+)**2
end

def difference(num)
  square_sum(num) - sum_squares(num)
end

puts difference(100)
