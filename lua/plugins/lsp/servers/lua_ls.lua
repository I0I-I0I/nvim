local function luals()
	local lua_opts = lsp_zero.nvim_lua_ls()
	lspconfig.lua_ls.setup(lua_opts)
end

return luals
