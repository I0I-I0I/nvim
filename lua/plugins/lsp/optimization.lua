local M = { "hinell/lsp-timeout.nvim" }

M.dependencies={ "neovim/nvim-lspconfig" }

M.init = function ()
	vim.g.lspTimeoutConfig = {
		stopTimeout  = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
		startTimeout = 1000 * 10,     -- ms, timeout before restart
		silent       = false,         -- true to suppress notifications
	}
end

M.config = function ()
	local Config = require("lsp-timeout.config").Config
	Config:new(vim.g.lspTimeoutConfig):validate()
end

return M
