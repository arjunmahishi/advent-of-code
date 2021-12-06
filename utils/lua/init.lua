-- I don't give a shit if you think "utils" is a bad name
-- ma code ma rulz!

local m = {}

m.read_file = function(filename)
  local file = io.open(filename, "rb")
  if not file then return nil end
  file:close()
  local lines = {}
  for line in io.lines(filename) do
    lines[#lines + 1] = line
  end
  return lines
end

m.trim_spaces = function(str)
  return str:gsub("^%s+", ""):gsub("%s+$", "")
end

m.split_string = function(str, step)
  str = m.trim_spaces(str)
  if step == nil then
    step = "%s"
  end
  local t={}
  for char in string.gmatch(str, "([^"..step.."]+)") do
    table.insert(t, char)
  end
  return t
end

return m
