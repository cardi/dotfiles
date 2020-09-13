-- hammerspoon config ~/.hammerspoon/init.lua
--   guide: http://www.hammerspoon.org/go/
--    docs: http://www.hammerspoon.org/docs/

-- disable animations
hs.window.animationDuration = 0

-- force 1100x768
hs.hotkey.bind({"cmd", "alt", "shift"}, "P", function()
  local win = hs.window.focusedWindow()

  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    -- 1280x800 for chrome store screenshots
    --f.w = 1280
    --f.h = 800
    f.w = 1100
    f.h = 768
    win:setFrame(f)
  end
end)

-- 100% width, top half
hs.hotkey.bind({"cmd", "shift"}, "K", function()
  local win = hs.window.focusedWindow()

  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
  end
end)

-- 50% height (no movement)
hs.hotkey.bind({"cmd", "alt", "shift"}, "K", function()
  local win = hs.window.focusedWindow()

  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.h = max.h / 2
    win:setFrame(f)
  end
end)

-- 50% height, bottom half
hs.hotkey.bind({"cmd", "alt", "shift"}, "J", function()
  local win = hs.window.focusedWindow()

  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = max.y + (max.h / 2)
    f.h = max.h / 2
    win:setFrame(f)
  end
end)

-- 100% width, bottom half
hs.hotkey.bind({"cmd", "shift"}, "J", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
  end
end)

-- 50% width, left half
hs.hotkey.bind({"cmd", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  end
end)

-- 50% width, right half
hs.hotkey.bind({"cmd", "shift"}, "L", function()
  local win = hs.window.focusedWindow()

  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  end
end)

-----

-- 1/3 width, left half
hs.hotkey.bind({"cmd", "alt", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
  end
end)

-- 2/3 width, right half
hs.hotkey.bind({"cmd", "alt", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 3)
    f.y = max.y
    f.w = max.w * (2/3)
    f.h = max.h
    win:setFrame(f)
  end
end)

-----

-- 2/3 width, left half
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w * (2 / 3)
    f.h = max.h
    win:setFrame(f)
  end
end)

-- 1/3 width, right half
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * (2 / 3))
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
  end
end)

-----

-- 100% width
hs.hotkey.bind({"cmd", "shift"}, "Return", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
  end
end)

-- 2/3 width, centered
hs.hotkey.bind({"alt", "shift"}, "Return", function()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 6)
    f.y = max.y
    f.w = max.w * (2/3)
    f.h = max.h
    win:setFrame(f)
  end
end)

-- lock screen: macOS >= 10.13 (high sierra) has a built-in lock screen
local osVersion = hs.host.operatingSystemVersion()
if(osVersion["major"] == 10 and osVersion["minor"] < 13) then
  -- we'll keep the keyboard shortcut consistent
  hs.hotkey.bind({"ctrl", "cmd"}, "Q", function()
    -- lockscreen.m: https://gist.github.com/cardi/3e2b527a2ec819d51916604528986e93
    os.execute("~/u/scripts/lockscreen")
  end)
end

-- TODO separate wifi into its own component
-- https://stackoverflow.com/questions/44559759/can-i-separate-init-lua-to-different-components-in-hammerspoon#44560895
-- https://apple.stackexchange.com/a/284671/292485

wifiMenu = hs.menubar.newWithPriority(2147483645)
wifiMenu:setTitle("")
wifiWatcher = nil
lastNetwork = ""

-- WIP: creates an item with a dropdown in the menu bar indicating
-- the wifi network currently connected to, if using wifi. The dropdown
-- will show which IPv{4,6} addresses are assigned to the interface
--
-- TODO support for VPNs, multiple interfaces, etc.
-- TODO am i on wifi or ethernet? which is prioritized? https://stackoverflow.com/a/39474846
--
function updateWifiMenuTitle()
  -- print("something changed: wifi? " .. hs.wifi.currentNetwork())
  print(hs.wifi.interfaceDetails())
  local wifiName = hs.wifi.currentNetwork()
  if wifiName ~= lastNetwork and wifiName ~= nil then
    wifiMenu:setTitle("wifi: " .. wifiName)
  end

  if wifiName == nil then
    wifiMenu:setTitle("wifi: off")
  end

  local interfaces = hs.network.interfaces()
  v4, v6 = hs.network.primaryInterfaces()

  wifiMenuDropdown = {
     { title = "IPv4: " .. hs.network.interfaceDetails(v4)["IPv4"]["Addresses"][1], checked = v4 ~= nil , disabled = true }
   , { title = "-" }
   , { title = "IPv6: " .. hs.network.interfaceDetails(v4)["IPv6"]["Addresses"][1], checked = v6 ~= nil , disabled = true }
  }

  -- wifiMenuDropdown = {
  --    { title = "IPv4: " .. hs.network.addresses()[v4], checked = v4 ~= nil , disabled = true }
  --  , { title = "-" }
  --  , { title = "IPv6", checked = v6 ~= nil , disabled = true }
  -- }

  -- * for each interface:
    -- * ipv4/ipv6 address
    -- * router
    -- * am i tunneled? via wg?
  --wifiMenuDropdown = {
  --   { title = "hi" }
  -- , { title = "-" }
  -- , { title = "disabled item", checked = true, disabled = true }
  --}

  -- external IP: dig +short myip.opendns.com @resolver1.opendns.com
  -- http://www.hammerspoon.org/docs/hs.html#execute
  wifiMenu:setMenu(wifiMenuDropdown)

  lastNetwork = wifiName
end

wifiWatcher = hs.wifi.watcher.new(updateWifiMenuTitle)
wifiWatcher:watchingFor({"SSIDChange", "linkChange", "powerChange"})
wifiWatcher:start()
updateWifiMenuTitle()

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

----

-- hyper sources:
-- * https://github.com/lodestone/hyper-hacks/blob/master/hammerspoon/init.lua

-- A global variable for the Hyper Mode
hyper = hs.hotkey.modal.new({}, 'F17')

hyper:bind({}, 'F10', function()
  output = hs.audiodevice.defaultOutputDevice()
  output:setMuted(not(output:muted()))
	hs.alert.closeAll(0.0)
	if output:muted() then
		hs.alert.show("Volume: Muted", 0.5)
	else
		hs.alert.show("Volume: Unmuted", 0.5)
	end
  hyper.triggered = true
end)

-- need to remap F11 to something like ctrl+shift+alt+cmd-F11
-- in keyboard shortcuts

function changeVolume(delta)
	local output = hs.audiodevice.defaultOutputDevice()
	local volume = math.floor(output:volume() + delta)
	output:setVolume(volume)
	hs.alert.closeAll(0.0)
	hs.alert.show("Volume: " .. math.floor(output:volume()) .. "%", 0.5)
end

hyper:bind({}, 'F11', function()
	changeVolume(-10)
  hyper.triggered = true
end)

-- https://gist.github.com/spinscale/fd82f00da29447990f27f36b3f4b927d
hyper:bind({}, 'F12', function()
	changeVolume(10)
  hyper.triggered = true
end)

----

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
function enterHyperMode()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- send ESCAPE if no other keys are pressed.
function exitHyperMode()
  hyper:exit()
  if not hyper.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key (to context menu)
f18 = hs.hotkey.bind({}, 110, enterHyperMode, exitHyperMode)

----

-- "Show Key Press Mode": this is helpful when trying to figure out which
-- keycode corresponds to the physical key you press. I used this to figure out
-- the keycode for the "Menu" key and assign it as a "hyper key" (like Ctrl,
-- Shift, Alt, Cmd, etc.).
--
-- Source: https://kirbuchi.com/2016/10/26/playing-with-hammerspoon/
function showKeyPress(tap_event)
  local duration = 1.5  -- popup duration
  local modifiers = ""  -- key modifiers string representation
  local flags = tap_event:getFlags()
  local character = hs.keycodes.map[tap_event:getKeyCode()]
  -- we only want to read special characters via getKeyCode, so we
  -- use this subset of hs.keycodes.map
  local special_chars = {
    ["f1"] = true, ["f2"] = true, ["f3"] = true, ["f4"] = true,
    ["f5"] = true, ["f6"] = true, ["f7"] = true, ["f8"] = true,
    ["f9"] = true, ["f10"] = true, ["f11"] = true, ["f12"] = true,
    ["f13"] = true, ["f14"] = true, ["f15"] = true, ["f16"] = true,
    ["f17"] = true, ["f18"] = true, ["f19"] = true, ["f20"] = true,
    ["pad"] = true, ["pad*"] = true, ["pad+"] = true, ["pad/"] = true,
    ["pad-"] = true, ["pad="] = true, ["pad0"] = true, ["pad1"] = true,
    ["pad2"] = true, ["pad3"] = true, ["pad4"] = true, ["pad5"] = true,
    ["pad6"] = true, ["pad7"] = true, ["pad8"] = true, ["pad9"] = true,
    ["padclear"] = true, ["padenter"] = true, ["return"] = true,
    ["tab"] = true, ["space"] = true, ["delete"] = true, ["escape"] = true,
    ["help"] = true, ["home"] = true, ["pageup"] = true,
    ["forwarddelete"] = true, ["end"] = true, ["pagedown"] = true,
    ["left"] = true, ["right"] = true, ["down"] = true, ["up"] = true
  }

  -- if we have a simple character (no modifiers), we want a shorter
  -- popup duration.
  if (not flags.shift and not flags.cmd and
        not flags.alt and not flags.ctrl) then
    duration = 0.3
  end

  -- we want to get regular characters via getCharacters as it
  -- "cleans" the key for us (e.g. for a "⇧-5" keypress we want
  -- to show "⇧-%").
  if special_chars[character] == nil then
    character = tap_event:getCharacters(true)
    if flags.shift then
      character = string.lower(character)
    end
  end

  -- make some known special characters look good
  if character == "return" then
    character = "⏎"
  elseif character == "delete" then
    character = "⌫"
  elseif character == "escape" then
    character = "⎋"
  elseif character == "space" then
    character = "SPC"
  elseif character == "up" then
    character = "↑"
  elseif character == "down" then
    character = "↓"
  elseif character == "left" then
    character = "←"
  elseif character == "right" then
    character = "→"
  end

  -- get modifiers' string representation
  if flags.ctrl then
    modifiers = modifiers .. "C-"
  end
  if flags.cmd then
    modifiers = modifiers .. "⌘-"
  end
  if flags.shift then
    modifiers = modifiers .. "⇧-"
  end
  if flags.alt then
    modifiers = modifiers .. "⌥-"
  end

  -- actually show the popup
  hs.alert.show(modifiers .. character, duration)

end


local key_tap = hs.eventtap.new(
  {hs.eventtap.event.types.keyDown},
  showKeyPress
)

-- Enable/Disable Keypress Show Mode with "C-⌘-⇧-p"
k = hs.hotkey.modal.new({"cmd", "shift", "ctrl"}, 'P')
function k:entered()
  hs.alert.show("Enabling Keypress Show Mode", 1.5)
  key_tap:start()
end
function k:exited()
  hs.alert.show("Disabling Keypress Show Mode", 1.5)
end
k:bind({"cmd", "shift", "ctrl"}, 'P', function()
    key_tap:stop()
    k:exit()
end)

-- vim: set expandtab ts=2 sw=2:
