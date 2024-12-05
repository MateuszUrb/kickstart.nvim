return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', fg = 'white' }),
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = 'white' }),
}
