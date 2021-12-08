local utils = require('utils')

local function bit_count(input)
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

  return count
end

local function run_part_1(input)
  local count = bit_count(input)
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

local function remove_invalid_numbers(numbers, bit, pos)
  local valid_numbers = {}

  for _, num in pairs(numbers) do
    if num:sub(pos, pos) == bit then
      table.insert(valid_numbers, num)
    end
  end

  return valid_numbers
end

local function run_part_2(input)
  local bin_size = #input[1]
  local o2_rating, co2_rating

  -- O2
  local valid_numbers = input
  for pos = 1,bin_size do
    local count = bit_count(valid_numbers)
    if count[pos]._0 > count[pos]._1 then
      valid_numbers = remove_invalid_numbers(valid_numbers, '0', pos)
    else
      valid_numbers = remove_invalid_numbers(valid_numbers, '1', pos)
    end
    -- print(pos .. ":" .. utils.print_list(valid_numbers))

    if #valid_numbers == 1 then
      break
    end
  end
  o2_rating = tonumber(valid_numbers[1], 2)

  -- CO2
  valid_numbers = input
  for pos = 1,bin_size do
    local count = bit_count(valid_numbers)
    if count[pos]._1 < count[pos]._0 then
      valid_numbers = remove_invalid_numbers(valid_numbers, '1', pos)
    else
      valid_numbers = remove_invalid_numbers(valid_numbers, '0', pos)
    end
    -- print(pos .. ":" .. utils.print_list(valid_numbers))

    if #valid_numbers == 1 then
      break
    end
  end
  co2_rating = tonumber(valid_numbers[1], 2)

  print(o2_rating * co2_rating)
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
run_part_2(input)
