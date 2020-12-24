class Instruction
  @@global_value = 0
  def initialize operation, arg
    @operation, @arg, @executed = operation, arg, false
  end

  def run
    @executed = true
    case @operation
    when 'acc' 
      @@global_value += @arg
      return 1
    when 'jmp'
      return @arg
    else
      return 1
    end
  end

  def never_ran?
    not @executed
  end

  def operation= op
    @operation = op
  end

  def self.global_value
    @@global_value
  end

  def self.reset
    @@global_value = 0
  end
end

def run instructions
  next_index = 0
  while next_index < instructions.length and instructions[next_index].never_ran?
    next_index += instructions[next_index].run
  end
  next_index == instructions.length
end

def get_instructions input
  instructions = []
  input.each { |ele| instructions << Instruction.new(ele[0], ele[1]) }
  instructions
end


input = []
File.open("./input.txt").readlines.each do |line| 
  operation, arg = line.chomp.split(" ")
  input << [operation, arg.to_i]
end


# Part 1
run get_instructions input
puts "Part 1: #{Instruction.global_value}"

# Part 2
input.each_with_index { |ele, i| 
  next if ele[0] == 'acc'
  Instruction.reset
  new_instructions = get_instructions input
  new_instructions[i].operation = ele[0] == 'jmp' ? 'nop' : 'jmp'
  if run new_instructions
    puts "Part 2: #{Instruction.global_value}" 
    break
  end
}

