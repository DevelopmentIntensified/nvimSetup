-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true, desc = "no maps to the space key" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Prime: remap for word wrap" })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Prime: remap for word wrap" })

vim.keymap.set('n', '<leader>fv', vim.cmd.Ex, { desc = 'File View' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Prime: remap for moving a line down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Prime: remap for moving a line up"})

vim.keymap.set("n", "J", "mzJ`z", {desc = "Prime: takes the line below and appends it to your current line with a space" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Prime: half page jumping' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Prime: half page jumping' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Prime: search terms stay in the middle' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Prime: search terms stay in the middle' })

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Prime: delete the highlighted word and then paste over it keeping the current paste buffer' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Prime: yank to system clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Prime: yank to system clipboard' })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'Prime: delete to void register' })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Prime: esc!' })

-- Don't get into the Q loop :\
vim.keymap.set("n", "Q", "<nop>", { desc = "Prime: no Q loop" })
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<lear>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", {desc = "Prime: Quick fix list navigation next"})
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", {desc = "Prime: Quick fix list navigation prev"})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = "Prime: Quick fix list navigation next"})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = "Prime: Quick fix list navigation prev"})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Prime: replace instances of the word you are on"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "turn bash script into executable" })

vim.keymap.set("n", "<leader>jtc", "<cmd>e C:\\Users\\MIRP\\AppData\\Local\\nvim\\lua\\thisBetterWork\\init.lua<CR>", {desc = "Prime: jump to config file"});
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
