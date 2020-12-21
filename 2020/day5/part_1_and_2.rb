# 128 rows, 8 columns

def narrow_down(steps, range)
  steps.split("").each do |step|
    if step == "1"
      range = range[(range.length/2)..]
    else
      range = range[0, range.length/2]
    end
  end
  range[0]
end

def get_row(boarding_pass_rows)
  narrow_down boarding_pass_rows.gsub('F', '0').gsub('B', '1'), (0..127).to_a
end

def get_column(boarding_pass_columns)
  narrow_down boarding_pass_columns.gsub('L', '0').gsub('R', '1'), (0..7).to_a
end

def get_seat_id(boarding_pass)
  row = get_row boarding_pass[0,7]
  column = get_column boarding_pass[7..]
  row * 8 + column
end

seat_ids = File.open("input.txt").readlines.map{ |bp| get_seat_id bp.chomp }

# part 1
p "Part 1: #{seat_ids.max}"

# part 2
seat_ids.sort!
prev_ele = seat_ids[0]
seat_ids[1..].each { |id| p "Part 2: #{id-1}" if id-prev_ele > 1; prev_ele = id }

