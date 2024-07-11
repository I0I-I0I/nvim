-- Buffers
vim.keymap.set("n", "<C-j>", "<cmd>bnext<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>bprevious<cr>", { silent = true, noremap = true })

-- Scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Terminal
-- vim.keymap.set("n", "<C-\\>", "<cmd>split <cr><C-w>J<cmd>resize 20<cr><cmd>term<cr>i", { silent = true })
-- vim.keymap.set("t", "<C-\\>", "<cmd>close<cr>", { silent = true })

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Save
vim.cmd("cnoreabbrev save wa<cr><cmd>mksession! session.vim<cr><cmd>qa<cr>")
vim.cmd("cnoreabbrev ss source session.vim<cr>")
