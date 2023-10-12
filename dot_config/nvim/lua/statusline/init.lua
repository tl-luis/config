local time = require('statusline/time')
local filename = require('statusline/filename')
local mode = require('statusline/mode')

local function run_or_empty(func)
    local result, vals = pcall(func)
    if result then
        return vals
    else
        return ''
    end
end

local function status_loop()
    local current_time = run_or_empty(time.format_time)
    local current_filename = run_or_empty(filename.format_filename)
    local current_mode = run_or_empty(mode.mode)

    -- Left aligned section
    vim.o.statusline = '%1*' .. current_mode .. '%*'           -- mode
    vim.o.statusline = vim.o.statusline ..
        '%1*' .. ' %f ' .. '%*'                                -- filename
    vim.o.statusline = vim.o.statusline .. '%2*' .. '%m' .. '%*' -- modified flag
    vim.o.statusline = vim.o.statusline .. '%2*' .. '%r' .. '%*' -- modified flag

    -- Right aligned section
    vim.o.statusline = vim.o.statusline ..
    '%2*%=%*'                                                               -- right align
    vim.o.statusline = vim.o.statusline .. '%1*' .. current_filename .. '%* ' -- filetype
    vim.o.statusline = vim.o.statusline ..
        '%1* %l/%L %c %* '                                                  -- line/total lines, column
    vim.o.statusline = vim.o.statusline .. '%1*[' .. current_time .. ']%*'

    -- Rerun every second
    vim.defer_fn(status_loop, 250)
end

-- Custom made status line
-- print(time.format_time())
vim.cmd [[
:hi StatusLine guifg=#ffffff guibg=#000000
:hi User1 guifg=#ffffff guibg=#000000
:hi User2 guifg=#ffffff guibg=#000000
]]
vim.o.laststatus = 3
vim.defer_fn(status_loop, 150)
