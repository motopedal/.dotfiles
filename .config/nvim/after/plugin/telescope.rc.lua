local telescope = require("telescope")
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local Remap = require("vitya.keymap")
local nnoremap = Remap.nnoremap

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  file_ignore_patterns = {"**/node_modules/**", "**/.git/**", "**/k8s/**", "assets"}
}

nnoremap(';f',
  function()
    builtin.find_files()
  end)
nnoremap(';r', function()
  builtin.live_grep()
end)
nnoremap('\\\\', function()
  builtin.buffers()
end)
nnoremap(';t', function()
  builtin.help_tags()
end)
nnoremap(';;', function()
  builtin.resume()
end)
nnoremap(';e', function()
  builtin.diagnostics()
end)
nnoremap('<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
