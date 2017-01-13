# https://projecteuler.net/problem=5

def is_prime?(num)
  return true if num == 2
  return false if num < 2 || num.even?
  (2...num).each { |n| return false if num % n == 0 }
  true
end

def prime_factors(num)
  return [num] if is_prime?(num)
  (2...num).each do |n|
    divisible = (num % n == 0)
    return [n] + prime_factors(num/n) if divisible
  end
end

def get_hash(arr)
  arr.each_with_object(Hash.new(0)){|key,hash| hash[key] += 1}
end

def smallest_divisible(num)
  res = Hash.new(0)
  num.downto(2) do |n|
    factors = get_hash(prime_factors(n))
    res.merge!(factors) { |key, v1, v2| [v1, v2].max }
  end
  res.keys.map { |k| [k]*res[k] }.flatten.inject(1, :*)
end

puts smallest_divisible(20)
