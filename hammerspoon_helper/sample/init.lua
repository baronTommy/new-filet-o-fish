hs.window.animationDuration = 0
hs.screen.strictScreenInDirection = true
hs.hotkey.bind({"cmd",'shift'}, "R", function()
    hs.reload()
  end)

local boot = require('hammerspoon_helper/boot/init').new()
boot:init()
HS_H = boot:commandActivation('All')
MY_HS_H = boot:usrCommandActivation('All')

require('./urlevent')
require('./hotkey')

local cron = require('./cron').new()
cron:init()
COROUTINE = {}
COROUTINE.CREATE_COLOR = coroutine.create(cron.createColor)

WINDOW_WATCHER = hs.timer.doEvery(cron.frequency, cron.windowWatcher)
WINDOW_WATCHER:start()

hs.alert('load end')
