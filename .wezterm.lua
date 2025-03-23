-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.use_ime = true
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Bamboo'
-- config.color_scheme = 'Espresso'
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Gruvbox dark, pale (base16)'
-- config.color_scheme = 'IC_Orange_PPL'
-- config.color_scheme = 'Mocha'
config.font = wezterm.font("UDEV Gothic", {weight="Thin", stretch="Normal", style="Normal"})
config.font_size = 14.0
config.line_height = 1.1

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = '#333',
  
      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = '#666',
        -- The color of the text for the tab
        fg_color = '#000',
  
        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = 'Normal',
  
        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = 'None',
  
        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,
  
        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },
  
      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = '#000000',
        fg_color = '#808080',
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },
  
      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      },
  
      -- The new tab button that let you create new tabs
      new_tab = {
        bg_color = '#161616',
        fg_color = '#999',
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab`.
      },
  
      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab_hover`.
      },
    },
  }

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|META',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

-- and finally, return the configuration to wezterm
return config