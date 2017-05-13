local Window = {}

Window.testCases = {
  {
    {
      callName = 'moveWindow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMove = '?'},
      parameter = {direction = 'up'},
    }
  },
  {
    {
      callName = 'moveWindow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMove = '?'},
      parameter = {direction = 'down'},
    }
  },
  {
    {
      callName = 'moveWindow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMove = '?'},
      parameter = {direction = 'left'},
    }
  },
  {
    {
      callName = 'moveWindow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMove = '?'},
      parameter = {direction = 'right'},
    }
  },
  {
    {
      callName = 'moveWindow',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMove = 'nil'},
      parameter = {direction = 'up'},
    }
  },
  {
    {
      callName = 'moveWindow',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMove = 'nil'},
      parameter = {direction = 'down'},
    }
  },
  {
    {
      callName = 'moveWindow',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMove = 'nil'},
      parameter = {direction = 'left'},
    }
  },
  {
    {
      callName = 'moveWindow',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMove = 'nil'},
      parameter = {direction = 'right'},
    }
  },
}

Window.new = function()
  local self = Window
  return self
end

Window.init = function(self)
  self.target = require(PATH.bin .. 'focus').new()
  self.target:init()

  local base = require(PATH.test .. 'base').new()
  base:init(self)

  self = setmetatable(self, {__index = base})
end

return Window
