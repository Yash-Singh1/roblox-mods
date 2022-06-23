; Allows you to press q to aim instead of right-click for no-right click mouses

Chatting := false
Aiming := false

#Persistent
SetTimer, CheckIfPlaying, 100

CheckIfPlaying:
WinGetActiveTitle, currentTitle
if (currentTitle != "Roblox") {
  return
}
WinGetPos, X, Y, width, height, Roblox
SetWorkingDir %A_ScriptDir%
ImageSearch,,, X, Y, X + width, Y + height, *30 setting.jpg
if (ErrorLevel != 1 && ErrorLevel != 2) {
  if (Aiming) {
    Click, Up Right
  }
  Aiming := false
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
q UP::
if Chatting {
  Aiming := false
  Click, Up Right
  Send q
  return
}
if Aiming {
  Click, Up Right
  Aiming := false
} else {
  Click, Down Right
  Aiming := true
}
return
