vim.loader.enable()

-- Settings
vim.g.mapleader = " "
vim.o.lazyredraw = true
vim.o.swapfile = false
vim.o.wildmode = "longest:list,full"
vim.o.wildmenu = true
vim.o.showtabline = 1
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.completeopt = "menu,menuone,noinsert,popup,fuzzy"
vim.o.winborder = "rounded"
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.inccommand = "split"
vim.o.termguicolors = true
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.path = "**"
vim.o.wildignore =
"**/node_modules/**,**/.git/**,**/__pycache__/**,**/.mypy_cache/**,**/.venv/**,**/.pytest_cache/**,**/.ruff_cache/**"
vim.o.langmap =
"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняжб;abcdefghijklmnopqrstuvwxyz\\;\\,"
vim.o.spell = true
vim.o.spelllang = "en,ru"
vim.o.mousescroll = "ver:1,hor:1"
vim.o.linebreak = true

vim.o.signcolumn = "yes:2"
vim.o.foldcolumn = "1"
vim.o.number = true
vim.o.relativenumber = true
vim.o.statuscolumn = "%s%l %C "

require("vim._extui").enable({ enable = true, msg = { target = "msg", timeout = 4000 } })

-- Abbreviations
vim.cmd.cabbrev("W w")
vim.cmd.cabbrev("Wa wa")
vim.cmd.cabbrev("n norm")

-- Keymaps
vim.keymap.set({ "n", "x" }, "j", function()
    if vim.v.count == 0 then
        return "gj"
    else
        return "j"
    end
end, { expr = true, remap = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", function()
    if vim.v.count == 0 then
        return "gk"
    else
        return "k"
    end
end, { expr = true, remap = true, silent = true })
vim.keymap.set("n", "^", "g^", { silent = true, noremap = true })
vim.keymap.set("n", "$", "g$", { silent = true, noremap = true })
vim.keymap.set("n", "0", "g0", { silent = true, noremap = true })
vim.keymap.set("n", "J", "mzJ`z", { silent = true, noremap = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set("n", "<M-^>", "kJ", { silent = true, noremap = true })
vim.keymap.set("x", "<M-^>", "<cmd>norm! J<cr>", { silent = true, noremap = true })

vim.keymap.set({ "n", "v" }, "<C-p>", "\"+p")
vim.keymap.set("i", "<C-p>", "<C-r>+")
vim.keymap.set({ "n", "v" }, "<M-y>", "\"+y")
vim.keymap.set({ "n", "i" }, "<M-y><M-p>", "<cmd>let @+=expand('%:p')<cr>",
    { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<M-y><M-P>", "<cmd>let @+=expand('%:p') . ':' . line('.')<cr>",
    { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<M-y><M-f>", "<cmd>let @+=expand('%:.')<cr>",
    { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<M-y><M-F>", "<cmd>let @+=expand('%:.') . ':' . line('.')<cr>",
    { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<M-y><M-d>", "<cmd>let @+=strftime('%F')<cr>",
    { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<M-y><M-t>", "<cmd>let @+=strftime('%T')<cr>",
    { silent = true, noremap = true })

vim.keymap.set("n", "<leader>gw", "<cmd>bufdo bd|e#|bd#<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gW", "<cmd>bufdo bd!|e#|bd#<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "\\", "za")
vim.keymap.set("n", "<M-\\>", "zA")
vim.keymap.set("n", "<backspace>", "zc")
vim.keymap.set("n", "<leader>c", "<cmd>tcd %:p:h<cr>")
vim.keymap.set("n", "<C-f>", "<C-\\><C-n>:e <C-r>=expand('%:p:h')<cr>/<C-d>", { noremap = true })
vim.keymap.set("n", "<C-\\><C-f>", "<C-\\><C-n>:e <C-r>=getcwd()<cr>/<C-d>", { noremap = true })
vim.keymap.set({ "n", "v" }, "<C-e>", "4<C-e>", { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<C-y>", "4<C-y>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-K>", "<cmd>cprev<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<M-J>", "<cmd>cnext<CR>zz", { silent = true, noremap = true })
vim.keymap.set({ "n", "t", "i" }, "<M-i>", "<cmd>tabprevious<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "t", "i" }, "<M-o>", "<cmd>tabnext<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "t", "i" }, "<M-S-o>", "<cmd>tabmove +<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "t", "i" }, "<M-S-i>", "<cmd>tabmove -<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-w>t", "<cmd>tab term<cr>", { silent = true, noremap = true })
-- vim.keymap.set("n", "<C-s>", "<cmd>sp term://tmux-sessionizer | startinsert<cr>", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { silent = true, noremap = true })
vim.keymap.set({ "n", "i", "v" }, "<C-[>", "<cmd>noh<cr><C-[>", { silent = true, noremap = true, desc = "Open link" })
vim.keymap.set({ "n", "i" }, "<M-l>", "<cmd>t.<cr>", { silent = true, noremap = true })
vim.keymap.set("x", "<M-l>", ":t'><cr>gv", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>R", "<cmd>restart<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>r", "<cmd>e<cr>", { silent = true, noremap = true })

-- Auto commands
vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd FileType fyler setlocal nospell
    autocmd TermOpen * setlocal nospell | set ft=shell | startinsert
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   silent! normal! g`"zz |
        \ endif
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

-- Plugins
vim.pack.add({ "https://github.com/chentoast/marks.nvim" })
require("marks").setup({ builtin_marks = { ".", "<", ">", "^" } })

-- Paste image
vim.pack.add({ "https://github.com/HakonHarnes/img-clip.nvim" })
require("img-clip").setup({})
vim.keymap.set("n", "<M-P>", "<cmd>PasteImage<cr>", { noremap = true, silent = true })

-- Markdown
vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim",
    "https://github.com/tadmccorkle/markdown.nvim",
    "https://github.com/3rd/image.nvim" })

require("image").setup({})
require("markdown").setup()
require("markview").setup({
    preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "markdown_inline" },
    callback = function()
        vim.keymap.set("n", "<cr>", "<cmd>Markview<cr>",
            { buffer = true, noremap = true, silent = true })
    end,
})

-- Tree-sitter
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" } })
require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})

-- Folds
vim.pack.add({ "https://github.com/masukomi/vim-markdown-folding" })

vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"

vim.o.foldenable = true
vim.o.foldmethod = "expr"
vim.o.foldtext = ""

vim.api.nvim_create_autocmd("BufRead", {
    callback = function()
        if vim.list_contains({ "markdown", "markdown_inline" }, vim.bo.filetype) then
            vim.cmd([[ setlocal foldexpr=NestedMarkdownFolds() ]])
            vim.opt_local.foldlevel = 0
            vim.opt_local.foldlevelstart = 0
            vim.opt_local.foldnestmax = 9
        else
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.opt_local.foldlevel = 99
            vim.opt_local.foldlevelstart = 99
            vim.opt_local.foldnestmax = 2
        end
    end,
})

-- Telescope
vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
})

local telescope = require("telescope")
local themes = require("telescope.themes")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function ivy_full(opts)
    return themes.get_ivy(vim.tbl_deep_extend("force", {
        layout_config = {
            height = vim.o.lines - vim.o.cmdheight - (vim.o.laststatus > 0 and 1 or 0),
            width = 0.999,
            prompt_position = "top",
            preview_cutoff = 5,
            preview_width = 0.65,
        },
        borderchars = {
            prompt  = { " ", " ", " ", " ", " ", " ", " ", " " },
            results = { " ", " ", " ", " ", " ", " ", " ", " " },
            preview = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
        results_title = false,
        preview_title = false,
        mappings = { i = { ["<Esc>"] = actions.close } },
    }, opts or {}))
end

local function T(picker, opts)
    return function() picker(ivy_full(opts)) end
end

telescope.setup({
    defaults = {
        mappings = { i = { ["<Esc>"] = actions.close } },
    },
    extensions = {
        ["ui-select"] = { themes.get_ivy({ border = true, layout_config = { height = 0.25 } }) },
    },
})

telescope.load_extension("ui-select")

vim.keymap.set("n", "s", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "sf", T(builtin.fd), { desc = "Telescope find files" })
vim.keymap.set("n", "sb", T(builtin.buffers, { previewer = false }), { desc = "Telescope buffers" })
vim.keymap.set("n", "sg", T(builtin.live_grep), { desc = "Telescope live grep" })
vim.keymap.set("n", "sh", T(builtin.help_tags), { desc = "Telescope help tags" })
vim.keymap.set("n", "sm", T(builtin.man_pages), { desc = "Telescope man pages" })
vim.keymap.set("n", "grs", T(builtin.lsp_workspace_symbols), { desc = "Telescope lsp symbols" })
vim.keymap.set("n", "grr", T(builtin.lsp_references), { desc = "Telescope lsp references" })
vim.keymap.set("n", "<C-]>", T(builtin.lsp_definitions), { desc = "Telescope lsp definitions" })
vim.keymap.set("n", "z=", function()
    builtin.spell_suggest(themes.get_cursor({ border = true }))
end, { desc = "Telescope spell suggest" })

-- Git integration
vim.pack.add({ "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/NeogitOrg/neogit",
    "https://github.com/esmuellert/codediff.nvim",
    "https://github.com/lewis6991/gitsigns.nvim" })

require("neogit").setup({})
local gitsigns = require("gitsigns")
gitsigns.setup({ sign_priority = 100 })

vim.keymap.set("n", "]c", gitsigns.next_hunk)
vim.keymap.set("n", "[c", gitsigns.prev_hunk)
vim.keymap.set("n", "<M-g>g", "<cmd>Neogit<cr>", { desc = "Open Neogit View" })
vim.keymap.set("n", "<M-g>p", gitsigns.preview_hunk)
vim.keymap.set("n", "<M-g>b", gitsigns.blame)
vim.keymap.set("n", "<M-g>Q", function() gitsigns.setqflist("all") end)
vim.keymap.set("n", "<M-g>q", gitsigns.setqflist)
vim.keymap.set("n", "<M-g>D", "<cmd>CodeDiff<cr>", { desc = "CodeDiff: explorer (git status)" })
vim.keymap.set("n", "<M-g>d", "<cmd>CodeDiff file HEAD<cr>", { desc = "CodeDiff: current file vs HEAD" })
vim.keymap.set("n", "<M-g>h", "<cmd>CodeDiff history<cr>", { desc = "CodeDiff: history" })

-- File explorer
vim.pack.add({ "https://github.com/A7Lavinraj/fyler.nvim" })
require("fyler").setup({
    views = {
        finder = {
            confirm_simple = true,
            default_explorer = true,
            mappings = { ["<tab>"] = "Select" },
            watcher = { enabled = false },
            win = { kind = "float" }
        }
    },
    integrations = { icon = "none" }
})
vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { desc = "Open Fyler View" })

-- Zen mode
-- vim.pack.add({ "https://github.com/I0I-I0I/zenmode.nvim" })
vim.opt.runtimepath:append("/home/nnofly/code/personal/zenmode.nvim")

vim.api.nvim_create_autocmd("VimLeavePre", {
    group = vim.api.nvim_create_augroup("ZenMode", { clear = true }),
    callback = function()
        vim.cmd("ZenmodeClose")
        vim.cmd("Sess save")
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("ZenModeMD", { clear = true }),
    pattern = { "*.md" },
    callback = function()
        vim.schedule(function()
            vim.cmd("ZenmodeOpen")
        end)
    end,
})

local zenmode = require("zenmode")
local zenmode_api = require("zenmode.api")

zenmode.setup({
    options = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
        foldcolumn = "yes:1",
        laststatus = 0,
    },
    log_level = "warn",
    default_width = 100,
})

vim.keymap.set("n", "<M-z>", zenmode_api.toggle, { desc = "Open Zenmode View" })

-- Session manager
-- vim.pack.add({ "https://github.com/i0i-i0i/sessionizer.nvim" })
vim.opt.runtimepath:append("/home/nnofly/code/personal/sessionizer.nvim")

local zenmode_state = false
local statusline = vim.o.statusline
require("sessionizer").setup({
    paths = {
        "~/code/personal/*",
        "~/code/work/*",
        "~/.dotfiles/*",
        "~/.config/nvim",
        "~/Dropbox",
    },
    smart_auto_load = true,
    auto_save = true,
    log_level = "error",
    before_load = {
        custom = function()
            zenmode_state = zenmode_api.state.is_enabled()
            zenmode_api.close()
        end,
    },
    after_load = {
        custom = function()
            local session = require("sessionizer.api").get.current().name or ""
            if session ~= "" then
                session = "[" .. session .. "] "
            end
            vim.o.statusline = session .. statusline

            if zenmode_state then
                zenmode_api.open()
            end
        end,
    },
    on_unload = {
        custom = function()
            vim.o.statusline = statusline
        end,
    },
})

require("telescope").load_extension("sessionizer")

vim.keymap.set("n", "ss", "<cmd>Sess list<cr>", { noremap = true })
vim.keymap.set("n", "<M-s>l", "<cmd>Sess last<cr>", { noremap = true })
vim.keymap.set("n", "<M-s>p", "<cmd>Sess pin<cr>", { noremap = true })

-- Tests
vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/antoinemadec/FixCursorHold.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/nvim-neotest/neotest",
    "https://github.com/nvim-neotest/neotest-python",
    "https://github.com/nvim-neotest/neotest-jest",
    "https://github.com/marilari88/neotest-vitest" })

local nt = require("neotest")

nt.setup({
    discovery = { enabled = true, concurrent = 2 },
    running = { concurrent = true },
    status = { enabled = true, virtual_text = true },
    output = { enabled = true, open_on_run = "short" },
    quickfix = { enabled = true, open = false },
    adapters = {
        require("neotest-python"),
        require("neotest-vitest"),
        require("neotest-jest")({
            jestCommand = "npx jest --runInBand",
            jestConfigFile = function()
                local cwd = (vim.uv or vim.loop).cwd()
                local candidates = {
                    cwd .. "/jest.config.ts",
                    cwd .. "/jest.config.js",
                    cwd .. "/jest.config.cjs",
                    cwd .. "/package.json",
                }
                for _, p in ipairs(candidates) do
                    if vim.uv.fs_stat(p) then return p end
                end
                return cwd .. "/package.json"
            end,
            cwd = function() return (vim.uv or vim.loop).cwd() end,
        }),
    },
})

vim.keymap.set("n", "t", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "tt", function() nt.run.run() end,
    { silent = true, noremap = true, desc = "Test: run nearest" })
vim.keymap.set("n", "tT", function() nt.run.run(vim.fn.expand("%")) end,
    { silent = true, noremap = true, desc = "Test: run file" })
vim.keymap.set("n", "ta", function() nt.run.run((vim.uv or vim.loop).cwd()) end,
    { silent = true, noremap = true, desc = "Test: run all (cwd)" })

vim.keymap.set("n", "td", function() nt.run.run({ strategy = "dap" }) end,
    { silent = true, noremap = true, desc = "Test: debug nearest (DAP)" })
vim.keymap.set("n", "tD", function() nt.run.run({ vim.fn.expand("%"), strategy = "dap" }) end,
    { silent = true, noremap = true, desc = "Test: debug file (DAP)" })

vim.keymap.set("n", "ts", function() nt.summary.toggle() end,
    { silent = true, noremap = true, desc = "Test: toggle summary" })
vim.keymap.set("n", "to", function() nt.output.open({ enter = true, auto_close = true }) end,
    { silent = true, noremap = true, desc = "Test: open output" })
vim.keymap.set("n", "tO", function() nt.output_panel.toggle() end,
    { silent = true, noremap = true, desc = "Test: toggle output panel" })

vim.keymap.set("n", "tS", function() nt.run.stop() end,
    { silent = true, noremap = true, desc = "Test: stop" })
vim.keymap.set("n", "]t", function() nt.jump.next({ status = "failed" }) end,
    { silent = true, noremap = true, desc = "Test: next failed" })
vim.keymap.set("n", "[t", function() nt.jump.prev({ status = "failed" }) end,
    { silent = true, noremap = true, desc = "Test: prev failed" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "neotest-summary", "neotest-output", "neotest-output-panel" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>",
            { buffer = true, desc = "Test: close output panel" })
    end
})

-- DB
vim.pack.add({ "https://github.com/kristijanhusak/vim-dadbod-ui",
    "https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-completion" })

vim.keymap.set("n", "<M-D>", "<cmd>tabnew<cr><cmd>DBUIToggle<cr>", { noremap = true })

-- Harpoon
vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" } })

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<M-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<M-0>", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

-- Completion
vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
    "https://github.com/disrupted/blink-cmp-conventional-commits",
    "https://github.com/bydlw98/blink-cmp-env",
    "https://github.com/rafamadriz/friendly-snippets" })

require("blink.cmp").setup({
    keymap = { preset = "default" },
    completion = {
        documentation = { auto_show = true },
        menu = { border = "rounded" }
    },
    cmdline = { enabled = false },
    sources = {
        default = { "lsp", "path", "snippets", "buffer", "env" },
        per_filetype = {
            sql = { "snippets", "dadbod" },
            gitcommit = { "conventional_commits", "buffer", "env" },
        },
        providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            conventional_commits = { name = "Conventional Commits", module = "blink-cmp-conventional-commits" },
            env = { name = "Env", module = "blink-cmp-env" },
        },
    },
})

-- AI
vim.pack.add({ "https://github.com/supermaven-inc/supermaven-nvim" })
require("supermaven-nvim").setup({})

vim.keymap.set({ "n", "i" }, "<M-a>t", function()
    require("supermaven-nvim.api").toggle()
    if require("supermaven-nvim.api").is_running() then
        print("Supermaven is enabled")
    else
        print("Supermaven is disabled")
    end
end)

vim.pack.add({ "https://github.com/olimorris/codecompanion.nvim" })
require("codecompanion").setup({
    interactions = {
        chat = {
            adapter = "codex",
            opts = { completion_provider = "blink" },
            fold_context = true,
        }
    },
    display = { chat = { window = { layout = "buffer" } } },
    adapters = {
        acp = {
            codex = function()
                return require("codecompanion.adapters").extend("codex", {
                    defaults = { auth_method = "chatgpt" },
                })
            end,
        },
    },
})

vim.keymap.set({ "n", "v" }, "<M-a>a", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<M-a>c", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

vim.cmd([[cab cc CodeCompanion]])

-- Multicursor
vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim" })
local mc = require("multicursor-nvim")
mc.setup()

vim.keymap.set({ "n", "x" }, "<M-A>", mc.matchAllAddCursors)
vim.keymap.set({ "n", "x" }, "<M-q>", mc.toggleCursor)
vim.keymap.set({ "n", "x" }, "<M-k>", function() mc.lineAddCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<M-j>", function() mc.lineAddCursor(1) end)
vim.keymap.set({ "n", "v" }, "<M-n>", function() mc.matchAddCursor(1) end)
vim.keymap.set({ "n", "v" }, "<M-p>", function() mc.matchAddCursor(-1) end)

vim.keymap.set("x", "I", mc.insertVisual)
vim.keymap.set("x", "A", mc.appendVisual)

mc.addKeymapLayer(function(layerSet)
    layerSet({ "n", "x" }, "<M-K>", function() mc.lineSkipCursor(-1) end)
    layerSet({ "n", "x" }, "<M-J>", function() mc.lineSkipCursor(1) end)
    layerSet({ "n", "v" }, "<M-N>", function() mc.matchSkipCursor(1) end)
    layerSet({ "n", "v" }, "<M-P>", function() mc.matchSkipCursor(-1) end)
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

-- LSP
vim.pack.add({ "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig" })

local lsp_servers = {
    "lua_ls",
    "ty",
    "ruff",
    "vtsls",
    "eslint",
    "biome",
    "cssls",
    "emmet_language_server",
    "html",
    "clangd",
}

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false,
    ensure_installed = lsp_servers,
})

vim.lsp.enable(lsp_servers)

vim.keymap.set("n", "grd", function()
    for _, client in ipairs(vim.lsp.get_clients()) do
        if client.supports_method and client:supports_method("workspace/diagnostic") then
            vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
        end
    end
    vim.defer_fn(function()
        vim.diagnostic.setqflist({ open = true })
        vim.cmd("wincmd p")
    end, 200)
end, { silent = true })

vim.diagnostic.config({ jump = { float = true }, signs = false, underline = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end,
})

-- Utils
vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
require("colorizer").setup({})

vim.pack.add({ "https://github.com/potamides/pantran.nvim" })
local pantran = require("pantran")
pantran.setup({
    default_engine = "yandex",
    engines = { yandex = { default_source = "auto", default_target = "ru" } },
})

vim.keymap.set({ "n", "x" }, "<C-M-y>", ":Pantran mode=hover source=auto target=ru<cr>",
    { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<M-Y>", ":Pantran mode=hover source=auto target=en<cr>",
    { noremap = true, silent = true })

vim.pack.add({ "https://github.com/azratul/expose-localhost.nvim" })
vim.keymap.set("n", "<M-x>x", function()
    require("expose-localhost").stop()
    vim.ui.input({ prompt = "Port to expose: " }, function(input)
        if not input then return end
        require("expose-localhost").expose(input, "ngrok")
    end)
end)

vim.keymap.set("n", "<M-x>X", function()
    require("expose-localhost").stop()
    local port = 53439
    vim.system({ "fuser", "-k", port .. "/tcp" }):wait()
    local handle = vim.system(
        { "python3", "-m", "http.server", tostring(port) },
        { detach = true }
    )

    if not handle then
        vim.notify("Failed to start server")
        return
    end
    require("expose-localhost").expose(port, "ngrok")
end)

-- Theme
vim.pack.add({ "https://github.com/oskarnurm/koda.nvim" })

local state_file = vim.fn.stdpath("state") .. "/theme_bg"

local function apply(bg)
    if bg ~= "dark" and bg ~= "light" then return end

    vim.o.background = bg
    if bg == "dark" then
        require("koda").setup({ transparent = true })
        vim.cmd.colorscheme("koda-dark")
    else
        require("koda").setup({ transparent = false })
        vim.cmd.colorscheme("koda-light")
    end
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if normal.bg then
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = string.format("#%06x", normal.bg) })
    end
end

local function load_bg()
    local f = io.open(state_file, "r")
    if f then
        local bg = f:read("*l")
        f:close()
        apply(bg)
    else
        apply(vim.o.background)
    end
end

load_bg()

local function save_bg()
    local f = io.open(state_file, "w")
    if f then
        f:write(vim.o.background)
        f:close()
    end
end

vim.keymap.set("n", "<leader>t", function()
    local next_bg = (vim.o.background == "dark") and "light" or "dark"
    apply(next_bg)
    save_bg()
end, { desc = "Toggle theme" })
