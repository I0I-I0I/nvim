return {
	-- Telescope
	Plug("nvim-lua/plenary.nvim"),
	Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.6" }),

	-- Harpoon
	Plug("tiagovla/scope.nvim"),

	-- Git
	Plug("lewis6991/gitsigns.nvim"),

	-- Surround
	Plug("kylechui/nvim-surround", { ["tag"] = "*" }),

	-- TreeSitter
	Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" }),

	-- Undotree
	Plug("mbbill/undotree"),

	-- Bdelete
	Plug("moll/vim-bbye"),
}
