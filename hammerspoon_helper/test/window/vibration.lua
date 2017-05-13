local Vibration = {}

Vibration.testCases = {
  {
    {
      callName = 'vibrate',
      resultKeyNames = {isValid = 'true', isExec = 'true', isVibrate = 'true'},
      parameter = {tremor = 'low'},
    }
  },
  {
    {
      callName = 'vibrate',
      resultKeyNames = {isValid = 'true', isExec = 'true', isVibrate = 'true'},
      parameter = {tremor = 'middle'},
    }
  },
  {
    {
      callName = 'vibrate',
      resultKeyNames = {isValid = 'true', isExec = 'true', isVibrate = 'true'},
      parameter = {tremor = 'high'},
    }
  },
  {
    {
      testValues = {NOT_FOCUS = true},
      callName = 'vibrate',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isVibrate = 'nil'},
      parameter = {tremor = 'low'},
    }
  },
  {
    {
      testValues = {NOT_FOCUS = true},
      callName = 'vibrate',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isVibrate = 'nil'},
      parameter = {tremor = 'middle'},
    }
  },
  {
    {
      testValues = {NOT_FOCUS = true},
      callName = 'vibrate',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isVibrate = 'nil'},
      parameter = {tremor = 'high'},
    }
  },
}

Vibration.new = function()
  local self = Vibration
  return self
end

Vibration.init = function(self)
  self.target = require(PATH.bin .. 'window').new()
  self.target:init()

  local base = require(PATH.test .. 'base').new()
  base:init(self)

  self = setmetatable(self, {__index = base})
end

return Vibration
