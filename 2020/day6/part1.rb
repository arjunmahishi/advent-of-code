count = 0
File.read("./input.txt").split("\n\n").each do |ele|
  count += ele.gsub("\n", "").split("").uniq.length
end
p count

