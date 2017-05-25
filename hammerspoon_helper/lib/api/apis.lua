local ApplicationProgrammingInterfaces = {}

ApplicationProgrammingInterfaces.requireParameterKeys = {'call'}

ApplicationProgrammingInterfaces.new = function()
  local self = ApplicationProgrammingInterfaces
  return self
end

ApplicationProgrammingInterfaces.init = function(self)
  self.base = require(PATH.lib .. 'base').new()
  self.base:init()
  self = setmetatable(self, {__index = self.base})

  self.opt = {}
  self.opt.tommy = {}
  self.opt.tommy.hsf = require(PATH.opt .. 'tommy/hammerspoon_functions')
end

ApplicationProgrammingInterfaces.call = function(self)
  return self[self.parameter.call](self)
end

ApplicationProgrammingInterfaces.get_display_id = function(self)
  return self.opt.tommy.hsf.jsonEncode(
    {
      display_id = self.opt.tommy.hsf.getDisplayId()
    }
  )
end

return ApplicationProgrammingInterfaces
