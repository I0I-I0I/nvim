vim.g.mapleader = ","
vim.g.maplocalleader = " "

function Bind(all_binds)
	for modes, binds in pairs(all_binds) do
		local mode = {}
		for m in modes:gmatch(".") do
			table.insert(mode, m)
		end
		for lhs, bind in pairs(binds) do
			local rhs = bind[1]
			local opts = bind[2] or {}
			opts.desc = bind.desc or ""

			vim.keymap.set(mode, lhs, rhs, opts)
		end
	end
end
