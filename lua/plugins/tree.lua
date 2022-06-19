local g = vim.g
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

g.nvim_tree_respect_buf_cwd = 1

require('nvim-tree').setup{
  -- auto_close = true,
  -- update_cwd = true,
  -- update_to_buf_dir   = {
  --   enable = true,
  --   auto_open = true
  -- },
  -- update_focused_file = {
  --   enable      = true,
  --   update_cwd  = true,
  -- },
  filters = {
    dotfiles = true,
    custom = {}
  },
  view = {
    width = 55,
    mappings = {
      list = {
          { key = {"C", "2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
      }
    }
  }
 }
