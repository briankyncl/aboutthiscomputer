#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; Example 1
; Get the domain password policy and the password info for the current user
; *****************************************************************************
#include <AD.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

; Get the password info
Global $aAD_PwdInfo[14][2] = [[13],["Maximum Password Age (days)"],["Minimum Password Age (days)"],["Enforce Password History (# of passwords remembered)"], _
		["Minimum Password Length"],["Account Lockout Duration (minutes)"],["Account Lockout Threshold (invalid logon attempts)"],["Reset account lockout counter after (minutes)"], _
		["Password last changed (YYYY/MM/DD HH:MM:SS local time)"],["Password expires (YYYY/MM/DD HH:MM:SS local time)"],["Password last changed (YYYY/MM/DD HH:MM:SS UTC)"], _
		["Password expires (YYYY/MM/DD HH:MM:SS UTC)"],["Password properties"],["Password expires - virtual property (YYYY/MM/DD HH:MM:SS local time)"]]

Global $aTemp = _AD_GetPasswordInfo()
For $iCount = 1 To $aTemp[0]
	$aAD_PwdInfo[$iCount][1] = $aTemp[$iCount]
Next
$aAD_PwdInfo[0][0] = $aTemp[0]

_ArrayDisplay($aAD_PwdInfo, "Active Directory Functions - Example 1")

; Close Connection to the Active Directory
_AD_Close()