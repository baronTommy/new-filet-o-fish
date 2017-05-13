local Display = {}

Display.testCases = {
  {
    {
      callName = 'moveDisplay',
      resultKeyNames = {isValid = '?', isExec = '?', isMoveDisplay = '?'},
      parameter = {direction = 'up'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      resultKeyNames = {isValid = '?', isExec = '?', isMoveDisplay = '?'},
      parameter = {direction = 'down'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      resultKeyNames = {isValid = '?', isExec = '?', isMoveDisplay = '?'},
      parameter = {direction = 'left'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      resultKeyNames = {isValid = '?', isExec = '?', isMoveDisplay = '?'},
      parameter = {direction = 'right'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'up'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'down'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'left'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'right'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_NEXT_DISPLAY = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'up'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_NEXT_DISPLAY = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'down'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_NEXT_DISPLAY = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'left'},
    }
  },
  {
    {
      callName = 'moveDisplay',
      testValues = {NOT_NEXT_DISPLAY = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMoveDisplay = 'nil'},
      parameter = {direction = 'right'},
    }
  },
}

Display.new = function()
  local self = Display
  return self
end

Display.init = function(self)
  self.target = require(PATH.bin .. 'window').new()
  self.target:init()

  local base = require(PATH.test .. 'base').new()
  base:init(self)

  self = setmetatable(self, {__index = base})
end

return Display
