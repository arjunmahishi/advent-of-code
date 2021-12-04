local utils = require('utils.lua')

local row_format = "| {{day}} | [link](https://adventofcode.com/{{year}}/day/{{day}}) | [link]({{year}}/day{{day}}) |\n"

local header = [[
| Day | Problem | Solution |
| --- | --- | --- |
]]

local section_format = [[
<details>
<summary>%d</summary>
<p>

%s

</p>
</details>]]

local function get_row(year, day)
  return row_format:gsub('{{day}}', tostring(day)):gsub('{{year}}', tostring(year))
end

local function get_table(year, num_of_days)
  local table_str = header
  for day=1,num_of_days do
    table_str = table_str .. get_row(year, day)
  end

  return table_str
end

local function get_section(year, num_of_days)
  return string.format(section_format, year, get_table(year, num_of_days))
end

local function run()
  local inp = io.read('*a')
  local lines = utils.split_string(inp, '\n')

  for _, line in pairs(lines) do
    local line_split = utils.split_string(line, ' ')
    num_of_days, year = line_split[1], line_split[2]

    print(get_section(year, num_of_days) .. '\n')
  end
end

run()
