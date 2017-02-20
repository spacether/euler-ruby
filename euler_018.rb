# https://projecteuler.net/problem=18

arr = []
arr << %w(75)
arr << %w(95 64)
arr << %w(17 47 82)
arr << %w(18 35 87 10)
arr << %w(20 04 82 47 65)
arr << %w(19 01 23 75 03 34)
arr << %w(88 02 77 73 07 63 67)
arr << %w(99 65 04 28 06 16 70 92)
arr << %w(41 41 26 56 83 40 80 70 33)
arr << %w(41 48 72 33 47 32 37 16 94 29)
arr << %w(53 71 44 65 25 43 91 52 97 51 14)
arr << %w(70 11 33 28 77 73 17 78 39 68 17 57)
arr << %w(91 71 52 38 17 14 91 43 58 50 27 29 48)
arr << %w(63 66 04 68 89 53 67 30 73 16 69 87 40 31)
arr << %w(04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)

arr.map! { |sub_arr| sub_arr.map(&:to_i) }

def next_locs(start)
  row, col = start
  [[row+1, col], [row+1, col+1]]
end

def val(loc, arr)
  arr[loc.first][loc.last]
end

def find_max_total(arr)
  loc = [0,0]
  p loc
  res = val(loc, arr)
  while loc.first <= arr.length - 2
    loc_vals = next_locs(loc).map { |pos| [pos, val(pos, arr)] }
    loc_vals.sort_by! { |arr| -arr.last }
    loc = loc_vals.first.first
    p loc
    res += loc_vals.first.last
  end
  res
end

p find_max_total(arr)
