vim.loader.enable()

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 21
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.cmd([[let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+']])
vim.g.mapleader = " "
vim.g.maplocalleader = "" -- <C-x>
vim.o.lazyredraw = true
vim.o.updatetime = 300
vim.o.swapfile = false
vim.o.mouse = "a"
vim.o.hidden = true
vim.o.list = true
vim.o.wildmode = "longest:full,full"
vim.o.wildmenu = true
vim.o.laststatus = 3
vim.o.ignorecase = true
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
vim.o.completeopt = "menuone,noinsert,popup,fuzzy"
vim.o.cmdheight = 0
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняжб;abcdefghijklmnopqrstuvwxyz\\;\\,"

vim.keymap.set("n", "<C-y>", "4<C-y>")
vim.keymap.set("n", "<C-e>", "4<C-e>")
vim.keymap.set("n", "<M-o>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<M-i>", "<cmd>tabprevious<cr>", { silent = true })
vim.keymap.set("n", "<M-S-o>", "<cmd>tabmove +<cr>", { silent = true })
vim.keymap.set("n", "<M-S-i>", "<cmd>tabmove -<cr>", { silent = true })
vim.keymap.set("n", "-", "<cmd>Lex %:p:h<cr>", { noremap = true })
vim.keymap.set("n", "<leader>-", "<cmd>Lex<cr>", { noremap = true })
vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true })
vim.keymap.set("n", "<M-c>", ":let @+=expand('%:p')<cr>", { silent = true })
vim.keymap.set("n", "<M-S-c>", ":let @+=expand('%:p') . ':' . line('.')<cr>", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>!tmux neww tmux-sessionizer<cr>", { silent = true })
vim.keymap.set("c", "<C-w>", "<backspace><C-w>")
vim.keymap.set("n", "<leader>N", ":tabnew ~/Sync/notes/.md<Left><Left><Left>")
vim.keymap.set("n", "<leader>q", "<cmd>mksession!<cr><cmd>wa<cr><cmd>qa<cr>", { silent = true })

vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<A-b>", "<C-f>bb<C-c>")
vim.keymap.set("c", "<A-f>", "<C-f>w<C-c>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-d>", "<Del>")
vim.keymap.set("c", "<C-s>", "<C-f>")

vim.keymap.set("n", "<localleader><C-f>", ":e <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<localleader><C-s>", ":sp <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<localleader><C-v>", ":vs <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<localleader><C-n>", ":tabnew <C-r>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<localleader><C-r>", function()
    local old_name = vim.fn.expand("%")
    local new_name = vim.fn.input("New file name: ", vim.fn.expand("%:p"), "file")
    if new_name ~= "" and new_name ~= old_name then
        os.rename(old_name, new_name)
        vim.cmd("e " .. new_name)
        vim.cmd("bd #")
    end end)
vim.keymap.set("n", "<localleader><C-d>", function()
    local filename = vim.fn.expand("%")
    local ask = vim.fn.input("Delete " .. filename .. "? [y/n] ")
    if filename ~= "" and ask == "y" or ask == "Y" then
        os.remove(filename)
        vim.cmd("bp|bd! #")
    end end)
vim.keymap.set("n", "<localleader><C-y>", function()
    local filename = vim.fn.expand("%:p:h")
    os.execute("tmux neww 'yazi " .. filename .. "'") end)

vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true }})
require("make")

-- Lazy
vim.schedule(function()
    vim.o.spell = true
    vim.o.spelllang = "en,ru"

    vim.api.nvim_create_user_command("LoadDapConfig", function() require("dap-config") end, {})
    require("vim._extui").enable({ enable = true, msg = { target = "msg", timeout = 4000 } })

    vim.pack.add({
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/ibhagwan/fzf-lua",
        "https://github.com/jake-stewart/multicursor.nvim",
        { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
        "https://github.com/Exafunction/windsurf.nvim",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/MeanderingProgrammer/render-markdown.nvim",
        "https://github.com/3rd/image.nvim" })

    vim.keymap.set("n", "<leader>c", function()
        require("codeium").setup({
            enable_chat = false,
            enable_cmp_source = false,
            virtual_text = { enabled = true } }) end)
    require("mason").setup()
    require("render-markdown").setup({})
    require("image").setup({ integrations = { markdown = {
                only_render_image_at_cursor = true,
                only_render_image_at_cursor_mode = "inline" }}})

    require("fzf-lua").setup({"ivy"})
    vim.keymap.set("n", "<C-p>", ":FzfLua files<cr>", { silent = true })
    vim.keymap.set("n", "", ":FzfLua grep<cr>", { silent = true })
    vim.keymap.set("n", "th", ":FzfLua helptags<cr>", { silent = true })
    vim.keymap.set("n", "tm", ":FzfLua manpages<cr>", { silent = true })
    vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = "NONE" })

    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

    local mc = require("multicursor-nvim")
    mc.setup()
    vim.keymap.set({"n", "x"}, "<A-k>", function() mc.lineAddCursor(-1) end)
    vim.keymap.set({"n", "x"}, "<A-j>", function() mc.lineAddCursor(1) end)
    vim.keymap.set({"n", "x"}, "<A-S-k>", function() mc.lineSkipCursor(-1) end)
    vim.keymap.set({"n", "x"}, "<A-S-j>", function() mc.lineSkipCursor(1) end)
    vim.keymap.set({"n", "x"}, "<A-n>", function() mc.matchAddCursor(1) end)
    vim.keymap.set({"n", "x"}, "<A-S-n>", function() mc.matchSkipCursor(1) end)
    vim.keymap.set({"n", "x"}, "<A-p>", function() mc.matchAddCursor(-1) end)
    vim.keymap.set({"n", "x"}, "<A-S-p>", function() mc.matchSkipCursor(-1) end)
    vim.keymap.set({"n", "x"}, "<A-a>", mc.matchAllAddCursors)
    vim.keymap.set({"n", "x"}, "<A-q>", mc.toggleCursor)
    vim.keymap.set("x", "I", mc.insertVisual)
    vim.keymap.set("x", "A", mc.appendVisual)
    vim.keymap.set("n", "<leader>gv", mc.restoreCursors)
    mc.addKeymapLayer(function(layerSet)
        layerSet({"n", "x"}, "<A-h>", mc.prevCursor)
        layerSet({"n", "x"}, "<A-l>", mc.nextCursor)
        layerSet({"n", "x"}, "<A-x>", mc.deleteCursor)
        layerSet("n", "<leader>a", mc.alignCursors)
        layerSet("n", "", function()
            if not mc.cursorsEnabled() then mc.enableCursors() else mc.clearCursors() end end)
    end)

    -- LSP
    vim.keymap.set("n", "grd", vim.diagnostic.setqflist, { silent = true })
    vim.keymap.set("n", "<leader>l", function()
        vim.lsp.stop_client(vim.lsp.get_active_clients())
        vim.cmd("w|e")
    end, { silent = true })
    vim.keymap.set("i", "<C-space>", vim.lsp.completion.get)
    vim.keymap.set("i", "<CR>", function()
        if vim.fn.pumvisible() == 1 then
            return vim.api.nvim_replace_termcodes("<C-e><CR>", true, true, true) end
        return "<CR>"
    end, { expr = true, noremap = true })

    vim.diagnostic.config({ jump = { float = true }, float = { source = true } })
    vim.lsp.enable({ "basedpyright", "ruff", "djlsp" , "clangd", "bashls", "lua_ls", "cssls",
                     "css_variables", "html", "emmet_language_server", "ts_ls", "superhtml" })
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            vim.keymap.set("n", "<C-w>d", function()
                vim.diagnostic.open_float()
                vim.diagnostic.open_float()
            end, { buffer = args.buf })
            vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })
            if client:supports_method("textDocument/completion") then
                local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
                client.server_capabilities.completionProvider.triggerCharacters = chars
                vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            end
        end })
end)

-- Color
vim.pack.add({
    "https://github.com/ntk148v/komau.vim",
    "https://github.com/craftzdog/solarized-osaka.nvim" })

-- vim.cmd("colo solarized-osaka")
vim.cmd("colo quiet")
local bgs = {"DiagnosticWarn", "DiagnosticError", "DiagnosticHint", "DiagnosticInfo"}
local date = tonumber(os.date("%H"))
if date >= 22 or date < 6 then
-- if true then
    vim.o.bg = "dark"
    vim.pack.add({"https://github.com/xiyaowong/transparent.nvim"})
    require("transparent").setup({
        extra_groups = { "TabLine", "TabLineFill", "TabLineSel", "Folded", "NormalFloat"},
        exclude_groups = { "CursorLine" } })
    for _, bg in pairs(bgs) do vim.api.nvim_set_hl(0, bg, { fg = "#ffffff" }) end
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#e0e2ea" })
else
    vim.o.bg = "light"
    for _, bg in pairs(bgs) do vim.api.nvim_set_hl(0, bg, { fg = "#000000" }) end
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#aaaaaa" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#aaaaaa" })
end
