local Test = {}

Test.path = {
  'drawing/window_grid_line',
  'window/position',
  'window/display',
  'window/vibration',
  'focus/window',
}

Test.new = function()
  local self = Test
  return self
end

Test.init = function(self)
  PATH = require('hammerspoon_helper/env/path')
  self.target = {}

  for k, v in pairs(Test.path) do
    Test.target = require(PATH.test .. v).new()
    Test.target:init()
    Test.target:call()
  end
end

return Test
