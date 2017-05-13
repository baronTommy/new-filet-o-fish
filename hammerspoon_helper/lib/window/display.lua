local Display = {}

Display.new = function()
  local self = Display
  return self
end

Display.parameterContractName = 'direction'

Display.init = function(self)
  self.base = require(PATH.lib .. 'base').new()
  self.base:init()
  self = setmetatable(self, {__index = self.base})
end

Display.move = function(self)
  local target = self.base.opt.tommy.hsf.getFocusedWindow()
  local beforeDisplayId = self.base.opt.tommy.hsf.findTargetDisplayId(target)

  self.base.opt.tommy.hsf.moveWindowPositionToDisplay(self.parameter.direction, self.env.const.directionMapping)

  local afterDisplayId = self.base.opt.tommy.hsf.findTargetDisplayId(target)
  return beforeDisplayId, afterDisplayId
end

return Display
