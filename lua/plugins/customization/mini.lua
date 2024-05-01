local mini = {
	animate = {
		"echasnovski/mini.animate",
		version = false,
		lazy = true,
		event = { "BufRead", "BufNewFile" },
	},
	ai = {
		"echasnovski/mini.ai",
		event = { "BufRead", "BufNewFile" },
		lazy = true,
		version = false,
	},
	bracketed = {
		"echasnovski/mini.bracketed",
		event = { "BufRead", "BufNewFile" },
		lazy = true,
		version = false,
	},
}

function mini.animate.config()
	require("mini.animate").setup()
end

return {
	mini.animate,
	mini.ai,
	mini.bracketed,
}
