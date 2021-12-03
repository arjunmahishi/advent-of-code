local function read_file(path)
  local file = io.open(path, "rb")
  if not file then return nil end
  file:close()
  local lines = {}
  for line in io.lines(path) do
    lines[#lines + 1] = line
  end
  return lines
end

local function run_part_1()
  local lines = read_file('./input.txt')
  local current_value = nil
  local count = 0

  for _, line in pairs(lines) do
    local num = tonumber(line)
    if current_value ~= nil and num > current_value then
      count = 1 + count
    end
    current_value = num
  end

  print(count)
end

local function run_part_2()
  local lines = read_file('./input.txt')
  local current_value = nil
  local count = 0

  for i=1,#lines-2 do
    local num = tonumber(lines[i]) + tonumber(lines[i+1]) + tonumber(lines[i+2])
    if current_value ~= nil and num > current_value then
      count = 1 + count
    end
    current_value = num
  end

  print(count)
end

run_part_1()
run_part_2()
