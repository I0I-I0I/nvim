vim.loader.enable()

if vim.g.neovide then
    vim.g.neovide_opacity = 0.73
    vim.g.neovide_normal_opacity = 0.8
    vim.g.neovide_scale_factor = 1.3
    vim.o.guifont = "Maple Mono"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_no_idle = false
    vim.g.neovide_fullscreen = false
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_position_animation_length = 0.15
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_vfx_mode = ""
    vim.schedule(function()
        vim.cmd.term()
        vim.cmd.startinsert()
    end)
    vim.keymap.set("n", "<C-enter>", "<cmd>lua vim.g.neovide_fullscreen=not vim.g.neovide_fullscreen<cr>")
end

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
vim.o.completeopt = "menu,menuone,noinsert,popup,nearest"
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.path = "**"
vim.o.wildignore = "**/node_modules/**,**/.git/**,**/__pycache__/**,**/.mypy_cache/**,**/.venv/**,**/.pytest_cache/**,**/.ruff_cache/**"
vim.o.spell = true
vim.o.spelllang = "en,ru"

-- Abbreviations
vim.cmd.abbreviate("W w")
vim.cmd.abbreviate("Wa wa")
vim.cmd.abbreviate("n norm")
vim.cmd.abbreviate("CD cd %:p:h")
vim.cmd.abbreviate("m make | copen | wincmd p")
vim.cmd.abbreviate("mc make % | copen | wincmd p")
vim.cmd.abbreviate("gr grep | copen | wincmd p<Home><Right><Right><Right><Right>")

-- Keymaps
vim.keymap.set({ "t", "n" }, "<C-\\><C-d>", "<C-\\><C-n>:Cd <C-r>=getcwd()<cr>/<C-d>", { noremap = true })
vim.keymap.set("n", "<C-\\><C-f>", "<C-\\><C-n>:sp <C-r>=expand('%:p:h')<cr>/<C-d>", { noremap = true })
vim.keymap.set("t", "<C-\\><C-f>", "<C-\\><C-n>:sp <C-r>=getcwd()<cr>/<C-d>", { noremap = true })
vim.keymap.set({ "t", "n" }, "<C-\\><C-h>", "<C-\\><C-n>:sp ~/<C-d>", { noremap = true })
vim.keymap.set({ "t", "n" }, "<C-\\><C-\\><C-f>", "<C-\\><C-n>:sp <C-r>=getcwd()<cr>/<C-d>", { noremap = true })

vim.keymap.set("n", "<leader>gw", "<cmd>%bd|e#|bd#<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { silent = true, noremap = true })

vim.keymap.set("n", "<C-d>", "<cmd>keepjumps normal! <C-d><cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-u>", "<cmd>keepjumps normal! <C-u><cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-y>", "3<C-y>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-e>", "3<C-e>", { silent = true, noremap = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true, noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, noremap = true })

vim.keymap.set({ "t", "n", "i" }, "<M-i>", "<cmd>tabprevious<cr>", { silent = true, noremap = true })
vim.keymap.set({ "t", "n", "i" }, "<M-o>", "<cmd>tabnext<cr>", { silent = true, noremap = true })
vim.keymap.set({ "t", "n", "i" }, "<M-S-i>", "<cmd>tabmove -<cr>", { silent = true, noremap = true })
vim.keymap.set({ "t", "n", "i" }, "<M-S-o>", "<cmd>tabmove +<cr>", { silent = true, noremap = true })

vim.keymap.set({ "t", "n", "i" }, "<M-h>", "<C-\\><C-n><cmd>norm! <C-w>h<cr>", { silent = true, noremap = true })
vim.keymap.set({ "t", "n", "i" }, "<M-j>", "<C-\\><C-n><cmd>norm! <C-w>j<cr>", { silent = true, noremap = true })
vim.keymap.set({ "t", "n", "i" }, "<M-k>", "<C-\\><C-n><cmd>norm! <C-w>k<cr>", { silent = true, noremap = true })
vim.keymap.set({ "t", "n", "i" }, "<M-l>", "<C-\\><C-n><cmd>norm! <C-w>l<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "<M-c>", ":let @+=expand('%:p')<cr>", { silent = true, noremap = true })

-- :h terminal
-- PROMPT_COMMAND='printf "\033]133;A\007"'  # enable OSC 133
vim.cmd [[tnoremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi']]
vim.keymap.set("n", "<C-w>t", "<cmd>tab term<cr>", { silent = true, noremap = true })

local function open_terminal(path)
    vim.ui.input(
        { prompt = path .. " $ ", completion = "shellcmdline" },
        function(input)
            if input == nil or input == "" then
                return
            end
            input = input
                :gsub("%|", "\\|")
                :gsub("%/", "\\\\/")
                :gsub("\"", '\\"')
            vim.cmd("sp term://" .. path .. "//" .. input)
            local current_term_buf = vim.api.nvim_get_current_buf()
            vim.keymap.set("t", "<C-w>", "<C-\\><C-o><C-w>",
                { buffer = current_term_buf, silent = true, noremap = true })
            vim.keymap.set("t", "<M-;>", function()
                vim.api.nvim_buf_delete(current_term_buf, { force = true })
                vim.schedule(function()
                    open_terminal(path)
                end)
            end, { buffer = current_term_buf, noremap = true })
            vim.schedule(function() vim.cmd.startinsert() end)
        end
    )
end
vim.keymap.set("n", "<M-;>", function() open_terminal(vim.fn.expand("%:p:h")) end, { noremap = true })
vim.keymap.set("n", "<M-:>", function() open_terminal(vim.fn.getcwd()) end, { noremap = true })

-- Emacs-like keymaps
vim.o.cedit = "<C-s>"
vim.keymap.set({ "n", "i", "v" }, "<C-l>", "<cmd>t.<cr>", { silent = true, noremap = true }) -- duplicate current line, like in emacs
vim.keymap.set("i", "<C-/>", "<C-o>u", { noremap = true })
vim.keymap.set("i", "<M-a>", "<C-o>(", { noremap = true })
vim.keymap.set("i", "<M-e>", "<C-o>)", { noremap = true })
vim.keymap.set({ "i", "c" }, "<M-p>", "<Up>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<M-n>", "<Down>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-b>", "<Left>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-f>", "<Right>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<M-b>", "<C-Left>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<M-f>", "<S-Right>", { noremap = true })
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true })
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-k>", function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    if #line <= col then return "<Del><C-o>d$" end
    return "<C-o>d$"
end, { noremap = true, expr = true })
vim.keymap.set("c", "<C-k>", "<C-s><esc>d$<C-c><End><space>", { noremap = true })
vim.keymap.set("c", "<M-d>", "<C-s><esc>ce<C-c><space>", { noremap = true })
vim.keymap.set("i", "<M-d>", "<C-o>ce", { noremap = true })
vim.keymap.set("i", "<C-k>", function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    if #line <= col then return "<Del>" end
    return "<C-o>d$"
end, { noremap = true, expr = true })

-- User commands
vim.api.nvim_create_user_command("P", function(args)
    local user_command = args.args
    if user_command == "" then return end
    vim.cmd(":new | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile")
    local out = vim.fn.execute(user_command)
    out = out:gsub("^\n+", ""):gsub("\n+$", "")
    vim.api.nvim_put(vim.split(out, "\n"), "l", true, true)
end, {
    nargs = "+",
    complete = function(_, cmdline, cursorpos)
        local line = cmdline:sub(1, cursorpos)
        line = line:gsub("^%s*P%s+", "")
        return vim.fn.getcompletion(line, "cmdline")
    end
})

vim.api.nvim_create_user_command("Cd", function(args)
    local utils = require("sessionizer.utils")
    vim.cmd.Sess("unload")
    vim.cmd("cd " .. args.args)
    utils.purge_hidden_buffers()
    vim.cmd.edit(".")
end, { nargs = "+", complete = "dir" })

-- Auto commands
vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd CmdwinEnter [:/\?] startinsert
    autocmd TermOpen * set nospell | set ft=shell
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   silent! normal! g`"zz |
        \ endif
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

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
vim.opt.runtimepath:append("/home/nnofly/code/personal/sessionizer.nvim")
vim.pack.add({ "https://github.com/mason-org/mason.nvim",
               "https://github.com/neovim/nvim-lspconfig",
               "https://github.com/supermaven-inc/supermaven-nvim" })

-- require("vim._extui").enable({ enable = true, msg = { target = "msg", timeout = 4000 } })
require("mason").setup()
require("supermaven-nvim").setup({})
vim.schedule(function() require("supermaven-nvim.api").stop() end)
vim.keymap.set({ "n", "i" }, "<M-g>", function()
    require("supermaven-nvim.api").toggle()
    if require("supermaven-nvim.api").is_running() then
        print("Supermaven is enabled")
    else
        print("Supermaven is disabled")
    end
end)

local statusline = vim.o.statusline
require("sessionizer").setup({
    exclude_filetypes = { "gitcommit" },
    paths = {
        "~/code/personal/*",
        "~/code/work/*",
        "~/.dotfiles/*",
        "~/.config/nvim",
    },
    smart_auto_load = false,
    log_level = "error",
    before_load = {
        auto_save_files = true,
        auto_remove_buffers = true,
    },
    after_load = {
        custom = function()
            local session = vim.g.sessionizer_current_session or ""
            if session ~= "" then
                session = "[" .. session .. "] "
            end
            vim.o.statusline = session .. statusline
        end
    },
    on_unload = {
        custom = function()
            vim.o.statusline = statusline
        end
    }
})

vim.keymap.set({ "n", "i", "t" }, "<C-M-l>", "<cmd>Sess last<cr>", { noremap = true })
vim.keymap.set({ "n", "i", "t" }, "<C-\\><C-s>", "<esc><C-\\><C-n>:Sess load <C-d>", { noremap = true })
vim.keymap.set("n", "<leader>sp", "<cmd>Sess pin<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ss", "<cmd>Sess save<cr>", { noremap = true })
vim.keymap.set("n", "<C-\\><C-\\><C-o>",
    "<cmd>Sess unload<cr><cmd>silent! bufdo bd<cr><cmd>term<cr><cmd>startinsert<cr>",
    { noremap = true })

local sessionizer_utils = require("sessionizer.utils")

vim.api.nvim_create_user_command("DT", function()
    sessionizer_utils.purge_term_buffers()
    vim.notify("Purged terminal buffers")
end, { nargs = 0 })

local prev_buf_ft = nil
vim.api.nvim_create_autocmd("BufLeave", { callback = function() prev_buf_ft = vim.bo.filetype end })

vim.api.nvim_create_autocmd("DirChangedPre", {
    callback = function()
        if vim.bo.filetype == "shell" or prev_buf_ft == "shell" then
            return
        end
        vim.cmd.Sess("unload")
    end
})

-- LSP
vim.keymap.set("n", "grd", "<cmd>lua vim.diagnostic.setqflist()<cr><cmd>wincmd p<cr>", { silent = true })
vim.keymap.set("n", "grf", vim.lsp.buf.format, { silent = true })

vim.diagnostic.config({ jump = { float = true } })
vim.lsp.enable({ "ty", "ruff", "lua_ls", "clangd", "cssls", "cssvar",
    "html", "emmet_language_server", "ts_ls", "biome" })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })
    end
})

local formatters = {
    python = "uv tool run ruff format --stdin-filename %",
    html = "bun run prettier --stdin-filepath %",
    css = "bun run prettier --stdin-filepath %",
    javascript = "bun run biome format --write --stdin-file-path=%",
    javascriptreact = "bun run biome format --write --stdin-file-path=%",
    typescript = "bun run biome format --write --stdin-file-path=%",
    typescriptreact = "bun run biome format --write --stdin-file-path=%"
}

vim.api.nvim_create_autocmd("FileType", { -- formatting with `gq`
    pattern = vim.tbl_keys(formatters),
    callback = function(args) vim.bo[args.buf].formatprg = formatters[vim.bo[args.buf].filetype] end
})

local linters = {
    python = "uv run pyright",
    bash = "shellcheck -f gcc",
    html = "bun run biome check --reporter=github --colors=off",
    css = "bun run biome check --reporter=github --colors=off",
    javascript = "bun run biome check --reporter=github --colors=off",
    javascriptreact = "bun run biome check --reporter=github --colors=off",
    typescript = "bun run biome check --reporter=github --colors=off",
    typescriptreact = "bun run biome check --reporter=github --colors=off"
}

vim.api.nvim_create_autocmd("FileType", { -- linting with `make`
    pattern = vim.tbl_keys(linters),
    callback = function(args)
        if vim.list_contains({ "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html" }, vim.bo[args.buf].filetype) then
            vim.cmd [[setlocal errorformat=::%t%*[a-z]\ title=%*[a-z0-9/]\\,file=%f\\,line=%l\\,endLine=%e\\,col=%c\\,endColumn=%k::%m,::%t%*[a-z]\ title=%*[a-z0-9/]\\,file=%f\\,line=%l\\,endline=%e\\,col=%c\\,endcolumn=%k::%m]]
        end
        vim.bo[args.buf].makeprg = linters[vim.bo[args.buf].filetype]
    end
})

-- Theme
vim.pack.add({ "https://github.com/mhartington/oceanic-next" })
vim.o.bg = "dark"
vim.cmd.colorscheme "OceanicNext"

local bg = "NONE"
local colors = { "Normal", "EndOfBuffer", "LineNr", "SignColumn", "TabLineFill" }
for _, color in ipairs(colors) do
    vim.api.nvim_set_hl(0, color, { bg = bg })
end

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "Float", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#666666" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#dadada" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#dadada", bg = "#2a2a2a" })
