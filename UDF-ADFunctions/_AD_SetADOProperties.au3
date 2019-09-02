#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include <AD.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

; *****************************************************************************
; Example 1
; Set a single property of the ADO Command Object
; *****************************************************************************
Global $aResult = _AD_SetADOProperties("Page Size = 200")
If @error <> 0 Then
	MsgBox(16, "Active Directory Functions - Example 1", "Error setting properties of the ADO command object. @error = " & @error & ", @extended = " & @extended)
Else
	$aResult = _AD_GetADOProperties("Com", "Page Size")
	_ArrayDisplay($aResult, "ADO Command Object")
EndIf