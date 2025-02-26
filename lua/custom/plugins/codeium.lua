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
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  -- commit = '289eb724e5d6fab2263e94a1ad6e54afebefafb2',
  -- version = '1.8.37', -- seems like newer versions are bugged for now
  config = function()
    -- disable defaults
    vim.g.codeium_disable_bindings = 1
    -- Set ctrl-t to call codeium#Accept
    vim.keymap.set('i', '<C-t>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })

    -- these are not available until 1.8.58?
    vim.keymap.set('i', '<C-l>', function()
      return vim.fn['codeium#AcceptNextWord']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-j>', function()
      return vim.fn['codeium#AcceptNextLine']()
    end, { expr = true, silent = true })

    -- vim.g.codeium_log_file = '~/codeium.log'

    vim.g.codeium_server_config = {
      portal_url = vim.fn.getenv 'CODEIUM_PORTAL_URL',
      api_url = vim.fn.getenv 'CODEIUM_API_URL',
    }
  end,

  -- {
  --   'monkoose/neocodeium',
  --   event = 'VeryLazy',
  --   config = function()
  --     local neocodeium = require 'neocodeium'
  --     neocodeium.setup()
  --     vim.keymap.set('i', '<C-t>', neocodeium.accept)
  --   end,
  -- },
}
-- Make sure you run ':Codeium Auth' after installation.
