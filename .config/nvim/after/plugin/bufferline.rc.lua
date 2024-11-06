local Remap = require("vitya.keymap")
local nnoremap = Remap.nnoremap

require("bufferline").setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },
})

nnoremap('<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
nnoremap('<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
