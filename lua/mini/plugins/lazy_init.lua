local lazypath = vim.fn.stdpath("data") .. "/lazy.mini/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local function setup_lazy(plugins)
    require("lazy").setup({
        spec = plugins,

        root = vim.fn.stdpath("data") .. "/lazy.mini", -- directory where plugins will be installed
        lockfile = vim.fn.stdpath("config") .. "/lua/mini/plugins/lazy-lock.mini.json", -- lockfile generated after running update.
        state = vim.fn.stdpath("state") .. "/lazy.mini/state.json", -- state info for checker and other things
        pkg = {
            cache = vim.fn.stdpath("state") .. "/lazy.mini/pkg-cache.lua",
        },
        readme = {
            root = vim.fn.stdpath("state") .. "/lazy.mini/readme",
        },
        rocks = {
            root = vim.fn.stdpath("data") .. "/lazy-rocks.mini",
        },
        change_detection = {
            -- automatically check for config file changes and reload the ui
            enabled = true,
            notify = false, -- get a notification when changes are found
        },
    })
end

return setup_lazy
