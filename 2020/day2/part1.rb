arr = File.open("input.txt").readlines.map do |line|
    range, letter, password = line.chomp.split(" ")
    letter = letter.split(":")[0]
    min, max = range.split("-").map { |n| n.to_i }
    count = password.count(letter)
    count >= min and count <= max
end

p arr.count true
