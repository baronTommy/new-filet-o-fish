# Sample
`new-filet-o-fish/hammerspoon_helper/sample/`


# Functions

## Focus Move
```lua
HS_H.focus:moveWindow({direction = 'up'})
HS_H.focus:moveWindow({direction = 'down'})
HS_H.focus:moveWindow({direction = 'right'})
HS_H.focus:moveWindow({direction = 'left'})
```


## Window move position
```lua
MY_HS_H.window:movePosition({position = 'up_half'})
MY_HS_H.window:movePosition({position = 'down_half'})
MY_HS_H.window:movePosition({position = 'left_half'})
MY_HS_H.window:movePosition({position = 'right_half'})
MY_HS_H.window:movePosition({position = 'max'})
```


## Window move display
```lua
MY_HS_H.window:moveDisplay({direction = 'up'})
MY_HS_H.window:moveDisplay({direction = 'down'})
MY_HS_H.window:moveDisplay({direction = 'right'})
MY_HS_H.window:moveDisplay({direction = 'left'})
```

## Window vibrate
```lua
HS_H.window:vibrate({tremor = 'low'})
HS_H.window:vibrate({tremor = 'middle'})
HS_H.window:vibrate({tremor = 'high'})
```


## Window grid line
### Show
```lua
HS_H.drawing:windowGridLineShow({red = 1})
HS_H.drawing:windowGridLineShow({blue = 1})
HS_H.drawing:windowGridLineShow({green = 1})

HS_H.drawing:windowGridLineShow({red = 1, blue = 1, green = 1})
HS_H.drawing:windowGridLineShow({red = 0.1, blue = 0.5, green = 1})
```


### Delete
```lua
HS_H.drawing:windowGridLineDelete()
```

