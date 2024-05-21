autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
		vim.lsp.start({
			capabilities = capabilities,
			cmd = { "lua-language-server" },
			init_options = {
				hostInfo = "neovim",
			},
			root_dir = vim.fn.getcwd(),
			settings = {
				Lua = {
					hint = { enable = true },
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						-- library = {
						-- "${3rd}/luv/library",
						-- unpack(vim.api.nvim_get_runtime_file("", true)),
						-- },
						library = { vim.env.VIMRUNTIME },
					},
					complition = {
						callSnippet = "Replace",
					},
					telemetry = { enable = false },
					diagnostics = {
						globals = {
							"vim",
							"augroup",
							"autocmd",
							"capabilities",
							"sources",
						},
					},
				},
			},
			single_file_support = true,
		})
	end,
})
