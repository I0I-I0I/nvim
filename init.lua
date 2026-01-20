vim.loader.enable()

-- Settings
vim.g.mapleader = " "
vim.o.lazyredraw = true
vim.o.swapfile = false
vim.o.wildmode = "longest:list,full"
vim.o.wildmenu = true
vim.o.laststatus = 3
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.completeopt = "menu,menuone,noinsert,popup,fuzzy"
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.path = "**"
vim.o.wildignore =
    "**/node_modules/**,**/.git/**,**/__pycache__/**,**/.mypy_cache/**,**/.venv/**,**/.pytest_cache/**,**/.ruff_cache/**"
vim.o.spell = true
vim.o.spelllang = "en,ru"

-- Abbreviations
vim.cmd.cabbrev("W w")
vim.cmd.cabbrev("Wa wa")
vim.cmd.cabbrev("n norm")

-- Keymaps
vim.keymap.set("n", "gw", "<cmd>bp|bd#<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-f>", "<C-\\><C-n>:sp <C-r>=expand('%:p:h')<cr>/<C-d>", { noremap = true })
vim.keymap.set("n", "<C-\\><C-f>", "<C-\\><C-n>:sp <C-r>=getcwd()<cr>/<C-d>", { noremap = true })
vim.keymap.set("n", "<C-e>", "3<C-e>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-y>", "3<C-y>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true, noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, noremap = true })
vim.keymap.set("n", "<C-s>", "<cmd>sp term://tmux-sessionizer | startinsert<cr>", { noremap = true })
vim.keymap.set("n", "<M-c>", ":let @+=expand('%:p')<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<C-l>", "<cmd>t.<cr>", { silent = true, noremap = true })

-- Auto commands
vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd FileType fyler setlocal nospell
    autocmd TermOpen * setlocal nospell
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   silent! normal! g`"zz |
        \ endif
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

-- Plugins
vim.pack.add({ "https://github.com/chentoast/marks.nvim" })
require("marks").setup({ builtin_marks = { ".", "<", ">", "^" } })

vim.pack.add({ "https://github.com/A7Lavinraj/fyler.nvim" })
require("fyler").setup({
    views = { finder = { confirm_simple = true, default_explorer = true } },
    integrations = {
        icon = function(item_type, _)
            if item_type == "directory" then
                return "", "FylerFSDirectoryIcon"
            end
            return ""
        end
    }
})
vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { desc = "Open Fyler View" })

vim.pack.add({ "https://github.com/supermaven-inc/supermaven-nvim" })
require("supermaven-nvim").setup({})

-- LSP
vim.pack.add({ "https://github.com/mason-org/mason.nvim",
               "https://github.com/neovim/nvim-lspconfig" })

require("mason").setup()

vim.keymap.set("n", "grd", "<cmd>lua vim.diagnostic.setqflist()<cr><cmd>wincmd p<cr>", { silent = true })
vim.keymap.set("n", "grf", vim.lsp.buf.format, { silent = true })

vim.diagnostic.config({ jump = { float = true }, signs = false, underline = false })

local lsp = require("lsp")
lsp.setup_linters({ "pyrefly", "shellcheck", "biome" })
lsp.setup_formatters({ "ruff", "prettier", "biome", "stylua" })
lsp.setup_lsps({ "lua-language-server", "pyrefly", "ruff", "typescript-language-server",
    "biome", "css-lsp", "css-variables-language-server", "emmet-language-server",
    "html-lsp", "clangd" })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })
    end,
})

-- Theme
vim.o.bg = "dark"
vim.pack.add({ "https://github.com/ntk148v/komau.vim" })

vim.cmd.colo("komau")
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#222222" })
local colors = { "Normal", "NormalNC", "EndOfBuffer", "WinSeparator", "LineNr", "SignColumn", "TabLineFill", "TabLine" }
for _, color in ipairs(colors) do
    vim.api.nvim_set_hl(0, color, { bg = "NONE" })
end
vim.schedule(function() vim.api.nvim_set_hl(0, "MarkSignNumHL", { bg = "NONE" }) end)
