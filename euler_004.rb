# https://projecteuler.net/problem=4

def palindrome?(num)
  return true if num.to_s == num.to_s.reverse
  false
end

def largest_pal(digits)
  max = ("9"*digits).to_i
  min = ("1"+"0"*(digits-1)).to_i
  res = []
  max.downto(min) do |bignum|
    (bignum-1).downto(min) do |smallnum|
      product = bignum*smallnum
      res << product if palindrome?(product)
    end
  end
  res.sort.last
end

largest_pal(3)
