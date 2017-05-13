local Window = {}

Window.new = function()
  local self = Window
  return self
end

Window.init = function(self, bin)
  self.display = require(PATH.usrLib .. 'window/display').new()
  self.display:init(bin)

  self.position = require(PATH.usrLib .. 'window/position').new()
  self.position:init(bin, self.display)
end

Window.moveDisplay = function(self, parameter)
  return self.display:moveDisplay(parameter)
end

Window.movePosition = function(self, parameter)
  return self.position:movePosition(parameter)
end

return Window
