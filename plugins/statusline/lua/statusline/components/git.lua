-- Set style
local style = require(Statusline_Constants .. "style")[Styles.git]
local str = style("StatusMasterColor", {
	fg = COLORS.git_status.master.fg,
})

table.insert(Colors_List, function()
	str = style("StatusMasterColor", {
		fg = COLORS.git_status.master.fg,
	})
end)

-- Component

local function git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if string.len(branch) <= 0 then
		return ""
	end

	return STATUSLINE_ICONS.git .. branch
end

local function update_git()
	GIT = str(git_branch())
end

GIT = ""

return update_git
