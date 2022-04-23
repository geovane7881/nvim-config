require('nvim-autopairs').setup{}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
  map_cr = true,
  map_complete = true,
  auto_select = true,
  insert = false,
  map_char = {
    all = '(',
    tex = '{'
  }
}))
