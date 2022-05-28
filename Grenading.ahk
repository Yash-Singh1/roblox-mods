Grenading := false
GrenadedTickTiming := A_TickCount
Chatting := false

#IfWinActive Roblox
~/::
Chatting := true
return

#IfWinActive Roblox
~Esc::
Chatting := false
return

#IfWinActive Roblox
~Enter::
Chatting := false
return

#IfWinActive Roblox
~LButton::
Keywait, LButton
SetWorkingDir %A_ScriptDir%
WinSet, Transparent, Off
ImageSearch,,, 0, 0, A_ScreenWidth, A_ScreenHeight, *2 grenade-icon.png
if (ErrorLevel = 1) {
} else {
  return
}
MouseGetPos, xpos
if WinExist("Roblox") {
  WinGetPos,, winy,, winh
  x := xpos - winx
  y := winh - (ypos - winy)
  if (y <= 20) {
    Chatting := true
  } else {
    Chatting := false
  }
}
return

#IfWinActive Roblox
g UP::
if Chatting {
  Send g
  return
}
if (Grenading and A_TickCount - GrenadedTickTiming > 5000) {
  Grenading := false
}
if Grenading {
  Send {g up}
  Grenading := false
} else {
  Send {g down}
  Grenading := true
  GrenadedTickTiming := A_TickCount
}
return
