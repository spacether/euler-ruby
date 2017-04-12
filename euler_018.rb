# https://projecteuler.net/problem=18

$arr = []
$arr << %w(75)
$arr << %w(95 64)
$arr << %w(17 47 82)
$arr << %w(18 35 87 10)
$arr << %w(20 04 82 47 65)
$arr << %w(19 01 23 75 03 34)
$arr << %w(88 02 77 73 07 63 67)
$arr << %w(99 65 04 28 06 16 70 92)
$arr << %w(41 41 26 56 83 40 80 70 33)
$arr << %w(41 48 72 33 47 32 37 16 94 29)
$arr << %w(53 71 44 65 25 43 91 52 97 51 14)
$arr << %w(70 11 33 28 77 73 17 78 39 68 17 57)
$arr << %w(91 71 52 38 17 14 91 43 58 50 27 29 48)
$arr << %w(63 66 04 68 89 53 67 30 73 16 69 87 40 31)
$arr << %w(04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)

$arr.map! { |sub_arr| sub_arr.map(&:to_i) }


def next_locs(loc)
  row, col = loc
  [[row + 1, col], [row + 1, col + 1]]
end

def add_under(pos, num, accum=0)
  accum += val(pos)
  row = pos.first
  return accum if num == 1 || row == $arr.length - 1
  res = 0
  if (row + 1) < $arr.length
    locs = next_locs(pos)
    res = locs.map { |loc| add_under(loc, num - 1, accum) }.max
  end
  res
end

def val(loc)
  $arr[loc.first][loc.last]
end

def find_max_total()
  loc = [0, 0]
  res = val(loc)
  p "#{res} #{res}"
  while loc.first < $arr.length - 1
    loc_vals = next_locs(loc).map { |pos| [pos, add_under(pos, 2)] }
    loc_vals.sort_by! { |pair| -pair.last }
    loc = loc_vals.first.first
    val = val(loc)
    res += val
    p "#{val} #{res}"
  end
  res
end

p find_max_total()
