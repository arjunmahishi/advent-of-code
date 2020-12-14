# arr = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"].map do |line|
arr = File.open("input.txt").readlines.map do |line|
    range, letter, password = line.chomp.split(" ")
    letter = letter.split(":")[0]
    pos1, pos2 = range.split("-").map { |n| n.to_i }
    (password[pos1-1] == letter) ^ (password[pos2-1] == letter)
end

p arr.count true
