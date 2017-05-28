local Display = {}

Display.testCases = {
  {
    {
      callName = 'call',
      resultKeyNames = {isValid = '?', isExec = '?', apiResult = '?'},
      parameter = {call = 'get_display_id'},
    }
  },
  {
    {
      callName = 'call',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', apiResult = 'nil'},
      parameter = {direction = 'get_display_id'},
    }
  },
}

Display.new = function()
  local self = Display
  return self
end

Display.init = function(self)
  self.target = require(PATH.bin .. 'api').new()
  self.target:init()

  local base = require(PATH.test .. 'base').new()
  base:init(self)

  self = setmetatable(self, {__index = base})
end

return Display
