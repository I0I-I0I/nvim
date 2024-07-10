local Pets = {
	"giusgad/pets.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
	cmd = {
		"PETS",
		"PetsNewCustom",
		"PetsNew",
	},
}

function Pets.config()
	local pets = require("pets")
	pets.setup({
		row = 6, -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
		col = 0, -- the column to display the pet at (set to high number to have it stay still on the right side)
		speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
		default_pet = "dog", -- the pet to use for the PetNew command
		default_style = "brown", -- the style of the pet to use for the PetNew command
		random = false, -- whether to use a random pet for the PetNew command, overrides default_pet and default_style
		death_animation = true, -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
		popup = { -- popup options, try changing these if you see a rectangle around the pets
			width = "100%", -- can be a string with percentage like "45%" or a number of columns like 45
			winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
			hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
			avoid_statusline = false, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
			-- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
		},
	})

	vim.api.nvim_create_user_command("PETS", function()
		vim.cmd([[
            PetsNewCustom rocky gray rocky_first
            PetsNewCustom rocky gray rocky_second
            PetsNewCustom rocky gray rocky_third
            PetsNewCustom dog gray rocky_gray
            PetsNewCustom dog brown dog_brown
        ]])
	end, {})
end

return Pets
