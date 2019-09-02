#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; Example 1
; Add an additional SMTP email address to the 'Email Addresses' tab
; of an Exchange-enabled AD account
; *****************************************************************************
#include <AD.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

Global $iReply = MsgBox(308, "Active Directory Functions - Example 1", "This script adds a SMTP mail address to an Exchange-enabled user." & @CRLF & @CRLF & _
		"Are you sure you want to change the Active Directory?")
If $iReply <> 6 Then Exit

; Enter parent UserId, EMailAddress and a flag to make this address the default address
#region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("Active Directory Functions - Example 1", 714, 156)
GUICtrlCreateLabel("EMail-enabled userid (samAccountName or FQDN):", 8, 10, 331, 17)
GUICtrlCreateLabel("Address to add:", 8, 42, 231, 17)
GUICtrlCreateLabel("If set makes the new address the default address:", 8, 74, 331, 34)
Global $IUser = GUICtrlCreateInput(@UserName, 341, 8, 359, 21)
Global $IAddress = GUICtrlCreateInput("", 341, 40, 359, 21)
Global $IFlag = GUICtrlCreateCheckbox("", 341, 72, 359, 21)
Global $BOK = GUICtrlCreateButton("Add address", 8, 114, 121, 33)
Global $BCancel = GUICtrlCreateButton("Cancel", 628, 114, 73, 33, BitOR($GUI_SS_DEFAULT_BUTTON, $BS_DEFPUSHBUTTON))
GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

While 1
	Global $nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $BCancel
			Exit
		Case $BOK
			Global $sUser = GUICtrlRead($IUser)
			Global $sAddress = GUICtrlRead($IAddress)
			Global $sFlag = BitAND(GUICtrlRead($IFlag), $GUI_CHECKED)
			ExitLoop
	EndSwitch
WEnd

; Add a new address
Global $iValue = _AD_AddEmailAddress($sUser, $sAddress, $sFlag)
If $iValue = 1 Then
	MsgBox(64, "Active Directory Functions - Example 1", "Address '" & $sAddress & "' successfully added")
ElseIf @error = 1 Then
	MsgBox(64, "Active Directory Functions - Example 1", "User '" & $sUser & "' does not exist")
ElseIf @error = 2 Then
	MsgBox(64, "Active Directory Functions - Example 1", "Could not connect to '" & $sUser & "'")
Else
	MsgBox(64, "Active Directory Functions - Example 1", "Return code '" & @error & "' from Active Directory")
EndIf

; Close Connection to the Active Directory
_AD_Close()