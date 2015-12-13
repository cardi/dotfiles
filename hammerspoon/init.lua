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

-- vim: set expandtab ts=2 sw=2:
