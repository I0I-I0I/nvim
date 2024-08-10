local M = {
	"backdround/neowords.nvim",
}

M.keys = function()
	local neowords = require("neowords")
	local p = neowords.pattern_presets
	local subword_hops = neowords.get_word_hops(
		p.snake_case,
		p.camel_case,
		p.upper_case,
		p.number,
		p.hex_color,
		"\\v\\.\\.",
		'\\v"[ ]*"',
		"\\v[{(\\[]$",
		"\\v[})\\]]$"
	)

	return {
		{ "w", subword_hops.forward_start, mode = { "n", "x", "o" } },
		{ "e", subword_hops.forward_end, mode = { "n", "x", "o" } },
		{ "b", subword_hops.backward_start, mode = { "n", "x", "o" } },
		{ "ge", subword_hops.backward_end, mode = { "n", "x", "o" } },
	}
end

return M
