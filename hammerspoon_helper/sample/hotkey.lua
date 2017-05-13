local modMoveWindow = {'shift', 'cmd'}
local modMovePosition = {'shift', 'option'}
local modMoveDisplay = {'shift', 'ctrl'}

local directionKey = {'up', 'down', 'left', 'right'}
-- local directionKey = {'h', 'j', 'k', 'l'}
local positionName = {'up_half', 'down_half', 'left_half', 'right_half'}

local directionKeyE = {
  up = '↑',
  down = '↓',
  left = '←',
  right = '→'
}

for k, v in pairs(directionKey) do
  hs.hotkey.bind(modMoveWindow, v, function()
      hs.alert('⇧ + ⌘ + ' .. directionKeyE[v])
      HS_H.focus:moveWindow({direction = v})
    end)
end

for k, v in pairs(directionKey) do
  hs.hotkey.bind(modMovePosition, v, function()
      hs.alert('⇧ + ⌥ + ' .. directionKeyE[v])
      MY_HS_H.window:movePosition({position = positionName[k]})
    end)
end
hs.hotkey.bind(modMovePosition, 'M', function()
    hs.alert('⇧ + ⌥ + M')
    MY_HS_H.window:movePosition({position = 'max'})
  end)

for k, v in pairs(directionKey) do
  hs.hotkey.bind(modMoveDisplay, v, function()
      MY_HS_H.window:moveDisplay({direction = v})
    end)
end
