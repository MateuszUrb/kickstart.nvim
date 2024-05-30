return {
  {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local theme = {
        current = { fg = '#cad3f5', bg = 'transparent', style = 'bold' },
        not_current = { fg = '#5b6078', bg = 'transparent' },

        fill = { bg = 'transparent' },
      }
      require('tabby.tabline').set(function(line)
        return {
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current or theme.not_current
            return {
              line.sep(' ', hl, theme.fill),
              tab.name(),
              line.sep(' ', hl, theme.fill),
              hl = hl,
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            local hl = win.is_current() and theme.current or theme.not_current

            return {
              line.sep(' ', hl, theme.fill),
              win.buf_name(),
              line.sep(' ', hl, theme.fill),
              hl = hl,
            }
          end),
          hl = theme.fill,
        }
      end)

      vim.api.nvim_set_keymap('n', '<leader>ta', ':$tabnew<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>to', ':tabonly<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>tn', ':tabn<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>tp', ':tabp<CR>', { noremap = true })
      -- move current tab to previous position
      vim.api.nvim_set_keymap('n', '<leader>tmp', ':-tabmove<CR>', { noremap = true })
      -- move current tab to next position
      vim.api.nvim_set_keymap('n', '<leader>tmn', ':+tabmove<CR>', { noremap = true })
    end,
  },
}
