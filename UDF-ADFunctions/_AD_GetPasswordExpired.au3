#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; Example 1
; Get a list of user accounts with expired password
; *****************************************************************************
#include <AD.au3>
#include <Debug.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

; Get a list of user accounts with expired password
Global $aExpired[1]
$aExpired = _AD_GetPasswordExpired()
If @error > 0 Then
	MsgBox(64, "Active Directory Functions - Example 1", "No users with expired passwords could be found")
Else
	_DebugArrayDisplay($aExpired, "Active Directory Functions - Example 1 - User accounts with expired password")
EndIf

; Close Connection to the Active Directory
_AD_Close()