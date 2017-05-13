local Base = {}

Base.ngParameters = {
  '',
  'hoge',
  {},
  {hoge = nil},
  {hoge = ''}
}

Base.new = function()
  local self = Base
  return self
end

Base.init = function(self, recipe)
  self.tests = {}
  self:make(recipe)
end

Base.call = function(self)
  for k,v in ipairs(self.tests) do
    v()
  end
end

Base.make = function(self, recipe)
  for k, testCase in pairs(recipe.testCases) do
    self:makeHelper(recipe.target, testCase)
    for k3, ngParameter in pairs(self.ngParameters) do
      self:makeHelper(recipe.target, testCase, ngParameter)
    end
  end
end

Base.makeHelper = function(self, target, testCase, ngParameter)
  table.insert(self.tests, function()
      self:printBegin()
      for k, v in pairs(testCase) do
        local parameter = self:findParameter(v.parameter, ngParameter)
        local callName = v.callName
        local resultKeyNames = v.resultKeyNames

        self:setGlobalTestValues(v.testValues)
        local result = target[callName](target, parameter)
        self:printDebugs(callName, parameter, resultKeyNames, result, ngParameter)
        self:assert(resultKeyNames, result, ngParameter)
        self:resetGlobalTestValues()
      end
      self:printFinish()
    end)
end

Base.printDebugs = function(self, callName, parameter, resultKeyNames, result, ngParameter)
  self:printDebug('#', 'functionName', callName)
  self:printGlobalTestValues()
  self:printParameter(parameter)
  self:printResult(resultKeyNames, result, ngParameter)
end

Base.printResult = function(self, resultKeyNames, result, ngParameter)
  for keyName, expectedValue in pairs(resultKeyNames) do
    self:printDebug('@', 'resultKeyName', keyName)
    if ngParameter then
      expectedValue = 'false or nil'
    end
    self:printDebug('*', 'expectedValue', expectedValue)
    self:printDebug('=', 'resultValue  ', result[keyName])
  end
end

Base.assert = function(self, resultKeyNames, result, ngParameter)
  for keyName, expectedValue in pairs(resultKeyNames) do
    if ngParameter then
      assert(not result[keyName])
    else
      assert(self:makeAssertParameter(expectedValue, result[keyName]))
    end
  end
end

Base.makeAssertParameter = function(self, expectedValue, resultData)
  if expectedValue == 'true' then
    return resultData
  end

  if expectedValue == 'false' then
    return not resultData
  end

  if expectedValue == 'nil' then
    return resultData == nil
  end

  if expectedValue == '?' then
    return true
  end

end

Base.findParameter = function(self, parameter, ngParameter)
  if ngParameter then
    return ngParameter
  end

  if parameter then
    return parameter
  end

  return nil
end

Base.setGlobalTestValues = function(self, testValues, unsetFlg)
  if not testValues then
    return
  end

  for testValuesKeyname, testValues in pairs(testValues) do
    TEST_VALUES[testValuesKeyname] = testValues
  end
end

Base.resetGlobalTestValues = function(self)
  TEST_VALUES = {}
end

Base.printGlobalTestValues = function(self)
  if not TEST_VALUES then
    return
  end

  for k, v in pairs(TEST_VALUES) do
    self:printDebug('$', k, v)
  end
end

Base.printParameter = function(self, parameter)
  if not parameter then
    return
  end

  if type(parameter) == 'string' then
    self:printDebug('%', '', parameter)
  end

  if type(parameter) == 'table' then
    for k, v in pairs(parameter) do
      self:printDebug('%', k, v)
    end
  end
end

Base.printDebug = function(self, symbol, keyname, value)
  print(symbol, keyname, '->', value)
end

Base.printBegin = function(self)
  print('↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓')
end

Base.printFinish = function(self)
  print('↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑')
end

return Base
