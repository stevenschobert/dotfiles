#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, ChomeShortcuts, ahk_exe chrome.exe
GroupAdd, TermShortcuts, ahk_exe WindowsTerminal.exe

#IfWinActive ahk_group ChomeShortcuts
!t::
Send, {Ctrl down}t{Ctrl up}
return
!f::
Send, {Ctrl down}f{Ctrl up}
return
#IfWinActive

#IfWinActive ahk_group TermShortcuts
!t::
Send, {Ctrl down}{Shift down}t{Ctrl up}{Shift up}
return
!c::
Send, {Ctrl down}{Shift down}c{Ctrl up}{Shift up}
return
!v::
Send, {Ctrl down}{Shift down}v{Ctrl up}{Shift up}
return
#IfWinActive

!c::
Send, {Ctrl down}c{Ctrl up}
return

!v::
Send, {Ctrl down}v{Ctrl up}
return

!z::
Send, {Ctrl down}z{Ctrl up}
return

!w::
Send, {Ctrl down}w{Ctrl up}
return

!q::
Send, {Alt down}{F4}{Alt up}
return

!+]::
Send, {Ctrl down}{Tab}{Ctrl up}
return

!+[::
Send, {Ctrl down}{Shift down}{Tab}{Ctrl up}{Shift up}
return

Alt & Space::
KeyWait Alt
KeyWait Space
Send, {LWin down}{LWin up}
return

CapsLock::LCtrl
CapsLock Up::
SendInput, {LCtrl up}
If A_TimeSincePriorHotkey < 200
{
  SendInput, {Escape}   
}
Else
return
return

Enter::RCtrl
Enter Up::
SendInput, {RCtrl up}
If A_TimeSincePriorHotkey < 200
{
  SendInput, {Enter}   
}
Else
return
return

F1::
if WinActive("ahk_class CabinetWClass") {
    WinMinimize, ahk_class CabinetWClass
} else {
    WinActivate, ahk_class CabinetWClass
}
return

F3::
if WinActive("ahk_exe chrome.exe") {
    WinMinimize, ahk_exe chrome.exe
} else {
    WinActivate, ahk_exe chrome.exe
}
return

F4::
if WinActive("ahk_exe WindowsTerminal.exe") {
    WinMinimize, ahk_exe WindowsTerminal.exe
} else {
    WinActivate, ahk_exe WindowsTerminal.exe
}
return

F12::
if WinActive("ahk_exe Code.exe") {
    WinMinimize, ahk_exe Code.exe
} else {
    WinActivate, ahk_exe Code.exe
}
return