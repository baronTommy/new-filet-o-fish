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
  return self.call:call(
    'isValidShow',
    {'show'},
    'show',
    {'isShow'},
    'isShow',
    {'isValid','isExec','isShow'}
  )
end

Drawing.windowGridLineDelete = function(self, parameter)
  self.call:preSetting(self.windowGridLine, parameter)
  return self.call:call(
    'isValidDelete',
    {'delete'},
    'delete',
    {'isDelete'},
    'isDelete',
    {'isValid','isExec','isDelete'}
  )
end

return Drawing
