local wezterm = require("wezterm")

local function query_appearance_gnome()
  local _, stdout = wezterm.run_child_process({ "gsettings", "get", "org.gnome.desktop.interface", "gtk-theme" })

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

--wezterm.on("update-status", function(window)
--  local overrides = window:get_config_overrides() or {}
--  local theme = query_appearance_gnome()
--
--  if theme == "Dark" then
--    overrides.color_scheme = "Catppuccin Macchiato"
--  else
--    overrides.color_scheme = "Catppuccin Latte"
--  end
--
--  window:set_config_overrides(overrides)
--end)

return {
  font = wezterm.font("UDEV Gothic NFLG"),
  font_size = 11,
  color_scheme = "Catppuccin Mocha",
  line_height = 1.4,
  clean_exit_codes = { 0, 130 },
  --enable_scroll_bar = true,
  scrollback_lines = 10000,
  --enable_tab_bar = false,
  --use_fancy_tab_bar = false,
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
  --use_resize_increments = true,
  window_decorations = "INTEGRATED_BUTTONS | RESIZE",
  --window_decorations = "RESIZE",
  integrated_title_button_color = "#cdd6f4",
  integrated_title_button_style = "Gnome",
  --window_padding = {
  --  left = 0,
  --  right = 0,
  --  top = 0,
  --  bottom = 0,
  --},
  initial_cols = 125,
  initial_rows = 26,
  underline_position = "-0.2cell",
  underline_thickness = "0.06cell",
  front_end = "WebGpu",
  use_cap_height_to_scale_fallback_fonts = true,
  keys = {
    { key = "LeftArrow",  mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
    { key = "RightArrow", mods = "CTRL|SHIFT", action = "DisableDefaultAssignment" },
  },
  colors = {
    tab_bar = {
      inactive_tab_edge = "#575757",
      active_tab = {
        bg_color = "#1e1e2e",
        fg_color = "#bbc4e2",
      },
      inactive_tab = {
        bg_color = "#181827",
        fg_color = "#7b839e",
      },
      inactive_tab_hover = {
        bg_color = "#252535",
        fg_color = "#7b839e",
      },
      new_tab = {
        bg_color = "#181827",
        fg_color = "#7b839e",
      },
      new_tab_hover = {
        bg_color = "#252535",
        fg_color = "#7b839e",
      },
    },
  },
  --window_background_opacity = 0.9,
  window_frame = {
    font = wezterm.font { family = "Noto Sans" },

    inactive_titlebar_bg = "#141424",
    active_titlebar_bg = "#1e1e2e",
    --active_titlebar_bg = "#303030",
    inactive_titlebar_fg = "#cccccc",
    active_titlebar_fg = "#ffffff",
    inactive_titlebar_border_bottom = "#2b2042",
    active_titlebar_border_bottom = "#2b2042",
    button_fg = "#ffffff",
    button_bg = "#444444",
    button_hover_fg = "#ffffff",
    button_hover_bg = "#4f4f4f",
    --border_left_width = "0.2cell",
    --border_right_width = "0.2cell",
    --border_bottom_height = "0.05cell",
    --border_top_height = "0.05cell",
    border_left_color = "#393939",
    border_right_color = "#393939",
    border_bottom_color = "#393939",
    border_top_color = "#393939",
  },
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
  warn_about_missing_glyphs = false,
  enable_kitty_keyboard = true,
}

-- vim: et ts=2 sw=2
