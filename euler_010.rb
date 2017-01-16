# https://projecteuler.net/problem=10

class PrimeMaker
  attr_reader :primes

  def initialize
    @primes = [2,3]
    @k = 1
    @pad = -1
  end

  def get_subset
    sqrtn = ((@k*6+1)**0.5).floor
    @primes.take_while { |n| n <= sqrtn }
  end

  def next_prime
    currlength = @primes.length
    subset = get_subset
    while @primes.length == currlength
      num = @k*6 + @pad
      @primes << num if subset.all? { |n| num % n != 0 }
      if @pad == 1
        @k += 1
        subset = get_subset
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
