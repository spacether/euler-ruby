# https://projecteuler.net/problem=3

def is_prime?(num)
  return true if num == 2
  return false if num < 2 || num.even?
  (2...num).each { |n| return false if num % n == 0 }
  true
end

def max_prime_factor(num)
  (num**0.5).floor.downto(2) { |n| return n if num % n == 0 && is_prime?(n) }
end

num = 600851475143
max_prime_factor(num)
