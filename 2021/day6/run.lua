local utils = require 'utils'

local function new_fish(timer)
  local fish = {
    timer = timer + 1,
  }

  function fish.incr()
    if fish.timer == 1 then
      fish.timer = 7
      return new_fish(9)
    end

    fish.timer = fish.timer - 1
  end

  return fish
end

local function run_part_1(input)
  local school = {}
  for _, raw_fish in pairs(utils.split_string(input[1], ',')) do
    table.insert(school, new_fish(tonumber(raw_fish)))
  end

  for _ = 1, 80 do
    for _, fish in pairs(school) do
      local baby = fish.incr()
      if baby then
        table.insert(school, baby)
      end
    end
  end

  print(#school)
end

local function run_part_2(input)
  local school = {}
  for _, raw_fish in pairs(utils.split_string(input[1], ',')) do
    table.insert(school, new_fish(tonumber(raw_fish)))
  end

  for _ = 1, 256 do
    for _, fish in pairs(school) do
      local baby = fish.incr()
      if baby then
        table.insert(school, baby)
      end
    end
  end

  print(#school)
end

local input = { '3,4,3,1,2' }

-- local input = utils.read_file('./input.txt')

run_part_1(input)
-- run_part_2(input)
