local utils = require("utils")

local depth_multipliers = { down = 1, up = -1 }
local dist_multipliers = { forward = 1 }

Submarine = {}

function Submarine.reset()
  Submarine.dist = 0
  Submarine.depth = 0
  Submarine.aim = 0
end

function Submarine.move(cmd)
  local cmd_split = utils.split_string(cmd, " ")
  local direction, magnitude = cmd_split[1], tonumber(cmd_split[2])

  local depth_mul = depth_multipliers[direction]
  if depth_mul ~= nil then
    Submarine.depth = Submarine.depth + (magnitude * depth_mul)
    return
  end

  local dist_mul = dist_multipliers[direction]
  if dist_mul ~= nil then
    Submarine.dist = Submarine.dist + (magnitude * dist_mul)
  end
end

function Submarine.move_v2(cmd)
  local cmd_split = utils.split_string(cmd, " ")
  local direction, magnitude = cmd_split[1], tonumber(cmd_split[2])

  local depth_mul = depth_multipliers[direction]
  if depth_mul ~= nil then
    Submarine.aim = Submarine.aim + (magnitude * depth_mul)
    return
  end

  local dist_mul = dist_multipliers[direction]
  if dist_mul ~= nil then
    Submarine.dist = Submarine.dist + (magnitude * dist_mul)
    Submarine.depth = Submarine.depth + (Submarine.aim * magnitude * dist_mul)
  end
end

local function run_part_1(lines)
  Submarine.reset()

  for _, cmd in pairs(lines) do
    Submarine.move(cmd)
  end

  print(Submarine.depth * Submarine.dist)
end

local function run_part_2(lines)
  Submarine.reset()

  for _, cmd in pairs(lines) do
    Submarine.move_v2(cmd)
  end

  print(Submarine.depth * Submarine.dist)
end

-- test
-- run_part_2({
--   "forward 5",
--   "down 5",
--   "forward 8",
--   "up 3",
--   "down 8",
--   "forward 2",
-- })

run_part_1(utils.read_file("./input.txt"))
run_part_2(utils.read_file("./input.txt"))
