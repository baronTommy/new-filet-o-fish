local Display = {}

Display.testCases = {
  {
    {
      callName = 'call',
      resultKeyNames = {isValidApi = '?', isExec = '?', isApiCall = '?'},
      parameter = {call = 'get_display_id'},
    }
  },
  {
    {
      callName = 'call',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValidApi = 'false', isExec = 'nil', isApiCall = 'nil'},
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
