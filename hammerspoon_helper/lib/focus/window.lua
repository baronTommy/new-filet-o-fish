local Window = {}

Window.new = function()
  local self = Window
  return self
end

Window.parameterContractName = 'direction'

Window.init = function(self)
  self.base = require(PATH.lib .. 'base').new()
  self.base:init()
  self = setmetatable(self, {__index = self.base})
end

Window.move = function(self)
  local beforeFocusedWindow = self.base.opt.tommy.hsf.getFocusedWindow()

  self.base.opt.tommy.hsf.moveFocus(self.parameter.direction, self.base.env.const.directionMapping)

  local afterFocusedWindow = self.base.opt.tommy.hsf.getFocusedWindow()

  return beforeFocusedWindow, afterFocusedWindow
end

return Window
