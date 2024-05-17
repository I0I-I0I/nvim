return {
	"coffebar/neovim-project",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	cmd = "NeovimProjectLoadRecent",
	opts = {
		projects = {
			"/mnt/d/code/project/app/*",
			"~/.config/nvim/lua/main",
			"~/.config/nvim/lua/mini",
		},
		last_session_on_startup = false,
		dashboard_mode = true,
	},
	init = function()
		vim.opt.sessionoptions:append("globals")
	end,
}
