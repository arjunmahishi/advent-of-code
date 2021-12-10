local utils = require 'utils'

local function new_board(board)
  local b = {
    column_count = {0,0,0,0,0},
    row_count = {0,0,0,0,0},
    board_index = {},
    board = board,
  }

  -- prepare the board index
  for i=1,5 do
    for j=1,5 do
      b.board_index[board[i][j]] = {i, j, is_marked = false}
    end
  end

  b.check = function(n)
    local coordinate = b.board_index[n]
    if coordinate ~= nil then
      b.column_count[coordinate[2]] = b.column_count[coordinate[2]] + 1
      b.row_count[coordinate[1]] = b.row_count[coordinate[1]] + 1
      b.board_index[n].is_marked = true

      -- check if the game is over
      if b.column_count[coordinate[2]] == 5 then
        local list = {}

        for i=1,5 do
          for j=1,5 do
            if j ~= coordinate[2] and not b.board_index[board[i][j]].is_marked then
              table.insert(list, b.board[i][j])
            end
          end
        end

        return list
      end

      if b.row_count[coordinate[1]] == 5 then
        local list = {}

        for i=1,5 do
          for j=1,5 do
            if i ~= coordinate[1] and not b.board_index[board[i][j]].is_marked then
              table.insert(list, b.board[i][j])
            end
          end
        end

        return list
      end
    end

    return nil
  end

  return b
end

local function extract_drawn_numbers(input)
  return utils.split_string(input[1], ',')
end

local function extract_boards(input)
  local boards = {}
  local current_board = {}

  for _, line in pairs(utils.slice_list(input, 2, #input)) do
    if #current_board == 5 then
      table.insert(boards, new_board(current_board))
      current_board = {}
    end

    local row = utils.split_string(line, ' ')
    table.insert(current_board, row)
  end

  if #current_board > 0 then
      table.insert(boards, new_board(current_board))
      current_board = {}
  end

  return boards
end

local function list_sum(list)
  local sum = 0
  for _, n in pairs(list) do
    sum = sum + tonumber(n)
  end
  return sum
end

local function run_part_1(input)
  local drawn_numbers = extract_drawn_numbers(input)
  local boards = extract_boards(input)

  for _, n in pairs(drawn_numbers) do
    for i, board in pairs(boards) do
      local list = board.check(n)
      if list ~= nil then
        print(i .. ' wins the game: ' .. list_sum(list) * n)
        return
      end
    end
  end
end

local function len(t)
  local count = 0
  for _, _ in pairs(t) do
    count = count + 1
  end
  return count
end

local function run_part_2(input)
  local drawn_numbers = extract_drawn_numbers(input)
  local boards = extract_boards(input)
  local winning_boards = {}

  for _, n in pairs(drawn_numbers) do
    for i, board in pairs(boards) do
      local list = board.check(n)
      if list ~= nil and winning_boards[i] == nil then
        winning_boards[i] = true

        if len(winning_boards) == len(boards) then
          print(i .. ' wins the game: ' .. list_sum(list) * n)
          return
        end
      end
    end
  end
end

-- local input = {
--   "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1",
--
--   "22 13 17 11  0",
--   " 8  2 23  4 24",
--   "21  9 14 16  7",
--   " 6 10  3 18  5",
--   " 1 12 20 15 19",
--
--   " 3 15  0  2 22",
--   " 9 18 13 17  5",
--   "19  8  7 25 23",
--   "20 11 10 24  4",
--   "14 21 16 12  6",
--
--   "14 21 17 24  4",
--   "10 16 15  9 19",
--   "18  8 23 26 20",
--   "22 11 13  6  5",
--   " 2  0 12  3  7",
-- }

local input = utils.read_file('./input.txt')

-- remove empty lines from the input
for i, line in pairs(input) do
  if line == '' then
    table.remove(input, i)
  end
end

run_part_1(input)
run_part_2(input)
