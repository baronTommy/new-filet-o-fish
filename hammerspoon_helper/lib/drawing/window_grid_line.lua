local WindowGridLine = {}

WindowGridLine.new = function()
  local self = WindowGridLine
  return self
end

WindowGridLine.fill = false
WindowGridLine.WindowGridLineWidth = 4
WindowGridLine.parameterContractName = 'colors'

WindowGridLine.init = function(self)
  self.base = require(PATH.lib .. 'base').new()
  self.base:init()
  self = setmetatable(self, {__index = self.base})

  self.drawing = nil
end

WindowGridLine.show = function(self)
  self.drawing = self:create()
  return self.drawing:show()
end

WindowGridLine.delete = function(self)
  self.drawing:delete()

  self.drawing = nil
  return true
end

WindowGridLine.create = function(self)
  local focusedWindow = self.base.opt.tommy.hsf.getFocusedWindow()
  local windowize = self.base.opt.tommy.hsf.findwindowize(focusedWindow)
  local drawBase = self.base.opt.tommy.hsf.createDrawBase(windowize)

  return self.base.opt.tommy.hsf.createDraw(drawBase, self.WindowGridLineWidth, self.parameter, self.fill)
end

return WindowGridLine
