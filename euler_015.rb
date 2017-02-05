# https://projecteuler.net/problem=15

def paths(cubes_per_side)
  side_size = cubes_per_side + 1
  nodes = Array.new(side_size) { Array.new(side_size) { 1 } }
  (1...side_size).each do |i|
    (1...side_size).each do |j|
      nodes[i][j] = nodes[i][j - 1] + nodes[i - 1][j]
    end
  end
  nodes[-1][-1]
end

# puts paths(1)
# puts paths(2)
# puts paths(3)
# puts paths(4)
puts paths(20)
