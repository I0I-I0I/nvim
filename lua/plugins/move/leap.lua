local leap = require("leap")

leap.opts.special_keys.next_target = "<enter>"
leap.opts.special_keys.prev_target = "<tab>"
leap.opts.special_keys.next_group = "<space>"
leap.opts.special_keys.prev_group = "<tab>"
leap.opts.special_keys.multi_accept = "<enter>"
leap.opts.special_keys.multi_revert = "<backspace>"
leap.opts.equivalence_classes = { " \t\r\n" }

vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward-to)")
vim.keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward-to)")
vim.keymap.set({ "n", "x", "o" }, "<leader>x", "<Plug>(leap-forward-till)")
vim.keymap.set({ "n", "x", "o" }, "<leader>X", "<Plug>(leap-backward-till)")
