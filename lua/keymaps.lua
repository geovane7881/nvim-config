local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

-- Command
-- set("n", ";", ":", { noremap = true })

-- Config
set("n", "<Leader>e", ":e! ~/.config/nvim/init.lua<cr>", ns)

-- Terminal
set("t", "<Esc>", "<C-\\><C-n><C-w><C-w>", ns)

-- Directory
set("n", "<Leader>cd", ":cd %:p:h<cr>:!pwd > ~/.last_dir<cr><cr>", ns)
set("n", "<Leader>C", ":pwd<cr>", ns)
set("n", "<Leader>cp", ":let @+=expand(\"%:p\")<CR>", ns)

-- Clean Search
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
set("n", "<c-h>", "^", ns)
set("n", "<c-l>", "g_", ns)
set("v", "<c-h>", "^", ns)
set("v", "<c-l>", "g_", ns)
set("i", "<c-h>", "<Esc>^i", ns)
set("i", "<c-l>", "<Esc>g_a", ns)
-- paragraphs
set("n", "<c-j>", "}}kg_", ns)
set("n", "<c-k>", "{kg_", ns)

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
set("v", "<Leader>c", ':%w !xclip -i -sel c<CR>', ns)
set("v", "<Leader>x", ':%w !xclip -i -sel c<CR>"+C', ns)
set("v", "<C-V>", ':r !xclip -o -sel -c<CR>', ns)
-- set("n", "<C-V>", ':r !xclip -o -sel -c<CR>', ns)

-- Macro
set("n", "<Leader>r", "q", ns)

-- Nvim Tree
-- set("n", "<M-n>", ":NvimTreeFindFileToggle<CR>", ns)
-- set("n", "<C-n>", ":cd %:p:h<cr>:!pwd > ~/.last_dir<cr><cr>:NvimTreeFindFileToggle<CR>", ns)
set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", ns)
set("n", "<M-b>", ":NvimTreeToggle<CR>", ns)

-- Telescope
set("n", "<C-p>", ":Telescope find_files<CR>", ns)
set("n", "<C-h>", ":Telescope live_grep<CR>", ns)
-- set("n", "<C-b>", ":Telescope buffers<CR>", ns)
set("n", "<Leader>h", ":Telescope oldfiles<CR>", ns)

-- Commentary
set("n", "<Leader>cc", ":Commentary<CR>", ns)
set("v", "<Leader>cc", ":Commentary<CR>", ns)

-- Pretier
set("n", "<Leader>f", ":ALEFix prettier<CR>", ns)


-- Dashboard
set("n", "<C-g>", ":DashboardFindWord<CR>", ns)
set("n", "<Leader>ss", ":<C-u>SessionSave<CR>", ns)
set("n", "<Leader>sl", ":<C-u>SessionLoad<CR>", ns)
set("n", "<Leader>fh", ":DashboardFindHistory<CR>", ns)
set("n", "<Leader>ff", ":DashboardFindFile<CR>", ns)
set("n", "<Leader>tc", ":DashboardChangeColorscheme<CR>", ns)
set("n", "<Leader>fb", ":DashboardJumpMark<CR>", ns)
set("n", "<Leader>cn", ":DashboardNewFile<CR>", ns)

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
