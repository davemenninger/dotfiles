local wezterm = require("wezterm")
local config = {}

config.default_prog = { 'powershell.exe', '-NoLogo' }

config.font_size = 10.0

config.leader = { key = "b", mods = "CTRL" }

config.keys = {
  { key = '"', mods = "LEADER|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "%", mods = "LEADER|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = ":", mods = "LEADER|SHIFT", action = wezterm.action.ActivateCommandPalette },
  { key = "b", mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x02" } },
  { key = "N", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "o", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Next" } },

  -- above here are my configs from muscle memory, below copied from somewhere...

  { key = "-", mods = "SHIFT|CTRL",   action = "DecreaseFontSize" },
  { key = "+", mods = "SHIFT|CTRL",   action = "IncreaseFontSize" },
  { key = "0", mods = "SHIFT|CTRL",   action = "ResetFontSize" },
  { key = "1", mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
  { key = "2", mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
  { key = "3", mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
  { key = "4", mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
  { key = "5", mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
  { key = "6", mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
  { key = "7", mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
  { key = "8", mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
  { key = "9", mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
  { key = "c", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "c", mods = "SHIFT|CTRL",   action = wezterm.action.CopyTo 'Clipboard' },
  { key = "n", mods = "SHIFT|CTRL",   action = "ToggleFullScreen" },
  { key = "v", mods = "SHIFT|CTRL",   action = wezterm.action.PasteFrom 'Clipboard' },
  { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
}

return config
