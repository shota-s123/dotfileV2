-- ~/.wezterm.lua
local wezterm = require "wezterm"
local config = wezterm.config_builder and wezterm.config_builder() or {}

config.automatically_reload_config = true

-- ---------------------------------------------------------
-- Font
-- ---------------------------------------------------------
config.font = wezterm.font("Moralerspace Neon")
config.font_size = 14

-- ---------------------------------------------------------
-- tmux support
-- ---------------------------------------------------------
config.enable_kitty_keyboard = true

-- ---------------------------------------------------------
-- Color scheme
-- ---------------------------------------------------------
config.color_scheme = "Dracula (Official)"

-- ---------------------------------------------------------
-- Window appearance
-- ---------------------------------------------------------
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_padding = { left = 10, right = 10, top = 8, bottom = 8 }
config.initial_cols = 140
config.initial_rows = 40

-- Inactive pane dimming (focus clarity)
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

-- ---------------------------------------------------------
-- GPU rendering + smooth animation
-- ---------------------------------------------------------
config.front_end = "WebGpu"
config.animation_fps = 60
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.cursor_blink_rate = 500
config.default_cursor_style = "BlinkingBar"

-- ---------------------------------------------------------
-- Scrollback (for long Claude Code output)
-- ---------------------------------------------------------
config.scrollback_lines = 100000
config.enable_scroll_bar = true

-- ---------------------------------------------------------
-- Tab bar (tabline.wez plugin)
-- ---------------------------------------------------------
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    theme = "Dracula (Official)",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    tab_separators = { left = "", right = "" },
  },
  sections = {
    tabline_a = { "mode" },
    tabline_b = { "workspace" },
    tabline_c = { " " },
    tab_active = {
      "index",
      { "process", padding = { left = 0, right = 1 } },
      { "cwd", padding = { left = 0, right = 1 } },
    },
    tab_inactive = {
      "index",
      { "process", padding = { left = 0, right = 1 } },
    },
    tabline_x = { "cpu" },
    tabline_y = { "datetime" },
    tabline_z = { "hostname" },
  },
})

-- ---------------------------------------------------------
-- Hyperlink rules (make file paths from Claude Code clickable)
-- ---------------------------------------------------------
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Match absolute paths like /Users/foo/bar.ts:42:10
table.insert(config.hyperlink_rules, {
  regex = [[(/[\w./-]+\.\w+)(?::(\d+))?(?::(\d+))?]],
  format = "file://$1",
})

-- ---------------------------------------------------------
-- Quick Select patterns (grab paths & hashes from Claude output)
-- ---------------------------------------------------------
config.quick_select_patterns = {
  -- file paths (absolute and relative)
  [[(?:[.~/]|\.\./)?(?:[\w@.-]+/)+[\w@.-]+\.[\w]+(?::\d+)?(?::\d+)?]],
  -- git short/long hashes
  [[\b[0-9a-f]{7,40}\b]],
}

-- ---------------------------------------------------------
-- Mouse bindings (tmux mouse mode bypass for hyperlinks)
-- ---------------------------------------------------------
config.bypass_mouse_reporting_modifiers = 'SHIFT'

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'SHIFT',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- ---------------------------------------------------------
-- Keybindings
-- ---------------------------------------------------------
config.keys = {
  -- Command Palette
  { key = "P", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
  -- Scrollback search (essential for long Claude output)
  { key = "F", mods = "CMD|SHIFT", action = wezterm.action.Search({ CaseInSensitiveString = "" }) },
  -- Quick Select (grab file paths, hashes, URLs)
  { key = "Space", mods = "CMD|SHIFT", action = wezterm.action.QuickSelect },
  -- Pane zoom toggle (read Claude output fullscreen, then toggle back)
  { key = "z", mods = "CMD|SHIFT", action = wezterm.action.TogglePaneZoomState },
  -- Clear scrollback (fresh start between Claude sessions)
  { key = "k", mods = "CMD|SHIFT", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },
  -- Scroll to bottom quickly
  { key = "End", mods = "CMD", action = wezterm.action.ScrollToBottom },
  -- Open scrollback in pager ($PAGER or less) for deep searching
  { key = "H", mods = "CMD|SHIFT", action = wezterm.action.ShowDebugOverlay },
}

return config
