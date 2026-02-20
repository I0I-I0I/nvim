vim.loader.enable()

-- Settings
vim.g.mapleader = " "
vim.o.lazyredraw = true
vim.o.swapfile = false
vim.o.wildmode = "longest:list,full"
vim.o.wildmenu = true
vim.o.showtabline = 3
vim.o.laststatus = 0
vim.o.cmdheight = 0
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
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

require("vim._extui").enable({ enable = true, msg = { target = "msg", timeout = 4000 } })

-- Abbreviations
vim.cmd.cabbrev("W w")
vim.cmd.cabbrev("Wa wa")
vim.cmd.cabbrev("n norm")

-- Keymaps
vim.keymap.set("n", "gw", "<cmd>bp|bd#<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<S-tab>", "za")
vim.keymap.set("n", "<leader><S-tab>", "zA")
vim.keymap.set("n", "<C-f>", "<C-\\><C-n>:sp <C-r>=expand('%:p:h')<cr>/<C-d>", { noremap = true })
vim.keymap.set("n", "<C-\\><C-f>", "<C-\\><C-n>:sp <C-r>=getcwd()<cr>/<C-d>", { noremap = true })
vim.keymap.set("n", "<C-e>", "4<C-e>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-y>", "4<C-y>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<M-i>", "<cmd>tabprevious<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-o>", "<cmd>tabnext<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-S-o>", "<cmd>tabmove +<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-S-i>", "<cmd>tabmove -<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-w>t", "<cmd>tabnew #<cr>", { silent = true, noremap = true })
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

-- Tree-sitter
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" } })
require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})

-- Telescope
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.fd, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>p", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "th", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "tm", builtin.man_pages, { desc = "Telescope man pages" })
vim.keymap.set("n", "grs", builtin.lsp_workspace_symbols, { desc = "Telescope lsp symbols" })
vim.keymap.set("n", "grd", builtin.diagnostics, { desc = "Telescope lsp diagnostics" })
vim.keymap.set("n", "grr", builtin.lsp_references, { desc = "Telescope lsp references" })
vim.keymap.set("n", "<C-]>", builtin.lsp_definitions, { desc = "Telescope lsp definitions" })
vim.keymap.set("n", "z=", builtin.spell_suggest, { desc = "Telescope spell suggest" })

-- Git integration
vim.pack.add({ "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/NeogitOrg/neogit",
    "https://github.com/esmuellert/codediff.nvim",
    "https://github.com/lewis6991/gitsigns.nvim" })

require("neogit").setup({})
local gitsigns = require("gitsigns")
gitsigns.setup({})

vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { desc = "Open Neogit View" })
vim.keymap.set("n", "]c", gitsigns.next_hunk)
vim.keymap.set("n", "[c", gitsigns.prev_hunk)
vim.keymap.set("n", "<M-g>p", gitsigns.preview_hunk)
vim.keymap.set("n", "<M-g>b", gitsigns.blame)
vim.keymap.set("n", "<M-g>Q", function() gitsigns.setqflist("all") end)
vim.keymap.set("n", "<M-g>q", gitsigns.setqflist)
vim.keymap.set("n", "<M-g>d", "<cmd>CodeDiff<cr>", { desc = "CodeDiff: explorer (git status)" })
vim.keymap.set("n", "<M-g>D", "<cmd>CodeDiff file HEAD<cr>", { desc = "CodeDiff: current file vs HEAD" })
vim.keymap.set("n", "<M-g>h", "<cmd>CodeDiff history<cr>", { desc = "CodeDiff: history" })

-- Fyler
vim.pack.add({ "https://github.com/A7Lavinraj/fyler.nvim" })
require("fyler").setup({
    views = {
        finder = {
            confirm_simple = true,
            default_explorer = true,
            mappings = { ["<tab>"] = "Select" }
        }
    },
    integrations = { icon = "none" }
})
vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { desc = "Open Fyler View" })

-- Session manager
vim.pack.add({ "https://github.com/i0i-i0i/sessionizer.nvim" })
require("sessionizer").setup({
    paths = {
        "~/code/personal/*",
        "~/code/work/*",
        "~/.dotfiles/*",
        "~/.config/nvim",
    },
    smart_auto_load = true,
    auto_save = true,
    log_level = "error",
})

-- DB
vim.pack.add({ "https://github.com/kristijanhusak/vim-dadbod-ui",
    "https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-completion" })

vim.keymap.set("n", "<leader>d", "<cmd>tabnew<cr><cmd>DBUIToggle<cr>", { noremap = true })

-- Harpoon
vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" } })

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<M-0>", function() harpoon:list():add() end)
vim.keymap.set("n", "<M-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<M-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<M-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<M-8>", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<M-9>", function() harpoon:list():select(9) end)

-- AI completion
vim.pack.add({ "https://github.com/supermaven-inc/supermaven-nvim" })
require("supermaven-nvim").setup({})

vim.pack.add({ "https://github.com/folke/sidekick.nvim" })
require("sidekick").setup({
    nes = { enabled = false },
    cli = {
        win = {
            layout = "float",
            keys = { buffers = { "<c-b>", "hide", mode = "nt", desc = "hide the terminal window" } }
        }
    },
})
vim.keymap.set({ "n", "v", "i", "t" }, "<C-b>", require("sidekick.cli").toggle, { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<M-C-B>", require("sidekick.cli").prompt, { noremap = true })

-- Multicursor
vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim" })
local mc = require("multicursor-nvim")
mc.setup()

vim.keymap.set({ "n", "x" }, "<M-k>", function() mc.lineAddCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<M-j>", function() mc.lineAddCursor(1) end)
vim.keymap.set({ "n", "x" }, "<M-S-k>", function() mc.lineSkipCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<M-S-j>", function() mc.lineSkipCursor(1) end)

vim.keymap.set({ "n", "x" }, "<M-a>", mc.matchAllAddCursors)
vim.keymap.set({ "n", "x" }, "<M-n>", function() mc.matchAddCursor(1) end)
vim.keymap.set({ "n", "x" }, "<M-S-n>", function() mc.matchSkipCursor(1) end)
vim.keymap.set({ "n", "x" }, "<M-p>", function() mc.matchAddCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<M-S-p>", function() mc.matchSkipCursor(-1) end)

vim.keymap.set({ "n", "x" }, "<M-q>", mc.toggleCursor)

vim.keymap.set("x", "I", mc.insertVisual)
vim.keymap.set("x", "A", mc.appendVisual)

mc.addKeymapLayer(function(layerSet)
    layerSet({ "n", "x" }, "<M-h>", mc.prevCursor)
    layerSet({ "n", "x" }, "<M-l>", mc.nextCursor)
    layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor)
    layerSet("n", "<C-[>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)

-- Formatting
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = "v1.9.1" },
    "https://github.com/disrupted/blink-cmp-conventional-commits",
    "https://github.com/bydlw98/blink-cmp-env",
    "https://github.com/rafamadriz/friendly-snippets" })

require("blink.cmp").setup({
    keymap = { preset = "default" },
    completion = { documentation = { auto_show = true } },
    cmdline = { enabled = false },
    sources = {
        default = { "conventional_commits", "lsp", "path", "snippets", "buffer", "env" },
        per_filetype = {
            sql = { "snippets", "dadbod", "buffer" },
            gitcommit = { "conventional_commits", "buffer", "env" }
        },
        providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            conventional_commits = { name = "Conventional Commits", module = "blink-cmp-conventional-commits" },
            env = { name = "Env", module = "blink-cmp-env" }
        },
    },
})

-- LSP
vim.pack.add({ "https://github.com/mason-org/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig" })

require("mason").setup()

vim.keymap.set("n", "grd", function()
    for _, client in ipairs(vim.lsp.get_clients()) do
        if client.supports_method and client:supports_method("workspace/diagnostic") then
            vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
        end
    end
    vim.defer_fn(function()
        vim.diagnostic.setqflist({ open = true })
    end, 200)
    vim.cmd("wincmd p")
end, { silent = true })

vim.diagnostic.config({ jump = { float = true }, signs = false, underline = true })

vim.lsp.enable({
    "lua_ls",
    "ty",
    "ruff",
    "vtsls",
    "eslint",
    "biome",
    "cssls",
    "cssvar",
    "emmet_language_server",
    "html",
    "clangd",
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })
    end,
})

-- Colorizer
vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
require("colorizer").setup({})

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
