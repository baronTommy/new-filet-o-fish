local HammerspoonFunctions = {}

HammerspoonFunctions.isDesktopFocuseWindow = function()
  return HammerspoonFunctions.getFocusedWindow() == hs.window.desktop()
end

HammerspoonFunctions.getFocusedWindow = function()
  return hs.window.focusedWindow()
end

HammerspoonFunctions.getDisplayId = function()
  return HammerspoonFunctions.getFocusedWindow():screen():id()
end

HammerspoonFunctions.findTargetDisplaySize = function(target)
  return target:screen():frame()
end

HammerspoonFunctions.findTargetDisplayId = function(target)
  return target:screen():id()
end

HammerspoonFunctions.findwindowize = function(window)
  return {
    window:topLeft().x,
    window:topLeft().y,
    window:size().w,
    window:size().h,
  }
end

HammerspoonFunctions.findPositionOfDestination = function(position)
  local targetDisplaySize = HammerspoonFunctions.findTargetDisplaySize(HammerspoonFunctions.getFocusedWindow())

  if position == 'max' then
    return {
      targetDisplaySize.x,
      targetDisplaySize.y,
      targetDisplaySize.w,
      targetDisplaySize.h,
    }
  end

  if position == 'right_half' then
    return {
      targetDisplaySize.x + (targetDisplaySize.w / 2),
      targetDisplaySize.y,
      targetDisplaySize.w / 2,
      targetDisplaySize.h,
    }
  end

  if position == 'left_half' then
    return {
      targetDisplaySize.x,
      targetDisplaySize.y,
      targetDisplaySize.w / 2,
      targetDisplaySize.h,
    }
  end

  if position == 'up_half' then
    return {
      targetDisplaySize.x,
      targetDisplaySize.y,
      targetDisplaySize.w,
      targetDisplaySize.h / 2,
    }
  end

  if position == 'down_half' then
    return {
      targetDisplaySize.x,
      targetDisplaySize.y + (targetDisplaySize.h / 2),
      targetDisplaySize.w,
      targetDisplaySize.h / 2,
    }
  end

  assert(nil)
end

HammerspoonFunctions.moveWindowPosition = function(window, position)
  window:setFrame(position)
end

HammerspoonFunctions.moveFocus = function(direction, mapping)
  local windowsToDirection = 'windowsTo' .. mapping[direction]

  for k,v in pairs(hs.window[windowsToDirection](nil, nil, true, true)) do
    if v:title() ~= '' then
      hs.window.focus(v)
      break
    end
  end
end

HammerspoonFunctions.moveWindowPositionToDisplay = function(direction, mapping)
  local moveOneScreen = 'moveOneScreen' .. mapping[direction]
  local focusedWindow = HammerspoonFunctions.getFocusedWindow()

  focusedWindow[moveOneScreen](focusedWindow, true)
end

HammerspoonFunctions.createDrawBase = function(rect)
  return hs.drawing.rectangle(hs.geometry.rect(rect))
end

HammerspoonFunctions.createDraw = function(draw, width, color, fill)
  draw:setStrokeWidth(width)
  draw:setStrokeColor(color)
  draw:setFill(fill)
  return draw
end

HammerspoonFunctions.jsonEncode = function(t)
  return hs.json.encode(t)
end

return HammerspoonFunctions
