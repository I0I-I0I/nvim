function Bind(all_binds)
	local plugleader = { key = "<plugleader>", value = "," }
	local leader = { key = "<leader>", value = "<space>" }

	for modes, binds in pairs(all_binds) do
		local mode = {}
		for m in modes:gmatch(".") do
			table.insert(mode, m)
		end
		for lhs, bind in pairs(binds) do
			local rhs = bind[1]
			local opts = bind[2] or {}

			lhs = lhs:gsub(plugleader.key, plugleader.value)
			lhs = lhs:gsub(leader.key, leader.value)

			vim.keymap.set(mode, lhs, rhs, opts)
		end
	end
end
