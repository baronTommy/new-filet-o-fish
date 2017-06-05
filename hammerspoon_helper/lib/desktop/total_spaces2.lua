local TotalSpaces2 = {}

TotalSpaces2.requireParameterKeys = {'desktop_id'}

TotalSpaces2.moveDesktopTogetherCommand = [[ ruby -r totalspaces2 -e 'TotalSpaces2.display_list.each do |v| TotalSpaces2.move_to_space_on_display('$desktopId', v[:display_id]) end' ]]
TotalSpaces2.moveWindowToOtherDesktopCommand = [[ ruby -r totalspaces2 -e 'TotalSpaces2.window_list; TotalSpaces2.move_window_to_space($windowId, $desktopId)' ]]

TotalSpaces2.new = function()
  local self = TotalSpaces2
  return self
end

TotalSpaces2.init = function(self)
  self.base = require(PATH.lib .. 'base').new()
  self.base:init()
  self = setmetatable(self, {__index = self.base})
end

TotalSpaces2.moveDesktopTogether = function(self)
  local replace = {
    desktopId = self.parameter.desktop_id,
  }
  local command = self.moveDesktopTogetherCommand:gsub('$(%w+)', replace)

  pcall(io.popen(command))
end

TotalSpaces2.moveWindowToOtherDesktop = function(self)
  local replace = {
    desktopId = self.parameter.desktop_id,
    windowId = hs.window.focusedWindow():id()
  }
  local command = self.moveWindowToOtherDesktopCommand:gsub('$(%w+)', replace)

  pcall(io.popen(command))
end

return TotalSpaces2
