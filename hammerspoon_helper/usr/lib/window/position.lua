local Position = {}

Position.new = function()
  local self = Position
  return self
end

Position.init = function(self, bin, display)
  self.bin = bin
  self.display = display
end

Position.movePosition = function(self, parameter)
  local resultMovePosition = self.bin.window:movePosition(parameter)

  if not self.bin.window.position.base:isAfterMovingPosition(resultMovePosition, parameter) then
    return resultMovePosition
  end

  return resultMovePosition, self.display:moveDisplay({direction = self.bin.window.position.base:findMoveDisplayDirection(parameter)})
end

return Position
