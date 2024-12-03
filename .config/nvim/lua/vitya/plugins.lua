-- Check if Packer is installed, print a message if it is missing
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- Load Packer for managing plugins
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Package Manager
  use("wbthomason/packer.nvim") -- Packer is a package manager for Neovim, used to manage other plugins

  -- Core dependencies for other plugins
  use("nvim-lua/plenary.nvim") -- Provides utility functions used by many other plugins
  use("nvim-lua/popup.nvim") -- Popup API for creating floating windows in Neovim
  use("nvim-pack/nvim-spectre") -- Search and replace tool with a user-friendly interface

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua', -- File explorer tree view that displays files in a directory structure
    requires = {
      'nvim-tree/nvim-web-devicons', -- Adds file-type icons for better visual organization in nvim-tree
    },
  }

  -- Status Line
  use("nvim-lualine/lualine.nvim") -- Highly customizable status line, showing information about the file, mode, etc.

  -- Telescope - Fuzzy Finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "danielfalk/smart-open.nvim",
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function ()
      local telescope = require("telescope")

      telescope.load_extension("smart_open")
      telescope.load_extension("live_grep_args")
    end
  } -- Fuzzy finder with support for finding files, searching text, and more

  -- LSP setup and Autocompletion plugins grouped together
  use('neovim/nvim-lspconfig') -- Essential LSP configurations for various programming languages
  use('williamboman/mason.nvim') -- LSP server manager for downloading and updating language servers
  use('williamboman/mason-lspconfig.nvim') -- Bridges Mason with nvim-lspconfig for smooth integration

  -- Autocompletion
  use('hrsh7th/nvim-cmp') -- Main autocompletion plugin supporting various completion sources
  use('hrsh7th/cmp-buffer') -- Adds buffer words to autocompletion suggestions
  use('hrsh7th/cmp-path') -- Adds filesystem paths to autocompletion suggestions
  use('hrsh7th/cmp-nvim-lsp') -- Integrates LSP completions with nvim-cmp
  use('hrsh7th/cmp-nvim-lua') -- Adds Lua-specific completions (for Neovim config)

  -- Snippets
  use('saadparwaiz1/cmp_luasnip') -- Snippet completion source for nvim-cmp
  use('L3MON4D3/LuaSnip') -- Snippet engine for managing and expanding code snippets
  use('rafamadriz/friendly-snippets') -- Collection of pre-made snippets for different languages

  -- Colors and Themes
  use({ "folke/tokyonight.nvim",
    config = function ()
      vim.cmd[[colorscheme tokyonight]]
    end
  }) -- Color scheme providing a pleasant and modern look for Neovim

  -- UI Enhancements
  use("windwp/nvim-autopairs") -- Automatically pairs brackets and quotes
  use("norcalli/nvim-colorizer.lua") -- Highlights color codes (e.g., #FFFFFF) with the actual color
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Treesitter - Syntax Highlighting and Parsing
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" }) -- Syntax highlighting, text object parsing, and more
  use("romgrk/nvim-treesitter-context") -- Keeps the current function/class header visible at the top while scrolling

  -- Code Formatting
  use { "prettier/vim-prettier" ,
    config = function ()
      vim.g['prettier#autoformat'] = 1
      vim.g['prettier#autoformat_config_present'] = 1
      vim.g['prettier#exec_cmd_path'] = 'prettier'
    end
  }-- Integrates Prettier for auto-formatting JavaScript, CSS, and more

  -- Commenting Utilities
  use("numToStr/Comment.nvim") -- Easily add, remove, and toggle comments in code
  use("JoosepAlviste/nvim-ts-context-commentstring") -- Enables contextual comment strings based on code location (useful for JSX, etc.)

  -- Git Integrations
  use("lewis6991/gitsigns.nvim") -- Shows git diff information (e.g., added, removed lines) in the gutter
  use("APZelos/blamer.nvim") -- Displays inline git blame information at the end of each line
  use("dinhhuy258/git.nvim") -- Git commands wrapper that enables easy git management from Neovim
end)
