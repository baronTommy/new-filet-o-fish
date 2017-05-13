local WindowGridLine = {}

WindowGridLine.testCases = {
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {red = 1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {green = 1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {blue = 1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {red = 0.1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {green = 0.1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {blue = 0.1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {red = 0.1, green = 0.1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {green = 0.1, blue = 0.1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {blue = 0.1, red = 0.1},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'true', isExec = 'true', isShow = 'true'},
      parameter = {red = 0.2, green = 0.4, blue = 0.6},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'true', isExec = 'true', isDelete = 'true'},
    },
  },
  {
    {
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isShow = 'nil'},
      parameter = {red = 9, green = 0.4, blue = 0.6},

    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isDelete = 'nil'},
    },
  },
  {
    {
      testValues = {NOT_FOCUS = true},
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isShow = 'nil'},
      parameter = {red = 0.2, green = 0.4, blue = 0.6},
    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isDelete = 'nil'},
    },
  },
  {
    {
      testValues = {IS_DESKTOP = true},
      callName = 'windowGridLineShow',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isShow = 'nil'},
      parameter = {red = 0.2, green = 0.4, blue = 0.6},
    },
    {
      callName = 'windowGridLineDelete',
      resultKeyNames = {isValid = 'false', isExec = 'nil', isDelete = 'nil'},
    },
  },
}

WindowGridLine.new = function()
  local self = WindowGridLine
  return self
end

WindowGridLine.init = function(self)
  self.target = require(PATH.bin .. 'drawing').new()
  self.target:init()

  local base = require(PATH.test .. 'base').new()
  base:init(self)

  self = setmetatable(self, {__index = base})
end

return WindowGridLine
