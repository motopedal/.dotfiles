# https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L378
require("nvim-tree").setup({
  sort = {
    sorter = "name",
    folders_first = true,
    files_first = false,
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  filters = {
    enable = true,
    git_ignored = false,
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    no_bookmark = false,
    custom = {},
    exclude = {},
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
})

