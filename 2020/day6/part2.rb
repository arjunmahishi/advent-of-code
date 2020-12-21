count = 0
File.read("./input.txt").split("\n\n").each do |ele|
  group_ans = {}
  people = ele.split("\n")
  people.each do |person|
    person.split('').each do |ans|
      group_ans[ans] = (group_ans.has_key? ans) ? group_ans[ans]+1 : 1
    end
  end
  group_ans.each_value { |val| count += 1 if val == people.length }
end
p count

