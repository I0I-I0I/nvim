vim.keymap.set("n", "<leader>b", "<cmd>lua require('dropbar.api').pick()<cr>")
vim.ui.select = require("dropbar.utils.menu").select
