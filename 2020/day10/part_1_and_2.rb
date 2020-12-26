adapters = File.open("./test_input.txt").readlines.map { |ele| ele.chomp.to_i }
adapters.sort!
adapters << adapters.last + 3 # device

def get_valid_adapters adapters, joltage
  valid_adapters = []
  adapters.each { |ad| 
    diff = ad - joltage
    return valid_adapters if diff > 3
    next if diff < 1
    valid_adapters << ad
  }
  valid_adapters
end

# Part 1
current_joltage = 0
diff_map = {}
while current_joltage < adapters.last
  valid_adapters = get_valid_adapters adapters, current_joltage
  diff = valid_adapters.first - current_joltage
  diff_map[diff] ||= 0
  diff_map[diff] += 1
  current_joltage = valid_adapters.first
end
puts "Part 1: #{diff_map[1] * diff_map[3]}"

