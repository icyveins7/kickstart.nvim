local M = {}

M.lineate_inputs = function(opts)
  local _, startrow, startcol = unpack(vim.fn.getpos "'<")
  local _, endrow, endcol = unpack(vim.fn.getpos "'>")
  -- automatically already has start < end
  local indentation = vim.fn.indent(startrow)
  -- print('indentation ', indentation)

  local text = vim.api.nvim_buf_get_text(0, startrow - 1, startcol - 1, endrow - 1, endcol, {})
  -- for i, line in ipairs(text) do
  --   print(i, line)
  -- end
  local longline = table.concat(text, '')
  -- print(longline)
  local splitlines = { '' }
  -- print('Indenting by ', indentation + vim.bo.shiftwidth)
  local leadingSpaces = string.rep(' ', indentation + vim.bo.shiftwidth)
  for str in string.gmatch(longline, '([^,]+)') do
    local trimmed = str:gsub('^%s*(.-)%s*$', '%1') -- trim leading and trailing whitespace
    -- insert trimmed line with current indentation + 1 more indentation level

    table.insert(splitlines, leadingSpaces .. trimmed .. ',')
    -- print(trimmed)
  end
  -- remove comma on last line
  splitlines[#splitlines] = splitlines[#splitlines]:sub(1, #splitlines[#splitlines] - 1)

  -- print(vim.inspect(opts))
  if opts.args == '1' then
    table.insert(splitlines, string.rep(' ', indentation))
    -- else
    --   print('argument was ' .. opts.args)
    --   print 'No final line'
  end

  vim.api.nvim_buf_set_text(0, startrow - 1, startcol - 1, endrow - 1, endcol, splitlines)
end

-- Allow 1 argument to pass in options to possibly turn off final line
vim.api.nvim_create_user_command('LineateInputs', M.lineate_inputs, { nargs = '*' })
vim.keymap.set('v', '<leader>li', ':<C-U>LineateInputs 1<CR>', { desc = '[L]ineate [I]nputs', silent = true })

return M
