#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include <AD.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

; *****************************************************************************
; Example 1
; Checks if the account for the current user is locked.
; *****************************************************************************
If _AD_IsObjectLocked() Then
	MsgBox(64, "Active Directory Functions", "User account '" & @UserName & "' is locked. Will be unlocked in " & @error & " minutes.")
Else
	MsgBox(64, "Active Directory Functions", "User account '" & @UserName & "' is not locked")
EndIf

; *****************************************************************************
; Example 2
; Get a list of locked accounts and checks the first entry
; *****************************************************************************
Global $aLocked = _AD_GetObjectsLocked()

If $aLocked[0] > 0 Then
	Global $sUser = _AD_FQDNToSamAccountName($aLocked[1])
	If _AD_IsObjectLocked($sUser) Then
		MsgBox(64, "Active Directory Functions", "User account '" & $sUser & "' is locked")
	Else
		MsgBox(64, "Active Directory Functions", "User account '" & $sUser & "' is not locked")
	EndIf
Else
	MsgBox(64, "Active Directory Functions", "No locked users accounts found")
EndIf

; Close Connection to the Active Directory
_AD_Close()