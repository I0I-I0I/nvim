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

local is_transparent = true
if vim.g.neovide then
    vim.g.neovide_opacity = .73
    vim.g.neovide_normal_opacity = .73
    vim.g.neovide_scale_factor = 1.1
    vim.o.guifont = "Maple Mono"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_no_idle = false
    vim.g.neovide_fullscreen = not is_transparent
    vim.g.neovide_window_decorations = "none"
    vim.g.neovide_confirm_quit = false
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_position_animation_length = .15
    vim.g.neovide_scroll_animation_length = .15
    vim.g.neovide_cursor_vfx_mode = ""

    vim.o.mousescroll = "ver:4,hor:4"

    vim.keymap.set("n", "<C-enter>", function()
        is_transparent = not is_transparent
        vim.g.neovide_fullscreen = not is_transparent
    end, { desc = "Toggle neovide fullscreen" })
    vim.keymap.set("n", "<C-=>", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05
        vim.notify("Scale: " .. vim.g.neovide_scale_factor)
    end, { noremap = true, desc = "Increase neovide scale" })
    vim.keymap.set("n", "<C-->", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
        vim.notify("Scale: " .. vim.g.neovide_scale_factor)
    end, { noremap = true, desc = "Decrease neovide scale" })
end

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
end, { expr = true, remap = true, silent = true, desc = "Move down by display line" })
vim.keymap.set({ "n", "x" }, "k", function()
    if vim.v.count == 0 then
        return "gk"
    else
        return "k"
    end
end, { expr = true, remap = true, silent = true, desc = "Move up by display line" })
vim.keymap.set("n", "^", "g^", { silent = true, noremap = true, desc = "Go to line start (display)" })
vim.keymap.set("n", "$", "g$", { silent = true, noremap = true, desc = "Go to line end (display)" })
vim.keymap.set("n", "0", "g0", { silent = true, noremap = true, desc = "Go to column 0 (display)" })
vim.keymap.set("n", "J", "mzJ`z", { silent = true, noremap = true, desc = "Join line and keep cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, noremap = true, desc = "Move selection up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, noremap = true, desc = "Move selection down" })
vim.keymap.set("n", "<M-^>", "kJ", { silent = true, noremap = true, desc = "Join with previous line" })
vim.keymap.set("x", "<M-^>", "<cmd>norm! J<cr>", { silent = true, noremap = true, desc = "Join selected lines" })

vim.keymap.set({ "n", "i", "v" }, "<C-s>", vim.cmd.update, { desc = "Save" })
vim.keymap.set("v", "<M-y>", function()
    vim.cmd([[norm! "+y]])
end, { silent = true, desc = "Copy" })
vim.keymap.set({ "n" }, "<M-y>", "\"+y", { silent = true, desc = "Copy" })
vim.keymap.set({ "n", "i", "v", "c", "t" }, "<M-p>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { silent = true, desc = "Paste" })

vim.keymap.set({ "n", "i" }, "<M-y><M-p>", "<cmd>let @+=expand('%:p')<cr>",
    { silent = true, noremap = true, desc = "Copy absolute path" })
vim.keymap.set({ "n", "i" }, "<M-y><M-P>", "<cmd>let @+=expand('%:p') . ':' . line('.')<cr>",
    { silent = true, noremap = true, desc = "Copy absolute path with line" })
vim.keymap.set({ "n", "i" }, "<M-y><M-f>", "<cmd>let @+=expand('%:.')<cr>",
    { silent = true, noremap = true, desc = "Copy relative path" })
vim.keymap.set({ "n", "i" }, "<M-y><M-F>", "<cmd>let @+=expand('%:.') . ':' . line('.')<cr>",
    { silent = true, noremap = true, desc = "Copy relative path with line" })
vim.keymap.set({ "n", "i" }, "<M-y><M-d>", "<cmd>let @+=strftime('%F')<cr>",
    { silent = true, noremap = true, desc = "Copy date" })
vim.keymap.set({ "n", "i" }, "<M-y><M-t>", "<cmd>let @+=strftime('%T')<cr>",
    { silent = true, noremap = true, desc = "Copy time" })

local function close_all_but(force)
    return function()
        local current = vim.fn.bufnr("%")
        local bufs = vim.tbl_filter(function(buf)
            local ok, listed = pcall(vim.api.nvim_get_option_value, "buflisted", { buf = buf })
            if not ok or not listed then
                return false
            end
            return buf ~= current
        end, vim.api.nvim_list_bufs())
        for _, buf in ipairs(bufs) do
            pcall(vim.api.nvim_buf_delete, buf, { force = force })
        end
    end
end

vim.keymap.set("n", "<leader>gw", close_all_but(), { silent = true, noremap = true, desc = "Close all buffers" })
vim.keymap.set("n", "<leader>gW", close_all_but(true),
    { silent = true, noremap = true, desc = "Force close all buffers" })
vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true, noremap = true, desc = "Close current buffer" })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true, noremap = true, desc = "Force close current buffer" })

vim.keymap.set("n", "\\", "za", { desc = "Toggle fold" })
vim.keymap.set("n", "<M-\\>", "zA", { desc = "Toggle fold recursively" })
vim.keymap.set("n", "<backspace>", "zc", { desc = "Close fold" })
vim.keymap.set("n", "<leader>c", "<cmd>tcd %:p:h<cr>", { desc = "Set cwd to current file directory" })
vim.keymap.set({ "n", "i" }, "<C-f>", "<C-\\><C-n>:e <C-r>=expand('%:p:h')<cr>/<C-d>",
    { noremap = true, desc = "Edit file from current file directory" })
vim.keymap.set({ "n", "i", "t" }, "<C-\\><C-f>", "<C-\\><C-n>:e <C-r>=getcwd()<cr>/<C-d>",
    { noremap = true, desc = "Edit file from cwd" })
vim.keymap.set({ "n", "v" }, "<C-e>", "4<C-e>", { silent = true, noremap = true, desc = "Scroll down 4 lines" })
vim.keymap.set({ "n", "v" }, "<C-y>", "4<C-y>", { silent = true, noremap = true, desc = "Scroll up 4 lines" })
vim.keymap.set("n", "<M-K>", "<cmd>cprev<CR>zz", { silent = true, noremap = true, desc = "Previous quickfix item" })
vim.keymap.set("n", "<M-J>", "<cmd>cnext<CR>zz", { silent = true, noremap = true, desc = "Next quickfix item" })
vim.keymap.set({ "n", "t", "i" }, "<M-i>", "<cmd>tabprevious<cr>",
    { silent = true, noremap = true, desc = "Previous tab" })
vim.keymap.set({ "n", "t", "i" }, "<M-o>", "<cmd>tabnext<cr>", { silent = true, noremap = true, desc = "Next tab" })
vim.keymap.set({ "n", "t", "i" }, "<M-S-o>", "<cmd>tabmove +<cr>",
    { silent = true, noremap = true, desc = "Move tab right" })
vim.keymap.set({ "n", "t", "i" }, "<M-S-i>", "<cmd>tabmove -<cr>",
    { silent = true, noremap = true, desc = "Move tab left" })
vim.keymap.set("n", "<C-w>t", "<cmd>tab term<cr>", { silent = true, noremap = true, desc = "Open terminal tab" })
-- vim.keymap.set("n", "<C-s>", "<cmd>sp term://tmux-sessionizer | startinsert<cr>", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { silent = true, noremap = true, desc = "Exit terminal mode" })
vim.keymap.set({ "n", "i", "v" }, "<C-[>", "<cmd>noh<cr><C-[>", { silent = true, noremap = true, desc = "Open link" })
vim.keymap.set({ "n", "i" }, "<C-l>", "<cmd>t.<cr>", { silent = true, noremap = true, desc = "Duplicate current line" })
vim.keymap.set("x", "<C-l>", ":t'><cr>gv", { silent = true, noremap = true, desc = "Duplicate selection" })
vim.keymap.set("n", "<leader>R", "<cmd>restart<cr>", { silent = true, noremap = true, desc = "Restart Neovim" })
vim.keymap.set("n", "R", "<cmd>e<cr>", { silent = true, noremap = true, desc = "Reload buffer" })

vim.keymap.set({ "n", "i", "t" }, "<M-h>", "<cmd>wincmd h<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "i", "t" }, "<M-j>", "<cmd>wincmd j<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "i", "t" }, "<M-k>", "<cmd>wincmd k<cr>", { silent = true, noremap = true })
vim.keymap.set({ "n", "i", "t" }, "<M-l>", "<cmd>wincmd l<cr>", { silent = true, noremap = true })

-- Auto commands
vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd FileType fyler setlocal nospell
    autocmd TermOpen * setlocal nospell | set ft=shell | startinsert
    autocmd FocusGained,BufEnter,CursorHold * checktime
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   silent! normal! g`"zz |
        \ endif
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

-- Plugins
-- WhichKey
vim.pack.add({ "https://github.com/folke/which-key.nvim" })
local wk = require("which-key")
wk.setup({
    triggers = {
        { "<auto>", mode = "nixsotc" },
        { "s",      mode = "n" },
        { "t",      mode = "n" },
    },
})

-- Marks
vim.pack.add({ "https://github.com/chentoast/marks.nvim" })
require("marks").setup({ builtin_marks = { ".", "<", ">", "^" } })

-- Paste image
vim.pack.add({ "https://github.com/HakonHarnes/img-clip.nvim" })
require("img-clip").setup({})
vim.keymap.set("n", "<M-P>", "<cmd>PasteImage<cr>",
    { noremap = true, silent = true, desc = "Paste image from clipboard" })

-- Markdown
vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim",
    "https://github.com/tadmccorkle/markdown.nvim",
    "https://github.com/3rd/image.nvim" })

require("image").setup({})
require("markdown").setup()
require("markview").setup({})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "markdown_inline" },
    callback = function()
        vim.keymap.set("n", "<cr>", "<cmd>Markview<cr>",
            { buffer = true, noremap = true, silent = true, desc = "Toggle markdown preview" })
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

vim.keymap.set("n", "s", "<Nop>", { noremap = true, silent = true, desc = "Telescope" })
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

vim.keymap.set("n", "]c", gitsigns.next_hunk, { desc = "Next git hunk" })
vim.keymap.set("n", "[c", gitsigns.prev_hunk, { desc = "Previous git hunk" })
vim.keymap.set({ "n", "t" }, "<M-g>g", "<cmd>Neogit<cr>", { desc = "Open Neogit View" })
vim.keymap.set({ "n", "t" }, "<M-g>p", gitsigns.preview_hunk, { desc = "Preview git hunk" })
vim.keymap.set({ "n", "t" }, "<M-g>b", gitsigns.blame, { desc = "Blame current line" })
vim.keymap.set({ "n", "t" }, "<M-g>Q", function() gitsigns.setqflist("all") end, { desc = "Quickfix all hunks" })
vim.keymap.set({ "n", "t" }, "<M-g>q", gitsigns.setqflist, { desc = "Quickfix buffer hunks" })
vim.keymap.set({ "n", "t" }, "<M-g>D", "<cmd>CodeDiff<cr>", { desc = "CodeDiff: explorer (git status)" })
vim.keymap.set({ "n", "t" }, "<M-g>d", "<cmd>CodeDiff file HEAD<cr>", { desc = "CodeDiff: current file vs HEAD" })
vim.keymap.set({ "n", "t" }, "<M-g>h", "<cmd>CodeDiff history<cr>", { desc = "CodeDiff: history" })

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
        { key = "~/.ssh/deploy_messenger.dev", path = "ssh://root@91.218.113.184/opt/messenger-mobile/" },
    },
    hide_buffers = {
        { name = "^term://*" },
    },
    smart_auto_load = not vim.g.neovide,
    auto_save = true,
    log_level = "info",
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

vim.keymap.set("n", "ss", "<cmd>Sess list<cr>", { noremap = true, desc = "Sessions: list" })
vim.keymap.set({ "n", "t" }, "<M-s>l", "<cmd>Sess last<cr>", { noremap = true, desc = "Sessions: load last" })
vim.keymap.set({ "n", "t" }, "<M-s>p", "<cmd>Sess pin<cr>", { noremap = true, desc = "Sessions: pin current" })

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

vim.keymap.set("n", "t", "<Nop>", { noremap = true, silent = true, desc = "Test" })
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

-- Fidget
vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })
require("fidget").setup({})

-- DB
vim.pack.add({ "https://github.com/kristijanhusak/vim-dadbod-ui",
    "https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-completion" })

vim.keymap.set({ "n", "t" }, "<M-D>", "<cmd>tabnew<cr><cmd>DBUIToggle<cr>",
    { noremap = true, desc = "Open DBUI in new tab" })

-- Harpoon
vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" } })

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<M-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon: toggle menu" })
vim.keymap.set("n", "<M-0>", function() harpoon:list():add() end, { desc = "Harpoon: add file" })
for i = 1, 9 do
    vim.keymap.set("n", "<M-" .. i .. ">", function() harpoon:list():select(i) end,
        { desc = "Harpoon: select file " .. i })
end

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

vim.keymap.set({ "n" }, "<leader>at", function()
    require("supermaven-nvim.api").toggle()
    if require("supermaven-nvim.api").is_running() then
        print("Supermaven is enabled")
    else
        print("Supermaven is disabled")
    end
end, { desc = "AI: toggle Supermaven" })

vim.pack.add({ "https://github.com/folke/sidekick.nvim" })
require("sidekick").setup({
    nes = { enabled = false },
    cli = {
        win = {
            layout = "float",
            keys = { buffers = { "<M-a>", "hide", mode = "nt", desc = "hide the terminal window" } }
        }
    },
})

vim.keymap.set({ "n", "v", "i", "t" }, "<M-a>", function()
    require("sidekick.cli").toggle({ name = "codex", filter = { cwd = vim.fn.getcwd() } })
end, { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader><M-a>", require("sidekick.cli").select, { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<M-S-a>", require("sidekick.cli").prompt, { noremap = true })

-- Multicursor
vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim" })
local mc = require("multicursor-nvim")
mc.setup()

vim.keymap.set({ "n", "x" }, "<C-M-a>", mc.matchAllAddCursors, { desc = "Multicursor: add all matches" })
vim.keymap.set({ "n", "x" }, "<C-q>", mc.toggleCursor, { desc = "Multicursor: toggle cursor" })
vim.keymap.set({ "n", "x" }, "<C-k>", function() mc.lineAddCursor(-1) end, { desc = "Multicursor: add cursor above" })
vim.keymap.set({ "n", "x" }, "<C-j>", function() mc.lineAddCursor(1) end, { desc = "Multicursor: add cursor below" })
vim.keymap.set({ "n", "v" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Multicursor: next match" })
vim.keymap.set({ "n", "v" }, "<C-p>", function() mc.matchAddCursor(-1) end, { desc = "Multicursor: previous match" })

vim.keymap.set("x", "I", mc.insertVisual, { desc = "Multicursor: insert at starts" })
vim.keymap.set("x", "A", mc.appendVisual, { desc = "Multicursor: append at ends" })

mc.addKeymapLayer(function(layerSet)
    layerSet({ "n", "x" }, "<C-S-k>", function() mc.lineSkipCursor(-1) end)
    layerSet({ "n", "x" }, "<C-S-j>", function() mc.lineSkipCursor(1) end)
    layerSet({ "n", "v" }, "<C-S-n>", function() mc.matchSkipCursor(1) end)
    layerSet({ "n", "v" }, "<C-S-p>", function() mc.matchSkipCursor(-1) end)
    layerSet({ "n", "x" }, "<C-h>", mc.prevCursor)
    layerSet({ "n", "x" }, "<C-l>", mc.nextCursor)
    layerSet({ "n", "x" }, "<C-x>", mc.deleteCursor)
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
    "basedpyright",
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
end, { silent = true, desc = "Diagnostics: workspace to quickfix" })
vim.keymap.set("n", "grh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

vim.diagnostic.config({ jump = { float = true }, signs = false, underline = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })
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
    { noremap = true, silent = true, desc = "Translate hover to Russian" })
vim.keymap.set({ "n", "x" }, "<M-Y>", ":Pantran mode=hover source=auto target=en<cr>",
    { noremap = true, silent = true, desc = "Translate hover to English" })

vim.pack.add({ "https://github.com/azratul/expose-localhost.nvim" })
vim.keymap.set("n", "<M-x>x", function()
    require("expose-localhost").stop()
    vim.ui.input({ prompt = "Port to expose: " }, function(input)
        if not input then return end
        require("expose-localhost").expose(input, "ngrok")
    end)
end, { desc = "Expose custom port via ngrok" })

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
end, { desc = "Expose static server via ngrok" })

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
