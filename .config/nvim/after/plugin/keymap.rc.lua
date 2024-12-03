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
nnoremap("te", ":tabedit ")

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
nnoremap("<leader>pv", ":NvimTreeToggle<CR>")
nnoremap("<leader>r", ":Spectre<CR>")
nnoremap("<leader>pf", ":NvimTreeFindFile<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

_G.organize_and_format = function(skip_write)
    vim.lsp.buf.execute_command({
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "Organize Imports"
    })

    vim.defer_fn(function()
        vim.cmd("Prettier")

        if not skip_write then
            vim.cmd("write!")
        end
    end, 50) -- Add a delay (100ms) if needed
end

-- Keybinding for manual format and organize imports
nnoremap("<leader>f", "<cmd>lua organize_and_format(false)<CR>", { noremap = true, silent = true })

-- Autoformat on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" },
--     callback = function()
--         organize_and_format(true)
--     end,
-- })
