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

m.trim = function(str, char)
  return str:gsub("^" .. char .. "+", ""):gsub(char .. "+$", "")
end

m.trim_spaces = function(str)
  -- return str:gsub("^%s+", ""):gsub("%s+$", "")
  return m.trim(str, "%s")
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

m.print_list = function(list, delim)
  local str = ""

  if delim == nil then
    delim = " "
  end

  for _, v in pairs(list) do
    str = str .. delim .. v
  end

  return str
end

m.slice_list = function(list, start, stop)
  local new_list = {}
  local i = 1
  for _, v in pairs(list) do
    if i >= start and i <= stop then
      table.insert(new_list, v)
    end
    i = i + 1
  end
  return new_list
end

m.dump = function(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
                if type(k) ~= 'number' then k = '"'..k..'"' end
                s = s .. '['..k..'] = ' .. m.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

return m
