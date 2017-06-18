local Call = {}

Call.new = function()
  local self = Call
  return self
end

Call.init = function(self)
  self.action = {}
  self.parameter = {}
end

Call.preSetting = function(self, action, parameter)
  self.action = action
  self.parameter = parameter
  self.action:resultsClean()
  self.action:setParameter(self.parameter)
end

Call.call = function(self, isValidFunctionName, execResultsNames, execFunctionName, actionResultsNames, isActionFunctionNmae, resultsName)
  if isValidFunctionName then
    if not self:callIsValid(isValidFunctionName) then
      return self.action:getResults(resultsNames)
    end
  end

  if not self:callExec(execResultsNames, execFunctionName) then
    return self.action:getResults(resultsNames)
  end

  if isActionFunctionNmae ~= nil then
    self:callIsAction(actionResultsNames, isActionFunctionNmae)
  end

  return self:callSetResults(resultsName)
end

Call.callIsValid = function(self, functionName)
  self.action:setResults({'isValid'}, self.action[functionName](self.action))
  return self.action:getResults('isValid')
end

Call.callExec = function(self, resultsNames, functionName)
  table.insert(resultsNames, 1, 'isExec')
  self.action:setResults(resultsNames, pcall(self.action[functionName], self.action))
  return self.action:getResults('isExec')
end

Call.callIsAction = function(self, setResultsNames, functionName)
  self.action:setResults(setResultsNames, self.action[functionName](self.action))
end

Call.callSetResults = function(self, resultsNames)
  return self.action:getResults(resultsNames)
end

return Call
