#singleinstance force

; script writer must decide how to get data in from storage file 
; and how to 'refresh' the scripts hotkeys

; keep track of a previous Hotkey
previousHotkey=

; interface with the use to make changes

 gui, add, text,, enter your hotkey and press 'done'
 Gui, Add, Hotkey, vChosenHotkey, %ChosenHotkey%
 gui, add, button, gdone, Done
 gui, show
return

done:
previousHotkey:=ChosenHotkey
gui, submit
; msgbox >%ChosenHotkey%< ; <----- just a diagnostic, 
			;      to see what this hotkey looks like

; if no curent hotkey, quit
if ChosenHotkey=
  return
else
  Hotkey, %ChosenHotkey% , just_a_subroutine

; if no previous hotkey, quit
if previousHotkey=
  return

; if no change from previous hotkey, quit

if previousHotkey = %ChosenHotkey%
  return

; remove previous hotkey
Hotkey, %previousHotkey% , OFF
previousHotkey=
  return

just_a_subroutine:
	IfWinExist ahk_class CIPCOMMUNICATOR
     {
          WinActivate ahk_class CIPCOMMUNICATOR
          Send {F2}
     }
return

; this how the hotkey assignment gui can be show again

Lalt & f1::
 gui, show
return

+esc::exitapp ;press shift-escape to exit the script