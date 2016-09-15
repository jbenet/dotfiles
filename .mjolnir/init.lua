-- make sure you install lua:
--    brew install lua
--
-- make sure you install these packages:
--    luarocks install mjolnir.application
--    luarocks install mjolnir.hotkey
--    luarocks install mjolnir.bg.grid

local application = require "mjolnir.application"
local fnutils = require "mjolnir.fnutils"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local screen = require "mjolnir.screen"
local grid = require "mjolnir.bg.grid"

grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 8
grid.GRIDHEIGHT = 8
local halfW = grid.GRIDWIDTH / 2
local thirdW = grid.GRIDWIDTH / 3

local resize = function(x, y, w, h)
  return function()
    win = window.focusedwindow()
    grid.set(win, {x=x, y=y, w=w, h=h}, win:screen())
  end
end

local modifier = {"cmd", "alt", "shift"}

-- full screen
hotkey.bind(modifier, "space", grid.maximize_window)
hotkey.bind(modifier, "f", grid.maximize_window)

-- halves
hotkey.bind(modifier, "left", resize(0, 0, halfW, grid.GRIDHEIGHT))
hotkey.bind(modifier, "right", resize(halfW, 0, halfW, grid.GRIDHEIGHT))

-- thirds
hotkey.bind(modifier, "1", resize(0, 0, thirdW, grid.GRIDHEIGHT))
hotkey.bind(modifier, "2", resize(thirdW, 0, thirdW, grid.GRIDHEIGHT))
hotkey.bind(modifier, "3", resize(thirdW * 2, 0, thirdW, grid.GRIDHEIGHT))

-- two thirds
hotkey.bind(modifier, "q", resize(0, 0, thirdW * 2, grid.GRIDHEIGHT))
hotkey.bind(modifier, "w", resize(thirdW, 0, thirdW * 2, grid.GRIDHEIGHT))


-- center resize
hotkey.bind(modifier, "up", function()
  local win = window.focusedwindow()
  local screenFrame = screen.mainscreen():frame()
  local frame = win:frame()
  frame.w = screenFrame.w / 1.5
  frame.h = screenFrame.h / 1.3
  frame.x = screenFrame.w / 2 - frame.w / 2
  frame.y = screenFrame.h / 2 - frame.h / 2
  win:setframe(frame)
end)

-- center
hotkey.bind(modifier, "down", function()
  local win = window.focusedwindow()
  local screenFrame = screen.mainscreen():frame()
  local frame = win:frame()
  frame.x = screenFrame.w / 2 - frame.w / 2
  frame.y = screenFrame.h / 2 - frame.h / 2
  win:setframe(frame)
end)