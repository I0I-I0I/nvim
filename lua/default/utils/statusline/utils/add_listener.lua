local function add_autocmd(pattern, event, update_fns, reload_fn, wait)
	autocmd(event, {
		pattern = pattern,
		callback = function()
			vim.defer_fn(function()
				for _, update_fn in ipairs(update_fns) do
					update_fn()
				end
				reload_fn()
			end, wait)
		end,
	})
end

local function add_listener(reload_fn)
	return function(pattern, event, update_fns, wait)
		add_autocmd(pattern, event, update_fns, reload_fn, wait or 0)
	end
end

return add_listener
