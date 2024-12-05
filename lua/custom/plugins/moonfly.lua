return {
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,

    init = function()
      vim.cmd.colorscheme 'moonfly'

      vim.g.moonflyCursorColor = true
      vim.g.moonflyTerminalColors = false
      vim.g.moonflyTransparent = true
      vim.g.moonflyUndercurls = true
      vim.g.moonflyVirtualTextColor = true
      vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋' }
    end,
  },
}
