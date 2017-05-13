local Position = {}

Position.new = function()
  local self = Position
  return self
end

Position.parameterContractName = 'position'

Position.init = function(self)
  self.base = require(PATH.lib .. 'base').new()
  self.base:init()
  self = setmetatable(self, {__index = self.base})
end

Position.move = function(self)
  local focusedWindow = self.base.opt.tommy.hsf.getFocusedWindow()
  local PositionBefore = self.base.opt.tommy.hsf.findwindowize(focusedWindow)
  local expectationmovePosition = self.base.opt.tommy.hsf.findPositionOfDestination(self.parameter.position)

  self.base.opt.tommy.hsf.moveWindowPosition(focusedWindow, expectationmovePosition)

  local PositionAfter = self.base.opt.tommy.hsf.findwindowize(focusedWindow)

  return PositionBefore, PositionAfter
end

return Position
