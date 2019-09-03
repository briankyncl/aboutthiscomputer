#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\AboutThisComputer\Support\BeOS_info.ico
#AutoIt3Wrapper_Outfile=..\AboutThisComputer\AboutThisComputerInstallHelper.exe
#AutoIt3Wrapper_Outfile_x64=..\AboutThisComputer\AboutThisComputerInstallHelper_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Fileversion=1.0.0.27
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=Copyright (c) 2018 Brian Kyncl (www.briankyncl.com). All rights reserved.
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=highestAvailable
#AutoIt3Wrapper_Add_Constants=n
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <FileConstants.au3>
; *** End added by AutoIt3Wrapper ***

#COMMENTS-START

    AboutThisComputerInstallHelper.au3
    Script/executable for assisting the INNO Setup installer for About This Computer.

    Created by Brian Kyncl on 2018-01-30
    Copyright (c) 2018 Brian Kyncl. All rights reserved.

    Must be ran with administrative privileges.

#COMMENTS-END

#Region -- PRE-FLIGHT
;; SCRIPT OPTIONS
  _WinAPI_Wow64EnableWow64FsRedirection(False)

;; INCLUDES
  #include <WinAPIFiles.au3>
#EndRegion

#Region -- ENVIRONMENT
;; EXECUTABLE MODE (GUI OR COMMAND LINE)
  If $CmdLine[00] > 0 Then
    Switch $CmdLine[01]
      Case '-mode'
        Switch $CmdLine [02]
          Case 'BeforeInstall'
            Global $sExeMode = 'BeforeInstall'
          Case 'AfterInstall'
            Global $sExeMode = 'AfterInstall'
        EndSwitch
      Case Else	;incorrect parameters provided
        MsgBox(1, 'About This Computer Install Helper', 'Incorrect paramters provided. Try "AboutThisComputerInstallHelper.exe -mode BeforeInstall".')
        SoftExit()
    EndSwitch
  Else
  MsgBox(1, 'About This Computer Install Helper', 'This should be ran only by the About This Computer installer.')
  SoftExit()
  EndIf

;; ENVIRONMENT
  Global $sDirScript         = @scriptDir
  Global $systemDrive        = EnvGet("systemdrive") ;Ex: 'C:'

  Global $aVerBuildNum       = StringSplit(FileGetVersion(@AutoItExe), '.')
  Global $sBuildNum          = $aVerBuildNum[4]
  Global $sVersionNum        = $aVerBuildNum[1] & '.' & $aVerBuildNum[2] & '.' & $aVerBuildNum[3]

  Global $bDebug             = False	;;True or False

;; GLOBAL DECLARATIONS
  Global $sTempDirRoot       = @TempDir & '\com.briankyncl'
  Global $sTempDir           = $sTempDirRoot & '\About This Computer'
  Global $sSupportTempDir    = $sTempDir & '\Support'
  Global $sTemplatesTempDir  = $sSupportTempDir & '\Templates'

  Global $sSupportDir        = @AppDataCommonDir & '\com.briankyncl\About This Computer\Support'
  Global $sTemplatesDir      = $sSupportDir & '\Templates'

#EndRegion

#Region -- START
If FileExists($sDirScript & '\AboutThisComputerInstallHelper_x64.exe') Then
  If @OSArch = 'X64' And @AutoItX64 <> 1 Then
    ;;If 64-bit, call 64-bit helper
    ShellExecuteWait($sDirScript & '\AboutThisComputerInstallHelper_x64.exe', $CmdLine[01] & ' ' & $CmdLine [02])
    SoftExit()
  EndIf
EndIf

Switch $sExeMode
  Case 'BeforeInstall'
    BeforeInstall()
  Case 'AfterInstall'
    AfterInstall()
EndSwitch
#EndRegion

#Region -- MAIN
;; BEFORE INSTALLING ABOUT THIS COMPUTER
  Func BeforeInstall()
    ;; DEBUG
      If $bDebug Then MsgBox('','Debug','BeforeInstall() called.')

    ;; UNINSTALL SYSTEM INFO
      RunWait(@ComSpec & " /c taskkill /IM ""systeminfo.exe"" /F", @SystemDir, @SW_HIDE)
      DirRemove($systemDrive & '\Program Files\IntelliAdmin\', 1)
      DirRemove($systemDrive & '\Program Files (x86)\IntelliAdmin\', 1)
      DirRemove(@ProgramsCommonDir & '\IntelliAdmin\', 1)
      FileDelete(@StartupCommonDir & '\systeminfo.lnk')

    ;; TERM ABOUT THIS COMPUTER
      RunWait(@ComSpec & " /c taskkill /IM ""AboutThisComputer.exe"" /F", @SystemDir, @SW_HIDE)

    ;; CAREFULLY BACKUP TEMPLATES
      FileDelete($sTemplatesDir & '\*-sample.xml')  ;;remove samples
      FileCopy($sTemplatesDir & '\*', $sTemplatesTempDir & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;backup user-created templates

    ;; CAREFULLY BACKUP CUSTOM CONFIG
      FileCopy($sSupportDir & '\*.txt', $sSupportTempDir & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;backup user-created config files

    ;; CLEANUP WHAT INNO SETUP WON'T REMOVE
      DirRemove(@AppDataCommonDir & '\com.briankyncl\About This Computer\Support', 1)
      RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', 'About This Computer')

  ;; DEBUG
      If $bDebug Then ShellExecute($sTempDir)
  EndFunc

;; AFTER INSTALLING ABOUT THIS COMPUTER
  Func AfterInstall()
    ;; DEBUG
      If $bDebug Then MsgBox('','Debug','AfterInstall() called.')

    ;; CAREFULLY RESTORE TEMPLATES, IF APPLICABLE
      FileCopy($sTemplatesTempDir & '\*', $sTemplatesDir & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;restore user-created templates

    ;; CAREFULLY RESTORE CUSTOM CONFIG, IF APPLICABLE
      If FileExists($sSupportTempDir & '\*.txt') Then
        FileDelete($sSupportDir & '\*.txt')
        FileCopy($sSupportTempDir & '\*.txt', $sSupportDir & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;restore user-created config files
      EndIf






    ;;MIGRATE CONFIGURATION
      ;Convert old file-based config to registry-based config.
      ;read custom helpdesk email, set corporate standard if not found

      ;;LEGACY HELPDESK EMAIL
      $sCustomHelpdeskEmailFilePath = $sAppInstallPathLegacy & '\Support\CustomHelpdeskEmail.txt'
      If FileExists($sCustomHelpdeskEmailFilePath) Then
        Local $hFileOpen = FileOpen($sCustomHelpdeskEmailFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sOrgName', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sCustomHelpdeskEmailFilePath)
      EndIf

      ;;LEGACY HELPDESK PHONE
      $sCustomHelpdeskPhoneFilePath = $sAppInstallPathLegacy & '\Support\CustomHelpdeskPhone.txt'
      If FileExists($sCustomHelpdeskPhoneFilePath) Then
        Local $hFileOpen = FileOpen($sCustomHelpdeskPhoneFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sOrgHelpdeskPhone', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sCustomHelpdeskPhoneFilePath)
        EndIf
      EndIf

      ;;LEGACY HELPDESK PASSWORD RESETS
      $sCustomHelpdeskPasswordResetsFilePath = $sAppInstallPathLegacy & '\Support\CustomHelpdeskPasswordResets.txt'
      If FileExists($sCustomHelpdeskPasswordResetsFilePath) Then
        Local $hFileOpen = FileOpen($sCustomHelpdeskPasswordResetsFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sOrgHelpdeskCorporatePhone', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sCustomHelpdeskPasswordResetsFilePath)
        EndIf
      EndIf

      ;;LEGACY HELPDESK URL
      $sCustomHelpdeskAddressFilePath = $sAppInstallPathLegacy & '\Support\CustomHelpdeskAddress.txt'
      If FileExists($sCustomHelpdeskAddressFilePath) Then
        Local $hFileOpen = FileOpen($sCustomHelpdeskAddressFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sOrgHelpdeskURL', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sCustomHelpdeskAddressFilePath)
      EndIf

      ;;LEGACY REMOTE SUPPORT URL
      $sCustomHelpdeskLMIrAddressFilePath = $sAppInstallPathLegacy & '\Support\CustomHelpdeskLMIrAddress.txt'
      If FileExists($sCustomHelpdeskLMIrAddressFilePath) Then
        Local $hFileOpen = FileOpen($sCustomHelpdeskLMIrAddressFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sOrgHelpdeskRemoteSupportURL', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sCustomHelpdeskLMIrAddressFilePath)
      EndIf

      ;;CLEANUP
      DirRemove(path, [recurse])

      ;DirRemove($sDirAppTempApp, 1)  ;C:\Users\kynclb\AppDate\Temp\com.briankyncl\WKS_Prep -- force delete
      ;DirRemove($sDirAppTempPublisher, 0)  ;C:\Users\kynclb\AppDate\Temp\com.briankyncl -- delete if empty






    ;; 64-BIT SUPPORT
      Switch @OSArch
        Case 'X64'
          FileMove(@AppDataCommonDir & '\com.briankyncl\About This Computer\AboutThisComputer_x64.exe', @AppDataCommonDir & '\com.briankyncl\About This Computer\AboutThisComputer.exe', BitOR($FC_OVERWRITE, $FC_CREATEPATH))
        Case 'X86'
          FileDelete(@AppDataCommonDir & '\com.briankyncl\About This Computer\AboutThisComputer_x64.exe')
      EndSwitch

    ;; CREATE STARTUP REGISTRY ENTRY
      FileDelete(@StartupCommonDir & '\About This Computer.lnk')
      RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', 'About This Computer', 'REG_SZ', '"' & @AppDataCommonDir & '\com.briankyncl\About This Computer\AboutThisComputer.exe" -mode Tray')

    ;; CLEANUP
      DirRemove($sTempDir & '\', 1) ;;delete temporary app directory
      DirRemove($sTempDirRoot, 0) ;;delete temporary directory if empty

  EndFunc
#EndRegion

#Region -- Tools
;; STANDARD RUN
  Func StandardRunCmd($cmd)
    ;$cmd = 'net share C=C:\ /GRANT:EVERYONE,FULL'
    ;StandardRunCmd($cmd)

    Run(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
  EndFunc

;; STANDARD RUN WAIT
  Func StandardRunWaitCmd($cmd)
    ;$cmd = 'net share C=C:\ /GRANT:EVERYONE,FULL'
    ;StandardRunCmd($cmd)

    RunWait(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
  EndFunc

;; FIND MATCHING PROCESSES
  Func _ProcessCloseMatching($sString)
    ;$sString = $sString
    Local $list = ProcessList()
    For $i = 1 To $list[0][0]
      If StringRegExp($list[$i][0], "^" & $sString & "*$") Then ProcessClose($list[$i][0])
    Next
  EndFunc

;; END PROCESS
    Func _ProcessClose($sPID)
        If IsString($sPID) Then $sPID = ProcessExists($sPID)
        If Not $sPID Then Return SetError(1, 0, 0)

        Return RunWait(@ComSpec & " /c taskkill /F /PID " & $sPID, @SystemDir, @SW_HIDE)
    EndFunc

;; END PROCESS TREE
    Func _ProcessCloseEx($sPID)
        If IsString($sPID) Then $sPID = ProcessExists($sPID)
        If Not $sPID Then Return SetError(1, 0, 0)

        Return RunWait(@ComSpec & " /c taskkill /F /PID " & $sPID & " /T", @SystemDir, @SW_HIDE)
    EndFunc
#EndRegion

#Region -- End
;; SAFE CLOSE AND EXIT
  Func SoftExit()
    End()
  EndFunc

;; SOFT EXIT
  Func End()
    Exit
  EndFunc

;; CATCH
Exit
#EndRegion