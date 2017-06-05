local Base = {}

Base.new = function()
  local self = Base
  return self
end

Base.differencePX = 10

Base.init = function(self)
  self.results = {}
  self.validation = {}
  self.validation.f = require(PATH.validation .. 'functions')
  self.validation.hsf = require(PATH.validation .. 'hammerspoon_functions')

  self.opt = {}
  self.opt.tommy = {}
  self.opt.tommy.hsf = require(PATH.opt .. 'tommy/hammerspoon_functions')
  self.opt.tommy.f = require(PATH.opt .. 'tommy/functions')

  self.env = {}
  self.env.const = require(PATH.env .. 'const')

  self.windowGridLine = require(PATH.lib .. 'drawing/window_grid_line').new()
end

Base.makeParameterContract = function(self, keyName)
  return {
    requireParameterKeys = {
      keyName,
    },
    whiteListTable = {
      {
        key = keyName,
        keyName = keyName
      }
    }
  }
end

Base.setParameter = function(self, parameter)
  self.parameter = parameter
end

Base.setResults = function(self, names, ...)
  for k, name in pairs(names) do
    self.results[name] = select(k, ...)
  end
end

Base.getResults = function(self, names)
  if names == nil then
    return self.results
  end

  if type(names) == 'string' then
    return self.results[names]
  end

  local results = {}
  for k, name in pairs(names) do
    results[name] = self.results[name]
  end

  return results
end

Base.resultsClean = function(self)
  self.results = {}
end

Base.isMoveWindow = function(self)
  return self:getResults('beforeData') ~= self:getResults('afterData')
end

Base.isMoveDisplay = function(self)
  return self:getResults('beforeData') ~= self:getResults('afterData')
end

Base.isMovePosition = function(self)
  local beforeData = self:getResults('beforeData')
  local afterData = self:getResults('afterData')
  local nearlyPX = self.windowGridLine.WindowGridLineWidth or 0

  nearlyPX = nearlyPX + Base.differencePX

  for k, v in pairs(beforeData) do
    if v ~= afterData[k] and not self.opt.tommy.f.isNealy(v, afterData[k], nearlyPX) then
      return true
    end
  end

  return false
end

Base.isApiCall = function(self)
  return self:getResults('apiResult')
end

Base.isVibrate = function(self)
  return self:getResults('vibrate')
end

Base.isShow = function(self)
  return self:getResults('show')
end

Base.isDelete = function(self)
  return self:getResults('delete')
end

Base.isValid = function(self)
  if not self.validation.f:isValid(self.parameter, self:makeParameterContract(self.parameterContractName)) then
    return false
  end

  return self.validation.hsf.hasFocus()
end

Base.isValidMovePosition = function(self)
  return self:isValid()
end

Base.isValidVibrate = function(self)
  return self:isValid()
end

Base.isValidMoveWindow = function(self)
  return self:isValid()
end

Base.isValidMoveDisplay = function(self)
  if not self:isValid() then
    return false
  end

  local direction = self.env.const.directionMapping[self.parameter.direction]
  return self.validation.hsf.hasNextDisplay(direction)
end

Base.isValidShow = function(self)
  if self.drawing then
    return false
  end

  if not self.validation.f:isValidShow(self.parameter, self.env.const[self.parameterContractName]) then
    return false
  end

  return not self.validation.hsf.isDesktop() and self.validation.hsf.hasFocus()
end

Base.isValidDelete = function(self)
  return not (self.drawing == nil)
end

Base.isValidApi = function(self)
  if not self.validation.f:isValidApi(self.parameter, self.requireParameterKeys) then
    return false
  end

  if not self[self.parameter.call] then
    return false
  end

  return self.validation.hsf.hasFocus()
end

Base.isValidMoveDesktopTogether = function(self)
  return self.validation.f:isValidMoveDesktopTogether(self.parameter, self.requireParameterKeys)
end

Base.isValidMoveWindowToOtherDesktop = function(self)
  if not self.validation.f:isValidMoveDesktopTogether(self.parameter, self.requireParameterKeys) then
    return false
  end

  return self.validation.hsf.hasFocus()
end

Base.isAfterMovingDisplay = function(self, results)
  if not results.isValid then
    return false
  end

  if not results.isExec then
    return false
  end

  if not results.isMoveDisplay then
    return false
  end

  return true
end

Base.isAfterMovingPosition = function(self, results, parameter)
  if not self.opt.tommy.f.tableKeyExists(parameter.position, self.env.const.positionToDirection) then
    return false
  end

  if not results.isValid then
    return false
  end

  if not results.isExec then
    return false
  end

  if results.isMovePosition then
    return false
  end

  return true
end

Base.findMoveDisplayDirection = function(self, parameter)
  return self.env.const.positionToDirection[parameter.position]
end

return Base
