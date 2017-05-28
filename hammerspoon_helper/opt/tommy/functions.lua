local Functions = {}

Functions.tableKeyExists = function(key, t)
  for k, v in pairs(t) do
    if k == key then
      return true
    end
  end
  return false
end

Functions.tableValueExists = function(value, t)
  for k, v in pairs(t) do
    if v == value then
      return true
    end
  end
  return false
end

Functions.tableCount = function(t)
  local cnt = 0
  for k, v in pairs(t) do
    cnt = cnt + 1
  end
  return cnt
end

Functions.isNealy = function(v1, v2, nearlyPX)
  local diff = v1 - v2

  if diff <= nearlyPX and -nearlyPX <= diff then
    return true
  end

  return false
end

Functions.hasKeys = function(keys, t)
  for k, v in pairs(keys) do
    if t[v] == nil then
      return false
    end
  end

  return true
end

return Functions
