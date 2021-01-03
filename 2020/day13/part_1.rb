FILE_NAME = './input.txt'

def get_closest_dep bus_id, time
  return time if time%bus_id == 0
  return time/bus_id*bus_id+bus_id
end

file_lines = File.open(FILE_NAME).readlines
dep = file_lines[0].to_i
buses = file_lines[1].split(",").select { |n| n != 'x' }.map { |n| n.to_i }
bus = buses.map { |bus| [(get_closest_dep bus, dep)-dep, bus] }.min
p bus[0] * bus[1]

