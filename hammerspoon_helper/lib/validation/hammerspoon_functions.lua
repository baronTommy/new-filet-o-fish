local HammerspoonFunctions = {}

local opt = {}
opt.tommy = {}
opt.tommy.hsf = require(PATH.opt .. 'tommy/hammerspoon_functions')

HammerspoonFunctions.isDesktop = function()
  if TEST_MODE and (TEST_VALUES.IS_DESKTOP ~= nil) then
    return true
  end

  return opt.tommy.hsf.isDesktopFocuseWindow()
end

HammerspoonFunctions.hasFocus = function()
  if TEST_MODE and (TEST_VALUES.NOT_FOCUS ~= nil) then
    return false
  end

  return not (
    opt.tommy.hsf.getFocusedWindow() == nil or
    opt.tommy.hsf.getFocusedWindow() == false
  )
end

HammerspoonFunctions.hasNextDisplay = function(direction)
  if TEST_MODE and (TEST_VALUES.NOT_NEXT_DISPLAY ~= nil) then
    return false
  end

  local fw = opt.tommy.hsf.getFocusedWindow()

  if fw:screen()['to' .. direction](fw:screen()) then
    return true
  end

  return false
end

return HammerspoonFunctions
