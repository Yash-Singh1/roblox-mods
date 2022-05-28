; Allows you to press g to take out grenade and press g again to launch grenade
; Original is press g and hold to cook grenade and let go to launch grenade
; If for some reason your grenades just immediately throw, try /+Esc to turn on the chat then turn it off

Grenading := false
Chatting := false

#Persistent
SetTimer, CheckIfPlaying, 100

CheckIfPlaying:
WinGetActiveTitle, currentTitle
if (currentTitle != "Roblox") {
  return
}
WinGetPos, X, Y, width, height, Roblox
ImageSearch,,, X + (width * 3 / 4), Y + (height * 3 / 4), X + width, Y + height, *2 grenade-icon.png
if (ErrorLevel = 1) {
  Grenading := false
}
return

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
WinGetPos, X, Y, width, height, Roblox
ImageSearch,,, X + (width * 3 / 4), Y + (height * 3 / 4), X + width, Y + height, *2 grenade-icon.png
if (ErrorLevel = 1) {
} else {
  return
}
MouseGetPos, xpos
if WinExist("Roblox") {
  WinGetPos,, winy,, winh
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
if Grenading {
  Send {g up}
  Grenading := false
} else {
  Send {g down}
  Grenading := true
}
return
