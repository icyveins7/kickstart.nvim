vim.api.nvim_create_user_command('ScmDiff', function()
  local file_path = vim.fn.expand '%'
  local cmd = 'scm diff file ' .. file_path
  vim.cmd('!' .. cmd)
end, { nargs = 0 })

vim.api.nvim_create_user_command('ScmCheckin', function()
  local file_path = vim.fn.expand '%'
  local cmd = 'scm checkin ' .. file_path
  vim.cmd('!' .. cmd)
end, { nargs = 0 })

vim.api.nvim_create_user_command('ScmCommit', function(opts)
  local args = vim.split(opts.args, ' ')
  local cmd1 = string.format('scm set cs --current --comment "%s" %s', args[1], args[2])
  local cmd2 = string.format('scm set cs --complete %s', args[2])
  vim.cmd('!' .. cmd1)
  vim.cmd('!' .. cmd2)
end, { nargs = 1 })
