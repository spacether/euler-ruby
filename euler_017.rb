# https://projecteuler.net/problem=17

nums = (1..9).to_a
num_words = %w(one two three four five six seven eight nine)
pairs = nums.zip(num_words)
ONES = Hash[pairs]

nums = (11..19).to_a
num_words = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
pairs = nums.zip(num_words)
TEENS = Hash[pairs]

nums = (10..90).step(10).to_a
num_words = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
pairs = nums.zip(num_words)
TENS = Hash[pairs]

def num_to_str(num)
  if num == 0
    ""
  elsif num < 10
    ONES[num]
  elsif TEENS.key?(num)
    TEENS[num]
  elsif num < 100
    if TENS.key?(num)
      TENS[num]
    else
      TENS[10 * (num / 10)] + ONES[num % 10]
    end
  elsif num < 1000
    adder = (num % 100 == 0 ? "" : "and")
    ONES[num / 100] + "hundred" + adder + num_to_str(num % 100)
  elsif num == 1000
    "onethousand"
  end
end

puts (1..1000).map { |i| num_to_str(i) }.join("").length
