local ApplicationProgrammingInterface = {}

ApplicationProgrammingInterface.new = function()
  local self = ApplicationProgrammingInterface
  return self
end

ApplicationProgrammingInterface.init = function(self)
  self.opt_call = require(PATH.opt .. 'tommy/call').new()
  self.opt_call:init()
  self.apis = require(PATH.lib .. 'api/apis').new()
  self.apis:init()
end

ApplicationProgrammingInterface.call = function(self, parameter)
  self.opt_call:preSetting(self.apis, parameter)
  return self.opt_call:call(
    'isValidApi',
    {'apiResult'},
    'call',
    {'apiResult'},
    'isApiCall',
    {'isValid','isExec','apiResult'}
  )
end

return ApplicationProgrammingInterface
