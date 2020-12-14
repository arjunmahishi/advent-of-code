# Find the product of 3 numbers which add up to 2020

def get_sum_pair(arr, sum)
    hash = {}
    arr.each do |n| 
      return n, sum-n if hash.has_key? sum-n.to_i
      hash[n.to_i] = sum-n.to_i
    end
    return
end

arr = File.open("input.txt").readlines.map { |n| n.to_i }
for i in 0..arr.length-1 do
    c = arr[i]
    a, b = get_sum_pair arr[i+1..arr.length-1], 2020-c
    break if !a.nil? and !b.nil? 
end
p a*b*c
