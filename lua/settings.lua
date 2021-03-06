local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Leader
g.mapleader = ','

-- General
opt.compatible = false
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
-- fix ident for comments
cmd [[
  set nosmartindent
  filetype plugin indent on
  set cindent
  set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e
  autocmd FileType * set cindent "some file types override it
]]

-- json
-- cmd [[
--   " Disable quote concealing in JSON files
--   let g:vim_json_conceal=0
-- ]]
cmd [[
  " Disable quote concealing in JSON files
  set conceallevel=0
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

cmd [[
  au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
]]


-- Theme
opt.termguicolors = true
-- cmd [[colorscheme dracula]]
-- For dark theme
g.vscode_style = "dark"
-- For light theme
-- g.vscode_style = "light"
cmd [[colorscheme vscode]]
-- cmd [[colorscheme PaperColor]]


 -- \       'override' : {
 -- \		'color00' : ['#ffffff', '256'],
 --  \       }
 -- \     }


-- cmd [[

-- set background=dark
-- set t_Co=256   " This is may or may not needed.

-- let g:PaperColor_Theme_Options = {
--   \   'theme': {
--   \     'default.dark': {
--   \ 	  'transparent_background': 1
--   \     }                  
--   \   }
--   \ }
  

--  colorscheme PaperColor

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
opt.cursorline = true
opt.guicursor = 'a:blinkon1'
opt.scrolloff = 10
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
-- opt.smartindent = true
opt.list = false
opt.listchars = { eol = '??' }
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


cmd [[
if has('nvim')
   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif]]

-- Neoterm
g.neoterm_default_mod = 'vertical'
g.neoterm_autoinsert = true
g.neoterm_autoscroll = true
g.neoterm_term_per_tab = true

-- CloseTags
g.closetag_filenames = '*.html,*.xhtml,*.phtml'
g.closetag_xhtml_filenames = '*.xhtml,*.jsx'
g.closetag_filetypes = 'html,xhtml,phtml'
g.closetag_xhtml_filetypes = 'xhtml,jsx'
g.closetag_emptyTags_caseSensitive = 1
-- g.closetag_regions:append {
--   ['typescript.tsx'] = 'jsxRegion,tsxRegion',
--   ['javascript.jsx'] = 'jsxRegion',
--   ['typescriptreact'] = 'jsxRegion,tsxRegion',
--   ['javascriptreact'] = 'jsxRegion',
-- }
g.closetag_shortcut = '>'
g.closetag_close_shortcut = '<leader>>'

-- Formatter
-- Autoformat
cmd [[ 
  let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'css': ['prettier'],
  \}

  let g:ale_linters_explicit = 1
  let g:ale_fix_on_save = 0
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
]]
