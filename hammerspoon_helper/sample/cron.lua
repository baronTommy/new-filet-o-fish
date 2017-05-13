local Cron = {}

Cron.new = function()
  local self = Cron
  return self
end

Cron.init = function(self)
  self.frequency = 0.1
  self.currentFocus = nil
end

Cron.isNewFocus = function(self)
  local fw = hs.window.focusedWindow()

  if fw == nil or fw == false then
    return false
  end

  if fw == self.currentFocus then
    return false
  end

  self.currentFocus = fw
  return true
end

Cron.createRandomColor = function(self)
  while true do
    local borderColor = {}

    for k, v in pairs({'red', 'blue', 'green'}) do
      borderColor[v] = math.random(0, 1)
    end

    coroutine.yield(borderColor)
  end
end

Cron.windowWatcher = function()
  HS_H.drawing:windowGridLineDelete()

  local bool, color = coroutine.resume(COROUTINE.CREATE_RANDOM_COLOR)

  HS_H.drawing:windowGridLineShow(color)

  if Cron:isNewFocus() then
    HS_H.drawing:windowGridLineDelete()
    HS_H.window:vibrate({tremor = 'high'})
    return
  end
end

return Cron
