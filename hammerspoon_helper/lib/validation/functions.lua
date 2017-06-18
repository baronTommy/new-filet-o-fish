local Functions = {}

local opt = {}
opt.tommy = {}
opt.tommy.f = require(PATH.opt .. 'tommy/functions')

Functions.getWhiteListTable = function(key)
  local whiteListTable = {
    position = {
      'up_half',
      'down_half',
      'left_half',
      'right_half',
      'max'
    },
    direction = {
      'up',
      'down',
      'left',
      'right'
    },
    tremor = {
      'high',
      'middle',
      'low'
    }
  }

  return whiteListTable[key]
end

Functions.depthOfColor = {
  min = 0,
  max = 1,
}

Functions.isValid = function(self, parameter, etc)
  if #etc['requireParameterKeys'] == 0 then
    if parameter == nil then
      return true
    end
    return false
  else
    if parameter == nil then
      return false
    end
  end

  if not opt.tommy.f.hasKeys(etc['requireParameterKeys'], parameter) then
    return false
  end

  for k, v in pairs(etc['whiteListTable']) do
    if not opt.tommy.f.tableValueExists(parameter[v.key], self.getWhiteListTable(v.keyName)) then
      return false
    end
  end

  if opt.tommy.f.tableCount(parameter) ~= #etc['whiteListTable'] then
    return false
  end

  return true
end

Functions.isValidShow = function(self, parameter, etc)
  if type(parameter) ~= 'table' then
    return false
  end

  if opt.tommy.f.tableCount(parameter) == 0 then
    return false
  end

  for k, v in pairs(parameter) do
    if not opt.tommy.f.tableValueExists(k, etc) then
      return false
    end

    if self.depthOfColor.min > v or self.depthOfColor.max < v then
      return false
    end
  end

  return true
end

Functions.isValidApi = function(self, parameter, requireParameterKeys)
  if type(parameter) ~= 'table' then
    return false
  end

  if opt.tommy.f.tableCount(parameter) == 0 then
    return false
  end

  if not opt.tommy.f.hasKeys(requireParameterKeys, parameter) then
    return false
  end

  return true
end

Functions.isValidMoveDesktopTogether = function(self, parameter, requireParameterKeys)
  return Functions.isValidApi(self, parameter, requireParameterKeys)
end

return Functions
