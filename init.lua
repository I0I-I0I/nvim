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

vim.o.signcolumn = "yes:2"
vim.o.foldcolumn = "1"
vim.o.number = true
vim.o.relativenumber = true
vim.o.statuscolumn = "%s%l %C "

local ok, extui = pcall(require, "vim._extui")
if ok then
    extui.enable({ enable = true, msg = { target = "msg", timeout = 4000 } })
end

local hour = os.date("*t").hour
local is_transparent = false
if hour <= 7 or hour >= 21 then
    is_transparent = true
end

if vim.g.neovide then
    vim.g.neovide_scale_factor = 1.15
    vim.o.guifont = "Maple Mono"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_no_idle = false
    vim.g.neovide_fullscreen = false
    vim.g.neovide_window_decorations = "none"
    vim.g.neovide_confirm_quit = false
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_position_animation_length = .15
    vim.g.neovide_scroll_animation_length = .15
    vim.g.neovide_cursor_vfx_mode = ""

    vim.o.mousescroll = "ver:4,hor:4"

    vim.keymap.set({ "n", "v", "i" }, "<C-enter>", function()
        is_transparent = not is_transparent
        vim.g.neovide_fullscreen = not is_transparent
    end, { desc = "Neovide: toggle fullscreen" })
    vim.keymap.set("n", "<C-=>", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05
        vim.notify("Scale: " .. vim.g.neovide_scale_factor)
    end, { noremap = true, desc = "Neovide: increase scale" })
    vim.keymap.set("n", "<C-->", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
        vim.notify("Scale: " .. vim.g.neovide_scale_factor)
    end, { noremap = true, desc = "Neovide: decrease scale" })
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
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true, desc = "Move selection up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true, desc = "Move selection down" })
vim.keymap.set("n", "<M-k>", "<cmd>m -2<cr>", { silent = true, noremap = true, desc = "Move selection up" })
vim.keymap.set("n", "<M-j>", "<cmd>m +1<cr>", { silent = true, noremap = true, desc = "Move selection down" })
vim.keymap.set("n", "<M-^>", "kJ", { silent = true, noremap = true, desc = "Join with previous line" })
vim.keymap.set("x", "<M-^>", "<cmd>norm! J<cr>", { silent = true, noremap = true, desc = "Join selected lines" })

vim.keymap.set({ "i", "c" }, "<M-h>", "<left>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<M-l>", "<right>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-M-h>", "<C-left>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-M-l>", "<C-right>", { noremap = true })

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
vim.keymap.set("n", "<C-w>+", "<cmd>vertical resize 999<cr><cmd>resize 999<cr>",
    { silent = true, noremap = true, desc = "Open terminal tab" })
-- vim.keymap.set("n", "<C-s>", "<cmd>sp term://tmux-sessionizer | startinsert<cr>", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { silent = true, noremap = true, desc = "Exit terminal mode" })
vim.keymap.set({ "n", "i", "v" }, "<C-[>", "<cmd>noh<cr><C-[>", { silent = true, noremap = true, desc = "Open link" })
vim.keymap.set({ "n", "i" }, "<C-l>", "<cmd>t.<cr>", { silent = true, noremap = true, desc = "Duplicate current line" })
vim.keymap.set("x", "<C-l>", ":t'><cr>gv", { silent = true, noremap = true, desc = "Duplicate selection" })
vim.keymap.set("n", "<leader>R", "<cmd>restart<cr>", { silent = true, noremap = true, desc = "Restart Neovim" })
vim.keymap.set("n", "R", "<cmd>e<cr>", { silent = true, noremap = true, desc = "Reload buffer" })

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

vim.api.nvim_create_autocmd({ 'TermRequest' }, {
    desc = 'Handles OSC 7 dir change requests',
    callback = function(ev)
        local val, n = string.gsub(ev.data.sequence, '\027]7;file://[^/]*', '')
        if n > 0 then
            local dir = val
            if vim.fn.isdirectory(dir) == 0 then
                vim.notify('invalid dir: ' .. dir)
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
-- WhichKey
vim.pack.add({ "https://github.com/folke/which-key.nvim" })
require("which-key").setup()

-- Marks
vim.pack.add({ "https://github.com/chentoast/marks.nvim" })
require("marks").setup({ builtin_marks = { ".", "<", ">", "^" } })

-- Paste image
vim.pack.add({ "https://github.com/HakonHarnes/img-clip.nvim" })
require("img-clip").setup({})
vim.keymap.set("n", "<leader><M-p>", "<cmd>PasteImage<cr>",
    { noremap = true, silent = true, desc = "Img-clip: paste image from clipboard" })

-- Markdown
vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim",
    "https://github.com/tadmccorkle/markdown.nvim",
    "https://github.com/3rd/image.nvim" })

require("image").setup({})
require("markdown").setup()
require("markview").setup({})

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

        if vim.list_contains({ "markdown", "markdown_inline" }, vim.bo.filetype) then
            vim.cmd("Markview disable")
        end
        vim.treesitter.stop()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "markdown_inline" },
    callback = function()
        vim.keymap.set("n", "<cr>", "<cmd>Markview<cr>",
            { buffer = true, noremap = true, silent = true, desc = "Markview: toggle" })
    end,
})

-- Folds
vim.pack.add({ "https://github.com/masukomi/vim-markdown-folding" })

vim.o.fillchars = "eob: ,foldopen:,foldinner:│,foldclose:"

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

-- Tree-sitter
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

require("nvim-treesitter.configs").setup({
    auto_install = true,
    indent = { enable = true },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max = 200 * 1024
            local name = vim.api.nvim_buf_get_name(buf)
            local ok, stat = pcall(vim.uv.fs_stat, name)
            return ok and stat and stat.size > max
        end,
    },
})

local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")
local ts_swap = require("nvim-treesitter-textobjects.swap")

require("nvim-treesitter-textobjects").setup({
    select = { enable = true, lookahead = true },
    swap = { enable = true },
    move = { enable = true, set_jumps = true },
})

local function select(query, desc)
    vim.keymap.set({ "x", "o" }, desc.lhs, function()
        ts_select.select_textobject(query, "textobjects")
    end, { desc = desc.text })
end

-- Select
select("@assignment.outer", { lhs = "a=", text = "Textobjects: select outer part of assignment" })
select("@assignment.inner", { lhs = "i=", text = "Textobjects: select inner part of assignment" })

select("@parameter.outer", { lhs = "aa", text = "Textobjects: select outer part of parameter/argument" })
select("@parameter.inner", { lhs = "ia", text = "Textobjects: select inner part of parameter/argument" })

select("@conditional.outer", { lhs = "ai", text = "Textobjects: select outer part of conditional" })
select("@conditional.inner", { lhs = "ii", text = "Textobjects: select inner part of conditional" })

select("@loop.outer", { lhs = "al", text = "Textobjects: select outer part of loop" })
select("@loop.inner", { lhs = "il", text = "Textobjects: select inner part of loop" })

select("@call.outer", { lhs = "af", text = "Textobjects: select outer part of function call" })
select("@call.inner", { lhs = "if", text = "Textobjects: select inner part of function call" })

select("@function.outer", { lhs = "am", text = "Textobjects: select outer part of method/function definition" })
select("@function.inner", { lhs = "im", text = "Textobjects: select inner part of method/function definition" })

select("@class.outer", { lhs = "ac", text = "Textobjects: select outer part of class" })
select("@class.inner", { lhs = "ic", text = "Textobjects: select inner part of class" })

-- Swap
vim.keymap.set("n", "<leader>an", function()
    ts_swap.swap_next("@parameter.inner")
end, { desc = "Textobjects: swap parameter with next" })

vim.keymap.set("n", "<leader>ap", function()
    ts_swap.swap_previous("@parameter.inner")
end, { desc = "Textobjects: swap parameter with previous" })

vim.keymap.set("n", "<leader>fn", function()
    ts_swap.swap_next("@function.outer")
end, { desc = "Textobjects: swap function with next" })

vim.keymap.set("n", "<leader>fp", function()
    ts_swap.swap_previous("@function.outer")
end, { desc = "Textobjects: swap function with previous" })

-- Move: next start
vim.keymap.set("n", "]f", function() ts_move.goto_next_start("@call.outer") end,
    { desc = "Textobjects: Next function call start" })
vim.keymap.set("n", "]m", function() ts_move.goto_next_start("@function.outer") end,
    { desc = "Textobjects: Next function start" })
vim.keymap.set("n", "]c", function() ts_move.goto_next_start("@class.outer") end,
    { desc = "Textobjects: Next class start" })
vim.keymap.set("n", "]i", function() ts_move.goto_next_start("@conditional.outer") end,
    { desc = "Textobjects: Next conditional start" })
vim.keymap.set("n", "]l", function() ts_move.goto_next_start("@loop.outer") end,
    { desc = "Textobjects: Next loop start" })

-- Move: next end
vim.keymap.set("n", "]F", function() ts_move.goto_next_end("@call.outer") end,
    { desc = "Textobjects: Next function call end" })
vim.keymap.set("n", "]M", function() ts_move.goto_next_end("@function.outer") end,
    { desc = "Textobjects: Next function end" })
vim.keymap.set("n", "]C", function() ts_move.goto_next_end("@class.outer") end, { desc = "Textobjects: Next class end" })
vim.keymap.set("n", "]I", function() ts_move.goto_next_end("@conditional.outer") end,
    { desc = "Textobjects: Next conditional end" })
vim.keymap.set("n", "]L", function() ts_move.goto_next_end("@loop.outer") end, { desc = "Textobjects: Next loop end" })

-- Move: previous start
vim.keymap.set("n", "[f", function() ts_move.goto_previous_start("@call.outer") end,
    { desc = "Textobjects: Prev function call start" })
vim.keymap.set("n", "[m", function() ts_move.goto_previous_start("@function.outer") end,
    { desc = "Textobjects: Prev function start" })
vim.keymap.set("n", "[c", function() ts_move.goto_previous_start("@class.outer") end,
    { desc = "Textobjects: Prev class start" })
vim.keymap.set("n", "[i", function() ts_move.goto_previous_start("@conditional.outer") end,
    { desc = "Textobjects: Prev conditional start" })
vim.keymap.set("n", "[l", function() ts_move.goto_previous_start("@loop.outer") end,
    { desc = "Textobjects: Prev loop start" })

-- Move: previous end
vim.keymap.set("n", "[F", function() ts_move.goto_previous_end("@call.outer") end,
    { desc = "Textobjects: Prev function call end" })
vim.keymap.set("n", "[M", function() ts_move.goto_previous_end("@function.outer") end,
    { desc = "Textobjects: Prev function end" })
vim.keymap.set("n", "[C", function() ts_move.goto_previous_end("@class.outer") end,
    { desc = "Textobjects: Prev class end" })
vim.keymap.set("n", "[I", function() ts_move.goto_previous_end("@conditional.outer") end,
    { desc = "Textobjects: Prev conditional end" })
vim.keymap.set("n", "[L", function() ts_move.goto_previous_end("@loop.outer") end,
    { desc = "Textobjects: Prev loop end" })

local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

-- Repeat motions with ; and ,
vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next, {
    desc = "Textobjects: Repeat last Treesitter move forward",
})
vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous, {
    desc = "Textobjects: Repeat last Treesitter move backward",
})

vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })

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

vim.keymap.set({ "n", "i" }, "<M-f><M-g>", T(builtin.live_grep), { desc = "Telescope: live grep" })
vim.keymap.set({ "n", "i" }, "<M-f><M-b>", T(builtin.buffers, { previewer = false }), { desc = "Telescope: buffers" })
vim.keymap.set({ "n", "i" }, "<M-f><M-h>", T(builtin.help_tags), { desc = "Telescope: help tags" })
vim.keymap.set({ "n", "i" }, "<M-f><M-m>", T(builtin.man_pages), { desc = "Telescope: man pages" })
vim.keymap.set({ "n", "i" }, "<M-f><M-f>", T(builtin.fd), { desc = "Telescope: find files" })
vim.keymap.set("n", "grs", T(builtin.lsp_workspace_symbols), { desc = "Telescope: lsp symbols" })
vim.keymap.set("n", "grr", T(builtin.lsp_references), { desc = "Telescope: lsp references" })
vim.keymap.set("n", "<C-]>", T(builtin.lsp_definitions), { desc = "Telescope: lsp definitions" })
vim.keymap.set("n", "z=", function()
    builtin.spell_suggest(themes.get_cursor({ border = true }))
end, { desc = "Telescope: spell suggest" })

-- Git integration
vim.pack.add({ "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/NeogitOrg/neogit",
    "https://github.com/esmuellert/codediff.nvim",
    "https://github.com/lewis6991/gitsigns.nvim" })

require("neogit").setup({})
local gitsigns = require("gitsigns")
gitsigns.setup({ sign_priority = 100 })

vim.keymap.set({ "n", "t" }, "<M-g>g", "<cmd>Neogit<cr>", { desc = "Git: open Neogit" })
vim.keymap.set("n", "]c", gitsigns.next_hunk, { desc = "Git: next hunk" })
vim.keymap.set("n", "[c", gitsigns.prev_hunk, { desc = "Git: previous hunk" })
vim.keymap.set({ "n", "t" }, "<M-g>p", gitsigns.preview_hunk, { desc = "Git: preview hunk" })
vim.keymap.set({ "n", "t" }, "<M-g>Q", function() gitsigns.setqflist("all") end, { desc = "Git: quickfix all hunks" })
vim.keymap.set({ "n", "t" }, "<M-g>q", gitsigns.setqflist, { desc = "Git: quickfix buffer hunks" })
vim.keymap.set({ "n", "t" }, "<M-g>r", gitsigns.reset_hunk, { desc = "Git: reset hunk" })
vim.keymap.set({ "n", "t" }, "<M-g>b", gitsigns.blame, { desc = "Git: blame current line" })
vim.keymap.set({ "n", "t" }, "<M-g>D", "<cmd>CodeDiff<cr>", { desc = "Git: explorer (git status)" })
vim.keymap.set({ "n", "t" }, "<M-g>d", "<cmd>CodeDiff file HEAD<cr>", { desc = "Git: current file vs HEAD" })
vim.keymap.set({ "n", "t" }, "<M-g>h", "<cmd>CodeDiff history<cr>", { desc = "Git: history" })

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
vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { desc = "Fyler: open" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fyler", "Fyler" },
    callback = function()
        vim.wo.cursorline = true
    end,
})

-- Zen mode
local zenmode_path = "/home/nnofly/code/personal/zenmode.nvim"
if vim.fn.isdirectory(zenmode_path) == 1 then
    vim.opt.runtimepath:append(zenmode_path)
else
    vim.pack.add({ "https://github.com/I0I-I0I/zenmode.nvim" })
end

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
        cursorline = true,
        signcolumn = "no",
        foldcolumn = "yes:1",
        laststatus = 0,
    },
    log_level = "warn",
    default_width = 120,
})

vim.keymap.set("n", "<M-z>", zenmode_api.toggle, { desc = "Zenmode: open" })

-- Session manager
local sessionizer_path = "/home/nnofly/code/personal/sessionizer.nvim"
if vim.fn.isdirectory(sessionizer_path) == 1 then
    vim.opt.runtimepath:append(sessionizer_path)
else
    vim.pack.add({ "https://github.com/i0i-i0i/sessionizer.nvim" })
end

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

vim.keymap.set("n", "<M-f><M-s>", "<cmd>Sess list<cr>", { noremap = true, desc = "Telescope: sessions" })
vim.keymap.set({ "n", "t" }, "<M-s>s", "<cmd>Sess save<cr>", { noremap = true, desc = "Sess: save" })
vim.keymap.set({ "n", "t" }, "<M-s>l", "<cmd>Sess last<cr>", { noremap = true, desc = "Sess: load last" })
vim.keymap.set({ "n", "t" }, "<M-s>p", "<cmd>Sess pin<cr>", { noremap = true, desc = "Sess: pin current" })

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

vim.keymap.set("n", "<M-t>t", function() nt.run.run() end,
    { silent = true, noremap = true, desc = "Test: run nearest" })
vim.keymap.set("n", "<M-t>T", function() nt.run.run(vim.fn.expand("%")) end,
    { silent = true, noremap = true, desc = "Test: run file" })
vim.keymap.set("n", "<M-t>a", function() nt.run.run((vim.uv or vim.loop).cwd()) end,
    { silent = true, noremap = true, desc = "Test: run all (cwd)" })

vim.keymap.set("n", "<M-t>d", function() nt.run.run({ strategy = "dap" }) end,
    { silent = true, noremap = true, desc = "Test: debug nearest (DAP)" })
vim.keymap.set("n", "<M-t>D", function() nt.run.run({ vim.fn.expand("%"), strategy = "dap" }) end,
    { silent = true, noremap = true, desc = "Test: debug file (DAP)" })

vim.keymap.set("n", "<M-t>s", function() nt.summary.toggle() end,
    { silent = true, noremap = true, desc = "Test: toggle summary" })
vim.keymap.set("n", "<M-t>o", function() nt.output.open({ enter = true, auto_close = true }) end,
    { silent = true, noremap = true, desc = "Test: open output" })
vim.keymap.set("n", "<M-t>O", function() nt.output_panel.toggle() end,
    { silent = true, noremap = true, desc = "Test: toggle output panel" })

vim.keymap.set("n", "<M-t>S", function() nt.run.stop() end,
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
    { noremap = true, desc = "DB: open DBUI in new tab" })

-- Grapple
vim.pack.add({ "https://github.com/cbochs/grapple.nvim" })

require("grapple").setup({ icons = false })

vim.keymap.set("n", "<M-0>", "<cmd>Grapple toggle scope=cwd<cr>",
    { silent = true, noremap = true, desc = "Grapple: tag a file" })
vim.keymap.set("n", "<M-e>", "<cmd>Grapple toggle_tags scope=cwd<cr>",
    { silent = true, noremap = true, desc = "Grapple: toggle tags menu" })

for i = 1, 9 do
    vim.keymap.set("n", "<M-" .. i .. ">", "<cmd>Grapple select index=" .. i .. " scope=cwd<cr>",
        { silent = true, noremap = true, desc = "Grapple: select " .. i .. " tag" })
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
        menu = { border = "single" }
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

vim.keymap.set({ "n" }, "<M-a>c", function()
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
            keys = { buffers = { "<M-S-a>", "hide", mode = "nt", desc = "AI: hide the terminal window" } }
        }
    },
})

vim.keymap.set({ "n", "v", "i", "t" }, "<M-S-a>", function()
    require("sidekick.cli").toggle({ name = "codex", filter = { cwd = vim.fn.getcwd() } })
end, { noremap = true, desc = "AI: toggle codex" })
vim.keymap.set({ "n", "v" }, "<M-a>s", require("sidekick.cli").select, { noremap = true, desc = "AI: select cli" })
vim.keymap.set({ "n", "v", "i" }, "<M-a>p", require("sidekick.cli").prompt, { noremap = true, desc = "AI: prompt" })

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
    layerSet({ "n", "x" }, "<C-S-k>", function() mc.lineSkipCursor(-1) end, { desc = "Multicursor: skip line" })
    layerSet({ "n", "x" }, "<C-S-j>", function() mc.lineSkipCursor(1) end, { desc = "Multicursor: skip line" })
    layerSet({ "n", "v" }, "<C-S-n>", function() mc.matchSkipCursor(1) end, { desc = "Multicursor: skip match" })
    layerSet({ "n", "v" }, "<C-S-p>", function() mc.matchSkipCursor(-1) end, { desc = "Multicursor: skip match" })
    layerSet({ "n", "x" }, "<C-h>", mc.prevCursor, { desc = "Multicursor: prev cursor" })
    layerSet({ "n", "x" }, "<C-l>", mc.nextCursor, { desc = "Multicursor: next cursor" })
    layerSet({ "n", "x" }, "<C-d>", mc.deleteCursor, { desc = "Multicursor: delete cursor" })
    layerSet("n", "<C-[>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end, { desc = "Multicursor: enable/clear cursors" })
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
end, { silent = true, desc = "LSP: workspace diagnostics" })
vim.keymap.set("n", "grh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP: toggle inlay hints" })

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

vim.keymap.set({ "n", "x" }, "<M-l>i", function()
    vim.ui.select({ "ru", "en" }, { prompt = "Select translation target:" }, function(choice)
        if not choice then return end
        vim.cmd("Pantran mode=interactive source=auto target=" .. choice)
    end)
end, { noremap = true, silent = true, desc = "Translate: interactively" })

vim.keymap.set({ "n", "x" }, "<M-l>r", ":Pantran mode=hover source=auto target=ru<cr>",
    { noremap = true, silent = true, desc = "Translate: hover to Russian" })
vim.keymap.set({ "n", "x" }, "<M-l>e", ":Pantran mode=hover source=auto target=en<cr>",
    { noremap = true, silent = true, desc = "Translate: hover to English" })

vim.pack.add({ "https://github.com/azratul/expose-localhost.nvim" })

vim.keymap.set("n", "<M-x>x", function()
    require("expose-localhost").stop()
    vim.ui.input({ prompt = "Port to expose: " }, function(input)
        if not input then return end
        require("expose-localhost").expose(input, "ngrok")
    end)
end, { desc = "Expose: custom port via ngrok" })

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
end, { desc = "Expose: static server via ngrok" })

-- Theme
vim.pack.add({
    "https://github.com/aditya-azad/candle-grey",
    "https://github.com/pbrisbin/vim-colors-off",
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = { "candle-grey", "off" },
    callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        if vim.g.colors_name == "off" then
            vim.api.nvim_set_hl(0, "CursorLineNr", { bg = string.format("#%06x", normal.bg) })
        end
        vim.api.nvim_set_hl(0, "TelescopeSelection",
            { bg = string.format("#%06x", normal.bg), italic = true, bold = true })
        local blink_color = { "BlinkCmpMenu", "BlinkCmpMenuBorder", "BlinkCmpKind" }
        for _, color in ipairs(blink_color) do
            vim.api.nvim_set_hl(0, color,
                { bg = string.format("#%06x", normal.bg) })
        end
        vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection",
            { bg = string.format("#%06x", normal.bg), italic = true, bold = true })
    end,
})

local state_file = vim.fn.stdpath("state") .. "/theme_bg"

local function apply(bg)
    if bg ~= "dark" and bg ~= "light" then return end

    vim.o.background = bg
    if bg == "dark" then
        vim.cmd.colorscheme("candle-grey-transparent")
        vim.g.neovide_opacity = .73
        vim.g.neovide_normal_opacity = .73
    else
        vim.cmd.colorscheme("off")
        vim.g.neovide_opacity = 1
        vim.g.neovide_normal_opacity = 1
    end
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if normal.bg then
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = string.format("#%06x", normal.bg) })
    end
end

local function load_bg()
    -- local f = io.open(state_file, "r")
    -- if f then
    --     local bg = f:read("*l")
    --     f:close()
    --     apply(bg)
    -- else
    --     apply(vim.o.background)
    -- end
    if is_transparent then
        apply("dark")
    else
        apply("light")
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
end, { desc = "Theme: toggle" })
