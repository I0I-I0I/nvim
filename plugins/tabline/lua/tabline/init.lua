PathToTabline = "tabline."
local get_last_of_string = require(PathToTabline .. "utils.get_last_of_string")
local set_color = require(PathToTabline .. "utils.set_color")
local get_nvim_tree_window_size = require(PathToTabline .. "utils.resize")
local buffer_icon = require(PathToTabline .. "utils.buffer_icon")

TabLine = ""

local TabNormalColor = set_color("TabNormalColor", { fg = "#666666", bg = "NONE" })
local TabCurrentColor = set_color("TabCurrentColor", { fg = "#ffffff", bg = "NONE" })
local TabSepColor = set_color("TabSepColor", { fg = "#555555", bg = "NONE" })

local function tab_label(index)
	local buflist = vim.fn.tabpagebuflist(index)
	local winnr = vim.fn.tabpagewinnr(index)
	local current_file = get_last_of_string(vim.fn.bufname(buflist[winnr]), "/")
	return current_file
end

local function create_tab(index)
	local tab = {}
	tab.current = (index == vim.fn.tabpagenr())
	tab.str = tab_label(index)
	tab.icon = buffer_icon(index)
	tab.color = tab.current and TabCurrentColor or TabNormalColor
	return tab
end

local function update_tab(tab)
	tab.color = tab.current and TabCurrentColor or TabNormalColor
	return tab
end

local function tostring_tabline(tabline)
	local s = tabline[1].str
	for i = 2, #tabline do
		s = s
			.. tabline[i].icon
			.. tabline[i].color
			.. " "
			.. tabline[i].str
			.. " "
			.. TabSepColor
			.. " ┃ "
			.. TabNormalColor
	end
	return s
end

local function create_tabline()
	local tabline = {
		{ str = TabSepColor .. string.format("%" .. (get_nvim_tree_window_size()) .. "s┃", "") },
	}
	for i = 1, vim.fn.tabpagenr("$") do
		table.insert(tabline, create_tab(i))
	end
	TabLine = tostring_tabline(tabline)
	return function()
		tabline[1] = { str = TabSepColor .. string.format("%" .. (get_nvim_tree_window_size()) .. "s┃", "") }
		local current_tab = vim.fn.tabpagenr()
		for i = 2, #tabline do
			tabline[i].current = false
		end
		tabline[current_tab + 1] = create_tab(current_tab)
		for i = 2, #tabline do
			tabline[i] = update_tab(tabline[i])
		end
		TabLine = tostring_tabline(tabline)
	end
end

local udapte_tabline = create_tabline()

autocmd({ "TabNew", "TabClosed", "SessionLoadPost" }, {
	pattern = "*",
	callback = function()
		udapte_tabline = create_tabline()
		vim.opt.tabline = TabLine
	end,
})

autocmd("VimEnter", {
	callback = function()
		create_tabline()()
		vim.opt.tabline = TabLine
	end,
})

autocmd({ "TabEnter", "BufEnter", "WinResized" }, {
	pattern = "*",
	callback = function()
		TabNormalColor = set_color("TabNormalColor", { fg = "#666666", bg = "NONE" })
		TabCurrentColor = set_color("TabCurrentColor", { fg = "#ffffff", bg = "NONE" })
		TabSepColor = set_color("TabSepColor", { fg = "#555555", bg = "NONE" })
		if not vim.fn.expand("%"):match("NvimTree") then
			udapte_tabline()
			vim.opt.tabline = TabLine
		end
	end,
})

vim.opt.showtabline = 3
