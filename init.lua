vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = "" -- <C-x>
vim.o.spell = true
vim.o.spelllang = "en,ru"
vim.o.lazyredraw = true
vim.o.updatetime = 300
vim.o.swapfile = false
vim.o.mouse = "a"
vim.o.hidden = true
vim.o.wildmode = "list,full"
vim.o.laststatus = 3
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.winborder = "single"
vim.o.completeopt = "menuone,noinsert,preview,fuzzy"
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.foldnestmax = 1
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.path = "**"
vim.o.wildignore = "*/.git/*,*/__pycache__/*,*/node_modules/*,*/.pytest_cache/*,*/.direnv/*,*/target/*,*/build/*,*/.vscode/*,*/.idea/*,*/.venv/*"
vim.o.grepprg = "rg --vimgrep --hidden -g '!**/.git/**' -g '!**/.venv/**' -g '!**/node_modules/**' -g '!**/Session.vim'"

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-y>", "4<C-y>")
vim.keymap.set("n", "<C-e>", "4<C-e>")
vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { noremap = true })
vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true })
vim.keymap.set("n", "<localleader><C-f>", ":e <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<localleader><C-s>", ":sp <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<localleader><C-v>", ":vs <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<localleader><C-n>", ":tabnew <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<M-c>", ":let @+=expand('%')<cr>", { silent = true })
vim.keymap.set("n", "<M-S-c>", ":let @+=expand('%') . ':' . line('.')<cr>", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>!tmux neww tmux-sessionizer<cr>", { silent = true })
vim.keymap.set("c", "<C-w>", "<backspace><C-w>")
vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("n", "<leader>N", ":tabnew ~/Dropbox/notes/.md<Left><Left><Left>")
vim.keymap.set("n", "<leader>w", "<cmd>mksession!<cr><cmd>w<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>mksession!<cr><cmd>wa<cr><cmd>qa<cr>", { silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>w<cr><cmd>e<cr>zozz", { silent = true })
vim.keymap.set("n", "grd", vim.diagnostic.setqflist, { silent = true })
vim.keymap.set("n", "<C-g>", "<cmd>Neogit<cr>", { silent = true })
vim.keymap.set("v", "", "y:execute 'grep ' . shellescape(@\") . ' | copen'<CR>", { noremap = true, silent = true })

vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd FocusGained,BufEnter * checktime
    autocmd FileType fyler setlocal nospell
]])

vim.api.nvim_create_user_command("LoadDapConfig", function() require("dap-config") end, {})

vim.pack.add({
    { src = "https://github.com/ntk148v/komau.vim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/artemave/workspace-diagnostics.nvim" },
    { src = "https://github.com/supermaven-inc/supermaven-nvim" },
    { src = "https://github.com/A7Lavinraj/fyler.nvim" },
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
})

vim.cmd("colo komau")
local date = tonumber(os.date("%H"))
if date >= 22 or date < 6 then
-- if true then
    vim.o.bg = "dark"
    vim.cmd.hi("Normal guibg=NONE")
    vim.cmd.hi("CursorLineNr guibg=NONE")
    vim.cmd.hi("NormalNC guibg=NONE")
    vim.cmd.hi("EndOfBuffer guibg=NONE")
    vim.cmd.hi("SignColumn guibg=NONE")
    vim.cmd.hi("Folded guibg=NONE")
    vim.cmd.hi("LineNr guibg=NONE")
    vim.cmd.hi("TabLine guifg=#707070 guibg=NONE")
    vim.cmd.hi("TabLineSel guibg=NONE guifg=#efedef")
    vim.cmd.hi("TabLineFill guibg=NONE")
    vim.cmd.hi("StatusLine guibg=NONE guifg=#efedef")
    vim.cmd.hi("NormalFloat guibg=NONE")
    vim.cmd.hi("Float guibg=NONE")
    vim.cmd.hi("FloatBorder guibg=NONE")
    vim.cmd.hi("FloatTitle guibg=NONE")
    vim.cmd.hi("FloatFooter guibg=NONE")
    vim.cmd.hi("RenderMarkdownCode guibg=NONE")
    vim.cmd.hi("WinSeparator guibg=NONE")
    vim.cmd.hi("DiagnosticWarn guifg=#ffffff")
    vim.cmd.hi("DiagnosticError guifg=#ffffff")
    vim.cmd.hi("DiagnosticHint guifg=#ffffff")
    vim.cmd.hi("DiagnosticInfo guifg=#ffffff")
else
    vim.o.bg = "light"
    vim.cmd.hi("DiagnosticWarn guifg=#000000")
    vim.cmd.hi("DiagnosticError guifg=#000000")
    vim.cmd.hi("DiagnosticHint guifg=#000000")
    vim.cmd.hi("DiagnosticInfo guifg=#000000")
end

require("vim._extui").enable({
    enable = true,
    msg = { target = "cmd", timeout = 4000 },
})

require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = { enable = false },
    indent = { enable = true }})
require("fyler").setup({confirm_simple = true, icon_provider = "none", default_explorer = true})
vim.cmd.hi("FylerFSDirectory guifg=#ae0000")
require("neogit").setup({})
require("supermaven-nvim").setup({})
require("mason").setup()
require("mason-lspconfig").setup({ensure_installed = {"basedpyright", "ruff", "clangd", "bashls", "lua_ls", "cssls", "css_variables", "jsonls", "html", "emmet_language_server"}})

local lsps = {"clangd", "lua_ls", "ruff"}
vim.diagnostic.config({ jump = { float = true }, float = { source = true } })
vim.lsp.enable({ "djlsp" })
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        for _, lsp in pairs(lsps) do
            if client.name == lsp then
                require("workspace-diagnostics").populate_workspace_diagnostics(client, args.buf)
            end
        end
    end,
})

