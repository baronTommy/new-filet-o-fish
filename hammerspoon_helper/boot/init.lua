-- TEST_MODE = true
-- TEST_VALUES = {}
-- require('hammerspoon_helper/test/init').new():init()

local Boot = {}

Boot.new = function()
  local self = Boot
  return self
end

Boot.init = function(self)
  PATH = require('hammerspoon_helper/env/path')

  self.command = {}
  self.usrCommand = {}

  self.opt = {}
  self.opt.tommy = {}
  self.opt.tommy.f = require(PATH.opt .. 'tommy/functions')

  self.commands = {
    'Window',
    'Focus',
    'Drawing'
  }

  self.usrCommands = {
    'Window',
  }

  PATH = nil
end

Boot.commandActivation = function(self, loadCommands)
  PATH = require('hammerspoon_helper/env/path')

  local commands = loadCommands
  if loadCommands == 'All' then
    commands = self.commands
  end

  for k, v in pairs(commands) do
    if self.opt.tommy.f.tableValueExists(v, self.commands) then
      local name = string.lower(v)
      self.command[name] = require(PATH.bin .. name).new()
      self.command[name]:init()
    end
  end

  PATH = nil
  return self.command
end

Boot.usrCommandActivation = function(self, loadCommands)
  PATH = require('hammerspoon_helper/env/path')
  local boot = require(PATH.boot .. 'init').new()
  boot:init()
  local bin = boot:commandActivation('All')

  local commands = loadCommands
  if loadCommands == 'All' then
    commands = self.usrCommands
  end

  PATH = require('hammerspoon_helper/env/path')
  for k, v in pairs(commands) do
    if self.opt.tommy.f.tableValueExists(v, self.usrCommands) then
      local name = string.lower(v)
      self.usrCommand[name] = require(PATH.usrBin .. name).new()
      self.usrCommand[name]:init(bin)
    end
  end

  PATH = nil
  return self.usrCommand
end

return Boot
