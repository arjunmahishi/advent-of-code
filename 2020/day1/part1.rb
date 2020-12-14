# Find the product of a pair of number which add up to 202j

hash = {}
File.open("input.txt").readlines.each do |n| 
  hash[n.to_i] = 2020-n.to_i; next unless hash.has_key? 2020-n.to_i
  p n.to_i * (2020-n.to_i)
  break
end
