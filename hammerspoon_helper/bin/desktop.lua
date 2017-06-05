local Desktop = {}

Desktop.new = function()
  local self = Desktop
  return self
end

Desktop.init = function(self, bin)
  self.call = require(PATH.opt .. 'tommy/call').new()
  self.call:init()
  self.totalSpaces2 = require(PATH.lib .. 'desktop/total_spaces2').new()
  self.totalSpaces2:init(bin)
end

Desktop.moveDesktopTogether = function(self, parameter)
  self.call:preSetting(self.totalSpaces2, parameter)
  return self.call:call(
    'isValidMoveDesktopTogether',
    {},
    'moveDesktopTogether',
    {},
    nil,
    {'isValid','isExec'}
  )
end

Desktop.moveWindowToOtherDesktop = function(self, parameter)
  self.call:preSetting(self.totalSpaces2, parameter)
  return self.call:call(
    'isValidMoveWindowToOtherDesktop',
    {},
    'moveWindowToOtherDesktop',
    {},
    nil,
    {'isValid','isExec'}
  )
end

return Desktop
