-- nvim-treesitter `main` branch.
--
-- The old `require('nvim-treesitter.configs').setup{}` API only exists on the
-- frozen `master` branch and does not work here. On `main` there are two jobs:
--   1. install parsers  -> require('nvim-treesitter').install()
--   2. start highlighting -> vim.treesitter.start(), per buffer
-- There is no `auto_install` any more, so the wanted parsers are listed
-- explicitly below.

local ts = require("nvim-treesitter")

ts.setup()

local ensure_installed = {
  -- explicitly wanted
  "c", "cpp", "lua", "rust", "go", "ocaml",
  -- markdown_inline is required for markdown injections (and render-markdown);
  -- markdown alone is not enough.
  "markdown", "markdown_inline",
  -- carried over from the previous auto_install set
  "astro", "bash", "csv", "cue", "dockerfile", "fish",
  "git_config", "gitattributes", "gitcommit", "gitignore",
  "gomod", "gosum", "html", "ini", "json", "make", "pem", "proto",
  "python", "requirements", "sql", "ssh_config", "terraform", "tmux",
  "toml", "typescript", "xml", "yaml",
}

-- Install only what is missing, so startup does not shell out to a compiler
-- on every launch.
local installed = {}
for _, lang in ipairs(ts.get_installed("parsers")) do
  installed[lang] = true
end

local missing = vim.tbl_filter(function(lang)
  return not installed[lang]
end, ensure_installed)

if #missing > 0 then
  ts.install(missing)
end

-- Enable treesitter highlighting per buffer.
local max_filesize = 100 * 1024 -- 100 KB

local function start(buf, filetype)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end

  -- Skip very large files; treesitter highlighting gets slow.
  local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return
  end

  -- Only start if a parser is actually available for this filetype.
  local lang = vim.treesitter.language.get_lang(filetype)
  if not lang then
    return
  end
  if not pcall(vim.treesitter.language.add, lang) then
    return
  end

  pcall(vim.treesitter.start, buf, lang)
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("aynp_treesitter_start", { clear = true }),
  callback = function(args)
    start(args.buf, args.match)
  end,
})

-- after/plugin runs after FileType has already fired for any file passed on the
-- command line, so catch up on buffers that are already loaded.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then
    local ft = vim.bo[buf].filetype
    if ft ~= "" then
      start(buf, ft)
    end
  end
end
