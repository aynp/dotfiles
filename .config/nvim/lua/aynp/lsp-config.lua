require('mason').setup();
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "gopls" },
  -- Servers are enabled explicitly via vim.lsp.enable() below so that the list
  -- isn't limited to whatever mason happens to have installed. Letting
  -- mason-lspconfig also enable them would be redundant.
  automatic_enable = false,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Buffer-local mappings, applied once a server attaches.
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('aynp_lsp_attach', { clear = true }),
  callback = function(args)
    local bufnr = args.buf

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
  end,
})

-- Shared config merged into every server. The per-server base configs ship with
-- nvim-lspconfig as `lsp/<name>.lua` files; we only layer our own bits on top.
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Per-server overrides
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  }
})

-- Servers to enable. Each will start when a matching filetype is opened,
-- provided its executable is on $PATH (see :checkhealth vim.lsp).
vim.lsp.enable({
  "ts_ls",
  "lua_ls",
  "gopls",
  "clangd",
  "dockerls",
  "pyright",
  "yamlls",
})
