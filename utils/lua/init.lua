-- I don't give a shit if you think "utils" is a bad name
-- ma code ma rulz!

local function read_file(filename)
  local file = io.open(filename, "rb")
  if not file then return nil end
  file:close()
  local lines = {}
  for line in io.lines(filename) do
    lines[#lines + 1] = line
  end
  return lines
end

local function trim_spaces(str)
  return str:gsub("^%s+", ""):gsub("%s+$", "")
end

local function split_string(str, step)
  str = trim_spaces(str)
  if step == nil then
    step = "%s"
  end
  local t={}
  for char in string.gmatch(str, "([^"..step.."]+)") do
    table.insert(t, char)
  end
  return t
end

return {
  read_file = read_file,
  split_string = split_string,
  trim_spaces = trim_spaces,
}
