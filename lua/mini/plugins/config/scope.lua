require("scope").setup()

require("telescope").load_extension("scope")

vim.keymap.set("n", "<leader>ab", "<cmd>Telescope scope buffers previewer=false theme=dropdown<cr>", { silent = true })
