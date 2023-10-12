local M = {}

local function map_mode(mode)
  return ({
    ['n'] = 'NORMAL',
    ['v'] = 'VISUAL',
    ['V'] = 'V-LINE',
    [''] = 'V-BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'S-LINE',
    [''] = 'S-BLOCK',
    ['i'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'V-REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM-EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MORE',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL',
  })[mode]
end

function M.mode()
  return ' ' .. map_mode(vim.api.nvim_get_mode().mode) .. ' '
end

return M
