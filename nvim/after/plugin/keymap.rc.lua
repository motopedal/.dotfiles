local Remap = require("vitya.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap("x", "_x")

-- Increment/decrement
nnoremap("+", "<C-a>")
nnoremap("-", "<C-x>")

-- Delete a word backwards
nnoremap('dw', 'vb"_d')

-- Select all
nnoremap("<C-a>", "gg<S-v>G")

-- New tab
nnoremap("te", ":tabedit")

-- Split window
nnoremap("ss", ":split<Return><C-w>w")
nnoremap("sv", ":vsplit<Return><C-w>w")

-- Resize window
nnoremap("<C-w><left>", "<C-w><")
nnoremap("<C-w><right>", "<C-w>>")
nnoremap("<C-w><up>", "<C-w>+")
nnoremap("<C-w><down>", "<C-w>-")

-- Escape faster
inoremap("<C-c>", "<Esc>")

-- Jumping around
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

-- File manager
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

nnoremap("gp", ":silent %!npx prettier --stdin-filepath %<CR>")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

-- Format file
nnoremap("<leader>f", function()
    -- vim.lsp.buf.format()
    organize_imports()
    vim.cmd(":exe 'normal gp'")
end)
