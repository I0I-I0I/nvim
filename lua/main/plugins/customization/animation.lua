local Animation = {
	"yuttie/comfortable-motion.vim",
	event = "VeryLazy",
}

function Animation.config()
	local opts = { silent = true, noremap = true }

	vim.g.comfortable_motion_no_default_key_mappings = 1
	vim.g.comfortable_motion_scroll_down_key = "j"
	vim.g.comfortable_motion_scroll_up_key = "k"

	vim.keymap.set("n", "<C-d>", "<cmd>call comfortable_motion#flick(110)<cr>", opts)
	vim.keymap.set("n", "<C-u>", "<cmd>call comfortable_motion#flick(-110)<cr>", opts)
	vim.keymap.set("n", "<ScrollWheelDown>", "<cmd>call comfortable_motion#flick(40)<cr>", opts)
	vim.keymap.set("n", "<ScrollWheelUp>", "<cmd>call comfortable_motion#flick(-40)<cr>", opts)
end

return Animation
