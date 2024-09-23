local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  -- [[                                                                       ]],
  -- [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
}

-- dashboard.section.header.val = {
--   [[　　　 　　/＾>》, -―‐‐＜＾}]],
--   [[　　　 　./:::/,≠´::::::ヽ.]],
--   [[　　　　/::::〃::::／}::丿ハ]],
--   [[　　　./:::::i{l|／　ﾉ／ }::}]],
--   [[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
--   [[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
--   [[　 |:::::::|／}｀ｽ /          /]],
--   [[.　|::::::|(_:::つ/  Laptop  /　neovim!]],
--   [[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
-- }
--

_Gopts = {
  position = "center",
  hl = "Type",
}

dashboard.section.buttons.val = {}
dashboard.section.buttons.val = {
  dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "Find File", ":Telescope find_files<CR>"),
  dashboard.button("r", "Find History", ":Telescope oldfiles<CR>"),
  dashboard.button("h", "Find Help", ":Telescope oldfiles<CR>"),
  dashboard.button("b", "Find Buffer", ":Telescope buffers<CR>"),
  dashboard.button("q", "Quit NVIM", ":qa<CR>"),

}

dashboard.section.footer.val = {
  "  ",
  "  ",
  "  ",
  "Hard work beats talent when talent doesn't work hard."
}

dashboard.section.footer.opts.hl = "Comment"


dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

