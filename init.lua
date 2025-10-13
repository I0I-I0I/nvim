vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = "" -- <C-x>
vim.o.lazyredraw = true
vim.o.swapfile = false
vim.o.mouse = "a"
vim.o.hidden = true
vim.o.list = true
vim.o.wildmode = "longest:full,full"
vim.o.wildmenu = true
vim.o.laststatus = 3
vim.o.scrolloff = 1
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.completeopt = "menu,menuone,noinsert,popup,nearest"
vim.o.cmdheight = 0
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняжб;abcdefghijklmnopqrstuvwxyz\\;\\,"

vim.keymap.set({ "v", "n" }, "<C-y>", "4<C-y>")
vim.keymap.set({ "v", "n" }, "<C-e>", "4<C-e>")
vim.keymap.set("n", "<M-o>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<M-i>", "<cmd>tabprevious<cr>", { silent = true })
vim.keymap.set("n", "<M-S-o>", "<cmd>tabmove +<cr>", { silent = true })
vim.keymap.set("n", "<M-S-i>", "<cmd>tabmove -<cr>", { silent = true })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "Q", "@@")
vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true })
vim.keymap.set("n", "<M-c>", ":let @+=expand('%')<cr>", { silent = true })
vim.keymap.set("n", "<M-S-c>", ":let @+=expand('%:p')<cr>", { silent = true })
vim.keymap.set("n", "<leader><M-c>", ":let @+=expand('%') . ':' . line('.')<cr>", { silent = true })
vim.keymap.set("n", "<leader><M-S-c>", ":let @+=expand('%:p') . ':' . line('.')<cr>", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>!tmux neww tmux-sessionizer<cr>", { silent = true })
vim.keymap.set("n", "=ap", "ma=ap`a")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p")
vim.keymap.set("x", "P", "\"_dP")
vim.keymap.set({ "n", "v" }, "<leader>'", function()
    local to = vim.fn.input("To: ")
    if to == "" then return end
    vim.cmd("let @" .. to .. "=@\"") end)

vim.keymap.set("n", "<localleader><c-f>", function()
    local stat = "current"
    local base_path = vim.fn.expand("%:p:h") .. "/"

    vim.keymap.set("c", "<C-w>", "<backspace><C-w>")
    local binds = { { "<C-t>", "new_tab" }, { "<C-v>", "vsplit" }, { "<C-s>", "hsplit" }}
    local commands = {
        current = vim.cmd.e,
        new_tab = vim.cmd.tabnew,
        vsplit = vim.cmd.vs,
        hsplit = vim.cmd.sp }

    for _, v in pairs(binds) do
        vim.keymap.set("c", v[1], function()
            stat = v[2]
            vim.api.nvim_input("<cr>")
        end, { noremap = true }) end

    vim.ui.input({
        prompt="open: ",
        default=base_path,
        completion="file" },
        function(path)
            if not path then return end
            commands[stat](path) end)

    vim.keymap.del("c", "<C-w>")
    for _, v in pairs(binds) do
        vim.keymap.del("c", v[1]) end end)

vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd FileType Fyler setlocal nospell
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd VimLeavePre * mark L
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

vim.pack.add({
    "https://github.com/A7Lavinraj/fyler.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  auto_install = true,
  highlight = { enable = true } })

require("fyler").setup({
    confirm_simple = true,
    default_explorer = true,
    icon_provider = "none",
    icon = {
        directory_collapsed = "",
        directory_empty = "󰍴",
        directory_expanded = "" } })

vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { noremap = true })

require("filetypes")

-- Lazy
vim.schedule(function()
    vim.o.spell = true
    vim.o.spelllang = "en,ru"

    require("vim._extui").enable({ enable = true, msg = { target = "msg", timeout = 4000 } })
    pcall(require, "dap-config")

    vim.pack.add({
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/neovim/nvim-lspconfig",
        { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
        "https://github.com/nvim-lua/plenary.nvim",
        { src = "https://github.com/saghen/blink.cmp", version = "v1.7.0" },
        "https://github.com/ibhagwan/fzf-lua",
        "https://github.com/supermaven-inc/supermaven-nvim",
        "https://github.com/folke/sidekick.nvim" })

    require("blink.cmp").setup({
        cmdline = { enabled = false },
        completion = { menu = { auto_show = true }, documentation = { auto_show = true } } })

    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

    require("supermaven-nvim").setup({ ignore_filetypes = { "Fyler", "" } })
    require("supermaven-nvim.api").stop()
    vim.keymap.set({ "n", "i" }, "<M-g>", function()
        require("supermaven-nvim.api").toggle()
        if require("supermaven-nvim.api").is_running() then
            print("Supermaven is enabled")
        else
            print("Supermaven is disabled") end end)
    vim.keymap.set({ "n", "t" }, "<M-b>", function()
        require("sidekick.cli").toggle({ name = "gemini", focus = true }) end)

    require("fzf-lua").setup({{"ivy", "hide"}, winopts = { preview = { hidden = true } } })
    vim.keymap.set("n", "<C-p>", "<cmd>FzfLua files<cr>", { silent = true })
    vim.keymap.set("n", "", "<cmd>FzfLua live_grep<cr>", { silent = true })
    vim.keymap.set("n", "<C-f>", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { silent = true })
    vim.keymap.set("n", "z=", "<cmd>FzfLua spell_suggest<cr>", { silent = true })
    vim.keymap.set("n", "th", "<cmd>FzfLua helptags<cr>", { silent = true })
    vim.cmd.FzfLua("register_ui_select")

    -- LSP
    require("mason").setup()

    vim.keymap.set("n", "grd", function()
        vim.diagnostic.setqflist()
        vim.cmd("wincmd p") end, { silent = true })
    vim.keymap.set("n", "<leader>lr", function()
        vim.cmd.LspRestart()
        print("Lsp restart") end, { silent = true })
    vim.keymap.set("i", "<C-x><C-o>", vim.lsp.completion.get, { noremap = true })

    vim.lsp.enable({ "basedpyright", "djlsp" , "clangd", "bashls", "cssls",
        "css_variables", "html", "superhtml", "emmet_language_server", "ts_ls",
        "copilot" })
    vim.diagnostic.config({ jump = { float = true } })
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf }) end }) end)

-- Colors
vim.o.bg = "dark"

vim.pack.add({
    "https://github.com/craftzdog/solarized-osaka.nvim",
    "https://github.com/rose-pine/neovim" })

vim.cmd.colorscheme "rose-pine-main"

vim.pack.add({ "https://github.com/xiyaowong/transparent.nvim" })
require("transparent").setup({
    extra_groups = { "TabLine", "TabLineFill", "TabLineSel", "FloatBorder"},
    exclude_groups = { "CursorLine" } })

for _, bg in pairs({"DiagnosticWarn", "DiagnosticError", "DiagnosticHint", "DiagnosticInfo", "TabLineSel"}) do
    vim.api.nvim_set_hl(0, bg, { fg = "#ffffff" }) end
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#e0e2ea" })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#707070" })
