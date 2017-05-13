local Vibration = {}

Vibration.new = function()
  local self = Vibration
  return self
end

Vibration.tremorCnt = {
  high = 3,
  middle = 2,
  low = 1,
}
Vibration.tremor = 2
Vibration.parameterContractName = 'tremor'

Vibration.init = function(self)
  self.base = require(PATH.lib .. 'base').new()
  self.base:init()
  self = setmetatable(self, {__index = self.base})

  self.focusedWindow = nil
  self.currentPosition = nil
end

Vibration.vibrate = function(self)
  self.focusedWindow = self.base.opt.tommy.hsf.getFocusedWindow()
  self.currentPosition = self.base.opt.tommy.hsf.findwindowize(self.focusedWindow)

  return self:callVibration()
end

Vibration.makeRollingPosition = function(self)
  local positionName = self.base.env.const.windowPositionName

  return {
    self.currentPosition[positionName.topLeftX] - self.tremor,
    self.currentPosition[positionName.topLeftY],
    self.currentPosition[positionName.sizeW] + self.tremor,
    self.currentPosition[positionName.sizeH],
  }
end

Vibration.callVibration = function(self)
  for i = 1, self.tremorCnt[self.parameter.tremor] do
    self:rolling()
    self:moveOriginalPosition()
  end

  return true
end

Vibration.rolling = function(self)
  self.base.opt.tommy.hsf.moveWindowPosition(self.focusedWindow, self:makeRollingPosition())
end

Vibration.moveOriginalPosition = function(self)
  self.base.opt.tommy.hsf.moveWindowPosition(self.focusedWindow, self.currentPosition)
end

return Vibration
