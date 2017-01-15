# https://projecteuler.net/problem=9

# a + b +c = 1000
# a^2 + b^2 = c^2
# a < b < c, a > 0
# 1 2 997, min first, max last
# 1 499 500, min first, max middle
# 332 333 335, max first

def checker(a, b)
  # this formula if true tests for a^2+b^2=c^2 and a+b+c=1000
  2000*a + 2000*b == 2*a*b + 1000000
end

def get_prod(a, b)
  c = 1000-a-b
  a*b*c
end

(1..332).each { |a| (a+1..499).each { |b| p get_prod(a,b) if checker(a,b) } }
