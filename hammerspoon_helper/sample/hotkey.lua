local modMoveWindow = {'shift', 'cmd'}
local modMovePosition = {'shift', 'option'}
local modMoveDisplay = {'shift', 'ctrl'}

local directionKey = {'up', 'down', 'left', 'right'}
-- local directionKey = {'h', 'j', 'k', 'l'}
local positionName = {'up_half', 'down_half', 'left_half', 'right_half'}

for k, v in pairs(directionKey) do
  hs.hotkey.bind(modMoveWindow, v, function()
      HS_H.focus:moveWindow({direction = v})
    end)
end

for k, v in pairs(directionKey) do
  hs.hotkey.bind(modMovePosition, v, function()
      MY_HS_H.window:movePosition({position = positionName[k]})
    end)
end
hs.hotkey.bind(modMovePosition, 'M', function()
    MY_HS_H.window:movePosition({position = 'max'})
  end)

for k, v in pairs(directionKey) do
  hs.hotkey.bind(modMoveDisplay, v, function()
    MY_HS_H.window:moveDisplay({direction = directionKey[k]})
    end)
end

