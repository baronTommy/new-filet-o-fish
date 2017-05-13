local Drawing = {}

Drawing.new = function()
  local self = Drawing
  return self
end

Drawing.init = function(self)
  self.call = require(PATH.opt .. 'tommy/call').new()
  self.call:init()
  self.windowGridLine = require(PATH.lib .. 'drawing/window_grid_line').new()
  self.windowGridLine:init()
end

Drawing.windowGridLineShow = function(self, parameter)
  self.call:preSetting(self.windowGridLine, parameter)
  return self.call:show()
end

Drawing.windowGridLineDelete = function(self, parameter)
  self.call:preSetting(self.windowGridLine, parameter)
  return self.call:delete()
end

return Drawing
