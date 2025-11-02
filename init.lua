vim.loader.enable()

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
vim.o.scrolloff = 1
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
vim.o.completeopt = "menu,menuone,noinsert,popup,nearest"
vim.o.cmdheight = 0
vim.o.undofile = true
vim.o.undolevels = 10000000
vim.o.undoreload = 10000000
vim.o.langmap =
"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняжб;abcdefghijklmnopqrstuvwxyz\\;\\,"

vim.keymap.set({ "v", "n" }, "<C-y>", "4<C-y>")
vim.keymap.set({ "v", "n" }, "<C-e>", "4<C-e>")
vim.keymap.set({ "n", "t", "i" }, "<M-o>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set({ "n", "t", "i" }, "<M-i>", "<cmd>tabprevious<cr>", { silent = true })
vim.keymap.set({ "n", "t", "i" }, "<M-S-o>", "<cmd>tabmove +<cr>", { silent = true })
vim.keymap.set({ "n", "t", "i" }, "<M-S-i>", "<cmd>tabmove -<cr>", { silent = true })
vim.keymap.set("n", "<C-w>t", "<cmd>tab term<cr>", { silent = true })
vim.keymap.set("n", "<C-w>g", "<cmd>tab term gitu<cr><cmd>norm! i<cr>", { silent = true })
vim.keymap.set("n", "<C-S-k>", "<cmd>cprev<CR>zz", { noremap = true })
vim.keymap.set("n", "<C-S-j>", "<cmd>cnext<CR>zz", { noremap = true })
vim.keymap.set("n", "Q", "@@")
vim.keymap.set("n", "gw", "<cmd>bp|bd #<cr>", { silent = true })
vim.keymap.set("n", "gW", "<cmd>bp|bd! #<cr>", { silent = true })
vim.keymap.set("n", "<M-c>", ":let @+=expand('%:p')<cr>", { silent = true })
vim.keymap.set("n", "<leader>o", ":!xdg-open . <cr>", { silent = true })
vim.keymap.set("n", "=ap", "ma=ap`a")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set("x", "P", "\"_dP")
vim.keymap.set("x", "D", "\"_d")
vim.keymap.set("x", "C", "\"_c")
vim.keymap.set({ "n", "v" }, "<leader>'", function()
    vim.ui.input({ prompt = "From: " }, function(from)
        if not from or from == "" then return end
        vim.ui.input({ prompt = "From " .. from .. " to: " }, function(to)
            if not to or to == "" then return end
            vim.cmd("let @" .. to .. "=@" .. from)
        end)
    end)
end)

vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd FileType fyler setlocal nospell
    autocmd TextYankPost * silent! lua vim.hl.on_yank({higroup="IncSearch", timeout=150})
    autocmd VimLeavePre * mark L
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   silent! normal! g`"zz |
        \ endif
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p") ]])

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = { enable = true }
})

vim.pack.add({ "https://github.com/A7Lavinraj/fyler.nvim", "https://github.com/nvim-mini/mini.icons" })
require("fyler").setup({
    views = {
        finder = {
            confirm_simple = true,
            default_explorer = true,
            git_status = { enabled = false },
            icon = {
                directory_collapsed = "",
                directory_empty = "󰍴",
                directory_expanded = ""
            }
        }
    }
})

vim.keymap.set("n", "<C-b>", "<cmd>Fyler<cr>", { noremap = true })

-- vim.pack.add({ "https://github.com/i0i-i0i/sessions.nvim" })
vim.opt.runtimepath:append("/home/nnofly/code/personal/sessions.nvim")
require("sessions").setup({})

vim.keymap.set({ "n", "t" }, "<C-s>", "<cmd>Sessions list<cr>", { noremap = true })
vim.keymap.set({ "n", "t" }, "<C-S-l>", "<cmd>Sessions last<cr>", { noremap = true })
vim.keymap.set("n", "<leader>sa", "<cmd>Sessions pin<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ss", "<cmd>Sessions load<cr>", { noremap = true })

local commands = require("sessions.commands")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            if vim.fn.argc() == 0 then
                commands.load()
            end
        end)
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        local utils = require("sessions.utils")
        if utils.contains(vim.bo.filetype,
                { "gitcommit", "fyler" }) then
            return
        end
        commands.save()
    end
})

require("filetypes")
require("pack")

-- Lazy
vim.schedule(function()
    vim.o.spell = true
    vim.o.spelllang = "en,ru"

    require("vim._extui").enable({ enable = true, msg = { target = "msg", timeout = 4000 } })
    pcall(require, "dap-config")

    vim.pack.add({
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/stevearc/conform.nvim",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/j-hui/fidget.nvim",
        { src = "https://github.com/ThePrimeagen/harpoon",          version = "harpoon2" },
        { src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
        "https://github.com/nvim-telescope/telescope-file-browser.nvim",
        "https://github.com/stevearc/dressing.nvim",
        { src = "https://github.com/saghen/blink.cmp", version = "v1.7.0" },
        "https://github.com/jake-stewart/multicursor.nvim",
        "https://github.com/supermaven-inc/supermaven-nvim",
        "https://github.com/lewis6991/gitsigns.nvim",
        "https://github.com/stevearc/quicker.nvim",
        "https://github.com/folke/sidekick.nvim" })

    vim.keymap.set("n", "<M-g>b", "<cmd>Gitsigns blame<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<M-g>r", "<cmd>Gitsigns reset_hunk<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<M-g>c", "<cmd>Gitsigns show_commit<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<M-g>q", function()
        vim.cmd.Gitsigns("toggle_word_diff")
        vim.cmd.Gitsigns("setqflist")
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<C-S-'>", "<cmd>Gitsigns toggle_deleted<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-'>", "<cmd>Gitsigns preview_hunk<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader><C-'>", "<cmd>Gitsigns preview_hunk_inline<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { noremap = true, silent = true })

    require("quicker").setup({
        keys = {
            { ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end },
            { "<", function() require("quicker").collapse() end }
        },
    })
    vim.keymap.set("n", "<C-q>", require("quicker").toggle)

    require("blink.cmp").setup({
        cmdline = { enabled = false },
        completion = { menu = { auto_show = true }, documentation = { auto_show = true } },
        signature = { enabled = true }
    })

    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

    require("supermaven-nvim").setup({ ignore_filetypes = { "fyler", "" } })
    vim.keymap.set({ "n", "i" }, "<C-g>", function()
        require("supermaven-nvim.api").toggle()
        if require("supermaven-nvim.api").is_running() then
            print("Supermaven is enabled")
        else
            print("Supermaven is disabled")
        end
    end)

    require("sidekick").setup({
        nes = { enabled = false },
        cli = { win = { split = { width = 1 } } }
    })
    vim.keymap.set({ "n", "t" }, "<C-M-b>", function()
        require("sidekick.cli").toggle({ name = "gemini", focus = true })
    end)

    require("dressing").setup({})
    require("telescope").setup({
        defaults = {
            scroll_strategy = "limit",
            layout_strategy = "bottom_pane",
            layout_config = { height = 0.3, prompt_position = "bottom" },
            sorting_strategy = "ascending",
        },
        extensions = {
            file_browser = {
                select_buffer = true,
                hidden = { file_browser = true, folder_browser = true },
                mappings = {
                    ["i"] = { ["<Tab>"] = require("telescope.actions").select_default },
                    ["n"] = { ["<Tab>"] = require("telescope.actions").select_default },
                },
            }
        }
    })

    require("telescope").load_extension("file_browser")
    local builtin, themes = require("telescope.builtin"), require("telescope.themes")
    vim.keymap.set("n", "<C-f>", "<cmd>Telescope file_browser path=%:p:h<cr>", { silent = true })
    vim.keymap.set("n", "<C-p>", function() builtin.find_files() end, { silent = true })
    vim.keymap.set("n", "g/", function() builtin.live_grep() end, { silent = true })
    vim.keymap.set("n", "<C-t>", function() builtin.lsp_dynamic_workspace_symbols() end,
        { silent = true })
    vim.keymap.set("n", "z=", function() builtin.spell_suggest(themes.get_cursor()) end, { silent = true })
    vim.keymap.set("n", "th", function() builtin.help_tags() end, { silent = true })

    local mc = require("multicursor-nvim")
    mc.setup()
    vim.keymap.set({ "n", "x" }, "<M-k>", function() mc.lineAddCursor(-1) end)
    vim.keymap.set({ "n", "x" }, "<M-j>", function() mc.lineAddCursor(1) end)
    vim.keymap.set({ "n", "x" }, "<M-S-k>", function() mc.lineSkipCursor(-1) end)
    vim.keymap.set({ "n", "x" }, "<M-S-j>", function() mc.lineSkipCursor(1) end)
    vim.keymap.set({ "n", "x" }, "<M-n>", function() mc.matchAddCursor(1) end)
    vim.keymap.set({ "n", "x" }, "<M-S-n>", function() mc.matchSkipCursor(1) end)
    vim.keymap.set({ "n", "x" }, "<M-p>", function() mc.matchAddCursor(-1) end)
    vim.keymap.set({ "n", "x" }, "<M-S-p>", function() mc.matchSkipCursor(-1) end)
    vim.keymap.set({ "n", "x" }, "<M-a>", mc.matchAllAddCursors)
    vim.keymap.set({ "n", "x" }, "<M-q>", mc.toggleCursor)
    vim.keymap.set("x", "I", mc.insertVisual)
    vim.keymap.set("x", "A", mc.appendVisual)
    vim.keymap.set("n", "<leader>gv", mc.restoreCursors)
    mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<M-h>", mc.prevCursor)
        layerSet({ "n", "x" }, "<M-l>", mc.nextCursor)
        layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor)
        layerSet("n", "<leader>a", mc.alignCursors)
        layerSet("n", "", function()
            if not mc.cursorsEnabled() then mc.enableCursors() else mc.clearCursors() end
        end)
    end)

    -- LSP
    require("fidget").setup({})
    require("mason").setup()

    vim.keymap.set("n", "grd", "<cmd>lua vim.diagnostic.setqflist()<cr><cmd>wincmd p<cr>", { silent = true })
    vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr><cmd>echo 'Lsp restart'<cr>", { silent = true })

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    require("conform").setup({
        formatters_by_ft = {
            python = { "ruff_format" },
            html = { "prettierd" },
            css = { "prettierd" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescriptreact = { "prettierd" }
        },
        format_after_save = { lsp_format = "fallback", timeout_ms = 500, async = true }
    })

    vim.lsp.enable({ "basedpyright", "lua_ls", "ruff", "clangd", "bashls", "cssls",
        "css_variables", "html", "emmet_language_server", "ts_ls" })
    vim.diagnostic.config({ jump = { float = true }, virtual_text = true, signs = false })

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf })

            if client.server_capabilities.documentHighlightProvider then
                local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    group = group,
                    buffer = args.buf,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    group = group,
                    buffer = args.buf,
                    callback = vim.lsp.buf.clear_references,
                })
                vim.api.nvim_set_hl(0, "LspReferenceRead", { bold = true, underdotted = true })
            end
        end
    })
end)

-- Colors
vim.pack.add({
    "https://github.com/Verf/deepwhite.nvim",
    "https://github.com/craftzdog/solarized-osaka.nvim",
    "https://github.com/slugbyte/lackluster.nvim",
    "https://github.com/ramojus/mellifluous.nvim",
    "https://github.com/sainnhe/everforest",
    "https://github.com/aktersnurra/no-clown-fiesta.nvim",
    "https://github.com/rose-pine/neovim" })

vim.pack.add({ "https://github.com/xiyaowong/transparent.nvim" })
require("transparent").setup({
    extra_groups = { "TabLine", "TabLineFill", "TabLineSel", "FloatBorder", "WinSeparator",
        "GitsignsAdd", "GitsignsChange", "GitsignsDelete", "GitsignsChangeDelete", "SidekickChat" },
    exclude_groups = { "CursorLine" }
})

vim.g.everforest_enable_italic = 1
vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1
vim.g.everforest_spell_foreground = "colored"
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_line_highlight = 1
vim.g.everforest_diagnostic_virtual_text = 1
vim.g.everforest_current_word = "italic"

require("gnome-track").setup(function(scheme)
    vim.cmd.colo "default"
    if scheme == "prefer-dark" then
        vim.o.bg = "dark"
        vim.cmd.colorscheme "mellifluous"
        vim.schedule(function() vim.cmd("TransparentEnable") end)
    else
        vim.o.bg = "light"
        vim.cmd.colorscheme "deepwhite"
        vim.schedule(function() vim.cmd("TransparentDisable") end)
    end
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#dadada" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#000000" })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { bold = true, underdotted = true })
end)
