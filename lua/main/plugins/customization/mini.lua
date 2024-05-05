local mini = {
	animate = {
		"echasnovski/mini.animate",
		version = false,
		lazy = true,
		event = { "BufRead", "BufNewFile" },
	},
}

function mini.animate.config()
	require("mini.animate").setup()
end

return {
	mini.animate,
}
