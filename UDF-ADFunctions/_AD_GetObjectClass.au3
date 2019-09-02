#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; Example 1
; Displays the class for the logged on user and local computer.
; *****************************************************************************
#include <AD.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

; Return class for the logged on user and local computer
MsgBox(64, "Active Directory Functions - Example 1", _
		"Class for logged on user: " & _AD_GetObjectClass(@UserName) & @CRLF & _
		"Class for local computer: " & _AD_GetObjectClass(@ComputerName & "$"))

; Close Connection to the Active Directory
_AD_Close()