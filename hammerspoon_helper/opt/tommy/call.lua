local Call = {}

Call.new = function()
  local self = Call
  return self
end

Call.init = function(self)
  self.action = {}
  self.parameter = {}
end

Call.movePosition = function(self)
  return self:call(
    'isValidMovePosition',
    {'beforeData', 'afterData'},
    'move',
    {'isMovePosition'},
    'isMovePosition',
    {'isValid','isExec','isMovePosition'}
  )
end

Call.vibrate = function(self)
  return self:call(
    'isValidVibrate',
    {'vibrate'},
    'vibrate',
    {'isVibrate'},
    'isVibrate',
    {'isValid','isExec','isVibrate'}
  )
end

Call.moveDisplay = function(self)
  return self:call(
    'isValidMoveDisplay',
    {'beforeData', 'afterData'},
    'move',
    {'isMoveDisplay'},
    'isMoveDisplay',
    {'isValid','isExec','isMoveDisplay'}
  )
end

Call.moveWindow = function(self)
  return self:call(
    'isValidMoveWindow',
    {'beforeData', 'afterData'},
    'move',
    {'isMoveWindow'},
    'isMoveWindow',
    {'isValid','isExec','isMoveWindow'}
  )
end

Call.show = function(self)
  return self:call(
    'isValidShow',
    {'show'},
    'show',
    {'isShow'},
    'isShow',
    {'isValid','isExec','isShow'}
  )
end

Call.delete = function(self)
  return self:call(
    'isValidDelete',
    {'delete'},
    'delete',
    {'isDelete'},
    'isDelete',
    {'isValid','isExec','isDelete'}
  )
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

  self:callIsAction(actionResultsNames, isActionFunctionNmae)
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
