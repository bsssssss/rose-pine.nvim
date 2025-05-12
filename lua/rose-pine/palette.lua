local options = require("rose-pine.config").options
local variants = {
	main = {
		_nc = "#16141f",
		base = "#191724",
		surface = "#1f1d2e",
		overlay = "#26233a",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ebbcba",
		pine = "#31748f",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		leaf = "#95b1ac",
		highlight_low = "#21202e",
		highlight_med = "#403d52",
		highlight_high = "#524f67",
		none = "NONE",
		mint = "#ACE697",
		sand = "#D1C29F",
		lagoon = "#75A6C7",
		turquoise = "#68DFC9",
		tea = "#ebbbb9",
	},
	moon = {
		_nc = "#1f1d30",
		base = "#262b38",
		surface = "#2D3343",
		overlay = "#353A52",
		muted = "#677598",
		subtle = "#8D92AA",
		text = "#C8C8D0",
		love = "#eb6f92",
		gold = "#D7B175",
		rose = "#ea9a97",
		pine = "#3e8fb0",
		foam = "#9CCFD8",
		iris = "#c4a7e7",
		leaf = "#95b1ac",
		highlight_low = "#343B4C",
		highlight_med = "#48526A",
		highlight_high = "#535E79",
		prune = "#717BC7",
		mint = "#ACE697",
		sand = "#D1C29F",
		lagoon = "#75A6C7",
		turquoise = "#68DFC9",
		tea = "#ebbbb9",
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
		turquoise = "#68DFC9",
		tea = "#ebbbb9",
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
