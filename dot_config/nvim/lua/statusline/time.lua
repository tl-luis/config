local M = {}

-- Get the current time
local function time()
  return os.date('%H:%M')
end

-- Format the current time for the statusline
function M.format_time()
  return ' ' .. time()
end

return M
