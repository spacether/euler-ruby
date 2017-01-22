# https://projecteuler.net/problem=12

def triangle_num(n)
  (n * (n + 1)) / 2
end

def factors(n)
  ubound = (n**0.5).floor
  factors = 0
  (1..ubound).each do |lowfact|
    if n % lowfact == 0
      factors += 1
      highfact = n / lowfact
      factors += 1 if highfact != lowfact
    end
  end
  factors
end

index, triangle, factors = [0, 0, 0]
while factors < 500
  index += 1
  triangle = triangle_num(index)
  factors = factors(triangle)
end
puts index
puts triangle
puts factors
