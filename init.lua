vim.loader.enable()

-- Settings
vim.g.mapleader = "\\"
local map_leader = "<M-g>"

---@param mode string|string[] The Vim mode(s) for the mapping (e.g., 'n', 't', { 'n', 'v' })
---@param key string|string[] A single key sequence or a list of key sequences to bind
---@param cmd string|function The command string or Lua callback function to execute
---@param opts? vim.keymap.set.Opts Optional table of mapping configurations (e.g., { desc = "...", silent = true })
local function map(mode, key, cmd, opts)
    if type(key) == "table" then
        for _, k in ipairs(key) do
            map(mode, k, cmd, opts)
        end
        return
    end

    if key:sub(1, #map_leader) == map_leader then
        if type(cmd) == "string" then
            cmd = "<C-\\><C-n>" .. cmd
        elseif type(cmd) == "function" then
            local cb = cmd
            cmd = function()
                vim.cmd.stopinsert()
                cb()
            end
        end
    end

    vim.keymap.set(mode, key, cmd, opts)
end

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
vim.o.pumheight = 5
vim.o.winborder = "single"
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
vim.opt.shortmess:append("c")

if os.getenv("WAYLAND_DISPLAY") == nil and os.getenv("XDG_SESSION_TYPE") == "wayland" then
    vim.env.WAYLAND_DISPLAY = "wayland-0"
end

vim.g.clipboard = {
    name = "wayland",
    copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
    },
    paste = {
        ["+"] = "wl-paste",
        ["*"] = "wl-paste",
    },
    cache_enabled = 1,
}

vim.o.signcolumn = "yes:2"
vim.o.foldcolumn = "1"
vim.o.number = true
vim.o.relativenumber = true
vim.o.statuscolumn = "%s%l %C "

require("tabs").setup()

local startup_group = vim.api.nvim_create_augroup("StartupLazyLoad", { clear = true })
local has_ui = #vim.api.nvim_list_uis() > 0

local function defer(fn)
    vim.api.nvim_create_autocmd("VimEnter", {
        group = startup_group,
        once = true,
        callback = function()
            vim.schedule(fn)
        end,
    })
end

local function load_once(fn)
    local loaded = false
    return function()
        if loaded then
            return
        end
        loaded = true
        local ok, err = pcall(fn)
        if not ok then
            loaded = false
            error(err)
        end
    end
end

local ok_ui, ui2 = pcall(require, "vim._core.ui2")
if ok_ui then
    ui2.enable({ enable = true, msg = { target = "msg" } })
end

-- Abbreviations
vim.cmd.cabbrev("W w")
vim.cmd.cabbrev("Wa wa")
vim.cmd.cabbrev("n norm")

-- Keymaps
local opts = { silent = true, noremap = true }

map({ "n", "x" }, "j", function()
    if vim.v.count == 0 then
        return "gj"
    else
        return "j"
    end
end, vim.tbl_extend("force", opts, { expr = true, remap = true, desc = "Move down by display line" }))
map({ "n", "x" }, "k", function()
    if vim.v.count == 0 then
        return "gk"
    else
        return "k"
    end
end, vim.tbl_extend("force", opts, { expr = true, remap = true, desc = "Move up by display line" }))
map("n", "J", "mzJ`z", vim.tbl_extend("force", opts, { desc = "Join line and keep cursor" }))
map("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result centered" }))
map("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result centered" }))
map("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up" }))
map("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down" }))
map("n", "<leader>o", function()
    local file = vim.fn.expand("%:h")
    local os = vim.loop.os_uname().sysname
    local cmd
    if os == "Linux" then
        cmd = "xdg-open"
    elseif os == "Darwin" then
        cmd = "open"
    elseif os == "Windows" then
        cmd = "explorer"
    end
    vim.fn.system(cmd .. " " .. file)
end, vim.tbl_extend("force", opts, { desc = "Open explorer from current file" }))

map("n", "<C-s>", "<cmd>write<cr>", vim.tbl_extend("force", opts, { desc = "Save file" }))

map({ "i", "c" }, "<M-h>", "<left>", opts)
map({ "i", "c" }, "<M-l>", "<right>", opts)
map("i", "", "<cmd>undo<cr>", opts)

map("v", "<M-y>", function()
    vim.cmd([[norm! "+y]])
end, vim.tbl_extend("force", opts, { desc = "Copy" }))
map({ "n" }, "<M-y>", "\"+y", vim.tbl_extend("force", opts, { desc = "Copy" }))
map({ "n", "i", "v", "c", "t" }, "<M-p>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, vim.tbl_extend("force", opts, { desc = "Paste" }))

map({ "n", "i" }, "<M-y><M-p>", "<cmd>let @+=expand('%:p')<cr>",
    vim.tbl_extend("force", opts, { desc = "Copy absolute path" }))
map({ "n", "i" }, "<M-y><M-P>", "<cmd>let @+=expand('%:p') . ':' . line('.')<cr>",
    vim.tbl_extend("force", opts, { desc = "Copy absolute path with line" }))
map({ "n", "i" }, "<M-y><M-f>", "<cmd>let @+=expand('%:.')<cr>",
    vim.tbl_extend("force", opts, { desc = "Copy relative path" }))
map({ "n", "i" }, "<M-y><M-F>", "<cmd>let @+=expand('%:.') . ':' . line('.')<cr>",
    vim.tbl_extend("force", opts, { desc = "Copy relative path with line" }))

map({ "i", "c" }, "<C-r><C-d>", function()
    return os.date("%F")
end, vim.tbl_extend("force", opts, { expr = true, desc = "Insert date" }))
map({ "i", "c" }, "<C-r><C-t>", function()
    return os.date("%T")
end, vim.tbl_extend("force", opts, { expr = true, desc = "Insert time" }))
map({ "i", "c" }, "<C-r><C-f>", function()
    return vim.fn.expand("%:.")
end, vim.tbl_extend("force", opts, { expr = true, desc = "Insert relative path" }))
map({ "i", "c" }, "<C-r><C-p>", function()
    return vim.fn.expand("%:p")
end, vim.tbl_extend("force", opts, { expr = true, desc = "Insert absolute path" }))

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

map({ "n", "t", "i" }, "<leader>gw", close_all_but(),
    vim.tbl_extend("force", opts, { desc = "Close all buffers" }))
map({ "n", "t", "i" }, "<leader>gW", close_all_but(true),
    vim.tbl_extend("force", opts, { desc = "Force close all buffers" }))
map("n", "gw", "<cmd>bp|bd #<cr>", vim.tbl_extend("force", opts, { desc = "Close current buffer" }))
map("n", "gW", "<cmd>bp|bd! #<cr>", vim.tbl_extend("force", opts, { desc = "Force close current buffer" }))

map("n", "<space>", "za", vim.tbl_extend("force", opts, { desc = "Toggle fold" }))
map("n", "<C-space>", "zA", vim.tbl_extend("force", opts, { desc = "Toggle fold recursively" }))
map("n", "<backspace>", "zc", vim.tbl_extend("force", opts, { desc = "Close fold" }))
map({ "n", "t", "i" }, "<leader>c", "<cmd>tcd %:p:h<cr>",
    vim.tbl_extend("force", opts, { desc = "Set cwd to current file directory" }))
map({ "n", "i" }, "<C-f>", "<C-\\><C-n>:e <C-r>=expand('%:p:h')<cr>/<C-d>",
    vim.tbl_extend("force", opts, { desc = "Edit file from current file directory" }))
map({ "n", "i", "t" }, "<C-\\><C-f>", "<C-\\><C-n>:e <C-r>=getcwd()<cr>/<C-d>",
    vim.tbl_extend("force", opts, { desc = "Edit file from cwd" }))
map({ "n", "v" }, "<C-e>", "4<C-e>", vim.tbl_extend("force", opts, { desc = "Scroll down 4 lines" }))
map({ "n", "v" }, "<C-y>", "4<C-y>", vim.tbl_extend("force", opts, { desc = "Scroll up 4 lines" }))
map("n", "<C-k>", "<cmd>cprev<CR>zz", vim.tbl_extend("force", opts, { desc = "Previous quickfix item" }))
map("n", "<C-j>", "<cmd>cnext<CR>zz", vim.tbl_extend("force", opts, { desc = "Next quickfix item" }))

map("t", { "<C-]><C-w>", "<M-w>" }, function()
    vim.cmd("stopinsert")
    local ctrl_w = vim.api.nvim_replace_termcodes("<C-w>", true, false, true)
    vim.api.nvim_feedkeys(ctrl_w, "m", true)
end, vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
map("t", { "<C-]><C-r>", "<M-r>" }, function()
    return "<C-\\><C-n>\"" .. vim.fn.nr2char(vim.fn.getchar()) .. "pi"
end, vim.tbl_extend("force", opts, { expr = true, desc = "Paste register in terminal" }))
map("n", "<C-w>V", "<cmd>vertical term<cr>",
    vim.tbl_extend("force", opts, { desc = "Open terminal vertically" }))
map("n", "<C-w>S", "<cmd>split term://$SHELL<cr>",
    vim.tbl_extend("force", opts, { desc = "Open terminal horizontally" }))
map("n", "<C-w>+", "<cmd>vertical resize 999<cr><cmd>resize 999<cr>",
    vim.tbl_extend("force", opts, { desc = "Miximize current window" }))
map("t", "<M-[>", "<C-\\><C-n>", vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
map({ "n", "i", "v" }, "<C-[>", "<cmd>noh<cr><C-[>",
    vim.tbl_extend("force", opts, { desc = "Open link" }))
map({ "n", "i" }, "<C-l>", "<cmd>t.<cr>",
    vim.tbl_extend("force", opts, { desc = "Duplicate current line" }))
map("x", "<C-l>", ":t'><cr>gv", vim.tbl_extend("force", opts, { desc = "Duplicate selection" }))

for i = 1, 9 do
    local idx_str = tostring(i)
    vim.keymap.set({ "n", "t", "i" }, "<M-" .. idx_str .. ">", "<cmd>tabnext " .. idx_str .. "<cr>",
        vim.tbl_extend("force", opts, { desc = "Select " .. idx_str .. " tab" }))
end

vim.keymap.set({ "n", "t", "i" }, "<M-i>", "<cmd>tabprevious<cr>",
    vim.tbl_extend("force", opts, { desc = "Previous tab" }))
vim.keymap.set({ "n", "t", "i" }, "<M-o>", "<cmd>tabnext<cr>",
    vim.tbl_extend("force", opts, { desc = "Next tab" }))
vim.keymap.set({ "n", "t", "i" }, "<M-S-o>", "<cmd>tabmove +<cr>",
    vim.tbl_extend("force", opts, { desc = "Move tab right" }))
vim.keymap.set({ "n", "t", "i" }, "<M-S-i>", "<cmd>tabmove -<cr>",
    vim.tbl_extend("force", opts, { desc = "Move tab left" }))
vim.keymap.set("n", "<C-w>t", "<cmd>tab term<cr>",
    vim.tbl_extend("force", opts, { desc = "Open terminal tab" }))

-- Auto commands
local main_group = vim.api.nvim_create_augroup("MainGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = main_group,
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = main_group,
    callback = function()
        vim.hl.hl_op({ higroup = "IncSearch", timeout = 150 })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = main_group,
    pattern = "netrw",
    callback = function()
        vim.opt_local.bufhidden = "wipe"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = main_group,
    pattern = "fyler",
    callback = function()
        vim.opt_local.spell = false
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = main_group,
    callback = function(args)
        vim.opt_local.spell = false
        vim.bo.filetype = "shell"

        vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
            buffer = args.buf,
            callback = function()
                vim.schedule(function()
                    if vim.api.nvim_get_current_buf() == args.buf then
                        vim.cmd("startinsert")
                    end
                end)
            end,
        })

        vim.schedule(function()
            if vim.api.nvim_get_current_buf() == args.buf then
                vim.cmd("startinsert")
            end
        end)
    end,
})

vim.api.nvim_create_autocmd("TermClose", {
    pattern = "term://*",
    callback = function(args)
        if vim.api.nvim_buf_is_valid(args.buf) then
            vim.api.nvim_buf_delete(args.buf, { force = true })
        end
    end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    group = main_group,
    callback = function()
        if vim.api.nvim_get_mode().mode ~= "c" then
            vim.cmd.checktime()
        end
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = main_group,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
            vim.cmd("normal! zz")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = main_group,
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

vim.api.nvim_create_autocmd({ "TermRequest" }, {
    desc = "Handles OSC 7 dir change requests",
    callback = function(ev)
        local val, n = string.gsub(ev.data.sequence, "\027]7;file://[^/]*", "")
        if n > 0 then
            local dir = val
            if vim.fn.isdirectory(dir) == 0 then
                vim.notify("invalid dir: " .. dir)
                return
            end
            vim.b[ev.buf].osc7_dir = dir
            if vim.api.nvim_get_current_buf() == ev.buf then
                vim.cmd.lcd(dir)
            end
        end
    end
})

-- Plugins
local load_store = load_once(function()
    vim.pack.add({ "https://github.com/alex-popov-tech/store.nvim" })
    require("store").setup({
        layout = "tab",
        plugin_manager = "vim.pack",
        telemetry = false,
    })
end)

map({ "n", "t", "i" }, map_leader .. "S", function()
    load_store()
    require("store").open()
end, { desc = "Store: open" })

local load_plenary = load_once(function()
    vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
end)
defer(load_plenary)

-- Undotree

local load_undotree = load_once(function()
    vim.cmd.packadd("nvim.undotree")
end)

map("n", map_leader .. "u", function()
    load_undotree()
    require("undotree").open()
end, { silent = true, noremap = true, desc = "Undotree: open" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "nvim-undotree",
    callback = function()
        map("n", "q", "<cmd>close<cr>", { buffer = true, desc = "Undotree: close" })
        vim.opt_local.rnu = false
        vim.opt_local.nu = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.foldcolumn = "0"
    end,
})

-- WhichKey
local load_which_key = load_once(function()
    vim.pack.add({ "https://github.com/folke/which-key.nvim" })
    require("which-key").setup()
end)
defer(load_which_key)

-- Marks
local load_marks = load_once(function()
    vim.pack.add({ "https://github.com/chentoast/marks.nvim" })
    require("marks").setup({ builtin_marks = { ".", "<", ">", "^" } })
end)
defer(load_marks)

-- Paste image
local load_img_clip = load_once(function()
    vim.pack.add({ "https://github.com/HakonHarnes/img-clip.nvim" })
    require("img-clip").setup({})
end)

map({ "n", "i" }, "<M-S-p>", function()
    load_img_clip()
    vim.cmd("PasteImage")
end, { noremap = true, silent = true, desc = "Img-clip: paste image from clipboard" })

-- Markdown
local function is_markdown(ft)
    return vim.list_contains({ "markdown", "markdown_inline" }, ft)
end

local load_markdown = load_once(function()
    vim.pack.add({
        "https://github.com/OXY2DEV/markview.nvim",
        "https://github.com/tadmccorkle/markdown.nvim",
        "https://github.com/3rd/image.nvim",
        "https://github.com/masukomi/vim-markdown-folding",
        "https://github.com/SCJangra/table-nvim",
    })

    if has_ui and not vim.g.neovide then
        require("image").setup({})
    end
    require("table-nvim").setup({})
    require("markdown").setup()
    require("markview").setup({})
end)

vim.api.nvim_create_autocmd("BufReadPre", {
    callback = function(args)
        local max = 200 * 1024
        local ok, stat = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
        if not ok or not stat or stat.size < max then
            return
        end

        vim.b.large_file = true
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if not vim.b.large_file then
            return
        end

        vim.opt_local.spell = false
        vim.opt_local.syntax = "off"
        vim.opt_local.undofile = false
        vim.opt_local.swapfile = false

        if is_markdown(vim.bo.filetype) then
            pcall(vim.cmd, "Markview disable")
        end
        vim.treesitter.stop()
    end,
})

-- Folds
local load_origami = load_once(function()
    vim.pack.add({ "https://github.com/chrisgrieser/nvim-origami" })
    require("origami").setup({})

    vim.o.fillchars = "fold: ,eob: ,foldopen:,foldinner:│,foldclose:"

    vim.o.foldenable = true
    vim.o.foldmethod = "expr"
    vim.o.foldtext = ""
end)

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        if not is_markdown(vim.bo.filetype) then
            load_origami()
            vim.opt_local.foldlevel = 99
            vim.opt_local.foldlevelstart = 99
            vim.opt_local.foldnestmax = 2
        else
            load_markdown()

            vim.cmd([[ setlocal foldexpr=NestedMarkdownFolds() ]])
            vim.opt_local.foldlevel = 0
            vim.opt_local.foldlevelstart = 0
            vim.opt_local.foldnestmax = 9
            vim.opt_local.wrap = false

            map("n", "<cr>", function()
                load_markdown()
                vim.cmd("Markview")
            end, { buffer = true, noremap = true, silent = true, desc = "Markview: toggle" })
        end
    end,
})

-- Tree-sitter
local load_treesitter = load_once(function()
    vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })
    require("tree-sitter-manager").setup({
        auto_install = true,
        highlight = true,
        ensure_installed = { "markdown", "markdown_inline", "latex", "svelte", "html", "css", "javascript", "typescript" },
    })
end)
defer(load_treesitter)

-- Surround
local load_surround = load_once(function()
    vim.pack.add({
        {
            src = "https://github.com/kylechui/nvim-surround",
            version = vim.version.range("4.x")
        }
    })
end)
defer(load_surround)

-- Telescope
local telescope
local themes
local actions
local builtin

local load_telescope = load_once(function()
    vim.pack.add({
        "https://github.com/nvim-telescope/telescope.nvim",
        "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    })

    telescope = require("telescope")
    themes = require("telescope.themes")
    actions = require("telescope.actions")
    builtin = require("telescope.builtin")

    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<Esc>"] = actions.close,
                    ["<C-x>"] = actions.delete_buffer,
                },
            },
        },
        extensions = {
            ["ui-select"] = { themes.get_ivy({ border = true, layout_config = { height = 0.25 } }) },
        },
    })

    telescope.load_extension("ui-select")
    pcall(telescope.load_extension, "sessionizer")
end)
defer(load_telescope)

local function ivy_full(telescope_opts)
    load_telescope()
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
    }, telescope_opts or {}))
end

local function T(picker, telescope_opts)
    return function()
        builtin[picker](ivy_full(telescope_opts))
    end
end

map({ "n" }, "tp", T("fd"), { desc = "Telescope: project files" })
map({ "n" }, "tg", T("live_grep"), { desc = "Telescope: live grep" })
map({ "n" }, "tb", T("buffers", { previewer = false }), { desc = "Telescope: buffers" })
map({ "n" }, "tt", T("buffers", { default_text = "term://", previewer = false }),
    { desc = "Telescope: terminal buffers" })
map({ "n" }, "th", T("help_tags"), { desc = "Telescope: help tags" })
map({ "n" }, "tm", T("man_pages"), { desc = "Telescope: man pages" })
map({ "n" }, "tk", T("keymaps"), { desc = "Telescope: keymaps" })
map("n", "grs", T("lsp_workspace_symbols"), { desc = "Telescope: lsp symbols" })
map("n", "grr", T("lsp_references"), { desc = "Telescope: lsp references" })
map("n", "<C-]>", T("lsp_definitions"), { desc = "Telescope: lsp definitions" })
map("n", "z=", function()
    load_telescope()
    builtin.spell_suggest(themes.get_cursor({ border = true }))
end, { desc = "Telescope: spell suggest" })

-- Git integration
local load_codediff = load_once(function()
    vim.pack.add({ "https://github.com/esmuellert/codediff.nvim" })
    require("codediff").setup({
        diff = {
            compute_moves = true,
            jump_to_first_change = false
        },
        explorer = {
            initial_focus = "modified",
            view_mode = "tree"
        }
    })
end)
defer(load_codediff)

local gitsigns

local load_git = load_once(function()
    vim.pack.add({
        "https://github.com/MunifTanjim/nui.nvim",
        -- "https://github.com/NeogitOrg/neogit",
        "https://github.com/lewis6991/gitsigns.nvim",
    })

    -- require("neogit").setup({
    --     graph_style = "kitty",
    --     process_spinner = true,
    -- })
    gitsigns = require("gitsigns")
    gitsigns.setup({ sign_priority = 100 })
end)
defer(load_git)

map({ "n", "t" }, { map_leader .. "gg", "<M-S-g>" }, function()
    vim.cmd("tabnew")
    local cmd_str = string.format("GITU_SHOW_EDITOR='nvim --server %s --remote-tab' gitu", vim.v.servername)
    vim.cmd("terminal " .. cmd_str)
    vim.cmd("startinsert")
end, { desc = "Git: open gitu" })

-- map({ "n", "t", "i" }, map_leader .. "gg", function()
--     load_git()
--     vim.cmd("Neogit")
-- end, { desc = "Git: open Neogit" })
map("n", "]c", function()
    load_git()
    gitsigns.next_hunk()
end, { desc = "Git: next hunk" })
map("n", "[c", function()
    load_git()
    gitsigns.prev_hunk()
end, { desc = "Git: previous hunk" })
map({ "n", "t", "i" }, map_leader .. "gp", function()
    load_git()
    gitsigns.preview_hunk()
end, { desc = "Git: preview hunk" })
map({ "n", "t", "i" }, map_leader .. "gQ", function()
    load_git()
    gitsigns.setqflist("all")
end, { desc = "Git: quickfix all hunks" })
map({ "n", "t", "i" }, map_leader .. "gq", function()
    load_git()
    gitsigns.setqflist()
end, { desc = "Git: quickfix buffer hunks" })
map({ "n", "t", "i" }, map_leader .. "gr", function()
    load_git()
    gitsigns.reset_hunk()
end, { desc = "Git: reset hunk" })
map("n", map_leader .. "gS", function()
    load_git()
    vim.cmd("Gitsigns stage_buffer")
end, { desc = "Git: stage current file" })
map("n", map_leader .. "gs", function()
    load_git()
    vim.cmd("Gitsigns stage_hunk")
end, { desc = "Git: stage current hunk" })
map("n", map_leader .. "gU", function()
    load_git()
    vim.cmd("Gitsigns reset_buffer_index")
end, { desc = "Git: unstage current file" })
map("n", map_leader .. "gu", function()
    load_git()
    vim.cmd("Gitsigns undo_stage_hunk")
end, { desc = "Git: unstage current hunk" })
map({ "n", "t", "i" }, map_leader .. "gb", function()
    load_git()
    gitsigns.blame()
end, { desc = "Git: blame current line" })
map({ "n", "t", "i" }, map_leader .. "gd", function()
    load_git()
    vim.cmd("CodeDiff")
end, { desc = "Git: explorer (git status)" })
map({ "n", "t", "i" }, map_leader .. "gh", function()
    load_git()
    vim.cmd("CodeDiff history")
end, { desc = "Git: history" })

-- File explorer
local load_fyler = load_once(function()
    vim.pack.add({ "https://github.com/A7Lavinraj/fyler.nvim" })
    require("fyler").setup({
        views = {
            finder = {
                confirm_simple = true,
                default_explorer = true,
                mappings = { ["<tab>"] = "Select" },
                watcher = { enabled = true },
                win = { kind = "replace" }
            }
        },
        integrations = { icon = "none" }
    })

    map("n", "-", vim.cmd.Fyler, { desc = "Fyler: open" })
end)
load_fyler()

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fyler", "Fyler" },
    callback = function()
        vim.wo.cursorline = true
    end,
})

local load_lsp_file_operations = load_once(function()
    vim.pack.add({ "https://github.com/antosha417/nvim-lsp-file-operations" })
    require("lsp-file-operations").setup()
end)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspFileOperations", { clear = true }),
    callback = function()
        defer(load_lsp_file_operations)
    end,
})

-- Zen mode
local zenmode_path = {
    dir = "/home/nnofly/code/personal/zenmode.nvim",
    url = "https://github.com/I0I-I0I/zenmode.nvim"
}
local zenmode_api

local load_zenmode = load_once(function()
    if vim.fn.isdirectory(zenmode_path.dir) == 1 then
        vim.opt.runtimepath:append(zenmode_path.dir)
    else
        vim.pack.add({ zenmode_path.url })
    end

    local zenmode = require("zenmode")
    zenmode_api = require("zenmode.api")

    zenmode.setup({
        options = {
            number = false,
            relativenumber = false,
            cursorline = true,
            signcolumn = "no",
            foldcolumn = "yes:1",
            laststatus = 0,
        },
        log_level = "warn",
        default_width = 120,
    })
end)

vim.api.nvim_create_autocmd("VimLeavePre", {
    group = vim.api.nvim_create_augroup("ZenMode", { clear = true }),
    callback = function()
        pcall(vim.cmd, "ZenmodeClose")
        pcall(vim.cmd, "Sess save")
    end,
})

map({ "n", "t", "i" }, map_leader .. "z", function()
    load_zenmode()
    zenmode_api.toggle()
end, { desc = "Zenmode: open" })

-- Session manager
local sessionizer_path = {
    dir = "/home/nnofly/code/personal/sessionizer.nvim",
    url = "https://github.com/i0i-i0i/sessionizer.nvim"
}

local zenmode_state = false

local load_sessionizer = load_once(function()
    load_zenmode()

    if vim.fn.isdirectory(sessionizer_path.dir) == 1 then
        vim.opt.runtimepath:append(sessionizer_path.dir)
    else
        vim.pack.add({ sessionizer_path.url })
    end

    require("sessionizer").setup({
        paths = {
            "~/code/personal/*",
            "~/code/work/*",
            "~/.dotfiles/*",
            "~/.config/nvim",
            "~/Dropbox",
            "/mnt/d/apps/Dropbox",
            "/mnt/d/code/xray-server",
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
                if zenmode_state then
                    zenmode_api.open()
                end
            end,
        },
    })

    if telescope then
        pcall(telescope.load_extension, "sessionizer")
    end

    map("n", "ts", function()
        load_telescope()
        vim.cmd("Sess list")
    end, { noremap = true, desc = "Telescope: sessions" })
    map({ "n", "t", "i" }, map_leader .. "ss", function()
        vim.cmd("Sess save")
    end, { noremap = true, desc = "Sess: save" })
    map({ "n", "t", "i" }, map_leader .. "sl", function()
        vim.cmd("Sess last")
    end, { noremap = true, desc = "Sess: load last" })
    map({ "n", "t", "i" }, map_leader .. "sp", function()
        vim.cmd("Sess pin")
    end, { noremap = true, desc = "Sess: pin current" })
end)
load_sessionizer()

-- Tests
local nt

local load_neotest = load_once(function()
    vim.pack.add({
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/antoinemadec/FixCursorHold.nvim",
        "https://github.com/nvim-neotest/nvim-nio",
        "https://github.com/nvim-neotest/neotest",
        "https://github.com/nvim-neotest/neotest-python",
        "https://github.com/nvim-neotest/neotest-jest",
        "https://github.com/marilari88/neotest-vitest"
    })

    load_treesitter()
    nt = require("neotest")

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
end)

map("n", map_leader .. "tt", function()
    load_neotest()
    nt.run.run()
end, { silent = true, noremap = true, desc = "Test: run nearest" })
map("n", map_leader .. "tT", function()
    load_neotest()
    nt.run.run(vim.fn.expand("%"))
end, { silent = true, noremap = true, desc = "Test: run file" })
map("n", map_leader .. "ta", function()
    load_neotest()
    nt.run.run((vim.uv or vim.loop).cwd())
end, { silent = true, noremap = true, desc = "Test: run all (cwd)" })

map("n", map_leader .. "td", function()
    load_neotest()
    nt.run.run({ strategy = "dap" })
end, { silent = true, noremap = true, desc = "Test: debug nearest (DAP)" })
map("n", map_leader .. "tD", function()
    load_neotest()
    nt.run.run({ vim.fn.expand("%"), strategy = "dap" })
end, { silent = true, noremap = true, desc = "Test: debug file (DAP)" })

map("n", map_leader .. "ts", function()
    load_neotest()
    nt.summary.toggle()
end, { silent = true, noremap = true, desc = "Test: toggle summary" })
map("n", map_leader .. "to", function()
    load_neotest()
    nt.output.open({ enter = true, auto_close = true })
end, { silent = true, noremap = true, desc = "Test: open output" })
map("n", map_leader .. "tO", function()
    load_neotest()
    nt.output_panel.toggle()
end, { silent = true, noremap = true, desc = "Test: toggle output panel" })

map("n", map_leader .. "tS", function()
    load_neotest()
    nt.run.stop()
end, { silent = true, noremap = true, desc = "Test: stop" })
map("n", "]t", function()
    load_neotest()
    nt.jump.next({ status = "failed" })
end, { silent = true, noremap = true, desc = "Test: next failed" })
map("n", "[t", function()
    load_neotest()
    nt.jump.prev({ status = "failed" })
end, { silent = true, noremap = true, desc = "Test: prev failed" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "neotest-summary", "neotest-output", "neotest-output-panel" },
    callback = function()
        map("n", "q", "<cmd>close<cr>",
            { buffer = true, desc = "Test: close output panel" })
    end
})

-- Fidget
local load_fidget = load_once(function()
    vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })
    require("fidget").setup({})
end)
defer(load_fidget)

-- DB
local load_dadbod = load_once(function()
    vim.pack.add({
        "https://github.com/kristijanhusak/vim-dadbod-ui",
        "https://github.com/tpope/vim-dadbod",
        "https://github.com/kristijanhusak/vim-dadbod-completion",
    })
end)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql" },
    callback = load_dadbod,
})

map({ "n", "t", "i" }, map_leader .. "D", function()
    load_dadbod()
    vim.cmd("tabnew")
    vim.cmd("DBUIToggle")
end, { noremap = true, desc = "DB: open DBUI in new tab" })

-- Grapple
local load_grapple = load_once(function()
    vim.pack.add({ "https://github.com/cbochs/grapple.nvim" })
    require("grapple").setup({ icons = false })
end)

map("n", "\\a", function()
    load_grapple()
    vim.cmd("Grapple toggle scope=cwd")
end, { silent = true, noremap = true, desc = "Grapple: tag a file" })
map("n", "<M-e>", function()
    load_grapple()
    vim.cmd("Grapple toggle_tags scope=cwd")
end, { silent = true, noremap = true, desc = "Grapple: toggle tags menu" })

for i = 1, 9 do
    map("n", "\\" .. i, function()
        load_grapple()
        vim.cmd("Grapple select index=" .. i .. " scope=cwd")
    end, { silent = true, noremap = true, desc = "Grapple: select " .. i .. " tag" })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "grapple" },
    callback = function(args)
        map("n", "<M-k>", "<cmd>m -2<cr>",
            { silent = true, noremap = true, desc = "Move selection up", buffer = args.buf })
        map("n", "<M-j>", "<cmd>m +1<cr>",
            { silent = true, noremap = true, desc = "Move selection down", buffer = args.buf })
    end,
})

-- Completion
local load_blink = load_once(function()
    vim.pack.add({
        { src = "https://github.com/saghen/blink.cmp",    version = vim.version.range("1.*") },
        { src = "https://github.com/saghen/blink.compat", version = vim.version.range("2.*") },
        "https://github.com/disrupted/blink-cmp-conventional-commits",
        "https://github.com/bydlw98/blink-cmp-env",
        "https://github.com/rafamadriz/friendly-snippets",
    })

    require("blink.cmp").setup({
        keymap = { preset = "default" },
        completion = {
            documentation = { auto_show = true },
            menu = { border = "single" },
        },
        cmdline = {
            enabled = false,
            keymap = { preset = "inherit" },
            completion = { menu = { auto_show = true } },
        },
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
end)

vim.api.nvim_create_autocmd("InsertEnter", {
    group = vim.api.nvim_create_augroup("BlinkLazyLoad", { clear = true }),
    once = true,
    callback = function() vim.schedule(load_blink) end,
})

-- AI
map("n", map_leader .. "aa", function()
    vim.cmd("tab term agy")
end, { desc = "AI: open agent (gemini)" })

local load_supermaven = load_once(function()
    vim.pack.add({ "https://github.com/supermaven-inc/supermaven-nvim" })
    require("supermaven-nvim").setup({
        ignore_filetypes = { "markdown", "markdown_inline", "fyler", "Fyler", "99prompt", "gitcommit" },
    })
end)
defer(load_supermaven)

map({ "n", "t", "i" }, map_leader .. "ac", function()
    load_supermaven()
    require("supermaven-nvim.api").toggle()
    if require("supermaven-nvim.api").is_running() then
        print("Supermaven is enabled")
    else
        print("Supermaven is disabled")
    end
end, { desc = "AI: toggle Supermaven" })

local _99
local load_99 = load_once(function()
    -- vim.pack.add({ "https://github.com/ThePrimeagen/99" })
    vim.opt.runtimepath:append("/home/nnofly/.config/nvim/99/")
    _99 = require("99")
    _99.setup({ provider = _99.Providers.GeminiCLIProvider })
    -- _99.setup({ provider = _99.Providers.GmnProvider })
    -- _99.setup({ provider = _99.Providers.AgyCLIProvider })
end)

map("n", map_leader .. "ao", function()
    load_99()
    _99.output()
end, { desc = "AI(99): open output" })

map("v", map_leader .. "<M-a>", function()
    load_99()
    _99.visual()
end, { desc = "AI(99): visual" })

map({ "n", "t", "i" }, map_leader .. "av", function()
    load_99()
    _99.vibe()
end, { desc = "AI(99): vibe" })

map({ "n", "t", "i" }, map_leader .. "ah", function()
    load_99()
    _99.open()
end, { desc = "AI(99): open history" })

map({ "n", "t", "i" }, map_leader .. "am", function()
    load_telescope()
    load_99()
    require("99.extensions.telescope").select_model()
end, { desc = "AI(99): select model" })

map({ "n", "t", "i" }, map_leader .. "ap", function()
    load_telescope()
    load_99()
    require("99.extensions.telescope").select_provider()
end, { desc = "AI(99): select provider" })

map({ "n", "t", "i" }, map_leader .. "ax", function()
    load_99()
    _99.stop_all_requests()
end, { desc = "AI(99): stop all requests" })

map({ "n", "t", "i" }, map_leader .. "as", function()
    load_99()
    _99.search()
end, { desc = "AI(99): search" })

-- Multicursor
local mc
local load_multicursor = load_once(function()
    vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim" })
    mc = require("multicursor-nvim")
    mc.setup()

    mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<M-S-k>", function() mc.lineSkipCursor(-1) end, { desc = "Multicursor: skip line" })
        layerSet({ "n", "x" }, "<M-S-j>", function() mc.lineSkipCursor(1) end, { desc = "Multicursor: skip line" })
        layerSet({ "n", "v" }, "<M-S-n>", function() mc.matchSkipCursor(1) end, { desc = "Multicursor: skip match" })
        layerSet({ "n", "v" }, "<M-S-p>", function() mc.matchSkipCursor(-1) end, { desc = "Multicursor: skip match" })
        layerSet({ "n", "x" }, "<M-h>", mc.prevCursor, { desc = "Multicursor: prev cursor" })
        layerSet({ "n", "x" }, "<M-l>", mc.nextCursor, { desc = "Multicursor: next cursor" })
        layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor, { desc = "Multicursor: delete cursor" })
        layerSet("n", "<C-[>", function()
            if not mc.cursorsEnabled() then
                mc.enableCursors()
            else
                mc.clearCursors()
            end
        end, { desc = "Multicursor: enable/clear cursors" })
    end)
end)

map({ "n", "x" }, "<M-a>", function()
    load_multicursor()
    mc.matchAllAddCursors()
end, { desc = "Multicursor: add all matches" })
map({ "n", "x" }, "<M-q>", function()
    load_multicursor()
    mc.toggleCursor()
end, { desc = "Multicursor: toggle cursor" })
map({ "n", "x" }, "<M-k>", function()
    load_multicursor()
    mc.lineAddCursor(-1)
end, { desc = "Multicursor: add cursor above" })
map({ "n", "x" }, "<M-j>", function()
    load_multicursor()
    mc.lineAddCursor(1)
end, { desc = "Multicursor: add cursor below" })
map({ "n", "v" }, "<M-n>", function()
    load_multicursor()
    mc.matchAddCursor(1)
end, { desc = "Multicursor: next match" })
map({ "n", "v" }, "<M-p>", function()
    load_multicursor()
    mc.matchAddCursor(-1)
end, { desc = "Multicursor: previous match" })

map("x", "I", function()
    load_multicursor()
    mc.insertVisual()
end, { desc = "Multicursor: insert at starts" })
map("x", "A", function()
    load_multicursor()
    mc.appendVisual()
end, { desc = "Multicursor: append at ends" })

-- Formatting
local load_conform = load_once(function()
    vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
    require("conform").setup({
        formatters_by_ft = {
            python = { "ruff_format" },
            html = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
            javascript = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
            svelte = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
        },
        format_after_save = {
            async = true,
            lsp_format = "fallback",
        },
        -- format_on_save = {
        --     timeout_ms = 5000,
        --     lsp_format = "fallback",
        -- },
    })
end)
defer(load_conform)

-- Locale
local load_locale = load_once(function()
    vim.pack.add({
        "https://github.com/yelog/i18n.nvim",
        "https://github.com/Strehk/lazy-watson",
    })
    require("i18n").setup({
        auto_detect = true,
        func_type = {
            "typescript",
            "javascript",
            "svelte",
            "typescriptreact",
            "javascriptreact",
        },
        func_pattern = {
            "t",
            "$t",
            "m%.([%w_]+)%s*%(",
        },
    })
    require("lazy-watson").setup({})
end)
defer(load_locale)

-- LSP
local lsp_servers = {
    "lua_ls",
    "basedpyright",
    "ruff",
    "svelte",
    "vtsls",
    -- "tsgo",
    "wc_ls",
    "eslint",
    "oxlint",
    "biome",
    "cssls",
    "emmet_language_server",
    "html",
    "clangd",
}

local load_lsp = load_once(function()
    vim.pack.add({
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/mason-org/mason-lspconfig.nvim",
        "https://github.com/neovim/nvim-lspconfig",
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
        automatic_enable = false,
        ensure_installed = lsp_servers,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_file_ops, file_ops = pcall(require, "lsp-file-operations")
    if has_file_ops then
        local file_ops_caps = file_ops.default_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, file_ops_caps)
    end
    vim.lsp.config("*", { capabilities = capabilities })
    vim.lsp.enable(lsp_servers)
end)
defer(load_lsp)

map("n", "grd", function()
    load_lsp()
    for _, client in ipairs(vim.lsp.get_clients()) do
        if client.supports_method and client:supports_method("workspace/diagnostic") then
            vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
        end
    end
    vim.defer_fn(function()
        vim.diagnostic.setqflist({ open = true })
        vim.cmd("wincmd p")
    end, 200)
end, { silent = true, desc = "LSP: workspace diagnostics" })

map("n", "grh", function()
    load_lsp()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP: toggle inlay hints" })

vim.diagnostic.config({
    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
        end,
    },
    signs = false,
    underline = true,
})

vim.o.updatetime = 400
local lsp_document_highlight = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })

        if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_clear_autocmds({ group = lsp_document_highlight, buffer = args.buf })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                group = "lsp_document_highlight",
                buffer = args.buf,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
                group = "lsp_document_highlight",
                buffer = args.buf,
                callback = vim.lsp.buf.clear_references,
            })
            local lsp_opts = { italic = true, underdotted = true }
            vim.api.nvim_set_hl(0, "LspReferenceText", lsp_opts)
            vim.api.nvim_set_hl(0, "LspReferenceRead", lsp_opts)
            vim.api.nvim_set_hl(0, "LspReferenceWrite", lsp_opts)
        end
    end,
})

-- Utils
local load_colorizer = load_once(function()
    vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
    require("colorizer").setup({})
end)
defer(load_colorizer)

local load_pantran = load_once(function()
    vim.pack.add({ "https://github.com/potamides/pantran.nvim" })
    require("pantran").setup({
        default_engine = "google",
        engines = {
            yandex = { default_source = "auto", default_target = "ru" },
            google = { default_source = "auto", default_target = "ru" },
        },
        ui = {
            width_percentage = 0.9,
            height_percentage = 0.8,
        },
    })
end)

map({ "n", "x" }, map_leader .. "li", function()
    load_pantran()
    vim.ui.select({ "ru", "en" }, { prompt = "Select translation target:" }, function(choice)
        if not choice then return end
        vim.cmd("Pantran mode=interactive source=auto target=" .. choice)
    end)
end, { noremap = true, silent = true, desc = "Translate: interactively" })

map({ "n", "x" }, map_leader .. "lr", function()
    load_pantran()
    if vim.tbl_contains({ "V", "v" }, vim.api.nvim_get_mode().mode) then
        vim.cmd("Pantran mode=hover source=auto target=ru")
        return
    end
    vim.cmd("Pantran mode=interactive source=auto target=ru")
end, { noremap = true, silent = true, desc = "Translate: to Russian" })
map({ "n", "x" }, map_leader .. "le", function()
    load_pantran()
    if vim.tbl_contains({ "V", "v" }, vim.api.nvim_get_mode().mode) then
        vim.cmd("Pantran mode=hover source=auto target=en")
        return
    end
    vim.cmd("Pantran mode=interactive source=auto target=en")
end, { noremap = true, silent = true, desc = "Translate: to English" })

local load_expose = load_once(function()
    vim.pack.add({ "https://github.com/azratul/expose-localhost.nvim" })
end)

map({ "n", "t", "i" }, map_leader .. "xx", function()
    load_expose()
    require("expose-localhost").stop()
    vim.ui.input({ prompt = "Port to expose: " }, function(input)
        if not input then return end
        require("expose-localhost").expose(input, "ngrok")
    end)
end, { desc = "Expose: custom port via ngrok" })

map({ "n", "t", "i" }, map_leader .. "xX", function()
    load_expose()
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
end, { desc = "Expose: static server via ngrok" })

-- Theme
local stille_path = {
    dir = "/home/nnofly/code/personal/stille.nvim",
    url = "https://github.com/I0I-I0I/stille.nvim"
}

if vim.fn.isdirectory(stille_path.dir) == 1 then
    vim.opt.runtimepath:append(stille_path.dir)
else
    vim.pack.add({ stille_path.url })
end

require("gnome-track").setup(function(scheme)
    local theme, is_transparent
    if scheme == "prefer-dark" then
        is_transparent = true
        theme = "stille-leere"
    else
        is_transparent = false
        theme = "stille-hell"
    end
    require("stille").setup({ transparent = is_transparent, terminal_colors = false })
    vim.cmd.colo(theme)
end)
