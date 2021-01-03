FILE_NAME = './test_input.txt'

def check_divisibility arr1, arr2
  arr1.each_with_index do |ele, i|
    next if arr2[i] == 0
    return false if ele % arr2[i] != 0
  end
  true
end

def get_adjacent_numbers n, size, offset=0
  numbers = []
  for i in 0..size-1
    numbers << n - offset + i
  end
  numbers
end

file_lines = File.open(FILE_NAME).readlines
buses = file_lines[1].split(",").map { |n| n.to_i }

offset = buses.index buses.max
current_time = buses.max
while true
  timestamps = get_adjacent_numbers current_time, buses.length, offset
  break if check_divisibility timestamps, buses
  current_time += buses.max
end
p timestamps.first
