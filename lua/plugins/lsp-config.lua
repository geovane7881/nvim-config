-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local ns = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', ns)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', ns)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ns)
  buf_set_keymap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', ns)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ns)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', ns)
  buf_set_keymap('n', '<Leader>h', '<cmd>lua vim.diagnostic.open_float()<cr>', ns)
  buf_set_keymap('n', '<Leader>H', '<cmd>lua vim.lsp.buf.signature_help()<CR>', ns)
  buf_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', ns)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', ns)
  buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', ns)
  buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', ns)
  buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', ns)
  buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', ns)
  buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', ns)
  buf_set_keymap('n', '<Leader>.', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', ns)
  buf_set_keymap('n', '<Leader>k', '<cmd>lua vim.diagnostic.goto_prev()<CR>', ns)
  buf_set_keymap('n', '<Leader>j', '<cmd>lua vim.diagnostic.goto_next()<CR>', ns)
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

-- v14.19.0 (casa)
-- v14.15.0 (trabalho)
local languageServerPath = "~/.nvm/versions/node/v14.21.1/lib/"
local cmd = {"~/.nvm/versions/node/v14.21.1/bin/node", languageServerPath.."/node_modules/@angular/language-server/index.js", "--stdio", "--tsProbeLocations", languageServerPath, "--ngProbeLocations", languageServerPath}
require'lspconfig'.angularls.setup{
  cmd = cmd,
  on_new_config = function(new_config,new_root_dir)
    new_config.cmd = cmd
  end,
}

-- Project nvim
require("project_nvim").setup {}

-- Quick lint js
-- require('lspconfig/quick_lint_js').setup {}
-- require'lspconfig'.quick_lint_js.setup {
--   lsp = {
--     on_attach = on_attach,
--     capabilities = capabilities
--   },
-- }

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
        null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
        null_ls.builtins.formatting.prettier, -- prettier, eslint, eslint_d, or prettierd
        null_ls.builtins.completion.spell,
    }
})

local eslint = require("eslint")
eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})
