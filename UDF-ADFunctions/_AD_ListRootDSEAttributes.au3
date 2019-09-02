#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; Example 1
; Get a list of all RootDSE attributes
; http://msdn.microsoft.com/en-us/library/cc223273.aspx
;
; domainControllerFunctionality: Specifies the functional level of this domain controller. Values can be:
;    0 - Windows 2000 Mode
;    2 - Windows Server 2003 Mode
;    3 - Windows Server 2008 Mode
;    4 - Windows Server 2008 R2 Mode
;    5 - Windows Server 2012 Mode
;    6 - Windows Server 2012 R2 Mode
;    7 - Windows Server 2016 Mode
; domainFunctionality: Specifies the functional level of the domain. Values can be:
;    0 - Windows 2000 Domain Mode
;    1 - Windows Server 2003 Interim Domain Mode
;    2 - Windows Server 2003 Domain Mode
;    3 - Windows Server 2008 Domain Mode
;    4 - Windows Server 2008 R2 Domain Mode
;    5 - Windows Server 2012 Domain Mode
;    6 - Windows Server 2012 R2 Domain Mode
;    7 - Windows Server 2016 Domain Mode
; forestFunctionality: Specifies the functional level of the forest. Values can be:
;    0 - Windows 2000 Forest Mode
;    1 - Windows Server 2003 Interim Forest Mode
;    2 - Windows Server 2003 Forest Mode
;    3 - Windows Server 2008 Forest Mode
;    4 - Windows Server 2008 R2 Forest Mode
;    5 - Windows Server 2012 Forest Mode
;    6 - Windows Server 2012 R2 Forest Mode
;    7 - Windows Server 2016 Forest Mode
; *****************************************************************************
#include <AD.au3>

; Open Connection to the Active Directory
_AD_Open()
If @error Then Exit MsgBox(16, "Active Directory Example Skript", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

; Get a list of all RootDSE attributes
Global $aTemp = _AD_ListRootDSEAttributes()
_ArrayDisplay($aTemp, "Active Directory Functions - Example 1")

; Close Connection to the Active Directory
_AD_Close()