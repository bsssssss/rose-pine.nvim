local options = require("rose-pine.config").options
local variants = {
	main = {
		-- stylua: ignore-start
		base    = "#222222",
		surface = "#2f2f2f",
		overlay = "#404040",
		muted   = "#5e5e5e",
		subtle  = "#999999",
		text    = "#DfDeD0",
		prune   = "#717BC7",
		iris    = "#c4a7e7",
		love    = "#eb6f92",
		gold    = "#D7B175",
		rose    = "#fbbaba",
		pine    = "#31748f",
		lagoon  = "#75A6C7",
		foam    = "#9ccfd8",
		mint    = "#ACE697",
		leaf    = "#95b1ac",
		sand    = "#D1C29F",

		highlight_low  = "#323232",
		highlight_med  = "#454545",
		highlight_high = "#535353",

		none = "NONE",
		_nc  = "#222222",
		-- stylua: ignore-end
	},
	moon = {
		_nc = "#1f1d30",
		base = "#222222",
		surface = "#252525",
		overlay = "#303030",
		muted = "#777777",
		subtle = "#888888",
		text = "#C8C8D0",
		love = "#eb6f92",
		gold = "#D7B175",
		rose = "#ea9a97",
		pine = "#3e8fb0",
		foam = "#9CCFD8",
		iris = "#c4a7e7",
		leaf = "#95b1ac",
		highlight_low = "#353535",
		highlight_med = "#484848",
		highlight_high = "#535353",
		prune = "#717BC7",
		mint = "#ACE697",
		sand = "#D1C29F",
		lagoon = "#75A6C7",
		none = "NONE",
	},
	dawn = {
		_nc = "#f8f0e7",
		base = "#faf4ed",
		surface = "#fffaf3",
		overlay = "#f2e9e1",
		muted = "#9893a5",
		subtle = "#797593",
		text = "#464261",
		love = "#b4637a",
		gold = "#ea9d34",
		rose = "#d7827e",
		pine = "#286983",
		foam = "#56949f",
		iris = "#907aa9",
		leaf = "#6d8f89",
		highlight_low = "#f4ede8",
		highlight_med = "#dfdad9",
		highlight_high = "#cecacd",
		none = "NONE",
		mint = "#ACE697",
		sand = "#D1C29F",
		lagoon = "#75A6C7",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.dawn or variants[options.dark_variant or "main"]
