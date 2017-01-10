# https://projecteuler.net/problem=2

fib = [1,2]
fib << fib[-2] + fib[-1] while fib.last < 4000000
fib.select { |n| n.even? }.inject(:+)
