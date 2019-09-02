#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; Example 1
; Open a connection to the Active Directory; get the Fully Qualified Domain
; Name (FQDN) for the current user; close the connection.
; *****************************************************************************
#include <AD.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

Global $SUserID1, $SUserID2, $SUserId3, $SDNSDomain, $SHostServer, $SConfiguration, $SPassword, $SUserId, $aTEMP

; User is already a domain member
If @LogonDomain <> "" Then
	; Open Connection to the Active Directory
	_AD_Open()
	If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)
	$SUserID1 = @UserName
	$SUserID2 = @LogonDomain & "\" & @UserName
	$SUserId3 = @UserName & "@" & @LogonDNSDomain
	$SDNSDomain = $sAD_DNSDomain
	$SHostServer = $sAD_HostServer
	$SConfiguration = $sAD_Configuration
	_AD_Close()
EndIf

#region ### START Koda GUI section ### Form=
Global $Form1_1 = GUICreate("Active Directory Functions - Example 1", 515, 290, 251, 112)
GUICtrlCreateLabel("UserId", 8, 12, 39, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("Windows Login Name:", 96, 12, 131, 21)
Global $IRadio1 = GUICtrlCreateRadio("", 72, 8, 17, 21)
Global $IUserId1 = GUICtrlCreateInput($SUserID1, 241, 8, 259, 21)
GUICtrlCreateLabel("NetBIOS Login Name:", 96, 44, 131, 21)
Global $IRadio2 = GUICtrlCreateRadio("", 72, 40, 17, 21)
Global $IUserId2 = GUICtrlCreateInput($SUserID2, 241, 40, 259, 21)
GUICtrlCreateLabel("User Principal Name:", 96, 76, 131, 21)
Global $IRadio3 = GUICtrlCreateRadio("", 72, 72, 17, 21)
Global $IUserId3 = GUICtrlCreateInput($SUserId3, 241, 72, 259, 21)
GUICtrlCreateLabel("Password", 8, 108, 200, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $IPassword = GUICtrlCreateInput("", 241, 104, 259, 21, $ES_PASSWORD)
GUICtrlCreateLabel("DNSDomain", 8, 140, 200, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $IDNSDomain = GUICtrlCreateInput($SDNSDomain, 241, 140, 259, 21)
GUICtrlCreateLabel("HostServer", 8, 172, 200, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $IHostServer = GUICtrlCreateInput($SHostServer, 241, 172, 259, 21)
GUICtrlCreateLabel("Configuration", 8, 204, 200, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $IConfiguration = GUICtrlCreateInput($SConfiguration, 241, 204, 259, 21)
Global $BOK = GUICtrlCreateButton("Logon", 8, 246, 130, 33)
Global $BCancel = GUICtrlCreateButton("Cancel", 428, 246, 73, 33)

; User is already a domain member
If @LogonDomain <> "" Then
	GUICtrlSetState($IRadio2, $GUI_CHECKED)
	GUICtrlSetState($IPassword, $GUI_FOCUS)
EndIf

GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

While 1
	Global $nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $BCancel
			Exit
		Case $BOK
			$SPassword = GUICtrlRead($IPassword)
			If $SPassword = "" Then
				MsgBox(16, "Active Directory Functions", "Password is missing!")
				GUICtrlSetState($IPassword, $GUI_FOCUS)
				ContinueCase
			EndIf
			$SDNSDomain = GUICtrlRead($IDNSDomain)
			$SHostServer = GUICtrlRead($IHostServer)
			$SConfiguration = GUICtrlRead($IConfiguration)
			If GUICtrlRead($IRadio1) = $GUI_CHECKED Then
				$SUserId = GUICtrlRead($IUserId1)
			EndIf
			If GUICtrlRead($IRadio2) = $GUI_CHECKED Then
				$SUserId = GUICtrlRead($IUserId2)
				$aTEMP = StringSplit($SUserId, "\")
				If $aTEMP[0] <> 2 Then
					MsgBox(16, "Active Directory Functions", "Wrong format for NETBIOS name." & @CRLF & "Has to be 'Domain\Userid'.")
					GUICtrlSetState($IUserId2, $GUI_FOCUS)
					ContinueCase
				EndIf
			EndIf
			If GUICtrlRead($IRadio3) = $GUI_CHECKED Then
				$SUserId = GUICtrlRead($IUserId3)
				If StringInStr($SUserId, "@") = 0 Then
					MsgBox(16, "Active Directory Functions", "Wrong format for User Principal Name." & @CRLF & "Has to be e.g. 'Userid@domain.com'.")
					GUICtrlSetState($IUserId3, $GUI_FOCUS)
					ContinueCase
				EndIf
			EndIf
			; Open Connection to the Active Directory
			If _AD_Open($SUserId, $SPassword, $SDNSDomain, $SHostServer, $SConfiguration) Then
				MsgBox(64, "Active Directory Functions", "Logon was succcessful!")
			ElseIf @error <= 8 Then
				MsgBox(16, "Active Directory Functions", "The logon was not succcessful!" & @CRLF & @CRLF & "@error: " & @error & ", @extended: " & @extended)
			Else
				MsgBox(16, "Active Directory Functions", "The logon was not succcessful!" & @CRLF & @CRLF & "@error: " & @error & ", @extended: " & @extended & _
					@CRLF & @CRLF & "Extended error information will be displayed")
				Global $aError = _AD_GetLastADSIError()
				_ArrayDisplay($aError)
			EndIf
			; Close Connection to the Active Directory
			_AD_Close()
	EndSwitch
WEnd