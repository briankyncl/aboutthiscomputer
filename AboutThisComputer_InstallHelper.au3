#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Images\BeOS_info.ico
#AutoIt3Wrapper_Outfile=Compiled\Support\AboutThisComputerInstallHelper.exe
#AutoIt3Wrapper_Outfile_x64=Compiled\Support\AboutThisComputerInstallHelper_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Fileversion=1.0.0.49
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=Copyright (c) 2020 Brian Kyncl (www.briankyncl.com). All rights reserved.
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=highestAvailable
#AutoIt3Wrapper_Add_Constants=n
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#COMMENTS-START

    AboutThisComputerInstallHelper.au3
    Script/executable for assisting the INNO Setup installer for About This Computer.

    Created by Brian Kyncl on 2018-01-30
    Copyright (c) 2020 Brian Kyncl. All rights reserved.

    Must be ran with administrative privileges.

#COMMENTS-END

#Region -- PRE-FLIGHT
  ;;INCLUDES
  #include <FileConstants.au3>
  #include <WinAPIFiles.au3>
#EndRegion

#Region -- ENVIRONMENT
  ;;EXECUTABLE MODE (GUI OR COMMAND LINE)
  If $CmdLine[00] > 0 Then
    Switch $CmdLine[01]
      Case '-mode'
        Switch $CmdLine [02]
          Case 'BeforeInstall'
            Global $sExeMode = 'BeforeInstall'
          Case 'AfterInstall'
            Global $sExeMode = 'AfterInstall'
        EndSwitch
      Case Else ;incorrect parameters provided
        MsgBox(1, 'About This Computer Install Helper', 'Incorrect paramters provided. Try "AboutThisComputerInstallHelper.exe -mode BeforeInstall".')
        SoftExit()
    EndSwitch
  Else
  MsgBox(1, 'About This Computer Install Helper', 'This should be ran only by the About This Computer installer.')
  SoftExit()
  EndIf

  ;;ENVIRONMENT
  Global $sDirScript         = @scriptDir
  Global $systemDrive        = EnvGet("systemdrive") ;Ex: 'C:'

  Global $aVerBuildNum       = StringSplit(FileGetVersion(@AutoItExe), '.')
  Global $sBuildNum          = $aVerBuildNum[4]
  Global $sVersionNum        = $aVerBuildNum[1] & '.' & $aVerBuildNum[2] & '.' & $aVerBuildNum[3]

  Global $bDebug             = False  ;;True or False

  ;;GLOBAL DECLARATIONS
  Global $sTempDirRoot       = @TempDir & '\com.briankyncl'
  Global $sTempDir           = $sTempDirRoot & '\About This Computer'
  Global $sSupportTempDir    = $sTempDir & '\Support'
  Global $sTemplatesTempDir  = $sSupportTempDir & '\Templates'

  ;;APP INFO
  Global $sAppOrg        = 'com.briankyncl'
  Global $sAppName       = 'About This Computer'

  ;;APP PATHS
  Global $sAppInstallPath       = @ProgramFilesDir & '\' & $sAppOrg & '\' & $sAppName
  Global $sAppSupportDir        = $sAppInstallPath & '\Support'
  Global $sAppRegistryPath      = 'HKEY_LOCAL_MACHINE\Software\' & $sAppOrg & '\' & $sAppName
  Global $sAppTemplatesDir      = $sAppSupportDir & '\Templates'

  Global $sAppInstallPathLegacy = @AppDataCommonDir & '\' & $sAppOrg & '\' & $sAppName
  Global $sSupportDirLegacy        = $sAppInstallPathLegacy & '\Support'
  Global $sTemplatesDirLegacy      = $sSupportDirLegacy & '\Templates'
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
  Func BeforeInstall()
    ;;BEFORE INSTALLING ABOUT THIS COMPUTER

    ;;DEBUG
    If $bDebug Then MsgBox('','Debug','BeforeInstall() called.')

    ;;UNINSTALL SYSTEM INFO
    RunWait(@ComSpec & " /c taskkill /IM ""systeminfo.exe"" /F", @SystemDir, @SW_HIDE)
    DirRemove($systemDrive & '\Program Files\IntelliAdmin\', 1)
    DirRemove($systemDrive & '\Program Files (x86)\IntelliAdmin\', 1)
    DirRemove(@ProgramsCommonDir & '\IntelliAdmin\', 1)
    FileDelete(@StartupCommonDir & '\systeminfo.lnk')

    ;;TERM ABOUT THIS COMPUTER
    RunWait(@ComSpec & " /c taskkill /IM ""AboutThisComputer.exe"" /F", @SystemDir, @SW_HIDE)

    ;;CAREFULLY BACKUP LEGACY TEMPLATES
    FileDelete($sTemplatesDirLegacy & '\*-sample.xml')  ;;remove samples
    FileCopy($sTemplatesDirLegacy & '\*', $sTemplatesTempDir & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;backup user-created templates

    ;;CAREFULLY BACKUP TEMPLATES
    ;FileDelete($sAppTemplatesDir & '\*-sample.xml')  ;;remove samples
    FileCopy($sAppTemplatesDir & '\*', $sTemplatesTempDir & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;backup user-created templates

    ;;CAREFULLY BACKUP LEGACY CUSTOM CONFIG
    FileCopy($sSupportDirLegacy & '\*.txt', $sSupportTempDir & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;backup user-created config files

    ;;CLEANUP WHAT INNO SETUP WON'T REMOVE
    DirRemove(@AppDataCommonDir & '\com.briankyncl\About This Computer\Support', 1)
    DirRemove($sAppSupportDir, 1)
    RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', 'About This Computer')

    ;;CALL LEGACY UNINSTALLER
    If FileExists($sAppInstallPathLegacy & '\unins000.exe') Then
      ShellExecuteWait($sAppInstallPathLegacy & '\unins000.exe', '/SILENT', @SystemDir)
    EndIf

    ;;DEBUG
    If $bDebug Then ShellExecute($sTempDir)
  EndFunc

  Func AfterInstall()
    ;;AFTER INSTALLING ABOUT THIS COMPUTER

    ;;DEBUG
    If $bDebug Then MsgBox('','Debug','AfterInstall() called.')

    ;;CAREFULLY RESTORE TEMPLATES, IF APPLICABLE
    FileCopy($sTemplatesTempDir & '\*', $sAppTemplatesDir & '\', $FC_CREATEPATH) ;;restore user-created templates

    ;;CAREFULLY RESTORE LEGACY CUSTOM CONFIG, IF APPLICABLE
    If FileExists($sSupportTempDir & '\*.txt') Then
      FileDelete($sSupportDirLegacy & '\*.txt')
      FileCopy($sSupportTempDir & '\*.txt', $sSupportDirLegacy & '\', BitOR($FC_OVERWRITE, $FC_CREATEPATH)) ;;restore user-created config files
    EndIf

    ;;STAGE CONFIGURATION REGISTRY ENTRIES
    ;; Test if registry key exists, if not, create it.
    Local $aRegistryConfiguration[2]
      $aRegistryConfiguration[00] = 'bConfigExitEnabled'
      $aRegistryConfiguration[01] = 'bConfigContactHelpdeskEnabled'
    For $i = 0 to UBound($aRegistryConfiguration) - 1
      RegRead($sAppRegistryPath, $aRegistryConfiguration[$i])
      If @error <> 0 Then
        RegWrite($sAppRegistryPath, $aRegistryConfiguration[$i], 'REG_DWORD', '0')
      EndIf
    Next

    ;;STAGE CUSTOMIZATION REGISTRY ENTRIES
    ;; Test if registry key exists, if not, create it.
    Local $aRegistryCustomization[17]
      $aRegistryCustomization[00] = 'sOrgName'
      $aRegistryCustomization[01] = 'sOrgDomain'
      $aRegistryCustomization[02] = 'sOrgFQDomain'
      $aRegistryCustomization[03] = 'sOrgIntranetName'
      $aRegistryCustomization[04] = 'sOrgIntranetURL'
      $aRegistryCustomization[05] = 'sOrgHelpdeskName'
      $aRegistryCustomization[06] = 'sOrgHelpdeskPhone'
      $aRegistryCustomization[07] = 'sOrgHelpdeskRegionalPhone'
      $aRegistryCustomization[08] = 'sOrgHelpdeskCorporatePhone'
      $aRegistryCustomization[09] = 'sOrgHelpdeskEmail'
      $aRegistryCustomization[10] = 'sOrgHelpdeskURL'
      $aRegistryCustomization[11] = 'sOrgHelpdeskRemoteSupportURL'
      $aRegistryCustomization[12] = 'sOrgHelpdeskRequestName'
      $aRegistryCustomization[13] = 'sOrgAppCatalogURL'
      $aRegistryCustomization[14] = 'sOrgPersonalDriveName'
      $aRegistryCustomization[15] = 'sOrgLoginScriptPath'
      $aRegistryCustomization[16] = 'sFreeTextDetails'
    For $i = 0 to UBound($aRegistryCustomization) - 1
      RegRead($sAppRegistryPath, $aRegistryCustomization[$i])
      If @error <> 0 Then
        RegWrite($sAppRegistryPath, $aRegistryCustomization[$i], 'REG_SZ', '')
      EndIf
    Next

    ;;MIGRATE CONFIGURATION
    If FileExists($sAppInstallPathLegacy) Then
      ;;Convert old file-based config to registry-based config.

      ;;LEGACY HELPDESK EMAIL
      $sCustomHelpdeskEmailFilePath = $sAppInstallPathLegacy & '\Support\CustomHelpdeskEmail.txt'
      If FileExists($sCustomHelpdeskEmailFilePath) Then
        Local $hFileOpen = FileOpen($sCustomHelpdeskEmailFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sOrgHelpdeskEmail', 'REG_SZ', FileReadLine($hFileOpen, 1))
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

      ;;LEGACY CustomInformation.txt
      $sFreeTextDetailsFilePath = $sAppInstallPathLegacy & '\Support\CustomInformation.txt'
      If FileExists($sFreeTextDetailsFilePath) Then
        Local $hFileOpen = FileOpen($sFreeTextDetailsFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sFreeTextDetails', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sFreeTextDetailsFilePath)
      EndIf

      ;;LEGACY CustomLCMXJCode.txt
      $sCustomLCMXJCodeFilePath = $sAppInstallPathLegacy & '\Support\CustomLCMXJCode.txt'
      If FileExists($sCustomLCMXJCodeFilePath) Then
        Local $hFileOpen = FileOpen($sCustomLCMXJCodeFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sCustomLCMXJCode', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sCustomLCMXJCodeFilePath)
      EndIf

      ;;LEGACY CustomLCMCRCode.txt
      $sCustomLCMCRCodeFilePath = $sAppInstallPathLegacy & '\Support\CustomLCMCRCode.txt'
      If FileExists($sCustomLCMCRCodeFilePath) Then
        Local $hFileOpen = FileOpen($sCustomLCMCRCodeFilePath,  $FO_READ)
        If (StringIsSpace(FileReadLine($hFileOpen, 1)) = 0) Then
          RegWrite($sAppRegistryPath, 'sCustomLCMCRCode', 'REG_SZ', FileReadLine($hFileOpen, 1))
        EndIf
        FileClose($hFileOpen)
        FileDelete($sCustomLCMCRCodeFilePath)
      EndIf

      ;;LEGACY ExitDisabled.txt
      $sExitDisabledFilePath = $sAppInstallPathLegacy & '\Support\ExitDisabled.txt'
      If Not FileExists($sExitDisabledFilePath) Then
        RegWrite($sAppRegistryPath, 'bConfigExitEnabled', 'REG_DWORD', 1)
        FileDelete($sExitDisabledFilePath)
      EndIf

      ;;LEGACY ContactHelpdeskDisabled.txt
      $sContactHelpdeskDisabledFilePath = $sAppInstallPathLegacy & '\Support\ContactHelpdeskDisabled.txt'
      If Not FileExists($sContactHelpdeskDisabledFilePath) Then
        RegWrite($sAppRegistryPath, 'bConfigContactHelpdeskEnabled', 'REG_DWORD', 1)
        FileDelete($sContactHelpdeskDisabledFilePath)
      EndIf

      ;;CLEANUP LEGACY
      DirRemove($sAppInstallPathLegacy, 1)  ;;Remove legacy app directory
      DirRemove(@AppDataCommonDir & '\' & $sAppOrg, 0)  ;;Remove org directory if empty
    EndIf

    ;;64-BIT SUPPORT
    Switch @OSArch
      Case 'X64'
        FileMove($sAppInstallPath & '\AboutThisComputer_x64.exe', $sAppInstallPath & '\AboutThisComputer.exe', BitOR($FC_OVERWRITE, $FC_CREATEPATH))
      Case 'X86'
        FileDelete($sAppInstallPath & '\AboutThisComputer_x64.exe')
    EndSwitch

    ;;CREATE STARTUP REGISTRY ENTRY
    FileDelete(@StartupCommonDir & '\About This Computer.lnk')  ;;Remove legacy startup entry
    RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', 'About This Computer', 'REG_SZ', '"' & $sAppInstallPath & '\AboutThisComputer.exe" -mode Tray')

    ;;CLEANUP
    DirRemove($sTempDir & '\', 1) ;;delete temporary app directory
    DirRemove($sTempDirRoot, 0) ;;delete temporary directory if empty
  EndFunc
#EndRegion

#Region -- TOOLS
  Func StandardRunCmd($cmd)
    ;;STANDARD RUN
    ;; $cmd = 'net share C=C:\ /GRANT:EVERYONE,FULL'
    ;; StandardRunCmd($cmd)

    Run(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
  EndFunc

  Func StandardRunWaitCmd($cmd)
    ;;STANDARD RUN WAIT
    ;; $cmd = 'net share C=C:\ /GRANT:EVERYONE,FULL'
    ;; StandardRunCmd($cmd)

    RunWait(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
  EndFunc

  Func _ProcessCloseMatching($sString)
    ;;FIND MATCHING PROCESSES
    ;; $sString = $sString
    Local $list = ProcessList()
    For $i = 1 To $list[0][0]
      If StringRegExp($list[$i][0], "^" & $sString & "*$") Then ProcessClose($list[$i][0])
    Next
  EndFunc

  Func _ProcessClose($sPID)
    ;;END PROCESS
    If IsString($sPID) Then $sPID = ProcessExists($sPID)
    If Not $sPID Then Return SetError(1, 0, 0)

    Return RunWait(@ComSpec & " /c taskkill /F /PID " & $sPID, @SystemDir, @SW_HIDE)
  EndFunc

  Func _ProcessCloseEx($sPID)
    ;;END PROCESS TREE
    If IsString($sPID) Then $sPID = ProcessExists($sPID)
    If Not $sPID Then Return SetError(1, 0, 0)

    Return RunWait(@ComSpec & " /c taskkill /F /PID " & $sPID & " /T", @SystemDir, @SW_HIDE)
  EndFunc
#EndRegion

#Region -- END
  Func SoftExit()
    ;;SAFE CLOSE AND EXIT
    End()
  EndFunc

  Func End()
    ;;SOFT EXIT
    Exit
  EndFunc

  ;;CATCH
  Exit
#EndRegion