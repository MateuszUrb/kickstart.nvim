return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function(_, opts)
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', fg = 'white' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = 'white' })
      vim.cmd [[
  augroup CustomColors
    autocmd!
    autocmd ColorScheme * lua vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', ctermbg = 'NONE' })
    autocmd ColorScheme * lua vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', ctermbg = 'NONE' })
  augroup END
]]
      require('lsp_signature').setup {
        bind = true,
        handler_opts = {
          border = 'single', -- double, rounded, single, shadow, none, or a table of borders
        },
        floating_window_off_x = 5, -- adjust float windows x position.
        floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
          local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
          local pumheight = vim.o.pumheight
          local winline = vim.fn.winline() -- line number in the window
          local winheight = vim.fn.winheight(0)

          -- window top
          if winline - 1 < pumheight then
            return pumheight
          end

          -- window bottom
          if winheight - winline < pumheight then
            return -pumheight
          end
          return 0
        end,
      }
    end,
  },
}
