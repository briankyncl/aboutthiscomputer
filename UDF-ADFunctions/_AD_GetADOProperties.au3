#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include <AD.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

; *****************************************************************************
; Example 1
; Display all properties of the ADO Connection Object
; *****************************************************************************
Global $aResult = _AD_GetADOProperties("Conn")
_ArrayDisplay($aResult, "ADO Connection Object")

; *****************************************************************************
; Example 2
; Display all properties of the ADO Command Object
; *****************************************************************************
$aResult = _AD_GetADOProperties("Com")
_ArrayDisplay($aResult, "ADO Command Object")

; *****************************************************************************
; Example 3
; Display three properties of the ADO Command Object
; *****************************************************************************
$aResult = _AD_GetADOProperties("Command", "SearchScope,Column Names only,sort on")
_ArrayDisplay($aResult, "ADO Command Object")