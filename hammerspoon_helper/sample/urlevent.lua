hs.urlevent.bind('move_focus', function(eventName, parameter)
    HS_H.focus:moveWindow(parameter)
  end)

hs.urlevent.bind('move_window_position', function(eventName, parameter)
    MY_HS_H.window:movePosition(parameter)
  end)

hs.urlevent.bind('move_window_position_to_other_display', function(eventName, parameter)
    MY_HS_H.window:moveDisplay(parameter)
  end)
