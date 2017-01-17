# https://projecteuler.net/problem=10

def get_primes(maxnum)
  arr = (0..maxnum).to_a
  arr[0], arr[1] = [nil, nil]
  ubound = (maxnum**0.5).floor
  (2..ubound).each do |num|
    if arr[num] != nil
      (num*2..maxnum).step(num) { |i| arr[i] = nil }
    end
  end
  arr.compact
end
# Sieve of Eratosthenes per https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
# 0.75 seconds

primes = get_primes(2000000)
puts primes.inject(:+)
