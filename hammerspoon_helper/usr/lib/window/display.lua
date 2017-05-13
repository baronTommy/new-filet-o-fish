local Display = {}

Display.new = function()
  local self = Display
  return self
end

Display.init = function(self, bin)
  self.bin = bin
end

Display.moveDisplay = function(self, parameter)
  local resultMoveDisplay = self.bin.window:moveDisplay(parameter)
  if not self.bin.window.position.base:isAfterMovingDisplay(resultMoveDisplay) then
    return resultMoveDisplay
  end

  return resultMoveDisplay, self.bin.window:movePosition({position = 'max'})
end

return Display
