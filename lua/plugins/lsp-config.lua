local capabilities = require'cmp_nvim_lsp'.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local ns = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', ns)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', ns)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ns)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ns)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', ns)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', ns)
  buf_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', ns)
  buf_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', ns)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', ns)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', ns)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', ns)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', ns)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', ns)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', ns)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', ns)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', ns)
end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(
  function (server)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end
)

--  -- NUll ls */
--  require("null-ls").config({ */
--      sources = { */
--          require("null-ls").builtins.formatting.stylua, */
--          require("null-ls").builtins.completion.spell, */
--      }, */
--  }) */
--  require("lspconfig")["null-ls"].setup({ */
--      on_attach = my_custom_on_attach, */
--  }) */

-- require("null-ls").setup({
--     sources = {
--         require("null-ls").builtins.formatting.stylua,
--         -- require("null-ls").builtins.diagnostics.eslint,
--         -- require("null-ls").builtins.completion.spell,
--     },
-- })

-- Signature
require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
})

-- HTML
require'lspconfig'.html.setup{
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities
  },
}

-- Java (exige java 11)
-- require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }

-- Python
require'lspconfig'.pyright.setup{}

-- Typescript
require'lspconfig'.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = true,
            eslint_enable_code_actions = true,
            enable_formatting = true,
            formatter = "prettier",
        })
        ts_utils.setup_client(client)        
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})


-- Angular
-- local languageServerPath = "~/.nvm/versions/node/v14.19.0/lib/"
-- local cmd = {"node", languageServerPath.."/node_modules/@angular/language-server/index.js", "--stdio", "--tsProbeLocations", languageServerPath, "--ngProbeLocations", languageServerPath}

local languageServerPath = "~/.nvm/versions/node/v14.15.0/lib/"
local cmd = {"~/.nvm/versions/node/v14.15.0/bin/node", languageServerPath.."/node_modules/@angular/language-server/index.js", "--stdio", "--tsProbeLocations", languageServerPath, "--ngProbeLocations", languageServerPath}
require'lspconfig'.angularls.setup{
  cmd = cmd,
  on_new_config = function(new_config,new_root_dir)
    new_config.cmd = cmd
  end,
}

-- Project nvim
-- require("project_nvim").setup {}
