local utils = require 'utils'

local function parse_line(line)
  local line_split = utils.split_string(line, ' ')
  local lhs, rhs = line_split[1], line_split[3]
  local lhs_split, rhs_split = utils.split_string(lhs, ','), utils.split_string(rhs, ',')

  return lhs_split, rhs_split
end

local function get_line(lhs, rhs)
  local x1, y1 = tonumber(lhs[1]), tonumber(lhs[2])
  local x2, y2 = tonumber(rhs[1]), tonumber(rhs[2])
  local slope = (y2 - y1) / (x2 - x1)
  local intercept = y1 - slope * x1
  local incr_x, incr_y = 1, 1
  local line_points = {}

  if x1 > x2 then
    incr_x = -1
  end

  if y1 > y2 then
    incr_y = -1
  end

  -- handle vertical lines (the slope is infinite)
  if (x2 - x1) == 0 then
    for i = y1, y2, incr_y do
      table.insert(line_points, {x1 + 1, i + 1})
    end
    return line_points
  end

  for i = x1, x2, incr_x do
    local y = slope * i + intercept
    table.insert(line_points, {i + 1, y + 1})
  end

  return line_points
end

local function draw_line(lhs, rhs, map)
  local line_points = get_line(lhs, rhs)

  for _, point in pairs(line_points) do
    if map[point[1]] == nil or map[point[1]][point[2]] == nil then
      map[point[1]] = map[point[1]] or {}
      map[point[1]][point[2]] = 1
    else
      map[point[1]][point[2]] = map[point[1]][point[2]] + 1
    end
  end

  return map
end

local function is_straight_line(lhs, rhs)
  local x1, y1 = tonumber(lhs[1]), tonumber(lhs[2])
  local x2, y2 = tonumber(rhs[1]), tonumber(rhs[2])

  return (x2 - x1) == 0 or (y2 - y1) == 0
end

local function run_part_1(input)
  local map = {}
  for _, line in pairs(input) do
    local lhs, rhs = parse_line(line)
    if is_straight_line(lhs, rhs) then
      map = draw_line(lhs, rhs, map)
    end
  end

  -- iterate over the map and count the number of times a point is touched at least twice
  local count = 0
  for _, row in pairs(map) do
    for _, point in pairs(row) do
      if point >= 2 then
        count = count + 1
      end
    end
  end

  print('count: ' .. count)
end

local function run_part_2(input)
  local map = {}
  for _, line in pairs(input) do
    local lhs, rhs = parse_line(line)
    map = draw_line(lhs, rhs, map)
  end

  -- iterate over the map and count the number of times a point is touched at least twice
  local count = 0
  for _, row in pairs(map) do
    for _, point in pairs(row) do
      if point >= 2 then
        count = count + 1
      end
    end
  end

  print('count: ' .. count)
end

-- local input = {
--   "0,9 -> 5,9",
--   "8,0 -> 0,8",
--   "9,4 -> 3,4",
--   "2,2 -> 2,1",
--   "7,0 -> 7,4",
--   "6,4 -> 2,0",
--   "0,9 -> 2,9",
--   "3,4 -> 1,4",
--   "0,0 -> 8,8",
--   "5,5 -> 8,2",
-- }

local input = utils.read_file('./input.txt')

run_part_1(input)
run_part_2(input)
