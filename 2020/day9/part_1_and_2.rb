PREAMBLE_LENGTH = 25
INPUT_FILE = "./input.txt"

def sum_pair_exists? arr, n
  h = {}
  arr.each do |ele|
    return true if h.has_key? ele
    h[n-ele] = true
  end
  false
end

def find_invalid_number number_list
  for i in PREAMBLE_LENGTH..number_list.length-1
    preamble = number_list[i-PREAMBLE_LENGTH, PREAMBLE_LENGTH]
    return number_list[i] unless sum_pair_exists? preamble, number_list[i] 
  end
end

def find_sum_range arr, n
  for range_size in 2..arr.length
    for i in 0..arr.length-range_size
      sum_range = arr[i, range_size]
      return sum_range if sum_range.sum == n
    end
  end
  []
end

number_list = File.open(INPUT_FILE).readlines.map { |ele| ele.chomp.to_i }

# Part 1
puts "Part 1: #{find_invalid_number number_list }"

# Part 2
n = find_invalid_number number_list
sum_range = find_sum_range number_list, n
puts "Part 2: #{sum_range.min + sum_range.max}"

