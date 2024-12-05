return {
  'EdenEast/nightfox.nvim',
  -- Add in any other configuration;
  --   event = foo,
  --   config = bar
  --   end,
  config = function()
    vim.cmd 'colorscheme carbonfox'
    require('nightfox').setup {
      options = {
        transparent = true,
      },
    }
  end,
}
