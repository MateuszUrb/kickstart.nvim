return {
  {
    'kkoomen/vim-doge',
    vim.keymap.set('n', '<Leader>dg', '<Plug>(doge-generate)'),
    vim.keymap.set('n', '<TAB>', '<Plug>(doge-comment-jump-forward)'),
    vim.keymap.set('n', '<S-TAB>', '<Plug>(doge-comment-jump-backward)'),
    vim.keymap.set('i', '<TAB>', '<Plug>(doge-comment-jump-forward)'),
    vim.keymap.set('i', '<S-TAB>', '<Plug>(doge-comment-jump-backward)'),
    vim.keymap.set('x', '<TAB>', '<Plug>(doge-comment-jump-forward)'),
    vim.keymap.set('x', '<S-TAB>', '<Plug>(doge-comment-jump-backward)'),
  },
}
