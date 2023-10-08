local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Leader
g.mapleader = ' '

-- General
opt.compatible = false
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240

-- Theme
opt.termguicolors = true

-- Catppuccin
-- default
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]

-- Dracula
-- cmd [[colorscheme dracula]]

-- VsCode
-- For dark theme
g.vscode_style = "dark"
-- For light theme
cmd [[colorscheme vscode]]
-- g.vscode_style = "light"

-- PaperColor
-- cmd [[colorscheme PaperColor]]

-- Fixes 
-- cmd [[
-- set background=dark
-- set t_Co=256   " This is may or may not needed.
-- hi Normal guibg=NONE ctermbg=NONE

-- let g:PaperColor_Theme_Options = {
--   \   'theme': {
--   \     'default': {
--   \       'transparent_background': 1
--   \     }
--   \   }
--   \ }

-- ]]

--  colorscheme PaperColor
-- " highlight de cursor
-- :hi Comment	ctermfg=Cyan guifg=#80a0ff gui=bold
-- " :hi MatchParen ctermfg=Cyan guifg=#80a0ff gui=bold
-- " :hi MatchParen ctermfg=Cyan guifg=#80a0ff gui=bold
-- ]]


-- Editor
opt.number = true
opt.wrap = false
opt.signcolumn = 'yes'
opt.showmatch = true
opt.showmode = false
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true
-- opt.conceallevel = 0
opt.colorcolumn = '80'
opt.cursorline = false
opt.guicursor = 'a:blinkon1'
opt.scrolloff = 10
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
-- opt.smartindent = true
opt.list = false
opt.listchars = { eol = '¬' }
opt.shortmess:append {c = true}
opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  [','] = true,
  h = true,
  l = true
}

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Interface
opt.showcmd = true
opt.relativenumber = true

-- Terminal
-- cmd [[command! Term :botright split term://$SHELL]]
-- cmd [[
--  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
--  autocmd TermOpen * startinsert
--  autocmd BufLeave term://* stopinsert
-- ]]

-- AutoChange CWD
-- autocmd VimEnter * if isdirectory(argv(0)) | exec 'Telescope find_files cwd=' . argv(0) | endif
-- autocmd VimEnter * if isdirectory(argv(0)) | exec 'Telescope oldfiles cwd=' . argv(0) | endif
-- autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
-- autocmd BufEnter * silent! :cd %:p:h
-- sempre troca para o diretorio do arquivo
-- cmd [[
--    autocmd BufEnter * silent! lcd %:p:h
-- ]]


-- cmd [[
-- if has('nvim')
--    au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
-- endif]]

-- Fix ident for comments
-- cmd [[
--   set nosmartindent
--   filetype plugin indent on
--   set cindent
--   set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e
--   autocmd FileType * set cindent "some file types override it
-- ]]

-- Json editing fixes
cmd [[
  " Disable quote concealing in JSON files
  "set conceallevel=0
  let g:conceallevel = 0
  let g:vim_json_syntax_conceal = 0
  let g:indentLine_concealcursor=""
]]

-- Backup
opt.wildignore="*.swp,*.bak,*.pyc,*.class"
opt.autowrite=true
opt.backup=true
opt.undodir= os.getenv("HOME") .. "/.config/nvim/undodir"
opt.backupdir=os.getenv("HOME") .. "/.config/nvim/backup"
opt.undofile = true
opt.undolevels=1000
opt.undoreload=10000
opt.writebackup=true
opt.backupcopy="yes"

-- cmd [[
--   au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
-- ]]

opt.timeoutlen = 500

-- Neoterm
g.neoterm_default_mod = 'rightbelow'
g.neoterm_autoinsert = true
g.neoterm_autoscroll = true
g.neoterm_term_per_tab = true
g.neoterm_size = 10
g.neoterm_fixedsize = 1

-- CloseTags
g.closetag_filenames = '*.html,*.xhtml,*.phtml'
g.closetag_xhtml_filenames = '*.xhtml,*.jsx'
g.closetag_filetypes = 'html,xhtml,phtml'
g.closetag_xhtml_filetypes = 'xhtml,jsx'
g.closetag_emptyTags_caseSensitive = 1
g.closetag_shortcut = '>'
g.closetag_close_shortcut = '<leader>>'

-- Formatter

-- Autoformat
-- cmd [[ 
--   let g:ale_fixers = {
--   \   'javascript': ['prettier'],
--   \   'css': ['prettier'],
--   \}

--   let g:ale_linters_explicit = 1
--   let g:ale_fix_on_save = 0
--   let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
-- ]]

-- statusline
-- cmd [[ 
--   set statusline=" "
--   set laststatus=0
--   set noruler
-- ]]

--tabline
-- cmd [[
--   " autocmd BufEnter * let &titlestring = expand("%:@")
--   " autocmd BufEnter * let &titlestring = expand("%:p:h")
--   autocmd BufEnter * let &titlestring = expand("%:t")
--   set title
--   set guitablabel=%t
--   set tabline=%t

-- ]]

-- gui options
-- cmd [[
--   set guicursor=a:hor20
--   set guifont=Iosevka\ Custom:h16

--   let g:terminal_color_0 = '#001930'
--   let g:terminal_color_1 = '#094B92'
--   let g:terminal_color_2 = '#BD4455'
--   let g:terminal_color_3 = '#073986'
--   let g:terminal_color_4 = '#8A3254'
--   let g:terminal_color_5 = '#A53756'
--   let g:terminal_color_6 = '#235D9F'
--   let g:terminal_color_7 = '#9ca5c8'
--   let g:terminal_color_8 = '#6d738c'
--   let g:terminal_color_9 = '#094B92'
--   let g:terminal_color_10 = '#BD4455'
--   let g:terminal_color_11 = '#073986'
--   let g:terminal_color_12 = '#8A3254'
--   let g:terminal_color_13 = '#A53756'
--   let g:terminal_color_14 = '#235D9F'
--   let g:terminal_color_15 = '#235D9F'
-- ]]


-- cmd [[
--   let g:rainbow#max_level = 16
--   let g:rainbow#pairs = [['(', ')'], ['[', ']']]
-- ]]
--


---------------------------------
-- Mensagem flutuante
---------------------------------
vim.diagnostic.config({
  float = { source = "always", border = border },
  virtual_text = false,
  signs = true,
  -- signs = false,
})

---------------------------------
-- Auto commands
---------------------------------
vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
