-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup({
  -- { import = "plugins" },

  -- lazy.nvim can manage itself
  { "folke/lazy.nvim" },

  -- Required Lua functions
  { "nvim-lua/plenary.nvim" },

  -- LSP configurations
  { "neovim/nvim-lspconfig" },
  -- NOTE: no `config = true` here. These are set up explicitly in
  -- lua/aynp/lsp-config.lua; a bare config = true would call setup() with no
  -- options first, which auto-enables every installed server and produces a
  -- duplicate client for each one.
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Treesitter for syntax highlighting.
  -- NOTE: `main` branch, not `master`. master is frozen and its query
  -- predicates use the pre-0.11 API, which crashes the markdown injection
  -- query on this Neovim version.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
  },

  -- Commenting functionality
  { "numToStr/Comment.nvim",             config = true },

  -- Autopair brackets and quotes
  { "windwp/nvim-autopairs",             config = true },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip",                  version = "v2.*" },

  -- Icons
  { "nvim-tree/nvim-web-devicons" },

  -- File explorer tree
  { "nvim-tree/nvim-tree.lua",           config = true },

  -- Fuzzy finder Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Status line
  { "nvim-lualine/lualine.nvim" },

  -- Theme
  { "catppuccin/nvim",                   name = "catppuccin" },

  -- Wiki
  { "vimwiki/vimwiki" },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim",      build = "cd app && npm install",             ft = { "markdown" } },

  -- In-buffer markdown rendering
  { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown" }, config = true },

  -- Vim be good (practice vim)
  { "ThePrimeagen/vim-be-good" },

  -- Wakatime for tracking
  { "wakatime/vim-wakatime" },

  -- Git plugins
  { "lewis6991/gitsigns.nvim",           config = true },
  { "sindrets/diffview.nvim" },

  -- Tmux integration
  { "christoomey/vim-tmux-navigator" },

  -- Competitive programming helper
  { "p00f/cphelper.nvim" },

  -- Greeter (dashboard)
  { "goolord/alpha-nvim",                requires = { "nvim-tree/nvim-web-devicons" } },

  -- Copilot
  { "github/copilot.vim" }
})
