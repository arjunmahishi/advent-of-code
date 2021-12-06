local utils = require('utils')

local function run_part_1(input)
  local bin_size = #input[1]
  local count = {}

  for _, line in pairs(input) do -- lines
    for i = 1,bin_size do -- chars
      if count[i] == nil then
        count[i] = { _0 = 0, _1 = 0 }
      end

      if line:sub(i, i) == '0' then
        count[i]._0 = count[i]._0 + 1
      else
        count[i]._1 = count[i]._1 + 1
      end
    end
  end

  local gamma, eps = '', ''
  for _, b in pairs(count) do
    if b._0 > b._1 then
      gamma = gamma .. '0'
      eps = eps .. '1'
    else
      gamma = gamma .. '1'
      eps = eps .. '0'
    end
  end

  print(tonumber(gamma, 2) * tonumber(eps, 2))
end

-- local input = {
--   '00100',
--   '11110',
--   '10110',
--   '10111',
--   '10101',
--   '01111',
--   '00111',
--   '11100',
--   '10000',
--   '11001',
--   '00010',
--   '01010',
-- }

local input = utils.read_file('./input.txt')

run_part_1(input)
