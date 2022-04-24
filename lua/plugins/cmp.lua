local luasnip = require 'luasnip'
local cmp = require'cmp'
local lspkind = require'lspkind'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup{
  completion = {
    completeopt ='menu,menuone,noinsert',
  },
  experimental = {
    -- ghost_text = true,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then cmp.select_next_item({
          behavior = cmp.SelectBehavior.Select
        })
        elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
        elseif has_words_before() then cmp.complete()
        else fallback() end
      end,
      { "i", "s" }
    ),
    ["<S-Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then cmp.select_prev_item({
          behavior = cmp.SelectBehavior.Select
        })
        elseif luasnip.jumpable(-1) then luasnip.jump(-1)
        else fallback() end
      end,
      { "i", "s" }
    ),
  },
  sources = {
    { name = 'luasnip', keyword_length = 3 },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'buffer', keyword_length = 3 },
    { name = 'path' },
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
}
-- load snippets from runtimepath, eg. friendly-snippets.
require("luasnip.loaders.from_vscode").load()
