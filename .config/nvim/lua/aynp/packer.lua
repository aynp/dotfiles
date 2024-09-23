-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim"

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'nvim-treesitter/nvim-treesitter'

  use 'numToStr/Comment.nvim'

  use 'windwp/nvim-autopairs'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- File tree
  use 'nvim-tree/nvim-tree.lua'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Bar
  use 'nvim-lualine/lualine.nvim'

  -- Theme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Wiki
  use { 'vimwiki/vimwiki' }

  -- Markdown
  use { 'iamcco/markdown-preview.nvim' }

  -- Vim be Good
  use 'ThePrimeagen/vim-be-good'

  -- Wakatime
  use 'wakatime/vim-wakatime'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"

  -- Make it work with tmux
  use 'christoomey/vim-tmux-navigator'

  -- Copilot
  -- use 'github/copilot.vim'

  -- CP Helper
  use 'p00f/cphelper.nvim'

  -- Greeter
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
end)
