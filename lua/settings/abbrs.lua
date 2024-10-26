local function set_abbrs(abbrs)
	for abbr, value in pairs(abbrs) do
		vim.cmd.abbr(abbr, value)
	end
end

set_abbrs({
	W = "w",
	Wa = "wa",
	Wq = "wq",
	cl = "close",
	ccl = "cclose",
	n = "norm",
	vitewsl = "CHOKIDAR_USEPOLLING=true",
})
