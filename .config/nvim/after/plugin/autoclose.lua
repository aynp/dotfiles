require("nvim-autopairs").setup({
  enable_check_bracket_line = true,
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'", '|' },
    end_key = '$',
    cursor_pos_before = true,
    manual_position = false,
    highlight = 'Search',
    highlight_grey = 'Comment'
  },
})

