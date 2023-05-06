local wezterm = require("wezterm")

local schemes = wezterm.get_builtin_color_schemes()

local function query_appearance_gnome()
	local success, stdout =
		wezterm.run_child_process({ "gsettings", "get", "org.gnome.desktop.interface", "gtk-theme" })

	stdout = stdout:lower():gsub("%s+", "")

	local mapping = {
		adwaita = "Light",
		["adwaita-dark"] = "Dark",
		["adw-gtk3"] = "Light",
		["adw-gtk3-dark"] = "Dark",
		["Catppuccin-Macchiato-Standard-Blue-Dark"] = "Dark",
		["Catppuccin-Latte-Standard-Blue-Light"] = "Light",
	}

	local appearance = mapping[stdout]

	if appearance then
		return appearance
	end

	if stdout:find("dark") then
		return "Dark"
	else
		return "Light"
	end
end

wezterm.on("update-status", function(window)
	local overrides = window:get_config_overrides() or {}
	local theme = query_appearance_gnome()

	if theme == "Dark" then
		overrides.color_scheme = "Catppuccin Macchiato"
	else
		overrides.color_scheme = "Catppuccin Latte"
	end

	window:set_config_overrides(overrides)
end)

return {
	font = wezterm.font("Console"),
	font_size = 14,
	line_height = 1.4,
	clean_exit_codes = { 0, 130 },
	enable_scroll_bar = false,
	scrollback_lines = 10000,
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	colors = {
		selection_fg = "none",
		selection_bg = "rgba(237 135 150 10%)",
	},
	term = "wezterm",
	skip_close_confirmation_for_processes_named = {
		"bash",
		"sh",
		"zsh",
		"fish",
		"tmux",
		"nu",
		"cmd.exe",
		"pwsh.exe",
		"powershell.exe",
		"cava",
	},
	use_resize_increments = true,
	window_background_opacity = 0.7,
	window_decorations = "NONE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_cols = 125,
	initial_rows = 26,
	underline_position = "-0.2cell",
	underline_thickness = "0.06cell",
	hyperlink_rules = {
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = "mailto:$0",
		},
		{
			regex = [[\bfile://\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},
		{
			regex = [["([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)"]],
			format = "https://github.com/$1/$3",
		},
	},
	unicode_version = 14,
}

-- vim: et ts=2 sw=2
