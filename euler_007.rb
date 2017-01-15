# https://projecteuler.net/problem=7

class PrimeMaker
  attr_reader :primes

  def initialize
    @primes = [2,3]
  end

  def next_prime
    num = @primes.last
    currlength = @primes.length
    while @primes.length == currlength
      num += 2
      primes << num if @primes.all? { |n| num % n != 0 }
    end
    @primes.last
  end

end

pmaker = PrimeMaker.new
while pmaker.primes.length < 10001
  pmaker.next_prime
end
puts pmaker.primes.last
