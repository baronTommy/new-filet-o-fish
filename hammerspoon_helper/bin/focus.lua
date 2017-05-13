local Focus = {}

Focus.new = function()
  local self = Focus
  return self
end

Focus.init = function(self)
  self.call = require(PATH.opt .. 'tommy/call').new()
  self.call:init()
  self.window = require(PATH.lib .. 'focus/window').new()
  self.window:init()
end

Focus.moveWindow = function(self, parameter)
  self.call:preSetting(self.window, parameter)
  return self.call:moveWindow()
end

return Focus
