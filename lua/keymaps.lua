local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

-- Config
set("n", "<Leader>e", ":e! ~/.config/nvim/init.lua<cr>", ns)

-- Terminal
set("t", "<Esc>", "<C-\\><C-n><C-w><C-w>", ns)

-- Directory
set("n", "<Leader>cd", ":cd %:p:h<cr>:!pwd > ~/.last_dir<cr><cr>", ns)
set("n", "<Leader>C", ":pwd<cr>", ns)
set("n", "<Leader>cp", ":let @+=expand(\"%:p\")<CR>", ns)

-- Clean Search
-- util quando a opção hlsearch está ativa
set("n", "<Leader>d", ":let @/=''<CR>", ns)

-- Window
set("n", "<up>", ":resize +4<CR>", ns)
set("n", "<down>", ":resize -4<CR>", ns)
set("n", "<right>", ":vertical resize +4<CR>", ns)
set("n", "<left>", ":vertical resize -4<CR>", ns)

set("n", "<Leader>s", ":<C-u>split<CR>", ns)
set("n", "<Leader>v", ":<C-u>vsplit<CR>", ns)

set("n", "<M-h>", "<C-w>h", ns)
set("n", "<M-j>", "<C-w>j", ns)
set("n", "<M-k>", "<C-w>k", ns)
set("n", "<M-l>", "<C-w>l", ns)


set("n", "<M-S-h>", "<C-w>H", ns)
set("n", "<M-S-j>", "<C-w>J", ns)
set("n", "<M-S-k>", "<C-w>K", ns)
set("n", "<M-S-l>", "<C-w>L", ns)

-- Moving
set("n", "j", "gj", ns)
set("n", "k", "gk", ns)

-- start and end of line
set("n", "<Leader>h", "^", ns)
set("n", "<Leader>l", "g_", ns)
set("v", "<Leader>h", "^", ns)
set("v", "<Leader>l", "g_", ns)
set("i", "<Leader>h", "<Esc>^i", ns)
set("i", "<Leader>l", "<Esc>g_a", ns)
-- paragraphs
-- set("n", "<Leader>j", "}}kg_", ns)
-- set("n", "<Leader>k", "{kg_", ns)
-- set("v", "<Leader>j", "}}kg_", ns)
-- set("v", "<Leader>k", "{kg_", ns)

-- Buffers
set("n", "J", ":BufferLineCycleNext<CR>", ns)
set("n", "K", ":BufferLineCyclePrev<CR>", ns)
set("n", "Q", ":bd!<CR>", ns)
set("n", "<C-t>", ":tabnew<CR>", ns)
set("n", "<Leader>x", "<esc>:w <bar> %bd <bar> e#<CR>", ns)

-- Save
set("n", "<C-s>", ":w<CR>", ns)
set("i", "<C-s>", "<Esc>:w<CR>a", ns)

-- Repeat Search
set("n", "?", ".", ns)
set("n", ".", ";", ns)

-- Copy and paste
set("v", "<C-V>", ':r !xclip -o -sel -c<CR>', ns)
set("n", "<C-x>", '"*yydd', ns)
set("v", "<C-x>", '"+ygvd', ns)
-- não mover conteudo apagado para área de transferencia
set("n", "x", '"_x', ns)
set("v", "x", '"_x', ns)
set("n", "X", '"_X', ns)
set("v", "X", '"_X', ns)
set("n", "d", '"_d', ns)
set("v", "d", '"_d', ns)
set("n", "D", '"_D', ns)
set("v", "D", '"_D', ns)
set("n", "c", '"_c', ns)
set("v", "c", '"_c', ns)
set("n", "C", '"_C', ns)
set("v", "C", '"_C', ns)
-- set("n", "p", 'pgvy', ns)
set("v", "p", 'pgvy', ns)

-- Macro
set("n", "<Leader>r", "q", ns)

-- Nvim Tree/
set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", ns)
set("n", "<M-b>", ":NvimTreeToggle<CR>", ns)

-- Telescope
set("n", "<C-p>", ":Telescope find_files<CR>", ns)
set("n", "<C-g>", ":Telescope live_grep<CR>", ns)
set("n", "<C-b>", ":Telescope buffers<CR>", ns)
set("n", "<C-h>", ":Telescope oldfiles<CR>", ns)

-- Commentary
set("n", "<Leader>cc", ":Commentary<CR>", ns)
set("v", "<Leader>cc", ":Commentary<CR>", ns)

-- Pretier
set("n", "<Leader>f", ":ALEFix prettier<CR>", ns)


-- Dashboard
set("n", "<Leader>n", ":DashboardNewFile<CR>", ns)
set("n", "<Leader>ss", ":<C-u>SessionSave<CR>", ns)
set("n", "<C-j>", ":<C-u>SessionLoad<CR>", ns)

-- Terminal

-- szw/vim-maximizer
set('', '<C-w>m', ':MaximizerToggle!<CR>', ns)
set('', '<C-m>', ':MaximizerToggle!<CR>', ns)

-- kassio/neoterm
set('n', '<c-y>', ':Ttoggle<CR>', ns)
set('i', '<c-y>', '<Esc>:Ttoggle<CR>', ns)
set('t', '<c-y>', '<c-\\><c-n>:Ttoggle<CR>', ns)
-- open current on terminal
-- set('n', '<leader>x', ':TREPLSendLine<CR>', ns)
-- set('v', '<leader>x', ':TREPLSendSelection<CR>', ns)
