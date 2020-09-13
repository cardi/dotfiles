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

-- XXX debugg
--print(wifiWatcher)
--print(dump(hs.wifi.interfaceDetails()))

-- vim: set expandtab ts=2 sw=2:
