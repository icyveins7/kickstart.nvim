return {
  -- 'Exafunction/codeium.nvim',
  -- dependencies = {
  --   'nvim-lua/plenary.nvim',
  --   'hrsh7th/nvim-cmp',
  -- },
  -- config = function()
  --   require('codeium').setup {
  --     enable_cmp_source = false,
  --     virtual_text = {
  --       enabled = true,
  --     },
  --   }
  -- end,
  --
  -- This doesn't seem to work. Just use the .vim one below

  'Exafunction/codeium.vim',
  event = 'BufEnter',
  version = '1.8.37', -- seems like newer versions are bugged for now
  config = function()
    -- Set ctrl-t to call codeium#Accept
    vim.keymap.set('i', '<C-t>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
  end,
}
-- Make sure you run ':Codeium Auth' after installation.
