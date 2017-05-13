local Position = {}

Position.testCases = {
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'up_half'},
    },
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMovePosition = 'true'},
      parameter = {position = 'max'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMovePosition = 'true'},
      parameter = {position = 'up_half'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMovePosition = 'true'},
      parameter = {position = 'down_half'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMovePosition = 'true'},
      parameter = {position = 'left_half'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = 'true', isExec = 'true', isMovePosition = 'true'},
      parameter = {position = 'right_half'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'up_half'},
    },
    {
      callName = 'movePosition',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMovePosition = 'nil'},
      parameter = {position = 'max'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMovePosition = 'nil'},
      parameter = {position = 'up_half'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMovePosition = 'nil'},
      parameter = {position = 'down_half'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMovePosition = 'nil'},
      parameter = {position = 'left_half'},
    }
  },
  {
    {
      callName = 'movePosition',
      resultKeyNames = {isValid = '?', isExec = '?', isMovePosition = '?'},
      parameter = {position = 'max'},
    },
    {
      callName = 'movePosition',
      testValues = {NOT_FOCUS = true},
      resultKeyNames = {isValid = 'false', isExec = 'nil', isMovePosition = 'nil'},
      parameter = {position = 'right_half'},
    }
  },
}

Position.new = function()
  local self = Position
  return self
end

Position.init = function(self)
  self.target = require(PATH.bin .. 'window').new()
  self.target:init()

  local base = require(PATH.test .. 'base').new()
  base:init(self)

  self = setmetatable(self, {__index = base})
end

return Position
