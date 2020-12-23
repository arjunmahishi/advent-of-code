# ^(.*)\s+bags\s+contain\s+(.*).$
# (\d+)\s+([a-z ]+)\s+bags?|no.*

PARENTS_CHILDREN_MAP = {} # map(color -> map(color -> count))
CHILD_PARENTS_MAP = {} # map(color -> array(color))

def parse_rules file
  File.open(file).readlines.each do |line| 
    outer_color, inside = line.match(/^(.*)\s+bags\s+contain\s+(.*).$/)[1..]
    PARENTS_CHILDREN_MAP[outer_color] = {}
    inside.split(", ").each do |bag| 
      n, color = bag.match(/(\d+)\s+([a-z ]+)\s+bags?|no.*/)[1..]
      PARENTS_CHILDREN_MAP[outer_color][color] = n.to_i if not n.nil?
      CHILD_PARENTS_MAP[color] ||= []
      CHILD_PARENTS_MAP[color] << outer_color
    end
  end
end

def get_all_parents child
  all_parents = []
  parents = CHILD_PARENTS_MAP[child] || []
  all_parents << parents
  parents.each { |parent| all_parents << get_all_parents(parent) }
  all_parents.flatten.uniq
end

def get_children_count parent
  return 0 unless PARENTS_CHILDREN_MAP.has_key? parent
  count = 0
  children = PARENTS_CHILDREN_MAP[parent] || {}
  children.each { |color, n| count += get_children_count(color) * n + n}
  count
end

parse_rules "./input.txt"

# Part 1
puts "Part 1: #{get_all_parents("shiny gold").length}"

# Part 2
puts "Part 2: #{get_children_count "shiny gold"}"

