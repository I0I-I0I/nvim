local Leap = {
	"ggandor/leap.nvim",
	keys = {
		{ "s" },
		{ "S" },
	},
}

function Leap.config()
	local leap = require("leap")

	leap.opts.special_keys.next_target = "<enter>"
	leap.opts.special_keys.prev_target = "<tab>"
	-- leap.opts.special_keys.next_group = "<space>"
	leap.opts.special_keys.prev_group = "<tab>"
	leap.opts.special_keys.multi_accept = "<enter>"
	leap.opts.special_keys.multi_revert = "<backspace>"
	leap.opts.equivalence_classes = { " \t\r\n" }

	vim.keymap.set("n", "s", "<Plug>(leap-forward-to)")
	vim.keymap.set("n", "S", "<Plug>(leap-backward-to)")
end

return Leap
