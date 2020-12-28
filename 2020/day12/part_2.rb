class Journey
  @@DIRECTIONS = ['N', 'E', 'S', 'W']

  def initialize starting_direction
    @current_direction = starting_direction
    @journey = {'N' => 0, 'E' => 0, 'S' => 0, 'W' => 0}
  end

  def change_direction angle
    @current_direction = @@DIRECTIONS[
      (@@DIRECTIONS.index(@current_direction) + angle/90) % 4
    ]
  end

  def process_instruction instruction
    action, value = instruction[0], instruction[1..].to_i
    case action
    when 'N', 'E', 'S', 'W'
      @journey[action] += value
    when 'F'
      @journey[@current_direction] += value
    when 'L', 'R'
      change_direction value * (action == 'R' ? 1 : -1)
    end
  end

  def manhattan_distance
    (@journey['N'] - @journey['S']).abs + (@journey['E'] - @journey['W']).abs
  end
end

FILE_NAME = "./input.txt"
instructions = File.read(FILE_NAME).split "\n"
journey = Journey.new 'E'
instructions.each do |instruction|
  journey.process_instruction instruction
end
puts journey.manhattan_distance

