local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

-- Config
set("n", "<Leader>e", ":e! ~/.config/nvim/init.lua<cr>", ns)

-- Terminal
-- set("t", "<Esc>", "<C-\\><C-n><C-w><C-w>", ns)
set("i", "<Esc>", "<C-c>", ns)

-- Directory
set("n", "<Leader>cd", ":cd %:p:h<cr>:!pwd > ~/.last_dir<cr><cr>", ns)
set("n", "<Leader>C", ":pwd<cr>", ns)
set("n", "<Leader>cp", ":let @+=expand(\"%:p\")<CR>", ns)

-- Clean Search
-- util quando a opção hlsearch está ativa
set("n", "<Leader>d", ":let @/=''<CR>", ns)

-- Window
set("n", "<M-up>", ":resize -4<CR>", ns)
set("n", "<M-down>", ":resize +4<CR>", ns)
set("n", "<M-left>", ":vertical resize +4<CR>", ns)
set("n", "<M-right>", ":vertical resize -4<CR>", ns)

set("n", "<Leader>s", ":<C-u>split<CR>", ns)
set("n", "<Leader>v", ":<C-u>vsplit<CR>", ns)

-- Move beetween windows
-- set("n", "<M-h>", "<C-w>h", ns)
-- set("n", "<M-j>", "<C-w>j", ns)
-- set("n", "<M-k>", "<C-w>k", ns)
-- set("n", "<M-l>", "<C-w>l", ns)

-- nao funciona
-- set("n", "<C-S-H>", "<C-w>H", ns)
-- set("n", "<C-S-J>", "<C-w>J", ns)
-- set("n", "<C-S-K>", "<C-w>K", ns)
-- set("n", "<C-S-L>", "<C-w>L", ns)

-- Moving
set("n", "j", "gj", ns)
set("n", "k", "gk", ns)

-- start and end of line
set("n", "<M-h>", "^", ns)
set("v", "<M-h>", "^", ns)
set("i", "<M-h>", "<Esc>^i", ns)
set("n", "<M-l>", "g_", ns)
set("v", "<M-l>", "g_", ns)
set("i", "<M-l>", "<Esc>g_a", ns)
-- paragraphs
set("n", "<M-j>", "}}kg_", ns)
set("v", "<M-j>", "}}kg_", ns)
set("n", "<M-k>", "{kg_", ns)
set("v", "<M-k>", "{kg_", ns)

-- Buffers
set("n", "J", ":BufferLineCycleNext<CR>", ns)
set("n", "K", ":BufferLineCyclePrev<CR>", ns)
set("n", "Q", ":bd!<CR>", ns)
-- set("n", "<C-t>", ":tabnew<CR>", ns)
set("n", "<Leader>x", "<esc>:w <bar> %bd <bar> e#<CR>", ns)

-- Save
set("n", "<C-s>", ":w<CR><Esc>", ns)
-- set("i", "<C-s>", "<Esc>:w<CR>a", ns)
set("i", "<C-s>", "<Esc>:w<CR><Esc>", ns)
set("n", "<Leader>s", ":w<CR>", ns)

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
set("n", "<Leader>p", ":Telescope find_files<CR>", ns)
set("n", "<Leader>g", ":Telescope live_grep<CR>", ns)
set("n", "<Leader>b", ":Telescope buffers<CR>", ns)
set("n", "<Leader>h", ":Telescope oldfiles<CR>", ns)

-- Commentary
set("n", "<Leader>cc", ":Commentary<CR>", ns)
set("v", "<Leader>cc", ":Commentary<CR>", ns)

-- Pretier
set("n", "<Leader>F", ":ALEFix prettier<CR>", ns)


-- Dashboard
set("n", "<Leader>N", ":DashboardNewFile<CR>", ns)
set("n", "<Leader>S", ":<C-u>SessionSave<CR>", ns)
set("n", "<Leader>L", ":<C-u>SessionLoad<CR>", ns)

-- Terminal

-- szw/vim-maximizer
set('', '<C-w>m', ':MaximizerToggle!<CR>', ns)
set('', '<C-m>', ':MaximizerToggle!<CR>', ns)

-- kassio/neoterm
-- set('n', '<c-y>', ':Ttoggle<CR>', ns)
-- set('i', '<c-y>', '<Esc>:Ttoggle<CR>', ns)
-- set('t', '<c-y>', '<c-\\><c-n>:Ttoggle<CR>', ns)

-- -- open current on terminal
-- -- set('n', '<leader>x', ':TREPLSendLine<CR>', ns)
-- -- set('v', '<leader>x', ':TREPLSendSelection<CR>', ns)
