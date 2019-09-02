#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; Example 1
; Moves an AD object to another OU.
; *****************************************************************************
#include <AD.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

Global $iReply = MsgBox(308, "Active Directory Functions - Example 1", "This script moves an object to another OU." & @CRLF & @CRLF & _
		"Are you sure you want to change the Active Directory?")
If $iReply <> 6 Then Exit

; Enter object to move and target OU
#region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("Active Directory Functions - Example 1", 814, 124)
GUICtrlCreateLabel("Object to move (FQDN or sAMAccountName):", 8, 10, 231, 17)
GUICtrlCreateLabel("OU where to move to (FQDN):", 8, 42, 231, 17)
Global $IObject = GUICtrlCreateInput(_AD_SamAccountNameToFQDN(@UserName), 241, 8, 559, 21)
Global $ITargetOU = GUICtrlCreateInput("", 241, 40, 559, 21)
Global $BOK = GUICtrlCreateButton("Move object", 8, 72, 130, 33)
Global $BCancel = GUICtrlCreateButton("Cancel", 728, 72, 73, 33, BitOR($GUI_SS_DEFAULT_BUTTON, $BS_DEFPUSHBUTTON))
GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

While 1
	Global $nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $BCancel
			Exit
		Case $BOK
			Global $sObject = GUICtrlRead($IObject)
			Global $sTargetOU = GUICtrlRead($ITargetOU)
			ExitLoop
	EndSwitch
WEnd

; Move object
Global $iValue = _AD_MoveObject($sTargetOU, $sObject)
If $iValue = 1 Then
	MsgBox(64, "Active Directory Functions - Example 1", "Object '" & $sObject & "' successfully moved to '" & $sTargetOU & "'")
ElseIf @error = 1 Then
	MsgBox(64, "Active Directory Functions - Example 1", "Target OU '" & $sTargetOU & "' does not exist")
ElseIf @error = 2 Then
	MsgBox(64, "Active Directory Functions - Example 1", "Object '" & $sObject & "' does not exist")
Else
	MsgBox(64, "Active Directory Functions - Example 1", "Return code '" & @error & "' from Active Directory")
EndIf

; Close Connection to the Active Directory
_AD_Close()