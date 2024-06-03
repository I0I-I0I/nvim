local keymap = vim.keymap.set
local opts = { noremap = true }

local function yankCutPast(motions, registers)
	for _, motion in pairs(motions) do
		for i = 1, 5 do
			if motion == "p" then
				keymap({ "n", "v" }, i .. motion, '"' .. registers[i] .. motion, opts)
			else
				keymap("v", i .. motion, '"' .. registers[i] .. motion, opts)
				keymap("n", i .. motion .. motion, '"' .. registers[i] .. motion .. motion, opts)
			end
		end
	end
end

local registers = { "z", "x", "c", "v", "b" }
local motions = { "y", "d", "c", "p" }

yankCutPast(motions, registers)
