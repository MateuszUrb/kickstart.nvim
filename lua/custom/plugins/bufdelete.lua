return {
  'famiu/bufdelete.nvim',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>bd', ':Bdelete<CR>', { noremap = true, silent = true })

    -- "bw" deletes the buffer and closes the window
    vim.api.nvim_set_keymap('n', '<leader>bw', ':Bwipeout<CR>', { noremap = true, silent = true })
  end,
}
