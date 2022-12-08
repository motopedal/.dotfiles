local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")

  -- Basic plugins
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

  -- Status Line
  use("nvim-lualine/lualine.nvim")      -- statusline config
	
  -- LSP
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp") 		-- nvim-cmp source for neovim's built-in LSP
  use("hrsh7th/cmp-buffer")		-- nvim-cmp source for buffer words
  use("hrsh7th/nvim-cmp") 		-- completion
  use("onsails/lspkind-nvim") 		-- little images in autocompletion
  use("glepnir/lspsaga.nvim")		-- LSP UIs
  use("simrat39/symbols-outline.nvim")	-- every simbol in the file - list of plugins for example
  use("saadparwaiz1/cmp_luasnip")	-- autocompletion for lua
  use("L3MON4D3/LuaSnip")		-- lua snippets
  use("nvim-lua/lsp_extensions.nvim") 	-- inlay hints for rust
  
  
  -- Colors
  use({
  'rose-pine/neovim', as = 'rose-pine'  -- Theme
  })
  use("folke/tokyonight.nvim")					-- Theme
  
  -- Visualizers
  use("windwp/nvim-autopairs")					-- 
  use("windwp/nvim-ts-autotag")					--
  use("norcalli/nvim-colorizer.lua")				--

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"										-- 
  })
  use("romgrk/nvim-treesitter-context")	--
		
  use("prettier/vim-prettier")
		
  -- Comments
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
		
  -- Git
  use('lewis6991/gitsigns.nvim')
  use('dinhhuy258/git.nvim') 
end)
