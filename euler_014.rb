# https://projecteuler.net/problem=14

def collatz_num(num)
  num.even? ? num / 2 : (3 * num) + 1
end

best = [1,1] # length, num
collatz = Hash.new { |hash, key| hash[key] = collatz_num(key) }
(2..1_000_000).each { |i| collatz[i] = collatz_num(i) }
steps = {}

(2..999_000).each do |i|
  count = 1
  num = i
  until num == 1
    num = collatz[num]
    if steps.key?(num)
      count += steps[num]
      num = 1
    else
      count += 1
    end
  end
  steps[i] = count
  best = [count, i] if count > best.first
end
puts "Number: #{best.last}  Sequence Lenth: #{best.first}"
