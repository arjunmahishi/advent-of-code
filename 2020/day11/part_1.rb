FILE_NAME = './input.txt'

def out_of_bound? size, spot
  x, y = spot
  x < 0 or y < 0 or x >= size or y >= size
end

def get_adjacent_seats seats, spot
  directions = [[-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]
  x, y = spot
  a_seats = []
  directions.each do |direction|
    i, j = direction
    next if out_of_bound? seats.length, [x+i, y+j]
    a_seats << seats[x+i][y+j]
  end
  a_seats
end

def get_spot_value spot, seats
  x, y = spot
  return seats[x][y] if seats[x][y] == '.'
  adjacent_seats = get_adjacent_seats seats, [x,y]
  return "#" if seats[x][y] == 'L' and not adjacent_seats.include? '#'
  return "L" if seats[x][y] == '#' and adjacent_seats.count('#') >= 4
  return seats[x][y]
end

def arrange seats
  new_seats = []
  seats.each_with_index do |row, x|
    new_row = []
    row.each_with_index do |seat, y|
      new_row << get_spot_value([x,y], seats)
    end
    new_seats << new_row
  end
  new_seats
end

def print_seats seats
  seats.each { |row| puts row.join }
  puts
end

seats = File.open(FILE_NAME).readlines.map { |line| line.chomp.split '' }

# Part 1
occupied = 0
new_seats = seats.dup
prev_seats = nil
while new_seats != prev_seats
  prev_seats = new_seats
  new_seats = arrange new_seats
end
new_seats.each { |row| occupied += row.count('#') }
p occupied

