vim.loader.enable()

-- Settings
vim.g.mapleader = " "
vim.o.lazyredraw = true
vim.o.swapfile = false
vim.o.wildmode = "longest:list,full"
vim.o.wildmenu = true
vim.o.laststatus = 0
vim.o.showtabline = 3
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.completeopt = "menu,menuone,noinsert,popup,nearest"
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.path = "**"
vim.o.wildignore = "**/node_modules/**,**/.git/**,**/__pycache__/**,**/.mypy_cache/**,**/.venv/**,**/.pytest_cache/**,**/.ruff_cache/**"
vim.o.spell = true
vim.o.spelllang = "en,ru"

-- Abbreviations
vim.cmd.abbreviate("W w")
vim.cmd.abbreviate("Wa wa")

-- Keymaps
vim.keymap.set("n", "<C-f>", ":e <C-r>=expand('%:p:h')<cr>/<C-d>", { noremap = true })
vim.keymap.set("n", "<leader><C-f>", ":e <C-r>=getcwd()<cr>/<C-d>", { noremap = true })

vim.keymap.set("n", "<C-w>t", "<cmd>tabnew #<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { silent = true, noremap = true })

vim.keymap.set("n", "<C-d>", "<cmd>keepjumps normal! <C-d><cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-u>", "<cmd>keepjumps normal! <C-u><cr>", { silent = true, noremap = true })

vim.keymap.set("n", "<C-s>", "<cmd>!tmux neww tmux-sessionizer<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>e", "<cmd>!tmux neww yazi %<cr>", { silent = true, noremap = true })

vim.keymap.set({ "n", "t", "i" }, "<M-o>", "<cmd>tabnext<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "t", "i" }, "<M-i>", "<cmd>tabprevious<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "t", "i" }, "<M-S-o>", "<cmd>tabmove +<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "t", "i" }, "<M-S-i>", "<cmd>tabmove -<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "n", "nzzzv", { silent = true, noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>q", "<cmd>mksession!<cr><cmd>wqa<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>w", "<cmd>mksession!<cr>", { silent = true, noremap = true })

-- Auto commands
vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   silent! normal! g`"zz |
        \ endif
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

-- Plugins
vim.pack.add({ "https://github.com/mason-org/mason.nvim",
               "https://github.com/neovim/nvim-lspconfig",
               "https://github.com/supermaven-inc/supermaven-nvim" })

require("vim._extui").enable({ enable = true, msg = { target = "msg", timeout = 4000 } })
require("mason").setup()
require("supermaven-nvim").setup({})
require("supermaven-nvim.api").stop()
vim.keymap.set({ "n", "i" }, "<M-g>", function()
    require("supermaven-nvim.api").toggle()
    if require("supermaven-nvim.api").is_running() then
        print("Supermaven is enabled")
    else
        print("Supermaven is disabled") end end)

-- LSP
vim.keymap.set("n", "grd", "<cmd>lua vim.diagnostic.setqflist()<cr><cmd>wincmd p<cr>", { silent = true })

vim.diagnostic.config({ jump = { float = true }})
vim.lsp.enable({ "ty", "ruff", "lua_ls", "clangd", "bashls", "cssls",
                 "css_variables", "html", "emmet_language_server", "ts_ls" })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf }) end })

local tools = { python = "uv tool run ruff format --stdin-filename %" }
vim.api.nvim_create_autocmd("FileType", {
    pattern = vim.tbl_keys(tools),
    callback = function(args) vim.bo[args.buf].formatprg = tools[vim.bo[args.buf].filetype] end })

-- Theme
vim.pack.add({"https://github.com/mhartington/oceanic-next"})
vim.o.bg = "dark"
vim.cmd.colorscheme "OceanicNext"

local bg = "NONE"
local colors = { "Normal", "EndOfBuffer", "LineNr", "SignColumn", "TabLineFill" }
for _, color in ipairs(colors) do
    vim.api.nvim_set_hl(0, color, { bg = bg }) end

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#666666" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#dadada" })
