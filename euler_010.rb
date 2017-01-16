# https://projecteuler.net/problem=10

class PrimeMaker
  attr_reader :primes

  def initialize
    @primes = [2,3]
    @k = 1
    @pad = -1
  end

  def prime?(num)
    upbound = (num**0.5).floor
    @primes.each do |prime|
      return false if num % prime == 0
      break if prime > upbound
    end
    true
  end

  def next_prime
    currlength = @primes.length
    while @primes.length == currlength
      num = @k*6 + @pad
      @primes << num if self.prime?(num)
      if @pad == 1
        @k += 1
      end
      @pad = -@pad
    end
    @primes.last
  end

end

pmaker = PrimeMaker.new
while pmaker.primes.last < 2000000
  pmaker.next_prime
end
pmaker.primes.pop
puts pmaker.primes.inject(:+)
# done in 3.8s
