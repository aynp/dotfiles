vim.g.mapleader          = " "

local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Delete to black hole register
M.map("n", "d", "\"_d")
M.map("x", "d", "\"_d")
M.map("n", "<leader>p", "\"_dP")

-- Go half page up/down and center the cursor
M.map("n", "<C-d>", "<C-d>zz")
M.map("n", "<C-u>", "<C-u>zz")

-- Search and center the cursor
M.map("n", "n", "nzzzv")
M.map("n", "N", "Nzzzv")

-- M.map("t", "<Esc>", "")

-- Center after up down
-- M.map("n", "j", "jzzzv")
-- M.map("n", "k", "kzzzv")

return M


