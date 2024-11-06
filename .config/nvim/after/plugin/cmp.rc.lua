local Remap = require("vitya.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities())

-- Key mappings for LSP functionality, applied via `on_attach`
local function on_attach()
  nnoremap("gd", vim.lsp.buf.definition)
  nnoremap("K", vim.lsp.buf.hover)
  nnoremap("<leader>vws", vim.lsp.buf.workspace_symbol)
  nnoremap("<leader>vd", vim.diagnostic.open_float)
  nnoremap("[d", vim.diagnostic.goto_next)
  nnoremap("]d", vim.diagnostic.goto_prev)
  nnoremap("<leader>vca", vim.lsp.buf.code_action)
  nnoremap("<leader>vrr", vim.lsp.buf.references)
  nnoremap("<leader>vrn", vim.lsp.buf.rename)
  inoremap("<C-h>", vim.lsp.buf.signature_help)
end

-- Define a function to configure each LSP server
local function setup_server(server, config)
  config = vim.tbl_deep_extend("force", {
    -- Apply the `on_attach` function with key mappings
    on_attach = on_attach,
    -- Apply the LSP capabilities for completion
    capabilities = capabilities,
  }, config or {})
  require("lspconfig")[server].setup(config)
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' }
  }, {
      { name = 'buffer' },
    })
})

-- Set up Mason with automatic LSP installation
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "rust_analyzer",
  },
  handlers = {
    -- Default handler to apply configuration for each server
    function(server_name)
      setup_server(server_name)
    end,

    -- TypeScript-specific configuration
    ["ts_ls"] = function()
      setup_server("ts_ls", {
        single_file_support = false,
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(".git")(fname)
              or require("lspconfig.util").root_pattern("tsconfig.json")(fname)
              or require("lspconfig.util").root_pattern("package.json", "jsconfig.json")(fname)
        end,
      })
    end,

    -- Lua-specific configuration
    ["lua_ls"] = function()
      setup_server("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
              globals = { "vim", "describe", "it", "before_each", "after_each" },
            },
          },
        },
      })
    end,
  }
})


vim.diagnostic.config({
  -- update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

local opts = {
  -- whether to highlight the currently hovered symbol
  -- disable if your cpu usage is higher than you want it
  -- or you just hate the highlight
  -- default: true
  highlight_hovered_item = true,

  -- whether to show outline guides
  -- default: true
  show_guides = true,
}

require("symbols-outline").setup(opts)
