local Window = {}

Window.new = function()
  local self = Window
  return self
end

Window.init = function(self)
  self.call = require(PATH.opt .. 'tommy/call').new()
  self.call:init()
  self.position = require(PATH.lib .. 'window/position').new()
  self.position:init()
  self.display = require(PATH.lib .. 'window/display').new()
  self.display:init()
  self.vibration = require(PATH.lib .. 'window/vibration').new()
  self.vibration:init()
end

Window.movePosition = function(self, parameter)
  self.call:preSetting(self.position, parameter)
  return self.call:movePosition()
end

Window.vibrate = function(self, parameter)
  self.call:preSetting(self.vibration, parameter)
  return self.call:vibrate()
end

Window.moveDisplay = function(self, parameter)
  self.call:preSetting(self.display, parameter)
  return self.call:moveDisplay()
end

return Window
