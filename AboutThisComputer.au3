#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Images\BeOS_info.ico
#AutoIt3Wrapper_Outfile=Compiled\AboutThisComputer.exe
#AutoIt3Wrapper_Outfile_x64=Compiled\AboutThisComputer_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=About This Computer
#AutoIt3Wrapper_Res_Description=About This Computer
#AutoIt3Wrapper_Res_Fileversion=2.0.0.1006
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=Copyright (c) 2020 Brian Kyncl (briankyncl.com). All rights reserved.
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Add_Constants=n
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mo
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#COMMENTS-START
  AboutThisComputer.au3
  Application for quickly displaying common computer information.

  Created by Brian Kyncl on 2017-11-29
  Copyright (c) 2020 Brian Kyncl (briankyncl.com). All rights reserved.

  Run as current user with implicit privileges.

  Assumptions:
   - Application is used by a business or other organized entity.
   - Organization has a corporate intranet.
   - Organization uses mapped personal drives; mapped via AD object setting.
   - Organization uses login scripts; configured via AD object setting.
   - Organization has an IT helpdesk.
   - Organization has a password self-service portal.
   - Organization uses employee ID numbers.
   - Organization tracks computer hardware using asset tags.
   - Organization writes asset tags to BIOS.
   - Workstation is joined to an Active Directory domain.
   - Operating System is common desktop or server version of Windows used in enterprises.
   - IT helpdesk has a regional phone number
   - IT helpdesk has a corporate phone number
   - IT helpdesk has a regional email address
   - IT helpdesk has a website
   - IT helpdesk has a website for remote control sessions
   - SCCM Application Catalog is utilized.
   - CrowdStrike is installed and service is running.
   - BeyondTrust PowerInsight is installed and service is running.
   - Splunk Forwarder is installed and service is running.
   - SCCM Client is installed and service is running.
   - Windows Update service is running.
#COMMENTS-END

#Region -- PRE-FLIGHT
  ;;OPTIONS
  ;;none

  ;;INCLUDES
  #include 'UDF-ADFunctions\AD.au3'
  #include 'UDF-ATCCustomization\_ATC_Customization.au3'
  #include 'UDF-SelfDelete\_SelfDelete.au3'
  #include 'UDF-Services\Services.au3'
  #include 'UDF-SMTPMailer\SmtpMailer.au3'
  #include <Array.au3>
  #include <AutoItConstants.au3>
  #include <ButtonConstants.au3>
  #include <ComboConstants.au3>
  #include <Date.au3>
  #include <EditConstants.au3>
  #include <File.au3>
  #include <FileConstants.au3>
  #include <FontConstants.au3>
  #include <GUIConstantsEx.au3>
  #include <GuiEdit.au3>
  #include <GuiRichEdit.au3>
  #include <MsgBoxConstants.au3>
  #include <ScreenCapture.au3>
  #include <StaticConstants.au3>
  #include <StringConstants.au3>
  #include <Timers.au3>
  #include <TrayConstants.au3>
  #include <WinAPIFiles.au3>
  #include <WindowsConstants.au3>
#EndRegion

Main()  ;;Main application
End()   ;;Exit app gracefully if code should ever find itself here.

#Region -- STARTUP
  Func StartupCoreGlobals()
    ;;DECLARE CORE GLOBALS

    ;;APP INFO
    Global $sAppOrg        = 'briankyncl.com'
    Global $sAppName       = 'About This Computer'
    Global $sAppShortName  = 'ATC'
    Global $sAppDocsHost   = 'GitHub'
    Global $sAppDocsFormat = 'website'
    Global $sAppDocsURL    = 'https://github.com/briankyncl/aboutthiscomputer/wiki'

    ;;APP VERSION
    Local  $aFileVersion = StringSplit(FileGetVersion(@AutoItExe), '.')
    Global $sAppBuild    = $aFileVersion[4]
    Global $sAppVersion  = $aFileVersion[1] & '.' & $aFileVersion[2] & '.' & $aFileVersion[3]
    Global $sAppRelease  = '2020-xx-xx'

    ;;APP PATHS
    Global $sAppInstallPath       = @ProgramFilesDir & '\' & $sAppOrg & '\' & $sAppName
    Global $sAppInstallPathLegacy = @AppDataCommonDir & '\com.briankyncl\About This Computer'
    Global $sAppSourcePath        = @ScriptDir
    Global $sAppTempPath          = @TempDir & '\' & $sAppOrg & '\' & $sAppName
    Global $sAppStartMenuPath     = @ProgramsCommonDir & '\' & $sAppName
    Global $sAppRegistryPath      = 'HKEY_LOCAL_MACHINE\Software\' & $sAppOrg & '\' & $sAppName
    Global $sAppLogo              = $sAppTempPath & '\ATC-BeOS_info.ico'

    DirCreate($sAppTempPath)

    ;;APP ASSETS
    FileInstall('Images\BeOS_info.ico', $sAppTempPath & '\ATC-BeOS_info.ico', $FC_OVERWRITE)
    ;FileMove(@TempDir & '\ATC-BeOS_info.ico', $sAppTempPath, $FC_OVERWRITE)
  EndFunc

  Func StartupExeMode()
    ;;PROCESS EXECUTABLE PARAMETERS
    Global $sMainAppExeMode = ''

    If $CmdLine[00] > 0 Then
      ;;one or more parameters were provided
      Switch $CmdLine[01]
        Case '-mode'
          Switch $CmdLine [02]
            Case 'window'
              $sMainAppExeMode = 'window'
            Case 'tray'
              $sMainAppExeMode = 'tray'
          EndSwitch
        Case Else
          MsgBox(BitOR($MB_OK, $MB_ICONERROR), $sAppName & ' Startup', 'Unsupported parameter provided. See documentation at ' & $sAppDocsURL)
          SoftExit()
      EndSwitch
    Else
      ;;no parameters provided
      $sMainAppExeMode = 'tray'
    EndIf
  EndFunc

  Func StartupRunFromTemp()
    ;;RUN FROM TEMP
    ;;Relaunch application from user's temp directory.

    ;;read provided parameters into one string
    Local $sStartupParam = $CmdLineRaw
    ;If $CmdLine[0] > 1 Then
    ;  For $iRow = 1 to UBound($CmdLine, $UBOUND_ROWS)-1
    ;    $sStartupParam = $sExeParam & ' ' & $CmdLine[$iRow]
    ;  Next
    ;EndIf

    ;;relaunch application from temp
    If StringInStr(@ScriptFullPath, $sAppTempPath, $STR_NOCASESENSEBASIC) = 0 Then
      ;;exe launched from non-temp location
      If FileExists($sAppTempPath & '\' & @ScriptName) = 1 Then
        ;;exe already in temp dir, attempt to delete
        If FileDelete($sAppTempPath & '\' & @ScriptName) <> 1 Then
          ;;unable to delete, notify and exit
          MsgBox(BitOR($MB_OK, $MB_ICONERROR), $sAppName & ' Startup', 'Unable to start ' & $sAppName & '. (Unable to delete existing executable from temp. Is ' & @ScriptName & ' already running?)')
          SoftExit()
        Else
          ;;successful file delete
          ;continue
        EndIf
      EndIf
      ;;attempt to copy exe to temp dir
      If FileCopy(@ScriptFullPath, $sAppTempPath, $FC_CREATEPATH) = 1 Then
        ;;successful file copy, attempt to launch
        If ShellExecute($sAppTempPath & '\' & @ScriptName, $sStartupParam, @SystemDir) <> 0 Then
          ;;successful launch, exit
          SoftExit()
        Else
          ;;unsuccessful launch, notify and exit
          MsgBox(BitOR($MB_OK, $MB_ICONERROR), $sAppName & ' Startup', 'Unable to start ' & $sAppName & '. (Unable to run executable from temp.)')
          SoftExit()
        EndIf
      Else
        ;;unsuccessful file copy, notify and exit
        MsgBox(BitOR($MB_OK, $MB_ICONERROR), $sAppName & ' Startup', 'Unable to start ' & $sAppName & '. (Unable to copy executable to temp.)')
        SoftExit()
      EndIf
    Else
      ;;exe launched from temp location, proceed with application load
      ;;continue
    EndIf
  EndFunc

  Func StartupGlobals()
    ;;DECLARE GLOBAL VARIABLES
    ;;Declare global variables not declared anywhere else.

    ;;;Default organization information
    ;;; Duplicate these values in ReadCustomization()
    ;;; Duplicate these values in InstallHelper
    ;Global $sOrgName                     = 'Contoso'
    ;Global $sOrgDomain                   = 'contoso.com'
    ;Global $sOrgFQDomain                 = 'corp.' & $sOrgDomain
    ;Global $sIntranetName             = 'Intranet'
    ;Global $sIntranetURL              = 'intranet.' & $sOrgDomain
    ;Global $sHelpdeskName             = 'IT Helpdesk'
    ;Global $sHelpdeskPhone            = '1-800-555-5555'
    ;Global $sHelpdeskRegionalPhone    = $sHelpdeskPhone
    ;Global $sHelpdeskCorporatePhone   = $sHelpdeskPhone
    ;Global $sHelpdeskEmail            = 'helpdesk@' & $sOrgDomain
    ;Global $sHelpdeskURL              = 'helpdesk.' & $sOrgDomain
    ;Global $sHelpdeskRemoteSupportURL = 'remotesupport.' & $sOrgDomain
    ;Global $sHelpdeskRequestName      = 'Create an IT' & @CRLF & 'Helpdesk Request'
    ;Global $sSCCMAppCatalogURL            = 'https://sccmserver.' & $sOrgFQDomain & '/CMApplicationCatalog'
    ;Global $sHomeFolderName        = 'Home Drive'  ;;'I: Drive', or 'Home Folder', etc.
    ;Global $sLoginScriptPath          = '\\' & $sOrgFQDomain & '\NETLOGON'

    _ATC_Customization($sAppRegistryPath, 'Declare')

    ;;Generic globals
    Global $hGUIMain
    ;Global $idGUIContact
    Global $GUI_CHECKENABLE
    Global $GUI_UNCHECKENABLE
    Global $GUI_CHECKDISABLE
    Global $GUI_UNCHECKDISABLE
    ;Global $sSummaryString
    ;Global $bConfigExitEnabled
    ;Global $lTemplates
    ;Global $sTemplateFromAddress
    ;Global $sTemplateToAddress
    ;Global $sTemplateCCAddress
    ;Global $sTemplateBCCAddress
    ;Global $sTemplateAttachmentPath
    ;Global $idLabelMainRight01a
    ;Global $idLabelMainRight02a
    ;Global $idLabelMainRight02c
    ;Global $idLabelMainRight03a
    ;Global $idLabelMainRight04a
    ;Global $idLabelMainRight05a
    ;Global $idLabelMainRight06a
    ;Global $idLabelMainRight07a
    ;Global $idLabelMainRight08a
    ;Global $idLabelMainRight09a
    ;Global $idLabelMainRight10a
    ;Global $idLabelMainRight11a
    ;Global $idLabelMainRight12a
    ;Global $idLabelMainRight13a
    ;Global $idLabelMainRight14a
    ;Global $idLabelMainRight15a
    ;Global $idLabelMainRight16a
    ;Global $idLabelMainRight17a
    ;Global $idLabelMainRight18a
    ;Global $idLabelMainRight19a
    ;Global $idLabelMainRight20a
    ;Global $idLabelMainRight21a
    ;Global $idLabelMainRight22a
    ;Global $idLabelMainRight23a
    ;Global $idLabelMainRight24a
    ;Global $idLabelMainRight25a
    ;Global $idLabelMainRight26a
    ;Global $idLabelMainRight27a
    ;Global $idLabelMainRight28a
    ;Global $idLabelMainRight29a
    ;Global $idLabelMainRight30a
  EndFunc

  Func ReadConfig()
    ;;READ APP CONFIGURATION
    ;; Read application configuration from registry.
    ;;
    ;; Duplicate these entries in InstallHelper

    ;;contact form enable/disable
    Global $bConfigContactHelpdeskEnabled = RegRead($sAppRegistryPath, 'bConfigContactHelpdeskEnabled')
    If @error Then
      $bConfigContactHelpdeskEnabled = False
    Else
      If $bConfigContactHelpdeskEnabled = 1 Then
        $bConfigContactHelpdeskEnabled = True
      Else
        $bConfigContactHelpdeskEnabled = False
      EndIf
    EndIf

    ;;exit enable/disable
    Global $bConfigExitEnabled = RegRead($sAppRegistryPath, 'bConfigExitEnabled')
    If @error Then
      $bConfigExitEnabled = False
    Else
      If $bConfigExitEnabled = 1 Then
        $bConfigExitEnabled = True
      Else
        $bConfigExitEnabled = False
      EndIf
    EndIf

    ;;icon selection

    ;;"assumption" features enabled/disabled
    ;;TODO

  EndFunc
#EndRegion

#Region -- MAIN
  Func Main()
    ;;Everything controlled from here.

    ;;DECLARE CORE GLOBALS
    ;; Declare core globals needed for application startup.
    StartupCoreGlobals()

    ;;PROCESS EXE PARAMETERS
    ;; Parse provided command line parameters, if any.
    StartupExeMode()

    ;;RELAUNCH FROM TEMP
    ;; Copy to and relaunch application from user's temp directory.
    StartupRunFromTemp()

    ;;DECLARE GLOBALS
    ;; Declare globals not declared anywhere else.
    StartupGlobals()

    ;;READ CONFIG
    ;; Read application configuration and customization.
    ReadConfig()

    ;;READ COMPUTER
    ;; Read details about computer but do not apply to interface.
    ReadComputer('NoRefresh')

    ;;STAGE GUIs
    ;; Define tray and display normal tray or window-mode tray.
    ;; Define main GUI and display Loading... GUI or main GUI.
    BuildTray()
    BuildMainGUI()

    ;;REFRESH COMPUTER INFO
    ;; Reload details about computer and apply to interface.
    ReadComputer()
    ReadComputerSchedule(True)

    ;;DISPLAY GUI(s)
    ;; Display either the main GUI or the tray icon and wait for user input.
    Switch $sMainAppExeMode
      Case 'Tray'
        MainTrayWait()
      Case 'Window'
        ReadComputerWait(0)
        MainGUIWait()
    EndSwitch

    ;;undeclared variable usage probably happens at this point.

    ;;GRACEFUL EXIT
    ;; Exit app gracefully if code should ever find itself here.
      End()
  EndFunc
#EndRegion

#Region -- READ COMPUTER
  ;;Fuctions for reading details about the computer.

  ;;CONTROLLERS
    Func ReadComputer($sOption = 'Normal')
      ;;Controller for reading details about the computer.
      ;; Potentially used for refreshing a subset of details.

      ;;read computer and user details
      ReadOS()
      ReadOSArch()
      ReadUser()
      ReadHardware()
      ReadNetworkAdapters()
      ReadDisks()
      ReadPrinters()
      ReadAD()
      ReadServices()
      ReadRegistry()
      ReadLCMInfo()  ;;move to branch

      ;;read app config and customization
      ReadConfig()
      ReadCustomization()

      ;;update interface with new data
      UpdateSummaryString()
      If $sOption <> 'NoRefresh' Then
        GUIDelete($hGUIMain)
        BuildMainGUI()
        UpdateMainGUI()
        RefreshTray()
      EndIf

      ;;cleanup that memory leak
      _ReduceMemory()
    EndFunc

    Func ReadComputerWait($idGUIParent)
      ;;Create busy GUI and refresh info
      $idGUIWorking = GUICreate('Refreshing...', 200, 50, -1, -1, BitOR($WS_DLGFRAME, $WS_POPUP), BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW), $idGUIParent)
      $sLabel = GUICtrlCreateLabel('Refreshing...', 0, 17, 200, 20, $SS_CENTER)
      GUICtrlSetFont($sLabel, 11, $FW_BOLD)
      GUISetState(@SW_SHOWNORMAL, $idGUIWorking)

      ReadComputer()

      GUIDelete($idGUIWorking)
    EndFunc

    Func ReadComputerSchedule($bOption)
      ;;Schedule periodic refresh of computer information
      Switch $bOption
        Case True
          AdlibRegister('ReadComputer', 180000)  ;;3 minutes
        Case False
          AdlibUnRegister('ReadComputer')
      EndSwitch
    EndFunc

  ;;READERS
    Func ReadOS()
      ;;Read operating system version.
      ;; Generated variables:
      ;;
      ;; $sOSBuild             ; Example output:
      ;; $sOSServicePack       ; Example output:
      ;; $sOSProductName       ; Example output: Microsoft Windows 10 Enterprise Insider Preview
      ;; $sOSVersion           ; Example output: WIN_7
      ;; $sOSVersionName       ; Example output: Windows 7
      ;; $iOSVersionValue      ; Example output: 08
      ;; $sOSVersionType       ; Example output: Client
      ;; $sOSEdition           ; Example output: Enterprise
      ;; $sOSBranch            ; Example output: LTSB
      ;;
      ;; https://www.microsoft.com/en-us/itpro/windows-10/release-information
      ;; https://docs.microsoft.com/en-us/windows/deployment/update/waas-overview
      ;; https://www.autoitscript.com/autoit3/docs/macros/SystemInfo.htm

      Global $sOSType         = @OSType  ;;Returns WIN_NT
      Global $sOSBuild        = @OSBuild
      Global $sOSServicePack  = @OSServicePack
      Global $sOSProductName  = ''
      Global $sOSVersion      = @OSVersion
      Global $sOSVersionName  = ''
      Global $iOSVersionValue = ''
      Global $sOSVersionType  = ''
      Global $sOSEdition      = ''
      Global $sOSBranch       = ''

      ;;READ OS FROM REGISTRY
      $sOSProductName       = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion', 'ProductName')
      $sOSReleaseID         = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion', 'ReleaseId')
      $sOSInstallationType  = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion', 'InstallationType')
      $sOSEditionID         = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion', 'EditionID')

      ;;DEFINE WINDOWS 10 VERSIONS
      If $sOSVersion = 'WIN_10' Then $sOSVersion = $sOSVersion & '-' & $sOSReleaseID  ;define release based on registry key
      If $sOSVersion = 'WIN_10-' Then $sOSVersion = 'WIN_10-1507' ;define initial release; missing registry key
      If StringInStr($sOSProductName, 'Insider') Then $sOSVersion = 'WIN_10-INSIDER'  ;define insider preview
      If $sOSVersion = 'WIN_2016' AND $sOSReleaseID = '1809' Then $sOSVersion = 'WIN_2019'  ;manually define Windows Server 2019 until AutoIt macro supports it

      ;;DEFINE OS BRANCH
      If StringInStr($sOSProductName, 'LTSB') Then $sOSBranch = 'LTSB'
      If StringInStr($sOSProductName, 'LTSC') Then $sOSBranch = 'LTSB'  ;Long-Term Servicing Branch renamed to Long-Term Servicing Channel, LTSB used in code for compatibility, LTSC set in friendly name
      If StringIsSpace($sOSBranch) = False Then $sOSVersion = $sOSVersion & '-' & $sOSBranch

      ;;DEFINE OS FRIENDLY NAME
      If $sOSVersion = 'WIN_XP'           Then $sOSVersionName = 'Windows XP'
      If $sOSVersion = 'WIN_XPe'          Then $sOSVersionName = 'Windows XP Embedded'
      If $sOSVersion = 'WIN_2003'         Then $sOSVersionName = 'Windows Server 2003'
      If $sOSVersion = 'WIN_XP64'         Then $sOSVersionName = 'Windows XP 64-bit'  ;doesn't work
      If $sOSVersion = 'WIN_2003R2'       Then $sOSVersionName = 'Windows Server 2003 R2'  ;doesn't work
      If $sOSVersion = 'WIN_VISTA'        Then $sOSVersionName = 'Windows Vista'
      If $sOSVersion = 'WIN_2008'         Then $sOSVersionName = 'Windows Server 2008'
      If $sOSVersion = 'WIN_7'            Then $sOSVersionName = 'Windows 7'
      If $sOSVersion = 'WIN_2008R2'       Then $sOSVersionName = 'Windows Server 2008 R2'
      If $sOSVersion = 'WIN_8'            Then $sOSVersionName = 'Windows 8'
      If $sOSVersion = 'WIN_2012'         Then $sOSVersionName = 'Windows Server 2012'
      If $sOSVersion = 'WIN_81'           Then $sOSVersionName = 'Windows 8.1'
      If $sOSVersion = 'WIN_2012R2'       Then $sOSVersionName = 'Windows Server 2012 R2'
      If $sOSVersion = 'WIN_10'           Then $sOSVersionName = 'Windows 10'
      If $sOSVersion = 'WIN_10-1507'      Then $sOSVersionName = 'Windows 10, Release 1507'
      If $sOSVersion = 'WIN_10-1507-LTSB' Then $sOSVersionName = 'Windows 10 LTSB 2015 (1507)'
      If $sOSVersion = 'WIN_10-1511'      Then $sOSVersionName = 'Windows 10, Release 1511'
      If $sOSVersion = 'WIN_10-1607'      Then $sOSVersionName = 'Windows 10, Release 1607'
      If $sOSVersion = 'WIN_10-1607-LTSB' Then $sOSVersionName = 'Windows 10 LTSB 2016 (1607)'
      If $sOSVersion = 'WIN_2016'         Then $sOSVersionName = 'Windows Server 2016'
      If $sOSVersion = 'WIN_10-1703'      Then $sOSVersionName = 'Windows 10, Release 1703'
      If $sOSVersion = 'WIN_10-1709'      Then $sOSVersionName = 'Windows 10, Release 1709'
      If $sOSVersion = 'WIN_10-1803'      Then $sOSVersionName = 'Windows 10, Release 1803'
      If $sOSVersion = 'WIN_10-1809'      Then $sOSVersionName = 'Windows 10, Release 1809'
      If $sOSVersion = 'WIN_10-1809-LTSB' Then $sOSVersionName = 'Windows 10 LTSC 2019 (1809)'
      If $sOSVersion = 'WIN_2019'         Then $sOSVersionName = 'Windows Server 2019'
      If $sOSVersion = 'WIN_10-1903'      Then $sOSVersionName = 'Windows 10, Release 1903'
      If $sOSVersion = 'WIN_10-1909'      Then $sOSVersionName = 'Windows 10, Release 1909'
      If $sOSVersion = 'WIN_10-INSIDER'   Then $sOSVersionName = 'Windows 10, Insider Preview'

      ;;DEFINE OS VERSION VALUE
      If $sOSVersion = 'WIN_XP'           Then $iOSVersionValue = 01  ;;Windows XP
      If $sOSVersion = 'WIN_XPe'          Then $iOSVersionValue = 02  ;;Windows XP Embedded
      If $sOSVersion = 'WIN_2003'         Then $iOSVersionValue = 03  ;;Windows Server 2003
      If $sOSVersion = 'WIN_XP64'         Then $iOSVersionValue = 04  ;;Windows XP 64-bit
      If $sOSVersion = 'WIN_2003R2'       Then $iOSVersionValue = 05  ;;Windows Server 2003 R2
      If $sOSVersion = 'WIN_VISTA'        Then $iOSVersionValue = 06  ;;Windows Vista
      If $sOSVersion = 'WIN_2008'         Then $iOSVersionValue = 07  ;;Windows Server 2008
      If $sOSVersion = 'WIN_7'            Then $iOSVersionValue = 08  ;;Windows 7
      If $sOSVersion = 'WIN_2008R2'       Then $iOSVersionValue = 09  ;;Windows Server 2008 R2
      If $sOSVersion = 'WIN_8'            Then $iOSVersionValue = 10  ;;Windows 8
      If $sOSVersion = 'WIN_2012'         Then $iOSVersionValue = 11  ;;Windows Server 2012
      If $sOSVersion = 'WIN_81'           Then $iOSVersionValue = 12  ;;Windows 8.1
      If $sOSVersion = 'WIN_2012R2'       Then $iOSVersionValue = 13  ;;Windows Server 2012 R2
      If $sOSVersion = 'WIN_10'           Then $iOSVersionValue = 14  ;;Windows 10
      If $sOSVersion = 'WIN_10-1507'      Then $iOSVersionValue = 15  ;;Windows 10, Release 1507
      If $sOSVersion = 'WIN_10-1507-LTSB' Then $iOSVersionValue = 16  ;;Windows 10 LTSB 2015 (1507)
      If $sOSVersion = 'WIN_10-1511'      Then $iOSVersionValue = 17  ;;Windows 10, Release 1511
      If $sOSVersion = 'WIN_10-1607'      Then $iOSVersionValue = 18  ;;Windows 10, Release 1607
      If $sOSVersion = 'WIN_10-1607-LTSB' Then $iOSVersionValue = 19  ;;Windows 10 LTSB 2016 (1607)
      If $sOSVersion = 'WIN_2016'         Then $iOSVersionValue = 20  ;;Windows Server 2016
      If $sOSVersion = 'WIN_10-1703'      Then $iOSVersionValue = 21  ;;Windows 10, Release 1703
      If $sOSVersion = 'WIN_10-1709'      Then $iOSVersionValue = 22  ;;Windows 10, Release 1709
      If $sOSVersion = 'WIN_10-1803'      Then $iOSVersionValue = 23  ;;Windows 10, Release 1803
      If $sOSVersion = 'WIN_10-1809'      Then $iOSVersionValue = 24  ;;Windows 10, Release 1809
      If $sOSVersion = 'WIN_10-1809-LTSB' Then $iOSVersionValue = 25  ;;Windows 10 LTSC 2019 (1809)
      If $sOSVersion = 'WIN_2019'         Then $iOSVersionValue = 26  ;;Windows Server 2019
      If $sOSVersion = 'WIN_10-1903'      Then $iOSVersionValue = 27  ;;Windows 10, Release 1903
      If $sOSVersion = 'WIN_10-1909'      Then $iOSVersionValue = 28  ;;Windows 10, Release 1909
      If $sOSVersion = 'WIN_10-INSIDER'   Then $iOSVersionValue = 99  ;;Windows 10, Insider Preview

      ;;DEFINE OS VERSION TYPE
      If $iOSVersionValue < '08' Then  ;;older than Windows 7, manually set OS type
        If $sOSVersion = 'WIN_XP'         Then $sOSVersionType = 'Client'  ;Windows XP
        If $sOSVersion = 'WIN_XPe'        Then $sOSVersionType = 'Client'  ;Windows XP Embedded
        If $sOSVersion = 'WIN_2003'       Then $sOSVersionType = 'Server'  ;Windows Server 2003
        If $sOSVersion = 'WIN_XP64'       Then $sOSVersionType = 'Client'  ;Windows XP 64-bit
        If $sOSVersion = 'WIN_2003R2'     Then $sOSVersionType = 'Server'  ;Windows Server 2003 R2
        If $sOSVersion = 'WIN_VISTA'      Then $sOSVersionType = 'Client'  ;Windows Vista
        If $sOSVersion = 'WIN_2008'       Then $sOSVersionType = 'Server'  ;Windows Server 2008
      ElseIf $iOSVersionValue >= '08' Then  ;;Windows 7 or newer, read OS type from registry
        $sOSVersionType = $sOSInstallationType
      EndIf

      ;;DEFINE OS EDITION
      Switch $sOSEditionID
        Case 'Enterprise', 'EnterpriseS'
          $sOSEdition = 'Enterprise'
        Case 'Pro', 'Professional'
          $sOSEdition = 'Pro'
        Case 'Home'
          $sOSEdition = 'Home'
      EndSwitch
    EndFunc

    Func ReadOSArch()
      ;;READ OS ARCHITECTURE
      ; Generated variables:
      ;
      ; $sOSArch              ; Example output: X64
      ; $sOSArchName          ; Example output: 64-bit Operating System
      ; $sOSArchShortname     ; Example output: 32-bit
      Global $sOSArch            = @OSArch
      Global $sOSArchName        = ''
      Global $sOSArchShortname   = ''

      If $sOSArch = 'X86' Then
        $sOSArchName             = '32-bit Operating System'
        $sOSArchShortname        = '32-bit'
      EndIf
      If $sOSArch = 'X64' Then
        $sOSArchName             = '64-bit Operating System'
        $sOSArchShortname        = '64-bit'
      EndIf
    EndFunc

    Func ReadUser()
      ;;READ CURRENT USER
      Global $sCurrentUsername = ''
      $sCurrentUsername = @UserName
    EndFunc

    Func ReadHardware()
      ;;DEFINE COMPUTER DETAILS
      ; Generated variables:
      ;
      ; $sComputerName
      ; $sOSAge
      ; $sOSAgeAndDate
      ; $sOSBootTime
      ; $sOSInstallDate
      ; $sOSUptime
      ; $sWMIAdminPasswordStatus
      ; $sWMIAutomaticResetBootOption
      ; $sWMIAutomaticResetCapability
      ; $sWMIBootOptionOnLimit
      ; $sWMIBootOptionOnWatchDog
      ; $sWMIBootROMSupported
      ; $sWMIBootupState
      ; $sWMICaption
      ; $sWMIChassisBootupState
      ; $sWMICreationClassName
      ; $sWMICurrentTimeZone
      ; $sWMIDaylightInEffect
      ; $sWMIDescription
      ; $sWMIDomain
      ; $sWMIDomainRole
      ; $sWMIEnableDaylightSavingsTime
      ; $sWMIFrontPanelResetStatus
      ; $sWMIInfraredSupported
      ; $sWMIInitialLoadInfo
      ; $sWMIInstallDate    ;use $sOSInstallDate instead
      ; $sWMIKeyboardPasswordStatus
      ; $sWMILastBootupTime    ;use $sOSBootTime instead
      ; $sWMILastLoadInfo
      ; $sWMIManufacturer
      ; $sWMIModel
      ; $sWMIName
      ; $sWMINameFormat
      ; $sWMINetworkServerModeEnabled
      ; $sWMIPartOfDomain
      ; $sWMIPauseAfterReset
      ; $sWMIPowerManagementSupported
      ; $sWMIPowerOnPasswordStatus
      ; $sWMIPowerState
      ; $sWMIPowerSupplyState
      ; $sWMIPrimaryOwnerContact
      ; $sWMIPrimaryOwnerName
      ; $sWMIResetCapability
      ; $sWMIResetCount
      ; $sWMIResetLimit
      ; $sWMIRoles
      ; $sWMISerialNumber
      ; $sWMISMBIOSAssetTag
      ; $sWMIStatus
      ; $sWMISystemStartupDelay
      ; $sWMISystemStartupSetting
      ; $sWMISystemType
      ; $sWMIThermalState
      ; $sWMITotalPhysicalMemory
      ; $sWMIUserName
      ; $sWMIWakeUpType
      ; $sWMIWorkgroup
      ;
      ; https://www.autoitscript.com/forum/topic/122994-get-computer-make-model-help/?do=findComment&comment=854055
      ; https://www.autoitscript.com/forum/topic/81269-detect-bios-manufacture-using-wmi/?do=findComment&comment=584628
      ; https://www.autoitscript.com/forum/topic/110300-system-uptime/?do=findComment&comment=774837

      Global $sComputerName = @ComputerName

      ;;gather and process wmi computer system details
      $wbemFlagReturnImmediately = 0x10
      $wbemFlagForwardOnly = 0x20
      $colItems = ""
      $strComputer = "localhost"

      $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
      $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_ComputerSystem", "WQL", _
                          $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

      If IsObj($colItems) then
        For $objItem In $colItems
          Global $sWMIAdminPasswordStatus       = $objItem.AdminPasswordStatus
          Global $sWMIAutomaticResetBootOption  = $objItem.AutomaticResetBootOption
          Global $sWMIAutomaticResetCapability  = $objItem.AutomaticResetCapability
          Global $sWMIBootOptionOnLimit         = $objItem.BootOptionOnLimit
          Global $sWMIBootOptionOnWatchDog      = $objItem.BootOptionOnWatchDog
          Global $sWMIBootROMSupported          = $objItem.BootROMSupported
          Global $sWMIBootupState               = $objItem.BootupState
          Global $sWMICaption                   = $objItem.Caption
          Global $sWMIChassisBootupState        = $objItem.ChassisBootupState
          Global $sWMICreationClassName         = $objItem.CreationClassName
          Global $sWMICurrentTimeZone           = $objItem.CurrentTimeZone
          Global $sWMIDaylightInEffect          = $objItem.DaylightInEffect
          Global $sWMIDescription               = $objItem.Description
          Global $sWMIDomain                    = $objItem.Domain
          Global $sWMIDomainRole                = $objItem.DomainRole
          Global $sWMIEnableDaylightSavingsTime = $objItem.EnableDaylightSavingsTime
          Global $sWMIFrontPanelResetStatus     = $objItem.FrontPanelResetStatus
          Global $sWMIInfraredSupported         = $objItem.InfraredSupported
          Local  $strInitialLoadInfo            = $objItem.InitialLoadInfo(0)
          Global $sWMIInitialLoadInfo           = $strInitialLoadInfo
          Global $sWMIKeyboardPasswordStatus    = $objItem.KeyboardPasswordStatus
          Global $sWMILastLoadInfo              = $objItem.LastLoadInfo
          Global $sWMIManufacturer              = $objItem.Manufacturer
          Global $sWMIModel                     = $objItem.Model
          Global $sWMIName                      = $objItem.Name
          Global $sWMINameFormat                = $objItem.NameFormat
          Global $sWMINetworkServerModeEnabled  = $objItem.NetworkServerModeEnabled
          Global $sWMIPartOfDomain              = $objItem.PartOfDomain
          Global $sWMIPauseAfterReset           = $objItem.PauseAfterReset
          Global $sWMIPowerManagementSupported  = $objItem.PowerManagementSupported
          Global $sWMIPowerOnPasswordStatus     = $objItem.PowerOnPasswordStatus
          Global $sWMIPowerState                = $objItem.PowerState
          Global $sWMIPowerSupplyState          = $objItem.PowerSupplyState
          Global $sWMIPrimaryOwnerContact       = $objItem.PrimaryOwnerContact
          Global $sWMIPrimaryOwnerName          = $objItem.PrimaryOwnerName
          Global $sWMIResetCapability           = $objItem.ResetCapability
          Global $sWMIResetCount                = $objItem.ResetCount
          Global $sWMIResetLimit                = $objItem.ResetLimit
          Local  $strRoles                      = $objItem.Roles(0)
          Global $sWMIRoles                     = $strRoles
          Global $sWMIStatus                    = $objItem.Status
          Global $sWMISystemStartupDelay        = $objItem.SystemStartupDelay
          Global $sWMISystemStartupSetting      = $objItem.SystemStartupSetting
          Global $sWMISystemType                = $objItem.SystemType
          Global $sWMIThermalState              = $objItem.ThermalState
          Global $sWMITotalPhysicalMemory       = $objItem.TotalPhysicalMemory
          Global $sWMIUserName                  = $objItem.UserName
          Global $sWMIWakeUpType                = $objItem.WakeUpType
          Global $sWMIWorkgroup                 = $objItem.Workgroup
        Next
      EndIf

      ;;validate $sWMIUserName
        If (StringIsSpace($sWMIUserName) = 1) Then
          $sWMIUserName = $sCurrentUsername
        EndIf

      ;;gather and process wmi bios details
      $wbemFlagReturnImmediately = 0x10
      $wbemFlagForwardOnly = 0x20
      $colItems = ""
      $strComputer = "localhost"

      $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
      $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_SystemEnclosure", "WQL", _
                          $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

      ;;process WMI serial and asset tag
      If IsObj($colItems) then
        For $objItem In $colItems
          Global $sWMISerialNumber = $objItem.SerialNumber
          Global $sWMISMBIOSAssetTag = $objItem.SMBIOSAssetTag
        Next
      EndIf

      Global $bAssetTagExists = True
      Switch $sWMISMBIOSAssetTag
        Case $sWMISerialNumber, 'No Asset Tag'
          $bAssetTagExists = False
        Case Else
          $bAssetTagExists = True
      EndSwitch

      ;;gather and process wmi os details
      $wbemFlagReturnImmediately = 0x10
      $wbemFlagForwardOnly = 0x20
      $colItems = ""
      $strComputer = "localhost"

      $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
      $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_OperatingSystem", "WQL", _
                          $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

      If IsObj($colItems) then
        For $objItem In $colItems
          Global $sWMILastBootupTime = $objItem.LastBootUpTime
          Global $sWMIInstallDate = $objItem.InstallDate
        Next
      EndIf

      ;;calculate uptime
      Global $sOSBootTime     = __WMIDateStringToDate($sWMILastBootupTime)
      Global $sOSUptime       = __CalcTimeChange($sOSBootTime)

      ;;convert install date
      Global $sOSInstallDate  = __WMIDateStringToDateShort($sWMIInstallDate)
      Global $sOSAge          = StringTrimRight(__CalcTimeChange($sOSInstallDate), 2)
      Global $sOSAgeAndDate   = $sOSAge & ' (' & $sOSInstallDate & ')'

      ;;remove make from model
      $sWMIModel = StringReplace($sWMIModel, $sWMIManufacturer & ' ', '', 1)
    EndFunc

    Func ReadNetworkAdapters()
      ;;Process IP address information for use by application.
      ;;
      ;; Generated variables:
      ;;
      ;; $aIPDetails[$i][0]    ;   Example output: (connection name)
      ;; $aIPDetails[$i][1]    ;   Example output: (adapter IP address)
      ;; $aIPDetails[$i][2]    ;   Example output: (MAC address)
      ;; $aIPDetails[$i][3]    ;   Example output: (gateway)
      ;; $aIPDetails[$i][4]    ;   Example output: (DNS servers, ie address - address - address) ;not working correctly?
      ;; $aIPDetails[$i][5]    ;   Example output: (DHCP enabled, true or false)
      ;; $aIPDetails[$i][6]    ;   Example output: (subnet mask)
      ;;
      ;; $sNetAdapter01Address         ;   Example output: adapter IP address
      ;; $sNetAdapter02Address         ;   Example output: adapter IP address
      ;; $sNetAdapter03Address         ;   Example output: adapter IP address
      ;;
      ;; https://www.autoitscript.com/forum/topic/128276-display-ip-address-default-gateway-dns-servers/?do=findComment&comment=890228

      Global $aIPDetails = _IPDetails()
      ;if statement just for reference
      If @error = 0 Then
        Local $sData = ''
        For $i = 1 To $aIPDetails[0][0]
          $sData &= 'Description: ' & $aIPDetails[$i][0] & @CRLF & 'IP Address: ' & $aIPDetails[$i][1] & @CRLF & 'MAC: ' & _
              $aIPDetails[$i][2] & @CRLF & 'Default Gateway: ' & $aIPDetails[$i][3] & @CRLF & 'DNS Servers: ' & $aIPDetails[$i][4] & @CRLF & @CRLF
        Next
        $sData = StringTrimRight($sData, StringLen(@CRLF & @CRLF))
        ;MsgBox($MB_SYSTEMMODAL, '', $sData)
      EndIf

      Global $bNetAdapter01Exists = False
      Global $bNetAdapter02Exists = False
      Global $bNetAdapter03Exists = False
      Global $bNetAdapter04Exists = False
      Global $bNetAdapter05Exists = False

      Global $sNetAdapter01Name = ''
      Global $sNetAdapter02Name = ''
      Global $sNetAdapter03Name = ''
      Global $sNetAdapter04Name = ''
      Global $sNetAdapter05Name = ''

      Global $sNetAdapter01Address = ''
      Global $sNetAdapter02Address = ''
      Global $sNetAdapter03Address = ''
      Global $sNetAdapter04Address = ''
      Global $sNetAdapter05Address = ''

      Global $sNetAdapter01DHCP = ''
      Global $sNetAdapter02DHCP = ''
      Global $sNetAdapter03DHCP = ''
      Global $sNetAdapter04DHCP = ''
      Global $sNetAdapter05DHCP = ''

      Global $sNetAdapter01Gateway = ''
      Global $sNetAdapter02Gateway = ''
      Global $sNetAdapter03Gateway = ''
      Global $sNetAdapter04Gateway = ''
      Global $sNetAdapter05Gateway = ''

      Global $sNetAdapter01SubnetMask = ''
      Global $sNetAdapter02SubnetMask = ''
      Global $sNetAdapter03SubnetMask = ''
      Global $sNetAdapter04SubnetMask = ''
      Global $sNetAdapter05SubnetMask = ''

      If _elementExists($aIPDetails, 1) Then
        $bNetAdapter01Exists = True
        $sNetAdapter01Name = $aIPDetails[1][0]
        $sNetAdapter01Address = $aIPDetails[1][1]
        If $aIPDetails[1][5] = True Then $sNetAdapter01DHCP = 'Dynamic'
        If $aIPDetails[1][5] = False Then $sNetAdapter01DHCP = 'Static'
        $sNetAdapter01Gateway = $aIPDetails[1][3]
        $sNetAdapter01SubnetMask = $aIPDetails[1][6]
      EndIf

      If _elementExists($aIPDetails, 2) Then
        $bNetAdapter02Exists = True
        $sNetAdapter02Name = $aIPDetails[2][0]
        $sNetAdapter02Address = $aIPDetails[2][1]
        If $aIPDetails[2][5] = True Then $sNetAdapter02DHCP = 'Dynamic'
        If $aIPDetails[2][5] = False Then $sNetAdapter02DHCP = 'Static'
        $sNetAdapter02Gateway = $aIPDetails[2][3]
        $sNetAdapter02SubnetMask = $aIPDetails[2][6]
      EndIf

      If _elementExists($aIPDetails, 3) Then
        $bNetAdapter03Exists = True
        $sNetAdapter03Name = $aIPDetails[3][0]
        $sNetAdapter03Address = $aIPDetails[3][1]
        If $aIPDetails[3][5] = True Then $sNetAdapter03DHCP = 'Dynamic'
        If $aIPDetails[3][5] = False Then $sNetAdapter03DHCP = 'Static'
        $sNetAdapter03Gateway = $aIPDetails[3][3]
        $sNetAdapter03SubnetMask = $aIPDetails[3][6]
      EndIf

      If _elementExists($aIPDetails, 4) Then
        $bNetAdapter04Exists = True
        $sNetAdapter04Name = $aIPDetails[4][0]
        $sNetAdapter04Address = $aIPDetails[4][1]
        If $aIPDetails[4][5] = True Then $sNetAdapter04DHCP = 'Dynamic'
        If $aIPDetails[4][5] = False Then $sNetAdapter04DHCP = 'Static'
        $sNetAdapter04Gateway = $aIPDetails[4][3]
        $sNetAdapter04SubnetMask = $aIPDetails[4][6]
      EndIf

      If _elementExists($aIPDetails, 5) Then
        $bNetAdapter05Exists = True
        $sNetAdapter05Name = $aIPDetails[5][0]
        $sNetAdapter05Address = $aIPDetails[5][1]
        If $aIPDetails[5][5] = True Then $sNetAdapter05DHCP = 'Dynamic'
        If $aIPDetails[5][5] = False Then $sNetAdapter05DHCP = 'Static'
        $sNetAdapter05Gateway = $aIPDetails[5][3]
        $sNetAdapter05SubnetMask = $aIPDetails[5][6]
      EndIf
    EndFunc

    Func _IPDetails()
      ;;WMI call for IP address information
      Local $aReturn[1][7] = [[0, 7]], $iCount = 0
      Local $oWMIService = ObjGet('winmgmts:{impersonationLevel = impersonate}!\\' & '.' & '\root\cimv2')
      Local $oColItems = $oWMIService.ExecQuery('Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True', 'WQL', 0x30)
      If IsObj($oColItems) Then
        For $oObjectItem In $oColItems
          $aReturn[0][0] += 1
          $iCount += 1

          If $aReturn[0][0] <= $iCount + 1 Then
            ReDim $aReturn[$aReturn[0][0] * 2][$aReturn[0][1]]
          EndIf

          $aReturn[$iCount][0] = _IsString($oObjectItem.Description)
          $aReturn[$iCount][1] = _IsString($oObjectItem.IPAddress(0))
          $aReturn[$iCount][2] = _IsString($oObjectItem.MACAddress)
          $aReturn[$iCount][3] = _IsString($oObjectItem.DefaultIPGateway(0))
          $aReturn[$iCount][4] = _IsString(_WMIArrayToString($oObjectItem.DNSServerSearchOrder(), ' - '))
          $aReturn[$iCount][5] = _IsString($oObjectItem.DHCPEnabled)
          $aReturn[$iCount][6] = _IsString($oObjectItem.IPSubnet(0))
        Next
        ReDim $aReturn[$aReturn[0][0] + 1][$aReturn[0][1]]
      EndIf
      Return SetError($aReturn[0][0] = 0, 0, $aReturn)
    EndFunc

    Func ReadDisks()
      ;;Process disk details.
      ;; Generated variables:
      ;;
      ;; $sDiskDetails       ;Example output: formatted string of disk details array
      ;; $aDiskDetails[i][0] ;Example output: drive letter
      ;; $aDiskDetails[i][1] ;Example output: 0 or null. Null means disk is not accessible, like a CD drive with no disc.
      ;; $aDiskDetails[i][2] ;Example output: "Local Fixed Disk", "CD-ROM Disc", "Network Connection", others
      ;; $aDiskDetails[i][3] ;Example output: path if mapped drive, blank if local disk

      Global $sDiskDetails = ''
      Global $aDiskDetails = ''

      $aDiskDetails = _DiskDetails()
      If @error = 0 Then
        Global $sDiskDetails = ''
        For $i = 1 To $aDiskDetails[0][0]
          $sDiskDetails &= ' • ' & $aDiskDetails[$i][2] & ' (' & $aDiskDetails[$i][0] & ') ' & $aDiskDetails[$i][3] & @CRLF
        Next
        $sDiskDetails = StringTrimRight($sDiskDetails, StringLen(@CRLF))
        ;MsgBox($MB_SYSTEMMODAL, '', $sDiskDetails)
      EndIf
    EndFunc

    Func _DiskDetails()
      ;;WMI call to gather disk information.
      Local $aReturn[1][4] = [[0, 4]], $iCount = 0
      Local $oWMIService = ObjGet('winmgmts:{impersonationLevel = impersonate}!\\' & '.' & '\root\cimv2')
      Local $oColItems = $oWMIService.ExecQuery('SELECT * FROM Win32_LogicalDisk', 'WQL', 0x30)
      If IsObj($oColItems) Then
        For $oObjectItem In $oColItems
          $aReturn[0][0] += 1
          $iCount += 1

          If $aReturn[0][0] <= $iCount + 1 Then
            ReDim $aReturn[$aReturn[0][0] * 2][$aReturn[0][1]]
          EndIf

          $aReturn[$iCount][0] = _IsStringReturnNull($oObjectItem.Name)
          $aReturn[$iCount][1] = _IsStringReturnNull($oObjectItem.Access)
          $aReturn[$iCount][2] = _IsStringReturnNull($oObjectItem.Description)
          $aReturn[$iCount][3] = _IsStringReturnNull($oObjectItem.ProviderName)
        Next
        ReDim $aReturn[$aReturn[0][0] + 1][$aReturn[0][1]]
      EndIf
      Return SetError($aReturn[0][0] = 0, 0, $aReturn)
    EndFunc

    Func ReadPrinters()
      ;;Process printer details.
      ;;
      ;;Generated variables:
      ;;
      ;; $sPrinterDetails       ;Example output: formatted string of printer details array
      ;; $aPrinterDetails[i][0] ;Example output: PDFCreator or //sewprnt1/CHLIT01
      ;; $aPrinterDetails[i][1] ;Example output: 10.164.10.56
      ;; $aPrinterDetails[i][2] ;Example output: CHL - IT Copier
      ;; $aPrinterDetails[i][3] ;Example output: Ricoh Aficio MP 2550

      Global $sPrinterDetails = ''
      Global $aPrinterDetails = ''

      $aPrinterDetails = _PrinterDetails()
      If @error = 0 Then
        Global $sPrinterDetails = ''
        For $i = 1 To $aPrinterDetails[0][0]
          $sPrinterDetails &= ' • ' & $aPrinterDetails[$i][0] & @CRLF & _
                              '    - Port: ' & $aPrinterDetails[$i][1] & @CRLF & _
                              '    - Location: ' & $aPrinterDetails[$i][2] & @CRLF & _
                              '    - Comments: ' & $aPrinterDetails[$i][3] & @CRLF
        Next
        $sPrinterDetails = StringTrimRight($sPrinterDetails, StringLen(@CRLF))
        ;MsgBox($MB_SYSTEMMODAL, '', $sPrinterDetails)
      EndIf
    EndFunc

    Func _PrinterDetails()
      ;;WMI call for printer information.
      Local $aReturn[1][4] = [[0, 4]], $iCount = 0
      Local $oWMIService = ObjGet('winmgmts:{impersonationLevel = impersonate}!\\' & '.' & '\root\cimv2')
      Local $oColItems = $oWMIService.ExecQuery('SELECT * FROM Win32_Printer', 'WQL', 0x30)
      If IsObj($oColItems) Then
        For $oObjectItem In $oColItems
          $aReturn[0][0] += 1
          $iCount += 1

          If $aReturn[0][0] <= $iCount + 1 Then
            ReDim $aReturn[$aReturn[0][0] * 2][$aReturn[0][1]]
          EndIf

          $aReturn[$iCount][0] = _IsStringReturnNull($oObjectItem.Name)
          $aReturn[$iCount][1] = _IsStringReturnNull($oObjectItem.PortName)
          $aReturn[$iCount][2] = _IsStringReturnNull($oObjectItem.Location)
          $aReturn[$iCount][3] = _IsStringReturnNull($oObjectItem.Comment)
        Next
        ReDim $aReturn[$aReturn[0][0] + 1][$aReturn[0][1]]
      EndIf
      Return SetError($aReturn[0][0] = 0, 0, $aReturn)
    EndFunc

    Func ReadAD()
      ;;READ DETAILS FROM ACTIVE DIRECTORY
      Global $sADDescription
      Global $sADDistinguishedName
      Global $sADLocalAdminPassword
      Global $sADLocalAdminPasswordExp
      Global $sADOUPath
      Global $sADLoginScript
      Global $sADHomeDirectory
      Global $sADHomeDrive

      ;Local $aADProperties[5][2]

      ;;Open Connection to Active Directory
      _AD_Open()

      If @error = 0 Then
        ;If @error Then Exit MsgBox(16, "Active Directory Connection", "Function _AD_Open encountered a problem. @error = " & @error & ", @extended = " & @extended)

        ;;ATTEMPT 1
        ;$aADProperties = _AD_GetObjectProperties(@ComputerName & '$', 'description,distinguishedName,ms-Mcs-AdmPwd,ms-Mcs-AdmPwdExpirationTime')
        ;If @error Then ReDim $aADProperties[5][2]
        ;ReDim $aADProperties[5][2]

        ;_ArrayDisplay($aADProperties, 'Debug')

        ;$sADDescription           = $aADProperties[1][1]
        ;$sADDistinguishedName     = $aADProperties[2][1]
        ;$sADLocalAdminPassword    = $aADProperties[3][1]
        ;$sADLocalAdminPasswordExp = $aADProperties[4][1]

        ;MsgBox(0, 'Debug', 'Description: ' & $sADDescription & '. OU: ' & $sADDistinguishedName & '. Admin Pass: ' & $sADLocalAdminPassword & '. Admin Pass Exp: ' & $sADLocalAdminPasswordExp & '.')

        ;$aProperties = _AD_GetObjectProperties(@ComputerName & "$")
        ;_ArrayDisplay($aProperties, "Active Directory Functions - Example 3 - Properties for computer '" & @ComputerName & "'")

        ;;ATTEMPT 2
        $sADDescription           = ADQuery(@ComputerName & '$', 'description')
        $sADDistinguishedName     = ADQuery(@ComputerName & '$', 'distinguishedName')
        $sADLocalAdminPassword    = ADQuery(@ComputerName & '$', 'ms-Mcs-AdmPwd')
        $sADLocalAdminPasswordExp = ADQuery(@ComputerName & '$', 'ms-Mcs-AdmPwdExpirationTime')
        $sADLoginScript           = ADQuery(@Username, 'scriptPath')  ;;Ex: "LoginScriptName.bat" without a path
        $sADHomeDirectory         = ADQuery(@Username, 'homeDirectory')  ;;Ex: "\\servername\folder\username"
        $sADHomeDrive             = ADQuery(@Username, 'homeDrive')  ;;Ex: "Z:"


        ;;Close Connection to Active Directory
        _AD_Close()

        ;;Parse AD OU path
        If StringIsSpace($sADDistinguishedName) = False Then
          $aADDistinguishedName = StringSplit($sADDistinguishedName, ',', $STR_NOCOUNT)
          $sADOUPath = ''
          _ArrayReverse($aADDistinguishedName)
          For $i = 3 to UBound($aADDistinguishedName) - 2
            $sADOUPath = $sADOUPath & ' > ' & $aADDistinguishedName[$i]
          Next
          $sADOUPath = StringTrimLeft($sADOUPath, 3)
          $sADOUPath = StringReplace($sADOUPath, 'OU=', '')
        EndIf
      EndIf
    EndFunc

    Func ADQuery($sADObject, $sADParameter)
      ;;Wrapper for _AD_GetObjectProperties to safely return single string.
      ;; Open AD connection before calling this.

      $aADProperties = _AD_GetObjectProperties($sADObject, $sADParameter)

      If IsArray($aADProperties) Then
        ReDim $aADProperties[2][2]
        Return $aADProperties[1][1]
      Else
        Return
      EndIf
    EndFunc

    Func ReadServices()
      ;;READ DETAILS ABOUT LOCAL SERVICES
      Global $sServCrowdStrikeStatus
      Global $sServWindowsUpdateStatus
      Global $sServBeyondTrustStatus
      Global $sServBeyondTrustMonitorStatus
      Global $sServSplunkForwarderStatus
      Global $sServSMSAgentStatus

      Local $sErrorText = 'Not Installed'
      Local $aServCrowdStrikeStatus
      Local $aServWindowsUpdateStatus
      Local $aServBeyondTrustStatus
      Local $aServBeyondTrustMonitorStatus
      Local $aServSplunkForwarderStatus
      Local $aServSMSAgentStatus

      ;;CrowdStrike
      $aServCrowdStrikeStatus = _Service_QueryStatus('CSFalconService')
      If @error Then
        $sServCrowdStrikeStatus = $sErrorText
      Else
        $sServCrowdStrikeStatus = TranslateServiceStatusCode($aServCrowdStrikeStatus[1])
      EndIf

      ;;Windows Update
      $aServWindowsUpdateStatus = _Service_QueryStatus('wuauserv')
      If @error Then
        $sServWindowsUpdateStatus = $sErrorText
      Else
        $sServWindowsUpdateStatus = TranslateServiceStatusCode($aServWindowsUpdateStatus[1])
      EndIf

      ;;BeyondTrust
      $aServBeyondTrustStatus = _Service_QueryStatus('BTService')
      If @error Then
        $sServBeyondTrustStatus = $sErrorText
      Else
        $sServBeyondTrustStatus = TranslateServiceStatusCode($aServBeyondTrustStatus[1])
      EndIf

      ;;BeyondTrust Monitor
      $aServBeyondTrustMonitorStatus = _Service_QueryStatus('BTMonitor')
      If @error Then
        $sServBeyondTrustMonitorStatus = $sErrorText
      Else
        $sServBeyondTrustMonitorStatus = TranslateServiceStatusCode($aServBeyondTrustMonitorStatus[1])
      EndIf

      ;;Splunk Forwarder
      $aServSplunkForwarderStatus = _Service_QueryStatus('SplunkForwarder')
      If @error Then
        $sServSplunkForwarderStatus = $sErrorText
      Else
        $sServSplunkForwarderStatus = TranslateServiceStatusCode($aServSplunkForwarderStatus[1])
      EndIf

      ;;SCCM Client
      $aServSMSAgentStatus = _Service_QueryStatus('CcmExec')
      If @error Then
        $sServSMSAgentStatus = $sErrorText
      Else
        $sServSMSAgentStatus = TranslateServiceStatusCode($aServSMSAgentStatus[1])
      EndIf
    EndFunc

    Func TranslateServiceStatusCode($iStatusValue)
      ;;Translates the code returned by the _Service_QueryStatus function.
      Local $sStatus

      Switch $iStatusValue
        Case 1
          $sStatus = 'Stopped'
        Case 2
          $sStatus = 'Starting'
        Case 3
          $sStatus = 'Stopping'
        Case 4
          $sStatus = 'Running'
        Case 5
          $sStatus = 'Continuing'
        Case 6
          $sStatus = 'Pausing'
        Case 7
          $sStatus = 'Paused'
      EndSwitch
      Return $sStatus
    EndFunc

    Func ReadCustomization()
      ;;READ APP CUSTOMIZATION
      ;; Read application customization.

      ;;;organization
      ;If RegRead($sAppRegistryPath, 'sOrgName') Then $sOrgName = RegRead($sAppRegistryPath, 'sOrgName')
      ;If RegRead($sAppRegistryPath, 'sOrgDomain') Then $sOrgDomain = RegRead($sAppRegistryPath, 'sOrgDomain')
      ;If RegRead($sAppRegistryPath, 'sOrgFQDomain') Then $sOrgFQDomain = RegRead($sAppRegistryPath, 'sOrgFQDomain')
      ;If RegRead($sAppRegistryPath, 'sIntranetName') Then $sIntranetName = RegRead($sAppRegistryPath, 'sIntranetName')
      ;If RegRead($sAppRegistryPath, 'sIntranetURL') Then $sIntranetURL = RegRead($sAppRegistryPath, 'sIntranetURL')
      ;
      ;;;helpdesk details
      ;If RegRead($sAppRegistryPath, 'sHelpdeskName') Then $sHelpdeskName = RegRead($sAppRegistryPath, 'sHelpdeskName')
      ;If RegRead($sAppRegistryPath, 'sHelpdeskPhone') Then $sHelpdeskPhone = RegRead($sAppRegistryPath, 'sHelpdeskPhone')
      ;If RegRead($sAppRegistryPath, 'sHelpdeskRegionalPhone') Then $sHelpdeskRegionalPhone = RegRead($sAppRegistryPath, 'sHelpdeskRegionalPhone')
      ;If RegRead($sAppRegistryPath, 'sHelpdeskCorporatePhone') Then $sHelpdeskCorporatePhone = RegRead($sAppRegistryPath, 'sHelpdeskCorporatePhone')
      ;If RegRead($sAppRegistryPath, 'sHelpdeskEmail') Then $sHelpdeskEmail = RegRead($sAppRegistryPath, 'sHelpdeskEmail')
      ;If RegRead($sAppRegistryPath, 'sHelpdeskURL') Then $sHelpdeskURL = RegRead($sAppRegistryPath, 'sHelpdeskURL')
      ;If RegRead($sAppRegistryPath, 'sHelpdeskRemoteSupportURL') Then $sHelpdeskRemoteSupportURL = RegRead($sAppRegistryPath, 'sHelpdeskRemoteSupportURL')
      ;If RegRead($sAppRegistryPath, 'sHelpdeskRequestName') Then $sHelpdeskRequestName = RegRead($sAppRegistryPath, 'sHelpdeskRequestName')
      ;
      ;;;other details
      ;If RegRead($sAppRegistryPath, 'sSCCMAppCatalogURL') Then $sSCCMAppCatalogURL = RegRead($sAppRegistryPath, 'sSCCMAppCatalogURL')
      ;If RegRead($sAppRegistryPath, 'sHomeFolderName') Then $sHomeFolderName = RegRead($sAppRegistryPath, 'sHomeFolderName')
      ;If RegRead($sAppRegistryPath, 'sLoginScriptPath') Then $sLoginScriptPath = RegRead($sAppRegistryPath, 'sLoginScriptPath')
      ;
      ;;;free-text field
      ;Global $sFreeTextDetails = ''
      ;If RegRead($sAppRegistryPath, 'sFreeTextDetails') Then $sFreeTextDetails = RegRead($sAppRegistryPath, 'sFreeTextDetails')

      _ATC_Customization($sAppRegistryPath, 'Read')

      Switch (StringIsSpace($sFreeTextDetails))
        Case 0
          Global $bFreeTextDetailsExists = True
        Case 1
          Global $bFreeTextDetailsExists = False
      EndSwitch
    EndFunc

    Func ReadRegistry()
      ;;READ REGISTRY DETAILS
      Global $sPCDescription

      $sPCDescription = RegRead('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters','srvcomment')
    EndFunc

    Func ReadLCMInfo()
      ;;READ LCM INFO
      ;; Generated variables:
      ;;
      ;; $sMainLCM_CustomXJCode   ;X88868
      ;; $sMainLCM_CustomRCRCode   ;SE900412

      ;;read LCM log file, set to blank if not found
      Global $sMainLCM_CustomXJCode  = ''
      Global $sMainLCM_CustomRCRCode  = ''

      ;;declare locals
      Local $sMainLCM_CustomXJCode0
      Local $sMainLCM_CustomRCRCode0
      Local $sMainLCM_CustomXJCode1
      Local $sMainLCM_CustomRCRCode1
      Local $sMainLCM_CustomXJCode2
      Local $sMainLCM_CustomRCRCode2
      Local $sMainLCM_CustomXJCode3
      Local $sMainLCM_CustomRCRCode3
      Local $sMainLCM_CustomXJCode4
      Local $sMainLCM_CustomRCRCode4
      Local $sMainLCM_CustomXJCode5
      Local $sMainLCM_CustomRCRCode5

      ;;LOCATION 0 - USER OVERRIDE / CUSTOMIZATION
      $sMainLCM_CustomXJCode0 = RegRead($sAppRegistryPath, 'sMainLCM_CustomXJCode')
      $sMainLCM_CustomRCRCode0 = RegRead($sAppRegistryPath, 'sMainLCM_CustomRCRCode')

      ;$sMainLCM_CustomXJCodeFilePath  = $sAppInstallPath & '\Support\CustomLCMXJCode.txt'
      ;$sMainLCM_CustomRCRCodeFilePath  = $sAppInstallPath & '\Support\CustomLCMCRCode.txt'
      ;$sCustomLCMEditionFilePath = $sAppInstallPath & '\Support\CustomLCMEdition.txt'

      ;If FileExists($sMainLCM_CustomXJCodeFilePath) Then
      ;  Local $hFileOpen = FileOpen($sMainLCM_CustomXJCodeFilePath,  $FO_READ)
      ;  $sMainLCM_CustomXJCode0 = FileRead($hFileOpen)
      ;  FileClose($hFileOpen)
      ;EndIf

      ;If FileExists($sMainLCM_CustomRCRCodeFilePath) Then
      ;  Local $hFileOpen = FileOpen($sMainLCM_CustomRCRCodeFilePath,  $FO_READ)
      ;  $sMainLCM_CustomRCRCode0 = FileRead($hFileOpen)
      ;  FileClose($hFileOpen)
      ;EndIf

      ;If FileExists($sCustomLCMEditionFilePath) Then
      ;  Local $hFileOpen = FileOpen($sCustomLCMEditionFilePath,  $FO_READ)
      ;  $sMainLCM_CustomRCRCode0 = FileRead($hFileOpen)
      ;  FileClose($hFileOpen)
      ;EndIf

      ;;LOCATION 1 - DEPRECATED
      $sLCMLogFilePath1 = 'C:\mulcm\data\logs\TouchReport.log'
      If FileExists($sLCMLogFilePath1) Then    ;do if file exists
        Local $hFileOpen = FileOpen($sLCMLogFilePath1,  $FO_READ)
        If Not ($hFileOpen = '-1') Then ;do if file opens successfully
          $pos = FileSetPos($hFileOpen, -4096, $FILE_END)
          If $pos = 'False' Then  ;do if set position has no error
            $string = FileRead($hFileOpen)
          Else
            FileSetPos($hFileOpen, 0, 0)
            $string = FileRead($hFileOpen)
          EndIf

          ;; find X/J code
          $aLCMXJCode = StringRegExp($string, '[XJxj]testCode:([XJxj][0-9]{1,5})', 1)

          ;; find CR code
          $aLCMCRCode = StringRegExp($string, '[CRcr]:([A-Z|a-z][A-Z|a-z][0-9]{1,6})', 1)

          ;; load variables
          If _elementExists($aLCMXJCode, 0) = True Then
            $sMainLCM_CustomXJCode1  = StringUpper($aLCMXJCode[0])
          Else
            $sMainLCM_CustomXJCode1  = ' '
          EndIf
          If _elementExists($aLCMCRCode, 0) = True Then
            $sMainLCM_CustomRCRCode1  = StringUpper($aLCMCRCode[0])
          Else
            $sMainLCM_CustomRCRCode1  = ' '
          EndIf

          FileClose($hFileOpen)
        EndIf
      EndIf

      ;;LOCATION 2 - Maintenance.log
      $sLCMLogFile2Path = 'C:\mulcm\data\logs\Maintenance.log'
      If FileExists($sLCMLogFile2Path) Then    ;do if file exists
        Local $hFileOpen = FileOpen($sLCMLogFile2Path,  $FO_READ)
        If Not ($hFileOpen = '-1') Then ;do if file opens successfully
          $pos = FileSetPos($hFileOpen, -4096, $FILE_END)
          If $pos = 'False' Then  ;do if set position has no error
            $string = FileRead($hFileOpen)
          Else
            FileSetPos($hFileOpen, 0, 0)
            $string = FileRead($hFileOpen)
          EndIf

          ;; find X/J code
          $aLCMXJCode = StringRegExp($string, "[XJxj]Test Code = '([XJxj][0-9]{1,5})'", 1)

          ;; find CR code
          $aLCMCRCode = StringRegExp($string, "'LCM-([A-Z|a-z][A-Z|a-z][0-9]{1,6})'", 1)

          ;; load variables
          If _elementExists($aLCMXJCode, 0) = True Then
            $sMainLCM_CustomXJCode2  = StringUpper($aLCMXJCode[0])
          Else
            $sMainLCM_CustomXJCode2  = ' '
          EndIf
          If _elementExists($aLCMCRCode, 0) = True Then
            $sMainLCM_CustomRCRCode2  = StringUpper($aLCMCRCode[0])
          Else
            $sMainLCM_CustomRCRCode2  = ' '
          EndIf

          FileClose($hFileOpen)
        EndIf
      EndIf

      ;;LOCATION 3 - Remote Maintenance.log
      $sLCMLogFile3Path = 'L:\mulcm\data\logs\Maintenance.log'
      If FileExists($sLCMLogFile3Path) Then    ;do if file exists
        Local $hFileOpen = FileOpen($sLCMLogFile3Path,  $FO_READ)
        If Not ($hFileOpen = '-1') Then ;do if file opens successfully
          $pos = FileSetPos($hFileOpen, -4096, $FILE_END)
          If $pos = 'False' Then  ;do if set position has no error
            $string = FileRead($hFileOpen)
          Else
            FileSetPos($hFileOpen, 0, 0)
            $string = FileRead($hFileOpen)
          EndIf

          ;; find X/J code
          $aLCMXJCode = StringRegExp($string, "[XJxj]Test Code = '([XJxj][0-9]{1,5})'", 1)

          ;; find CR code
          $aLCMCRCode = StringRegExp($string, "'LCM-([A-Z|a-z][A-Z|a-z][0-9]{1,6})'", 1)

          ;; load variables
          If _elementExists($aLCMXJCode, 0) = True Then
            $sMainLCM_CustomXJCode3  = StringUpper($aLCMXJCode[0])
          Else
            $sMainLCM_CustomXJCode3  = ' '
          EndIf
          If _elementExists($aLCMCRCode, 0) = True Then
            $sMainLCM_CustomRCRCode3  = StringUpper($aLCMCRCode[0])
          Else
            $sMainLCM_CustomRCRCode3  = ' '
          EndIf

          FileClose($hFileOpen)
        EndIf
      EndIf

      ;;LOCATION 4 - TRDMessage.log
      $sLCMLogFile4Path = 'C:\mulcm\data\logs\TRDMessage.log'
      If FileExists($sLCMLogFile4Path) Then    ;do if file exists
        Local $hFileOpen = FileOpen($sLCMLogFile4Path,  $FO_READ)
        If Not ($hFileOpen = '-1') Then ;do if file opens successfully
          $pos = FileSetPos($hFileOpen, -4096, $FILE_END)
          If $pos = 'False' Then  ;do if set position has no error
            $string = FileRead($hFileOpen)
          Else
            FileSetPos($hFileOpen, 0, 0)
            $string = FileRead($hFileOpen)
          EndIf

          ;; find X/J code
          $aLCMXJCode = StringRegExp($string, ",'([XJxj][0-9]{1,5})',", 1)

          ;; find CR code
          $aLCMCRCode = StringRegExp($string, ",'LCM-([A-Z|a-z][A-Z|a-z][0-9]{1,6})'", 1)

          ;; load variables
          If _elementExists($aLCMXJCode, 0) = True Then
            $sMainLCM_CustomXJCode4  = StringUpper($aLCMXJCode[0])
          Else
            $sMainLCM_CustomXJCode4  = ' '
          EndIf
          If _elementExists($aLCMCRCode, 0) = True Then
            $sMainLCM_CustomRCRCode4  = StringUpper($aLCMCRCode[0])
          Else
            $sMainLCM_CustomRCRCode4  = ' '
          EndIf

          FileClose($hFileOpen)
        EndIf
      EndIf

      ;;LOCATION 5 - Remote TRDMessage.log
      $sLCMLogFile5Path = 'L:\mulcm\data\logs\TRDMessage.log'
      If FileExists($sLCMLogFile5Path) Then    ;do if file exists
        Local $hFileOpen = FileOpen($sLCMLogFile5Path,  $FO_READ)
        If Not ($hFileOpen = '-1') Then ;do if file opens successfully
          $pos = FileSetPos($hFileOpen, -4096, $FILE_END)
          If $pos = 'False' Then  ;do if set position has no error
            $string = FileRead($hFileOpen)
          Else
            FileSetPos($hFileOpen, 0, 0)
            $string = FileRead($hFileOpen)
          EndIf

          ;; find X/J code
          $aLCMXJCode = StringRegExp($string, ",'([XJxj][0-9]{1,5})',", 1)

          ;; find CR code
          $aLCMCRCode = StringRegExp($string, ",'LCM-([A-Z|a-z][A-Z|a-z][0-9]{1,6})'", 1)

          ;; load variables
          If _elementExists($aLCMXJCode, 0) = True Then
            $sMainLCM_CustomXJCode5  = StringUpper($aLCMXJCode[0])
          Else
            $sMainLCM_CustomXJCode5  = ' '
          EndIf
          If _elementExists($aLCMCRCode, 0) = True Then
            $sMainLCM_CustomRCRCode5  = StringUpper($aLCMCRCode[0])
          Else
            $sMainLCM_CustomRCRCode5  = ' '
          EndIf

          FileClose($hFileOpen)
        EndIf
      EndIf

      ;;find which variables have best LCM info, override with custom if exist
      If StringIsSpace($sMainLCM_CustomXJCode1) = False Then $sMainLCM_CustomXJCode = $sMainLCM_CustomXJCode1
      If StringIsSpace($sMainLCM_CustomRCRCode1) = False Then $sMainLCM_CustomRCRCode = $sMainLCM_CustomRCRCode1
      If StringIsSpace($sMainLCM_CustomXJCode2) = False Then $sMainLCM_CustomXJCode = $sMainLCM_CustomXJCode2
      If StringIsSpace($sMainLCM_CustomRCRCode2) = False Then $sMainLCM_CustomRCRCode = $sMainLCM_CustomRCRCode2
      If StringIsSpace($sMainLCM_CustomXJCode3) = False Then $sMainLCM_CustomXJCode = $sMainLCM_CustomXJCode3
      If StringIsSpace($sMainLCM_CustomRCRCode3) = False Then $sMainLCM_CustomRCRCode = $sMainLCM_CustomRCRCode3
      If StringIsSpace($sMainLCM_CustomXJCode4) = False Then $sMainLCM_CustomXJCode = $sMainLCM_CustomXJCode4
      If StringIsSpace($sMainLCM_CustomRCRCode4) = False Then $sMainLCM_CustomRCRCode = $sMainLCM_CustomRCRCode4
      If StringIsSpace($sMainLCM_CustomXJCode5) = False Then $sMainLCM_CustomXJCode = $sMainLCM_CustomXJCode5
      If StringIsSpace($sMainLCM_CustomRCRCode5) = False Then $sMainLCM_CustomRCRCode = $sMainLCM_CustomRCRCode5
      If StringIsSpace($sMainLCM_CustomXJCode0) = False Then $sMainLCM_CustomXJCode = $sMainLCM_CustomXJCode0
      If StringIsSpace($sMainLCM_CustomRCRCode0) = False Then $sMainLCM_CustomRCRCode = $sMainLCM_CustomRCRCode0

      ;validate LCM info retrieved, disable section if data invalid
      Switch (StringIsSpace($sMainLCM_CustomXJCode))
        Case 0
          Global $bLCMInfoExists = True
        Case 1
          Global $bLCMInfoExists = False
      EndSwitch
    EndFunc

  ;;TOOLS
    Func __CalcTimeChange($sWMIDateTime)
      ;;Calculate difference in time values.
      Local $aDateDiffs=[[0,24," day"],[0,60," hour"],[0,60," minute"]]  ;Local $aDateDiffs=[[0,24," day"],[0,60," hour"],[0,60," minute"],[0,1," second"]]
      Local $aDateDiff = StringSplit("D|h|n","|")
      Local $sNow = _NowCalc()
      For $sDiff = 1 to $aDateDiff[0]
        $aDateDiffs[$sDiff-1][0] = _DateDiff($aDateDiff[$sDiff], $sWMIDateTime, $sNow)
      Next
      Local $iUbound = UBound($aDateDiffs)-1
      For $iX = $iUbound To 0 Step -1
        If $iX > 0 Then
          If $aDateDiffs[$iX-1][0] > 0 Then $aDateDiffs[$iX][0] = ($aDateDiffs[$iX][0]-($aDateDiffs[$iX-1][0]*$aDateDiffs[$iX-1][1]))
        EndIf
      Next
      Local $sTimeDiff = ""
      For $iX = 0 To $iUbound
        If $aDateDiffs[$iX][0] > 0 Then
          $sTimeDiff &= $aDateDiffs[$iX][0] & $aDateDiffs[$iX][2]
          If $aDateDiffs[$iX][0] > 1 Then $sTimeDiff &= "s"
          If $iX < $iUbound Then $sTimeDiff &= ", "
        EndIf
      Next
      Return $sTimeDiff
    EndFunc

    Func __WMIDateStringToDate($dtmDate)
      ;;Convert WMI date string to readable date.
      Return StringLeft($dtmDate,4) & "-" & StringMid($dtmDate, 5, 2) & "-" & StringMid($dtmDate, 7, 2) & " " & StringMid($dtmDate, 9, 2) & ":" & StringMid($dtmDate, 11, 2) & ":" & StringMid($dtmDate, 13, 2)
    EndFunc

    Func __WMIDateStringToDateShort($dtmDate)
      ;;Convert WMI date string to shorter readable date.
      Return StringLeft($dtmDate,4) & "-" & StringMid($dtmDate, 5, 2) & "-" & StringMid($dtmDate, 7, 2)
    EndFunc

    Func _IsString($sString)
      If IsString($sString) = 0 Then
        $sString = 'Not Available'
      EndIf
      Return $sString
    EndFunc

    Func _WMIArrayToString($aIPDetails, $sDelimeter = '|')
      Local $sString = 'Not Available'
      If UBound($aIPDetails) Then
        For $i = 0 To UBound($aIPDetails) - 1
          $sString &= $aIPDetails[$i] & $sDelimeter
        Next
        $sString = StringTrimRight($sString, StringLen($sDelimeter))
      EndIf
      Return $sString
    EndFunc

    Func _IsStringReturnNull($sString)
      If IsString($sString) = 0 Then
        $sString = ''
      EndIf
      If $sString = 'Network Connection' Then
        $sString = 'Mapped Drive'
      EndIf
      Return $sString
    EndFunc

    Func _elementExists($array, $element)
      If $element > UBound($array)-1 Then Return False ; element is out of the array bounds
      Return True ; element is in array bounds
    EndFunc

    Func _ReduceMemory()
      ;;Reduce application RAM usage.
      ;;https://www.autoitscript.com/forum/topic/131315-accumulating-memory-usage/
      Local $aReturn = DllCall('psapi.dll','int','EmptyWorkingSet','long', -1)
      If @error = 1 Then
        Return SetError(1, 0, 0)
      EndIf
      Return $aReturn[0]
    EndFunc
#EndRegion

#Region -- BUILD INTERFACE
  Func BuildTray()
    ;;BUILD TRAY

    ;;tray options
    Opt('TrayAutoPause', 0)  ;;don't PAUSE script, if systray icon is clicked
    Opt('TrayMenuMode', 3)  ;;the default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.

    ;;tray icon
    TraySetIcon('Shell32.dll',322) ;;24 (question mark) or 44 (thin star) or 263 (question mark) or 322 (thin star) or 16783 ('i' icon)

    ;;stage tray menu
    ;; Duplicate these settings in Tools menu of main GUI.
    Global $idTrayMainNetConnect = TrayCreateItem('Network Connections')
    Global $idTrayMainInetCpl    = TrayCreateItem('Internet Options')
      TrayCreateItem('')
    Global $idTrayMainAppCatalog = TrayCreateItem('Application Catalog')
    Global $idTrayMainAppWiz     = TrayCreateItem('Programs and Features')
    Global $idTrayMainServices   = TrayCreateItem('Services')
    Global $idTrayMainWinUpdate  = TrayCreateItem('Windows Update')
      TrayCreateItem('')
    Global $idTrayMainPrintMMC   = TrayCreateItem('Print Management')
    Global $idTrayMainDevNPrint  = TrayCreateItem('Devices and Printers')
    Global $idTrayMainDevMan     = TrayCreateItem('Device Manager')
      TrayCreateItem('')
    Global $idTrayMainCredMan    = TrayCreateItem('Credential Manager')
    Global $idTrayMainMailAcct   = TrayCreateItem('Mail Accounts')
      TrayCreateItem('')
    Global $idTrayMainSearchAD   = TrayCreateItem('Search Active Directory')
    Global $idTrayMainSysProp    = TrayCreateItem('System Properties')
      TrayCreateItem('')
    Global $idTrayMainSearchAD   = TrayCreateItem('Run Login Script')
    Global $idTrayMainSysProp    = TrayCreateItem('Map ' & $sToolsHomeDrive_Title)
      TrayCreateItem('')
    Global $idTrayMainShowInfo   = TrayCreateItem('About This Computer')
      TrayCreateItem('')
    Global $idTrayMainExit       = TrayCreateItem('Exit')

    Switch $bConfigExitEnabled
      Case True
        TrayItemSetState($idTrayMainExit, $TRAY_ENABLE)
      Case False
        TrayItemSetState($idTrayMainExit, $TRAY_DISABLE)
    EndSwitch

    ;;stage tray
    Switch $sMainAppExeMode
      Case 'window'
        TraySetState(2) ;;hide tray icon
      Case Else
        TraySetState(1) ;;show the tray icon.
        TraySetToolTip('Loading...')
        TraySetClick(8) ;;pressing secondary mouse button will show the tray menu.
    EndSwitch
  EndFunc

  Func BuildMainGUI()
    ;;CREATE MAIN GUI

    ;;DEFINE GUI GRID
      ;;COLUMNS
        ;;columns, left
        $columnMainLeft00 = 0
        $columnMainLeft01 = 20  ;image

        ;;columns, left, widths
        $columnMainLeft00Width = 140
        $columnMainLeft01Width = $columnMainLeft00Width - 36    ;total width of column minus spacing left and right

        ;;columns, right
        $columnMainRight00 = $columnMainLeft00Width
        $columnMainRight01 = $columnMainRight00    ;group line
        $columnMainRight02 = $columnMainRight01 + 10    ;label title
        $columnMainRight03 = $columnMainRight02 + 90    ;label info
        $columnMainRight04 = $columnMainRight03 + 200

        ;;columns, right, widths
        $columnMainRight00Width = 300
        $columnMainRight01Width = 10
        $columnMainRight02Width = 90
        $columnMainRight03Width = 200
        $columnMainRight04Width = 0

        ;;window boundary
        $columnMainBounds = $columnMainLeft00Width + $columnMainRight00Width + 12   ;right edge of window

      ;;ROWS
        ;;rows, left
        $rowMainLeft00 = 0
        $rowMainLeft01 = 10

        ;;rows, left, heights
        $rowMainLeft00Height = 400
        $rowMainLeft01Height = 128

        ;;rows, right
        $rowMainRightSpacing = 16   ;height of columns of text
        $rowMainRightSpacers = 6    ;lower number means more space between groups
        $rowMainRight00 = 0 - $rowMainRightSpacers                                        ;spacer
        $rowMainRight01 = $rowMainRight00 + $rowMainRightSpacing
        $rowMainRight02 = $rowMainRight01 + $rowMainRightSpacing
        $rowMainRight03 = $rowMainRight02 + $rowMainRightSpacing
        $rowMainRight03a = $rowMainRight03 + $rowMainRightSpacing
        $rowMainRight04 = $rowMainRight03a + $rowMainRightSpacing
        $rowMainRight05 = $rowMainRight04 + $rowMainRightSpacing - $rowMainRightSpacers   ;spacer
        $rowMainRight06 = $rowMainRight05 + $rowMainRightSpacing
        $rowMainRight07 = $rowMainRight06 + $rowMainRightSpacing
        If $bNetAdapter01Exists = True Then
          $rowMainRight08 = $rowMainRight07 + $rowMainRightSpacing    ; IP address 1
        Else
          $rowMainRight08 = $rowMainRight07
        EndIf
        If $bNetAdapter02Exists = True Then
          $rowMainRight09 = $rowMainRight08 + $rowMainRightSpacing    ; IP address 2
        Else
          $rowMainRight09 = $rowMainRight08
        EndIf
        If $bNetAdapter03Exists = True Then
          $rowMainRight10 = $rowMainRight09 + $rowMainRightSpacing    ; IP address 3
        Else
          $rowMainRight10 = $rowMainRight09
        EndIf
        If $bNetAdapter04Exists = True Then
          $rowMainRight11 = $rowMainRight10 + $rowMainRightSpacing    ; IP address 4
        Else
          $rowMainRight11 = $rowMainRight10
        EndIf
        If $bNetAdapter05Exists = True Then
          $rowMainRight12 = $rowMainRight11 + $rowMainRightSpacing    ; IP address 5
        Else
          $rowMainRight12 = $rowMainRight11
        EndIf
        $rowMainRight13 = $rowMainRight12 + $rowMainRightSpacing
        $rowMainRight14 = $rowMainRight13 + $rowMainRightSpacing - $rowMainRightSpacers   ;spacer
        $rowMainRight15 = $rowMainRight14 + $rowMainRightSpacing
        $rowMainRight16 = $rowMainRight15 + $rowMainRightSpacing
        $rowMainRight17 = $rowMainRight16 + $rowMainRightSpacing
        $rowMainRight18 = $rowMainRight17 + $rowMainRightSpacing
        $rowMainRight19 = $rowMainRight18 + $rowMainRightSpacing
        $rowMainRight20 = $rowMainRight19 + $rowMainRightSpacing
        $rowMainRight21 = $rowMainRight20 + $rowMainRightSpacing - $rowMainRightSpacers   ;spacer
        $rowMainRight22 = $rowMainRight21 + $rowMainRightSpacing
        $rowMainRight23 = $rowMainRight22 + $rowMainRightSpacing
        $rowMainRight24 = $rowMainRight23 + $rowMainRightSpacing
        If $bAssetTagExists = True Then
          $rowMainRight25 = $rowMainRight24 + $rowMainRightSpacing
        Else
          $rowMainRight25 = $rowMainRight24
        EndIf
        If $bLCMInfoExists = True Then
          $rowMainRight26 = $rowMainRight25 + $rowMainRightSpacing - $rowMainRightSpacers   ;spacer
          $rowMainRight27 = $rowMainRight26 + $rowMainRightSpacing
          $rowMainRight28 = $rowMainRight27 + $rowMainRightSpacing
          $rowMainRight29 = $rowMainRight28 + $rowMainRightSpacing
        Else
          ;; set these rows to increase by 0 if no LCM info section exists
          $rowMainRight26 = $rowMainRight25   ;spacer
          $rowMainRight27 = $rowMainRight26
          $rowMainRight28 = $rowMainRight27
          $rowMainRight29 = $rowMainRight28
        EndIf
        If $bFreeTextDetailsExists = True Then
          $rowMainRight30 = $rowMainRight29 + $rowMainRightSpacing - $rowMainRightSpacers   ;spacer
          $rowMainRight31 = $rowMainRight30 + $rowMainRightSpacing
          $rowMainRight32 = $rowMainRight31 + $rowMainRightSpacing + (($rowMainRightSpacing * 3) - 7) ;height of multiline custom info box, duplicate changes in rowMainRight below
        Else
          ;; set these rows to increase by 0 if no custom info section exists
          $rowMainRight30 = $rowMainRight29   ;spacer
          $rowMainRight31 = $rowMainRight30
          $rowMainRight32 = $rowMainRight31
        EndIf
        $rowMainRight33 = $rowMainRight32 + $rowMainRightSpacing
        $rowMainRight34 = $rowMainRight33 + $rowMainRightSpacing
        $rowMainRight35 = $rowMainRight34 + $rowMainRightSpacing
        $rowMainRight36 = $rowMainRight35 + $rowMainRightSpacing
        $rowMainRight37 = $rowMainRight36 + $rowMainRightSpacing
        $rowMainRight38 = $rowMainRight37 + $rowMainRightSpacing
        $rowMainRight39 = $rowMainRight38 + $rowMainRightSpacing
        $rowMainRight40 = $rowMainRight39 + $rowMainRightSpacing
        $rowMainRight41 = $rowMainRight40 + $rowMainRightSpacing
        $rowMainRight42 = $rowMainRight41 + $rowMainRightSpacing
        $rowMainRight43 = $rowMainRight42 + $rowMainRightSpacing
        $rowMainRight44 = $rowMainRight43 + $rowMainRightSpacing
        $rowMainRight45 = $rowMainRight44 + $rowMainRightSpacing
        $rowMainRight46 = $rowMainRight45 + $rowMainRightSpacing
        $rowMainRight47 = $rowMainRight46 + $rowMainRightSpacing
        $rowMainRight48 = $rowMainRight47 + $rowMainRightSpacing
        $rowMainRight49 = $rowMainRight48 + $rowMainRightSpacing
        $rowMainRight50 = $rowMainRight49 + $rowMainRightSpacing

        ;;rows, right, heights
        $rowMainRightHeights  = $rowMainRightSpacing
        $rowMainRight00Height = $rowMainRightHeights
        $rowMainRight01Height = $rowMainRightHeights
        $rowMainRight02Height = $rowMainRightHeights
        $rowMainRight03Height = $rowMainRightHeights
        $rowMainRight03aHeight = $rowMainRightHeights
        $rowMainRight04Height = $rowMainRightHeights
        $rowMainRight05Height = $rowMainRightHeights
        $rowMainRight06Height = $rowMainRightHeights
        $rowMainRight07Height = $rowMainRightHeights
        If $bNetAdapter01Exists = True Then
          $rowMainRight08Height = $rowMainRightHeights    ;IP address 1
        Else
          $rowMainRight08Height = 0
        EndIf
        If $bNetAdapter02Exists = True Then
          $rowMainRight09Height = $rowMainRightHeights    ;IP address 2
        Else
          $rowMainRight09Height = 0
        EndIf
        If $bNetAdapter03Exists = True Then
          $rowMainRight10Height = $rowMainRightHeights    ;IP address 3
        Else
          $rowMainRight10Height = 0
        EndIf
        If $bNetAdapter04Exists = True Then
          $rowMainRight11Height = $rowMainRightHeights    ;IP address 4
        Else
          $rowMainRight11Height = 0
        EndIf
        If $bNetAdapter05Exists = True Then
          $rowMainRight12Height = $rowMainRightHeights    ;IP address 5
        Else
          $rowMainRight12Height = 0
        EndIf
        $rowMainRight13Height = $rowMainRightHeights
        $rowMainRight14Height = $rowMainRightHeights
        $rowMainRight15Height = $rowMainRightHeights
        $rowMainRight16Height = $rowMainRightHeights
        $rowMainRight17Height = $rowMainRightHeights
        $rowMainRight18Height = $rowMainRightHeights
        $rowMainRight19Height = $rowMainRightHeights
        $rowMainRight20Height = $rowMainRightHeights
        $rowMainRight21Height = $rowMainRightHeights
        $rowMainRight22Height = $rowMainRightHeights
        $rowMainRight23Height = $rowMainRightHeights
        $rowMainRight24Height = $rowMainRightHeights
        If $bAssetTagExists = True Then
          $rowMainRight25Height = $rowMainRightHeights
        Else
          $rowMainRight25Height = 0
        EndIf
        If $bLCMInfoExists = True Then
          $rowMainRight26Height = $rowMainRightHeights
          $rowMainRight27Height = $rowMainRightHeights
          $rowMainRight28Height = $rowMainRightHeights
          $rowMainRight29Height = $rowMainRightHeights
        Else
          ;; set these rows to 0 height if no LCM info section exists
          $rowMainRight26Height = 0
          $rowMainRight27Height = 0
          $rowMainRight28Height = 0
          $rowMainRight29Height = 0
        EndIf
        If $bFreeTextDetailsExists = True Then
          $rowMainRight30Height = $rowMainRightHeights
          $rowMainRight31Height = $rowMainRightHeights + (($rowMainRightSpacing * 3) - 7) ;height of multiline custom info box, duplicate changes in rowMainRightHeight above
          $rowMainRight32Height = $rowMainRightHeights
        Else
          ;; set these rows to 0 height if no custom info section exists
          $rowMainRight30Height = 0
          $rowMainRight31Height = 0
          $rowMainRight32Height = 0
          ;; end
        EndIf
        $rowMainRight33Height = $rowMainRightHeights
        $rowMainRight34Height = $rowMainRightHeights
        $rowMainRight35Height = $rowMainRightHeights
        $rowMainRight36Height = $rowMainRightHeights
        $rowMainRight37Height = $rowMainRightHeights
        $rowMainRight38Height = $rowMainRightHeights
        $rowMainRight39Height = $rowMainRightHeights
        $rowMainRight40Height = $rowMainRightHeights
        $rowMainRight41Height = $rowMainRightHeights
        $rowMainRight42Height = $rowMainRightHeights
        $rowMainRight43Height = $rowMainRightHeights
        $rowMainRight44Height = $rowMainRightHeights
        $rowMainRight45Height = $rowMainRightHeights
        $rowMainRight46Height = $rowMainRightHeights
        $rowMainRight47Height = $rowMainRightHeights
        $rowMainRight48Height = $rowMainRightHeights
        $rowMainRight49Height = $rowMainRightHeights
        $rowMainRight50Height = $rowMainRightHeights

        ;;window boundary
        $rowMainBounds = $rowMainRight33 + 17  ;;bottom edge of window, last used row in right column plus adjustment.

      ;;COLUMNS, FROM BOTTOM
        ;;columns, left, from bottom
        $columnMainLeft_00 = 0
        $columnMainLeft_01 = 10

        ;;columns, left, widths
        $columnMainLeft_00Width = 10
        $columnMainLeft_01Width = $columnMainLeft00Width - 20

      ;;ROWS, FROM BOTTOM
        ;;rows, left, from bottom
        $rowMainLeftSpacing = 35
        $rowMainLeftSpacer = 25 ;high number means less space between, up to $rowMainLeftSpacing
        $rowMainLeft_00 = $rowMainBounds - 24
        $rowMainLeft_01 = $rowMainLeft_00 - $rowMainLeftSpacing
        $rowMainLeft_02 = $rowMainLeft_01 - $rowMainLeftSpacing
        $rowMainLeft_03 = $rowMainLeft_02 - $rowMainLeftSpacing + $rowMainLeftSpacer
        $rowMainLeft_04 = $rowMainLeft_03 - $rowMainLeftSpacing - 10
        $rowMainLeft_05 = $rowMainLeft_04 - $rowMainLeftSpacing
        $rowMainLeft_06 = $rowMainLeft_05 - $rowMainLeftSpacing
        $rowMainLeft_07 = $rowMainLeft_06 - $rowMainLeftSpacing
        $rowMainLeft_08 = $rowMainLeft_07 - $rowMainLeftSpacing
        $rowMainLeft_09 = $rowMainLeft_08 - $rowMainLeftSpacing
        $rowMainLeft_10 = $rowMainLeft_09 - $rowMainLeftSpacing

        ;;rows, left, from bottom heights
        $rowMainLeftHeights = $rowMainLeftSpacing - 5
        $rowMainLeft_00Height = 0
        $rowMainLeft_01Height = $rowMainLeftHeights
        $rowMainLeft_02Height = $rowMainLeftHeights
        $rowMainLeft_03Height = $rowMainLeftHeights
        $rowMainLeft_04Height = $rowMainLeftHeights + 10
        $rowMainLeft_05Height = $rowMainLeftHeights
        $rowMainLeft_06Height = $rowMainLeftHeights
        $rowMainLeft_07Height = $rowMainLeftHeights
        $rowMainLeft_08Height = $rowMainLeftHeights
        $rowMainLeft_09Height = $rowMainLeftHeights
        $rowMainLeft_10Height = $rowMainLeftHeights

    ;;DECLARE MAIN WINDOW
      Global $hGUIMain = GUICreate('About This Computer', $columnMainBounds, $rowMainBounds, -1, -1, -1, $WS_EX_TOPMOST)

      $sCloseButtonText = 'Close'
      If $sMainAppExeMode = 'Window' Then $sCloseButtonText = 'Exit'

    ;;MENU BAR
      ;;File
        Global $idMenuMainFile = GUICtrlCreateMenu("&File")

        Global $idMenuItemMainFileEmail = GUICtrlCreateMenuItem('Email Summary', $idMenuMainFile, -1)
        Global $idMenuItemMainFileShow = GUICtrlCreateMenuItem('Show Summary', $idMenuMainFile, -1)
          GUICtrlCreateMenuItem('', $idMenuMainFile, -1) ; create a separator line
        Global $idMenuItemMainFilePrint = GUICtrlCreateMenuItem('Print Summary...', $idMenuMainFile, -1)
          GUICtrlCreateMenuItem('', $idMenuMainFile, -1) ; create a separator line
        Global $idMenuItemMainFileClose = GUICtrlCreateMenuItem($sCloseButtonText, $idMenuMainFile, -1)

      ;;Edit
        Global $idMenuMainEdit = GUICtrlCreateMenu('&Edit')

        Global $idMenuItemMainEditCut = GUICtrlCreateMenuItem('Cut', $idMenuMainEdit, -1)
        Global $idMenuItemMainEditCopy = GUICtrlCreateMenuItem('Copy', $idMenuMainEdit, -1)
        Global $idMenuItemMainEditPaste = GUICtrlCreateMenuItem('Paste', $idMenuMainEdit, -1)
          GUICtrlCreateMenuItem('', $idMenuMainEdit, -1) ; create a separator line
        Global $idMenuItemMainEditCopySum = GUICtrlCreateMenuItem('Copy Summary', $idMenuMainEdit, -1)

      ;;Tools
        Global $idMenuMainTools = GUICtrlCreateMenu('&Tools')

        Global $idMenuItemMainToolsNetConnect = GUICtrlCreateMenuItem('Network Connections', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsInetCpl = GUICtrlCreateMenuItem('Internet Options', $idMenuMainTools, -1)
          GUICtrlCreateMenuItem('', $idMenuMainTools, -1) ; create a separator line
        Global $idMenuItemMainToolsAppCatalog = GUICtrlCreateMenuItem('Application Catalog', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsAppWiz = GUICtrlCreateMenuItem('Programs and Features', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsServices = GUICtrlCreateMenuItem('Services', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsWinUpdate = GUICtrlCreateMenuItem('Windows Update', $idMenuMainTools, -1)
          GUICtrlCreateMenuItem('', $idMenuMainTools, -1) ; create a separator line
        Global $idMenuItemMainToolsPrintMMC = GUICtrlCreateMenuItem('Print Management', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsDevNPrint = GUICtrlCreateMenuItem('Devices and Printers', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsDevMan = GUICtrlCreateMenuItem('Device Manager', $idMenuMainTools, -1)
          GUICtrlCreateMenuItem('', $idMenuMainTools, -1) ; create a separator line
        Global $idMenuItemMainToolsCredMan = GUICtrlCreateMenuItem('Credential Manager', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsMailAcct = GUICtrlCreateMenuItem('Mail Accounts', $idMenuMainTools, -1)
          GUICtrlCreateMenuItem('', $idMenuMainTools, -1) ; create a separator line
        Global $idMenuItemMainToolsSearchAD = GUICtrlCreateMenuItem('Search Active Directory', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsSysProp = GUICtrlCreateMenuItem('System Properties', $idMenuMainTools, -1)
          GUICtrlCreateMenuItem('', $idMenuMainTools, -1) ; create a separator line
        Global $idMenuItemMainToolsLoginScript = GUICtrlCreateMenuItem('Run Login Script', $idMenuMainTools, -1)
        Global $idMenuItemMainToolsPersonalDrive = GUICtrlCreateMenuItem('Map ' & $sToolsHomeDrive_Title & ' Drive', $idMenuMainTools, -1)
        ;Global $idMenuItemMainToolsSysInfo = GUICtrlCreateMenuItem('System Information', $idMenuMainTools, -1)

      ;;Help
        Global $idMenuMainHelp = GUICtrlCreateMenu('&Help')

        Global $idMenuItemMainHelpLaunchLMIr = GUICtrlCreateMenuItem('LogMeIn Rescue', $idMenuMainHelp, -1)  ;↗
          GUICtrlCreateMenuItem('', $idMenuMainHelp, -1) ; create a separator line
        Global $idMenuItemMainHelpLaunchIntranet = GUICtrlCreateMenuItem($sHelpLink2_DisplayName, $idMenuMainHelp, -1)  ;↗
        Global $idMenuItemMainHelpLaunchHDesk = GUICtrlCreateMenuItem($sMainHelpdesk_Title, $idMenuMainHelp, -1) ;↗
        Global $idMenuItemMainHelpLaunchPWM = GUICtrlCreateMenuItem('Password Self-Service', $idMenuMainHelp, -1) ;↗
          GUICtrlCreateMenuItem('', $idMenuMainHelp, -1) ; create a separator line
        Global $idMenuItemMainHelpDocumentation = GUICtrlCreateMenuItem('Documentation (' & $sAppDocsHost & ')', $idMenuMainHelp, -1)
          GUICtrlCreateMenuItem('', $idMenuMainHelp, -1) ; create a separator line
        Global $idMenuItemMainHelpAbout = GUICtrlCreateMenuItem('About', $idMenuMainHelp, -1)

    ;;MAIN WINDOW ELEMENTS - LEFT COLUMN
      $idGraphicMainAboutPC = GUICtrlCreateIcon($sAppLogo, -1, $columnMainLeft01, $rowMainLeft01, 128, 128, -1, $GUI_WS_EX_PARENTDRAG)

      Global $idButtonMainLeftClose = GUICtrlCreateButton($sCloseButtonText, $columnMainLeft_01, $rowMainLeft_01, $columnMainLeft_01Width, $rowMainLeft_01Height)
      Global $idButtonMainLeftRefresh = GUICtrlCreateButton('Refresh', $columnMainLeft_01, $rowMainLeft_02, $columnMainLeft_01Width, $rowMainLeft_02Height)
      If $bConfigContactHelpdeskEnabled = True Then
        Global $idButtonMainLeftContactHDesk = GUICtrlCreateButton($sContactGeneral_ButtonText, $columnMainLeft_01, $rowMainLeft_04, $columnMainLeft_01Width, $rowMainLeft_04Height, BitOR($BS_MULTILINE, $BS_CENTER, $BS_VCENTER))
      Else
        Global $idButtonMainLeftContactHDesk = GUICtrlCreateButton('Copy Summary', $columnMainLeft_01, $rowMainLeft_04, $columnMainLeft_01Width, $rowMainLeft_04Height)
      EndIf

    ;;MAIN WINDOW ELEMENTS - RIGHT COLUMN
      ;;Contact information
        $idGroupMainRightContact = GUICtrlCreateGroup($sOrgName & ' ' & $sMainHelpdesk_Title, $columnMainRight01, $rowMainRight01, $columnMainRight00Width + 1, ($rowMainRight04 - $rowMainRight01) + 4)
        $idLabelMainRight01 = GUICtrlCreateLabel('Email: ', $columnMainRight02, $rowMainRight02, $columnMainRight02Width, $rowMainRight02Height, $SS_RIGHT)
        $idLabelMainRight02 = GUICtrlCreateLabel('Phone: ', $columnMainRight02, $rowMainRight03, $columnMainRight02Width, $rowMainRight03Height, $SS_RIGHT)
        $idLabelMainRight02b = GUICtrlCreateLabel('Password Reset: ', $columnMainRight02, $rowMainRight03a, $columnMainRight02Width, $rowMainRight03aHeight, $SS_RIGHT)

        Global $idLabelMainRight01a = GUICtrlCreateEdit($sMainHelpdesk_EmailAddress, $columnMainRight03, $rowMainRight02, $columnMainRight03Width - 1, $rowMainRight02Height, $ES_READONLY, 0)
        Global $idLabelMainRight02a = GUICtrlCreateEdit($sMainHelpdesk_PhoneNumber, $columnMainRight03, $rowMainRight03, $columnMainRight03Width - 1, $rowMainRight03Height, $ES_READONLY, 0)
        Global $idLabelMainRight02c = GUICtrlCreateEdit($sMainHelpdesk_AlternateAddress, $columnMainRight03, $rowMainRight03a, $columnMainRight03Width - 1, $rowMainRight03Height, $ES_READONLY, 0)

      ;;Session information
        $idGroupMainRightSession = GUICtrlCreateGroup('Session', $columnMainRight01, $rowMainRight05, $columnMainRight00Width + 1, ($rowMainRight13 - $rowMainRight05) + 4)
        $idLabelMainRight03 = GUICtrlCreateLabel('Current User: ', $columnMainRight02, $rowMainRight06, $columnMainRight02Width, $rowMainRight06Height, $SS_RIGHT)
        $idLabelMainRight04 = GUICtrlCreateLabel('Computer Name: ', $columnMainRight02, $rowMainRight07, $columnMainRight02Width, $rowMainRight07Height, $SS_RIGHT)

        If $bNetAdapter01Exists = True Then
          $idLabelMainRight05 = GUICtrlCreateLabel('IP Address: ', $columnMainRight02, $rowMainRight08, $columnMainRight02Width, $rowMainRight08Height, $SS_RIGHT)
          Global $idLabelMainRight05a = GUICtrlCreateEdit($sNetAdapter01Address, $columnMainRight03-4, $rowMainRight08-2, $columnMainRight03Width - 1, $rowMainRight08Height, $ES_READONLY, 0)

          GUICtrlSetFont($idLabelMainRight05a, 10, $FW_BOLD)
        Else
          Local $idLabelMainRight05
          Global $idLabelMainRight05a
        EndIf
        If $bNetAdapter02Exists = True Then
          $idLabelMainRight06 = GUICtrlCreateLabel('IP Address: ', $columnMainRight02, $rowMainRight09, $columnMainRight02Width, $rowMainRight09Height, $SS_RIGHT)
          Global $idLabelMainRight06a = GUICtrlCreateEdit($sNetAdapter02Address, $columnMainRight03, $rowMainRight09, $columnMainRight03Width - 1, $rowMainRight09Height, $ES_READONLY, 0)
        Else
          Local $idLabelMainRight06
          Global $idLabelMainRight06a
        EndIf
        If $bNetAdapter03Exists = True Then
          $idLabelMainRight07 = GUICtrlCreateLabel('IP Address: ', $columnMainRight02, $rowMainRight10, $columnMainRight02Width, $rowMainRight10Height, $SS_RIGHT)
          Global $idLabelMainRight07a = GUICtrlCreateEdit($sNetAdapter03Address, $columnMainRight03, $rowMainRight10, $columnMainRight03Width - 1, $rowMainRight10Height, $ES_READONLY, 0)
        Else
          Local $idLabelMainRight07
          Global $idLabelMainRight07a
        EndIf
        If $bNetAdapter04Exists = True Then
          $idLabelMainRight08 = GUICtrlCreateLabel('IP Address: ', $columnMainRight02, $rowMainRight11, $columnMainRight02Width, $rowMainRight11Height, $SS_RIGHT)
          Global $idLabelMainRight08a = GUICtrlCreateEdit($sNetAdapter04Address, $columnMainRight03, $rowMainRight11, $columnMainRight03Width - 1, $rowMainRight11Height, $ES_READONLY, 0)
        Else
          Local $idLabelMainRight08
          Global $idLabelMainRight08a
        EndIf
        If $bNetAdapter05Exists = True Then
          $idLabelMainRight09 = GUICtrlCreateLabel('IP Address: ', $columnMainRight02, $rowMainRight12, $columnMainRight02Width, $rowMainRight12Height, $SS_RIGHT)
          Global $idLabelMainRight09a = GUICtrlCreateEdit($sNetAdapter05Address, $columnMainRight03, $rowMainRight12, $columnMainRight03Width - 1, $rowMainRight12Height, $ES_READONLY, 0)
        Else
          Local $idLabelMainRight09
          Global $idLabelMainRight09a
        EndIf

        Global $idLabelMainRight03a = GUICtrlCreateEdit($sWMIUserName, $columnMainRight03, $rowMainRight06, $columnMainRight03Width - 1, $rowMainRight06Height, $ES_READONLY, 0)
        Global $idLabelMainRight04a = GUICtrlCreateEdit($sComputerName, $columnMainRight03, $rowMainRight07, $columnMainRight03Width - 1, $rowMainRight07Height, $ES_READONLY, 0)

      ;;Operating system information
        $idGroupMainRightOS = GUICtrlCreateGroup('Operating System', $columnMainRight01, $rowMainRight14, $columnMainRight00Width + 1, ($rowMainRight20 - $rowMainRight14) + 4)
        $idLabelMainRight10 = GUICtrlCreateLabel('Version: ', $columnMainRight02, $rowMainRight15, $columnMainRight02Width, $rowMainRight15Height, $SS_RIGHT)
        $idLabelMainRight11 = GUICtrlCreateLabel('Architecture: ', $columnMainRight02, $rowMainRight16, $columnMainRight02Width, $rowMainRight16Height, $SS_RIGHT)
        $idLabelMainRight12 = GUICtrlCreateLabel('Uptime: ', $columnMainRight02, $rowMainRight17, $columnMainRight02Width, $rowMainRight17Height, $SS_RIGHT)
        $idLabelMainRight13 = GUICtrlCreateLabel('Install Age: ', $columnMainRight02, $rowMainRight18, $columnMainRight02Width, $rowMainRight18Height, $SS_RIGHT)
        $idLabelMainRight14 = GUICtrlCreateLabel('Domain: ', $columnMainRight02, $rowMainRight19, $columnMainRight02Width, $rowMainRight19Height, $SS_RIGHT)

        Global $idLabelMainRight10a = GUICtrlCreateEdit($sOSVersionName, $columnMainRight03, $rowMainRight15, $columnMainRight03Width - 1, $rowMainRight15Height, $ES_READONLY, 0)
        Global $idLabelMainRight11a = GUICtrlCreateEdit($sOSArchShortname, $columnMainRight03, $rowMainRight16, $columnMainRight03Width - 1, $rowMainRight16Height, $ES_READONLY, 0)
        Global $idLabelMainRight12a = GUICtrlCreateEdit($sOSUptime, $columnMainRight03, $rowMainRight17, $columnMainRight03Width - 1, $rowMainRight17Height, $ES_READONLY, 0)
        Global $idLabelMainRight13a = GUICtrlCreateEdit($sOSAgeAndDate, $columnMainRight03, $rowMainRight18, $columnMainRight03Width - 1, $rowMainRight18Height, $ES_READONLY, 0)
        Global $idLabelMainRight14a = GUICtrlCreateEdit($sWMIDomain, $columnMainRight03, $rowMainRight19, $columnMainRight03Width - 1, $rowMainRight19Height, $ES_READONLY, 0)

      ;;Hardware information
        $idGroupMainRightHardware = GUICtrlCreateGroup('Hardware', $columnMainRight01, $rowMainRight21, $columnMainRight00Width + 1, ($rowMainRight25 - $rowMainRight21) + 4)
        $idLabelMainRight15 = GUICtrlCreateLabel('Model: ', $columnMainRight02, $rowMainRight22, $columnMainRight02Width, $rowMainRight22Height, $SS_RIGHT)
        $idLabelMainRight16 = GUICtrlCreateLabel('Serial: ', $columnMainRight02, $rowMainRight23, $columnMainRight02Width, $rowMainRight23Height, $SS_RIGHT)
        If $bAssetTagExists = True Then
          $idLabelMainRight17 = GUICtrlCreateLabel('Asset Tag: ', $columnMainRight02, $rowMainRight24, $columnMainRight02Width, $rowMainRight24Height, $SS_RIGHT)
          Global $idLabelMainRight17a = GUICtrlCreateEdit($sWMISMBIOSAssetTag, $columnMainRight03, $rowMainRight24, $columnMainRight03Width - 1 - 1, $rowMainRight24Height, $ES_READONLY, 0)
        Else
          Local $idLabelMainRight17
          Global $idLabelMainRight17a
        EndIf
        Global $idLabelMainRight15a = GUICtrlCreateEdit($sWMIManufacturer & ' ' & $sWMIModel, $columnMainRight03, $rowMainRight22, $columnMainRight03Width - 1 - 1, $rowMainRight22Height, $ES_READONLY, 0)
        Global $idLabelMainRight16a = GUICtrlCreateEdit($sWMISerialNumber, $columnMainRight03, $rowMainRight23, $columnMainRight03Width - 1 - 1, $rowMainRight23Height, $ES_READONLY, 0)


      ;;LCM details
        If $bLCMInfoExists = True Then
          $idGroupMainRightLCM = GUICtrlCreateGroup('PSC/IOP Details', $columnMainRight01, $rowMainRight26, $columnMainRight00Width + 1, ($rowMainRight29 - $rowMainRight26) + 4)
          $idLabelMainRight18 = GUICtrlCreateLabel('Site Code: ', $columnMainRight02, $rowMainRight27, $columnMainRight02Width, $rowMainRight27Height, $SS_RIGHT)
          $idLabelMainRight19 = GUICtrlCreateLabel('CRA: ', $columnMainRight02, $rowMainRight28, $columnMainRight02Width, $rowMainRight28Height, $SS_RIGHT)

          Global $idLabelMainRight18a = GUICtrlCreateEdit($sMainLCM_CustomXJCode, $columnMainRight03, $rowMainRight27, $columnMainRight03Width - 1, $rowMainRight27Height, $ES_READONLY, 0)
          Global $idLabelMainRight19a = GUICtrlCreateEdit($sMainLCM_CustomRCRCode, $columnMainRight03, $rowMainRight28, $columnMainRight03Width - 1, $rowMainRight28Height, $ES_READONLY, 0)
        Else
          Local $idGroupMainRightLCM
          Local $idLabelMainRight18
          Local $idLabelMainRight19
          Global $idLabelMainRight18a
          Global $idLabelMainRight19a
        EndIf

      ;;Free-text details
        If $bFreeTextDetailsExists = True Then
          $idGroupMainRightCustom = GUICtrlCreateGroup('More Details', $columnMainRight01, $rowMainRight30, $columnMainRight00Width + 1, ($rowMainRight32 - $rowMainRight30) + 4)

          Global $idLabelMainRight20a = GUICtrlCreateEdit($sFreeTextDetails, $columnMainRight01+8, $rowMainRight31, $columnMainRight00Width-9, $rowMainRight31Height-4, BitOR($ES_AUTOVSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL), 0)
        Else
          Local $idGroupMainRightCustom
          Global $idLabelMainRight20a
        EndIf

    ;;GATHER GUI ELEMENTS INTO ARRAYS
      Global $aMainMenus[4]
        $aMainMenus[00] = $idMenuMainFile
        $aMainMenus[01] = $idMenuMainEdit
        $aMainMenus[02] = $idMenuMainTools
        $aMainMenus[03] = $idMenuMainHelp

      Global $aMainMenuItems[26]
        ;;NOT MAINTAINED
        $aMainMenuItems[00] = $idMenuItemMainFileEmail
        $aMainMenuItems[01] = $idMenuItemMainFileShow
        $aMainMenuItems[02] = $idMenuItemMainFilePrint
        $aMainMenuItems[03] = $idMenuItemMainFileClose
        $aMainMenuItems[04] = $idMenuItemMainEditCut
        $aMainMenuItems[05] = $idMenuItemMainEditCopy
        $aMainMenuItems[06] = $idMenuItemMainEditCopySum
        $aMainMenuItems[07] = $idMenuItemMainEditPaste
        $aMainMenuItems[08] = $idMenuItemMainToolsNetConnect
        $aMainMenuItems[09] = $idMenuItemMainToolsInetCpl
        $aMainMenuItems[10] = $idMenuItemMainToolsAppCatalog
        $aMainMenuItems[11] = $idMenuItemMainToolsAppWiz
        $aMainMenuItems[12] = $idMenuItemMainToolsServices
        $aMainMenuItems[13] = $idMenuItemMainToolsPrintMMC
        $aMainMenuItems[14] = $idMenuItemMainToolsDevNPrint
        $aMainMenuItems[15] = $idMenuItemMainToolsDevMan
        $aMainMenuItems[16] = $idMenuItemMainToolsCredMan
        $aMainMenuItems[17] = $idMenuItemMainToolsMailAcct
        $aMainMenuItems[18] = $idMenuItemMainToolsSearchAD
        $aMainMenuItems[19] = $idMenuItemMainToolsSysProp
        $aMainMenuItems[20] = $idMenuItemMainHelpLaunchLMIr
        $aMainMenuItems[21] = $idMenuItemMainHelpLaunchIntranet
        $aMainMenuItems[22] = $idMenuItemMainHelpLaunchHDesk
        $aMainMenuItems[23] = $idMenuItemMainHelpLaunchPWM
        $aMainMenuItems[24] = $idMenuItemMainHelpDocumentation
        $aMainMenuItems[25] = $idMenuItemMainHelpAbout

      Global $aMainButtons[3]
        $aMainButtons[00] = $idButtonMainLeftClose
        $aMainButtons[01] = $idButtonMainLeftRefresh
        $aMainButtons[02] = $idButtonMainLeftContactHDesk
  EndFunc
#EndRegion

#Region -- OPERATIONS
  Func MainTrayWait()
    ;;WAIT FOR TRAY INPUT
    While 1
      Sleep(10)
      Switch TrayGetMsg()
        Case $idTrayMainNetConnect
          LaunchNetConnect()
        Case $idTrayMainInetCpl
          LaunchInetCpl()
        Case $idTrayMainAppCatalog
          LaunchAppCatalog()
        Case $idTrayMainAppWiz
          LaunchAppWiz()
        Case $idTrayMainServices
          LaunchServices()
        Case $idTrayMainWinUpdate
          LaunchWindowsUpdate()
        Case $idTrayMainPrintMMC
          LaunchPrintMMC()
        Case $idTrayMainDevNPrint
          LaunchDevNPrint()
        Case $idTrayMainDevMan
          LaunchDevMan()
        Case $idTrayMainCredMan
          LaunchCredMan()
        Case $idTrayMainMailAcct
          LaunchMailAcct()
        Case $idTrayMainSearchAD
          LaunchSearchAD()
        Case $idTrayMainSysProp
          LaunchSysProp()

        Case $TRAY_EVENT_PRIMARYUP, $idTrayMainShowInfo ;;left-click on tray icon or "About This Computer" clicked
          TraySetState(2)  ;;hide tray icon
          ReadComputerSchedule(False)
          MainGUIWait()
          ReadComputerSchedule(True)
        Case $idTrayMainExit
          End()
      EndSwitch
    WEnd
  EndFunc

  Func MainGUIWait()
    ;;DISPLAY THE GUI AND WAIT FOR USER INPUT
    GUIMainSetDefaults()
    GUISetState(@SW_SHOWNORMAL, $hGUIMain)  ;;show GUI

    ;;WAIT FOR INPUT
    $sGUIBusyWait = 300

    Local $aMsg
    While 1
      $aMsg = GUIGetMsg(1)  ;;use advanced parameter
      Switch $aMsg[1]  ;;check which GUI sent the message
        Case $hGUIMain
          Switch $aMsg[0]
            ;;MENU - FILE
            Case $idMenuItemMainFileEmail
              GUIMainSetBusyDefaults()
              MailSummary()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainFileShow
              GUIMainSetBusyDefaults()
              LaunchShowSummary()
              GUIMainSetDefaults()
            Case $idMenuItemMainFilePrint
              GUIMainSetBusyDefaults()
              PrintSummary()
              GUIMainSetDefaults()
            Case $idMenuItemMainFileClose
              MainGUIClose()
              ExitLoop

            ;;MENU - EDIT
            Case $idMenuItemMainEditCopy
              Send("^c")  ;;press ctrl + c
            Case $idMenuItemMainEditCopySum
              CopySummaryToClipboard()

            ;;MENU - TOOLS
            Case $idMenuItemMainToolsNetConnect
              GUIMainSetBusyDefaults()
              LaunchNetConnect()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsInetCpl
              GUIMainSetBusyDefaults()
              LaunchInetCpl()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsAppCatalog
              GUIMainSetBusyDefaults()
              LaunchAppCatalog()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsAppWiz
              GUIMainSetBusyDefaults()
              LaunchAppWiz()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsServices
              GUIMainSetBusyDefaults()
              LaunchServices()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsWinUpdate
              GUIMainSetBusyDefaults()
              LaunchWindowsUpdate()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsPrintMMC
              GUIMainSetBusyDefaults()
              LaunchPrintMMC()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsDevNPrint
              GUIMainSetBusyDefaults()
              LaunchDevNPrint()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsDevMan
              GUIMainSetBusyDefaults()
              LaunchDevMan()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsCredMan
              GUIMainSetBusyDefaults()
              LaunchCredMan()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsMailAcct
              GUIMainSetBusyDefaults()
              LaunchMailAcct()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsSearchAD
              GUIMainSetBusyDefaults()
              LaunchSearchAD()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainToolsSysProp
              GUIMainSetBusyDefaults()
              LaunchSysProp()
              MainGUIClose()
              ExitLoop

            ;;MENU - HELP
            Case $idMenuItemMainHelpLaunchLMIr
              GUIMainSetBusyDefaults()
              LaunchRemoteSupportApp()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainHelpLaunchIntranet
              GUIMainSetBusyDefaults()
              LaunchIntranet()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainHelpLaunchHDesk
              GUIMainSetBusyDefaults()
              LaunchITHelpdesk()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainHelpLaunchPWM
              GUIMainSetBusyDefaults()
              LaunchPaswordManagement()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainHelpDocumentation
              GUIMainSetBusyDefaults()
              LaunchDocumentation()
              MainGUIClose()
              ExitLoop
            Case $idMenuItemMainHelpAbout
              GUIMainSetBusyDefaults()
              LaunchAbout()
              GUIMainSetDefaults()

            ;;TEXT

            ;;BUTTONS
            Case $idButtonMainLeftContactHDesk
              GUIMainSetBusyDefaults()
              If $bConfigContactHelpdeskEnabled = True Then
                GUISetState(@SW_MINIMIZE, $hGUIMain)  ;;minimize main GUI
                Sleep(100)
                ContactHelpdesk()
                Sleep(100)
                GUISetState(@SW_RESTORE, $hGUIMain)  ;;restore GUI
              Else
                CopySummaryToClipboard()
                Sleep($sGUIBusyWait)
              EndIf
              GUIMainSetDefaults()
            Case $idButtonMainLeftRefresh
              GUIMainSetBusyDefaults()
              GUISetState(@SW_HIDE, $hGUIMain)
              ReadComputerWait($hGUIMain)
              GUISetState(@SW_SHOWNORMAL, $hGUIMain)
              GUIMainSetDefaults()
            Case $idButtonMainLeftClose
              MainGUIClose()
              ExitLoop

            ;;CLOSE
            Case $GUI_EVENT_CLOSE
              MainGUIClose()
              ExitLoop
          EndSwitch
      EndSwitch
    WEnd
  EndFunc

  Func MainGUIClose()
    ;;CLOSE MAIN GUI AND RETURN TO TRAY
    Switch $sMainAppExeMode
      Case 'Tray'
        GUISetState(@SW_HIDE, $hGUIMain)  ;;hide GUI
        ;GUIDelete($hGUIMain)
        TraySetState(1) ;re-enable tray icon
        MainTrayWait()
      Case 'Window'
        GUISetState(@SW_HIDE, $hGUIMain)  ;;hide GUI
        End()
    EndSwitch
  EndFunc

  Func RefreshTray()
    ;;UPDATE TRAY MENU AND TOOLTIP
    $sTrayToolTip = 'Computer Name: ' & $sComputerName & @CRLF & _
                    'IP Address: ' & $sNetAdapter01Address & @CRLF & _
                    'Uptime: ' & $sOSUptime
    TraySetToolTip($sTrayToolTip)

    Switch $bConfigExitEnabled
      Case True
        TrayItemSetState($idTrayMainExit, $TRAY_ENABLE)
      Case False
        TrayItemSetState($idTrayMainExit, $TRAY_DISABLE)
    EndSwitch
  EndFunc

  Func UpdateMainGUI()
    ;;UPDATE MAIN GUI FIELDS
    GUICtrlSetData($idLabelMainRight01a, $sMainHelpdesk_EmailAddress)
    GUICtrlSetData($idLabelMainRight02a, $sMainHelpdesk_PhoneNumber)
    GUICtrlSetData($idLabelMainRight02c, $sMainHelpdesk_AlternateAddress)
    GUICtrlSetData($idLabelMainRight03a, $sWMIUserName)
    GUICtrlSetData($idLabelMainRight04a, $sComputerName)
    GUICtrlSetData($idLabelMainRight05a, $sNetAdapter01Address)
    GUICtrlSetData($idLabelMainRight06a, $sNetAdapter02Address)
    GUICtrlSetData($idLabelMainRight07a, $sNetAdapter03Address)
    GUICtrlSetData($idLabelMainRight08a, $sNetAdapter04Address)
    GUICtrlSetData($idLabelMainRight09a, $sNetAdapter05Address)
    GUICtrlSetData($idLabelMainRight10a, $sOSVersionName)
    GUICtrlSetData($idLabelMainRight11a, $sOSArchShortname)
    GUICtrlSetData($idLabelMainRight12a, $sOSUptime)
    GUICtrlSetData($idLabelMainRight13a, $sOSAgeAndDate)
    GUICtrlSetData($idLabelMainRight14a, $sWMIDomain)
    GUICtrlSetData($idLabelMainRight15a, $sWMIManufacturer & ' ' & $sWMIModel)
    GUICtrlSetData($idLabelMainRight16a, $sWMISerialNumber)
    GUICtrlSetData($idLabelMainRight17a, $sWMISMBIOSAssetTag)
    GUICtrlSetData($idLabelMainRight18a, $sMainLCM_CustomXJCode)
    GUICtrlSetData($idLabelMainRight19a, $sMainLCM_CustomRCRCode)
    GUICtrlSetData($idLabelMainRight20a, $sFreeTextDetails)
  EndFunc

  Func UpdateSummaryString()
    ;;UPDATE SUMMARY STRING

    Global $sSummaryString

    ;;Build network adapter strings
    Local $sNetAdapter01String
    Local $sNetAdapter02String
    Local $sNetAdapter03String
    Local $sNetAdapter04String
    Local $sNetAdapter05String
    If StringIsSpace($sNetAdapter01Address) = False Then $sNetAdapter01String = ( _
      ' • Network Adapter 1: ' & $sNetAdapter01Name & @CRLF & _
      '    - Address: ' & $sNetAdapter01Address & @CRLF & _
      '    - Subnet Mask: ' & $sNetAdapter01SubnetMask & @CRLF & _
      '    - Gateway: ' & $sNetAdapter01Gateway & @CRLF)
    If StringIsSpace($sNetAdapter02Address) = False Then $sNetAdapter02String = ( _
      ' • Network Adapter 2: ' & $sNetAdapter02Name & @CRLF & _
      '    - Address: ' & $sNetAdapter02Address & @CRLF & _
      '    - Subnet Mask: ' & $sNetAdapter02SubnetMask & @CRLF & _
      '    - Gateway: ' & $sNetAdapter02Gateway & @CRLF)
    If StringIsSpace($sNetAdapter03Address) = False Then $sNetAdapter03String = ( _
      ' • Network Adapter 3: ' & $sNetAdapter03Name & @CRLF & _
      '    - Address: ' & $sNetAdapter03Address & @CRLF & _
      '    - Subnet Mask: ' & $sNetAdapter03SubnetMask & @CRLF & _
      '    - Gateway: ' & $sNetAdapter03Gateway & @CRLF)
    If StringIsSpace($sNetAdapter04Address) = False Then $sNetAdapter04String = ( _
      ' • Network Adapter 4: ' & $sNetAdapter04Name & @CRLF & _
      '    - Address: ' & $sNetAdapter04Address & @CRLF & _
      '    - Subnet Mask: ' & $sNetAdapter04SubnetMask & @CRLF & _
      '    - Gateway: ' & $sNetAdapter04Gateway & @CRLF)
    If StringIsSpace($sNetAdapter05Address) = False Then $sNetAdapter05String = ( _
      ' • Network Adapter 5: ' & $sNetAdapter05Name & @CRLF & _
      '    - Address: ' & $sNetAdapter05Address & @CRLF & _
      '    - Subnet Mask: ' & $sNetAdapter05SubnetMask & @CRLF & _
      '    - Gateway: ' & $sNetAdapter05Gateway & @CRLF)

    ;;Build AD information strings
    If StringIsSpace($sADLoginScript) = 1 Or $sADLoginScript = '0' Then
      ;;No logon script defined for AD user object.
      Local $sUserLoginScript = ''
    Else
      Local $sUserLoginScript = $sToolsLoginScript_Custom & '\' & $sADLoginScript
    EndIf

    If StringIsSpace($sADHomeDirectory) = 1 Or $sADHomeDirectory = '0' Then
      ;;No home folder defined for AD user object.
      Local $sUserHomeDrive = ''
    Else
      If StringIsSpace($sADHomeDrive) = 1 Or $sADHomeDrive = '0' Then
        ;;No home drive defined for AD user object.
        Local $sUserHomeDrive = ''
      Else
        ;;No home drive defined but home folder is defined.
        Local $sUserHomeDrive = '$sADHomeDirectory'
      EndIf
      ;;Home folder and drive defined for AD user object.
      Local $sUserHomeDrive = '(' & $sADHomeDrive & ') ' & $sADHomeDirectory
    EndIf

    ;;Trim strings as needed
    Local $sFreeTextDetails_Trimmed = ''
    If StringIsSpace($sFreeTextDetails) = 0 Then  ;;0 means string is not spaces
      $sFreeTextDetails_Trimmed = $sFreeTextDetails & @CRLF
    EndIf

    ;;Build summary string
    $sSummaryString = _
      'Session:' & @CRLF & _
      ' • Current User: ' & $sWMIUserName & @CRLF & _
      ' • Computer Name: ' & $sComputerName & @CRLF & _
      ' • Network Adapter 1: ' & $sNetAdapter01Name & @CRLF & _
      '    - Address: ' & $sNetAdapter01Address & @CRLF & _
      '    - Subnet Mask: ' & $sNetAdapter01SubnetMask & @CRLF & _
      '    - Gateway: ' & $sNetAdapter01Gateway & @CRLF & _
      $sNetAdapter02String & _
      $sNetAdapter03String & _
      $sNetAdapter04String & _
      $sNetAdapter05String & _
      @CRLF & _
      'Operating System:' & @CRLF & _
      ' • Version: ' & $sOSVersionName & @CRLF & _
      ' • Edition: ' & $sOSEdition & @CRLF & _
      ' • Architecture: ' & $sOSArchShortname & @CRLF & _
      ' • Uptime: ' & $sOSUptime & @CRLF & _
      ' • Install Age: ' & $sOSAgeAndDate & @CRLF & _
      ' • Domain: ' & $sWMIDomain & @CRLF & _
      ' • Local Description: ' & $sPCDescription & @CRLF & _
      @CRLF & _
      'Active Directory:' & @CRLF & _
      ' • Computer Description: ' & $sADDescription & @CRLF & _
      ' • Computer OU: ' & $sADOUPath & @CRLF & _
      ' • User Login Script: ' & $sUserLoginScript & @CRLF & _
      ' • User ' & $sToolsHomeDrive_Title & ': ' & $sUserHomeDrive & @CRLF & _
      @CRLF & _
      'Services:' & @CRLF & _
      ' • Windows Update: ' & $sServWindowsUpdateStatus & @CRLF & _
      ' • SCCM Client (SMS Agent Host): ' & $sServSMSAgentStatus & @CRLF & _
      ' • CrowdStrike Windows Sensor: ' & $sServCrowdStrikeStatus & @CRLF & _
      ' • Splunk Universal Forwarder: ' & $sServSplunkForwarderStatus & @CRLF & _
      ' • BeyondTrust PowerBroker: ' & $sServBeyondTrustStatus & @CRLF & _
      ' • BeyondTrust Monitor: ' & $sServBeyondTrustMonitorStatus & @CRLF & _
      @CRLF & _
      'Hardware:' & @CRLF & _
      ' • Manufacturer: ' & $sWMIManufacturer & @CRLF & _
      ' • Model: ' & $sWMIModel & @CRLF & _
      ' • Serial: ' & $sWMISerialNumber & @CRLF & _
      ' • Asset Tag: ' & $sWMISMBIOSAssetTag & @CRLF & _
      @CRLF & _
      'LCM:' & @CRLF & _
      ' • Site Code: ' & $sMainLCM_CustomXJCode & @CRLF & _
      ' • CRA: ' & $sMainLCM_CustomRCRCode & @CRLF & _
      @CRLF & _
      'Drives:' & @CRLF & _
      $sDiskDetails & @CRLF & _
      @CRLF & _
      'Printers:' & @CRLF & _
      $sPrinterDetails & @CRLF & _
      @CRLF & _
      'Custom:' & @CRLF & _
      $sFreeTextDetails_Trimmed & _
      @CRLF & _
      'Helpdesk:' & @CRLF & _
      ' • Email: ' & $sMainHelpdesk_EmailAddress & @CRLF & _
      ' • Phone: ' & $sMainHelpdesk_PhoneNumber & @CRLF & _
      ' • Password Reset: ' & $sMainHelpdesk_AlternateAddress & @CRLF & _
      ' • Website: ' & $sMainHelpdesk_WebsiteAddress & @CRLF & _
      ' • LMIr URL: ' & $sHelpLink1_Command & @CRLF & _
      @CRLF & _
      'About This Computer  •  ' & $sAppVersion & '  •  ' & @YEAR & '-' & @MON & '-' & @MDAY & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & '  •  [mB7a78-' & $sAppBuild & ']'
  EndFunc

  Func UpdateSummaryFile()
    ;;UPDATE SUMMARY FILE
    Global $sSummaryFilePath = $sAppTempPath & '\AboutThisComputerSummary.txt'
    If FileExists($sSummaryFilePath) Then FileDelete($sSummaryFilePath)
    FileWrite($sSummaryFilePath, $sSummaryString)
  EndFunc

  Func CopySummaryToClipboard()
    ;;COPY SUMMARY STRING TO CLIPBOARD
    ClipPut($sSummaryString)
  EndFunc

  Func MailSummary()
    ;;PLACE SUMMARY STRING IN EMAIL BODY
    $sEmailTo = $sMainHelpdesk_EmailAddress
    $sEmailSubject = 'Details about ' & $sComputerName & ' from ' & $sCurrentUsername
    $sEmailBody = StringReplace($sSummaryString, @CRLF, '%0D%0A')
    $sMailTo = 'mailto:' & $sEmailTo & '?subject=' & $sEmailSubject & '&body=%0D%0A%0D%0A' & $sEmailBody
    ShellExecute($sMailTo)
  EndFunc

  Func PrintSummary()
    ;;SEND SUMMARY STRING TO PRINTER
    UpdateSummaryFile()

    $iButtonPressed = MsgBox(BitOR($MB_ICONQUESTION, $MB_TOPMOST, $MB_SETFOREGROUND, $MB_YESNO, $MB_DEFBUTTON2), 'Print Summary', 'Print summary to default printer?', 0, $hGUIMain)
    If $iButtonPressed = $IDYES Then
      $iPrintSuccess = _FilePrint($sSummaryFilePath)
      If $iPrintSuccess Then
        ;MsgBox(BitOR($MB_OK, $MB_ICONINFORMATION, $MB_TOPMOST, $MB_SETFOREGROUND), 'Print Summary', 'Sent to printer.')
      Else
        MsgBox(BitOR($MB_OK, $MB_ICONERROR, $MB_TOPMOST, $MB_SETFOREGROUND), 'Print Summary', 'Unable to send to printer.')
      EndIf
    EndIf
  EndFunc
#EndRegion

#Region -- GUI STATES
  Func GUIMainSetDefaults()
    ;;SET GUI DEFAULTS
    GUIMainSetMenuDefaults()
    GUIMainSetMenuItemDefaults()
    GUIMainSetButtonDefaults()
  EndFunc

  Func GUIMainSetBusyDefaults()
    ;;SET GUI BUSY DEFAULTS
    GUIMainSetMenus($GUI_DISABLE)
    GUIMainSetMenuItems($GUI_DISABLE)
    GUIMainSetButtons($GUI_DISABLE)
  EndFunc

  Func GUIMainSetMenuDefaults()
    ;;SET MENU DEFAULTS
    GUIMainSetMenus($GUI_ENABLE)
  EndFunc

  Func GUIMainSetMenuItemDefaults()
    ;;SET MENU ITEM DEFAULTS
    GUIMainSetMenuItems($GUI_ENABLE)
    ToggleGUIControl($idMenuItemMainEditCut, $GUI_DISABLE)
    ToggleGUIControl($idMenuItemMainEditPaste, $GUI_DISABLE)
  EndFunc

  Func GUIMainSetButtonDefaults()
    ;;SET BUTTON DEFAULTS
    GUIMainSetButtons($GUI_ENABLE)
  EndFunc

  Func GUIMainSetMenus($Option)
    ;;SET ALL MENUS WITH OPTION
    ;; $GUI_ENABLE
    ;; $GUI_DISABLE

    For $i = 0 To UBound($aMainMenus) - 1
      ToggleGUIControl($aMainMenus[$i], $Option)
    Next
  EndFunc

  Func GUIMainSetMenuItems($Option)
    ;;SET ALL MENU ITEMS WITH OPTION
    ;; $GUI_ENABLE
    ;; $GUI_DISABLE

    For $i = 0 To UBound($aMainMenuItems) - 1
      ToggleGUIControl($aMainMenuItems[$i], $Option)
    Next
  EndFunc

  Func GUIMainSetButtons($Option)
    ;;SET ALL BUTTONS WITH OPTION
    ;; $GUI_ENABLE
    ;; $GUI_DISABLE

    For $i = 0 To UBound($aMainButtons) - 1
      ToggleGUIControl($aMainButtons[$i], $Option)
    Next
  EndFunc
#EndRegion

#Region -- LAUNCH EXTERNAL APPS
  Func LaunchShowSummary()
    ;;SHOW SUMMARY STRING WINDOW
    Local $iWidth  = 600
    Local $iHeight = 500
    $idGUISummary = GUICreate('Summary', $iWidth, $iHeight, -1, -1, BitOR($WS_SIZEBOX, $WS_EX_TOPMOST), '', $hGUIMain)

    GUISetState(@SW_DISABLE, $hGUIMain)
    GUISetState(@SW_SHOWNORMAL, $idGUISummary)

    ;GUICtrlCreateGroup('', 10, 10, 380, 480)
    GUICtrlCreateEdit($sSummaryString, 15, 15, $iWidth - 32, $iHeight - 55, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY), -1)
    GUICtrlSetResizing(-1, $GUI_DOCKBORDERS)

    While 1
      Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
          GUISetState(@SW_ENABLE, $hGUIMain)
          GUIDelete($idGUISummary)
          ExitLoop
      EndSwitch
    WEnd
  EndFunc

  Func LaunchNetConnect()
    ;;LAUNCH NETWORK CONNECTIONS
    StandardRunCmd('ncpa.cpl')
  EndFunc

  Func LaunchInetCpl()
    ;;LAUNCH INTERNET OPTIONS
    StandardRunCmd('inetcpl.cpl')
  EndFunc

  Func LaunchAppCatalog()
    ;;LAUNCH APPLICATION CATALOG
    ShellExecute($sCustomToolsCommand1_Command)
  EndFunc

  Func LaunchAppWiz()
    ;;LAUNCH PROGRAMS AND FEATURES
    StandardRunCmd('appwiz.cpl')
  EndFunc

  Func LaunchServices()
    ;;LAUNCH SERVICES
    StandardRunCmd('services.msc')
  EndFunc

  Func LaunchWindowsUpdate()
    ;;LAUNCH WINDOWS UPDATE
    Switch $iOSVersionValue
      Case $iOSVersionValue < '14' ;OS is older than Windows 10
        StandardRunCmd('wuapp.exe')
      Case $iOSVersionValue >= '14'  ;OS is Windows 10 or newer
        StandardRunCmd('explorer ms-settings:windowsupdate')
    EndSwitch
  EndFunc

  Func LaunchPrintMMC()
    ;;LAUNCH PRINT MANAGEMENT
    ;StandardRunCmd('printmanagement.msc')
    ShellExecute('printmanagement.msc', '', @SystemDir, 'runas')
  EndFunc

  Func LaunchDevNPrint()
    ;;LAUNCH DEVICES AND PRINTERS
    StandardRunCmd('explorer shell:::{A8A91A66-3A7D-4424-8D24-04E180695C7A}')
  EndFunc

  Func LaunchDevMan()
    ;;LAUNCH DEVICE MANAGER
    ;StandardRunCmd('devmgmt.msc')    ;needs to be ran elevated?
    ShellExecute('devmgmt.msc', '', @SystemDir, 'runas')
  EndFunc

  Func LaunchCredMan()
    ;;LAUNCH CREDENTIAL MANAGER
    StandardRunCmd('control /name Microsoft.CredentialManager')
  EndFunc

  Func LaunchMailAcct()
    ;;LAUNCH MAIL ACCOUNTS
    StandardRunCmd('control mlcfg32.cpl')
    ;StandardRunCmd(@WindowsDir & '\SYSTEM32\rundll32.exe shell32.dll,Control_RunDLL mlcfg32.cpl')
    ;ShellExecute(@WindowsDir & '\SysNative\rundll32.exe shell32.dll,Control_RunDLL mlcfg32.cpl')
    ;ShellExecute('rundll32.exe shell32.dll,Control_RunDLL mlcfg32.cpl', '', @WindowsDir & '\SysNative\', 'runas')
    ;DllCall('kernel32.dll', 'int', 'Wow64EnableWow64FsRedirection', 'int', 0)
    ;ShellExecute('control mlcfg32.cpl', '', @SystemDir, 'runas')
    ;DllCall('kernel32.dll', 'int', 'Wow64EnableWow64FsRedirection', 'int', 1)
  EndFunc

  Func LaunchSearchAD()
    ;;LAUNCH SEARCH ACTIVE DIRECTORY
    StandardRunCmd(@WindowsDir & '\SYSTEM32\rundll32.exe dsquery,OpenQueryWindow')
  EndFunc

  Func LaunchSysProp()
    ;;LAUNCH SYSTEM PROPERTIES
    StandardRunCmd('Sysdm.cpl')
  EndFunc

  Func LaunchSysInfo()
    ;;LAUNCH SYSTEM INFORMATION
    StandardRunCmd('msinfo32.exe')
  EndFunc

  Func LaunchRemoteSupportApp()
    ;;LAUNCH REMOTE SUPPORT APPLICATION
    ShellExecute($sHelpLink1_Command)
  EndFunc

  Func LaunchIntranet()
    ;;LAUNCH INTRANET
    ShellExecute($sHelpLink2_Command)
  EndFunc

  Func LaunchITHelpdesk()
    ;;LAUNCH IT HELPDESK
    ShellExecute('iexplore.exe', $sMainHelpdesk_WebsiteAddress, 'C:\Windows\System32')
  EndFunc

  Func LaunchPaswordManagement()
    ;;LAUNCH PASSWORD MANAGEMENT SELF-SERVICE
    ShellExecute('iexplore.exe', 'http://pwm.' & $sOrgDomain, 'C:\Windows\System32')
  EndFunc

  Func LaunchDocumentation()
    ;;LAUNCH DOCUMENTATION
    ;;TODO
  EndFunc

  Func LaunchAbout()
    ;;LAUNCH ABOUT WINDOW

    ;;Variables
    $sWindowTitle = 'About'
    $idParentGUI = $hGUIMain
    $sGraphic = $sAppLogo
    $sTitle = 'About This Computer'
    $sSubtitle = 'A workstation information utility.'
    $sVersion = 'Version ' & $sAppVersion
    $sCredits = 'Created by Brian Kyncl (brian@briankyncl.com)' & @CRLF & 'BeOS icons by StudioTwentyEight' & @CRLF & '(http://www.studiotwentyeight.net)'

    ;;GUI SIZING
    $iGUIAboutWidthDefault = 256

    ;;HEADER
    $iColumnAboutHeader00 = 00
    $iColumnAboutHeader01 = ($iGUIAboutWidthDefault - 128) / 2  ;column for main image

    $iColumnAboutHeader00Width = $iGUIAboutWidthDefault
    $iColumnAboutHeader01Width = 128 ;width of main image

    $iRowAboutHeader00  = 00
    $iRowAboutHeader01  = 20

    $iRowAboutHeader00Height  = 168 ;height of image row
    $iRowAboutHeader01Height  = 128 ;height of main image

    ;;TITLE
    $iColumnAboutTitle00  = 00
    $iColumnAboutTitle01  = 10

    $iColumnAboutTitle00Wdith = $iGUIAboutWidthDefault
    $iColumnAboutTitle01Width = $iColumnAboutTitle00Wdith - 20

    $iRowAboutTitle00 = $iColumnAboutHeader00 + $iRowAboutHeader00Height
    $iRowAboutTitle01 = $iRowAboutTitle00

    $iRowAboutTitle00Height = 22
    $iRowAboutTitle01Height = 22

    ;;SUBTITLE
    $iColumnAboutSubtitle00  = 00
    $iColumnAboutSubtitle01  = 10

    $iColumnAboutSubtitle00Wdith = $iGUIAboutWidthDefault
    $iColumnAboutSubtitle01Width = $iColumnAboutSubtitle00Wdith - 20

    $iRowAboutSubtitle00 = $iRowAboutTitle00 + $iRowAboutTitle00Height
    $iRowAboutSubtitle01 = $iRowAboutSubtitle00

    $iRowAboutSubtitle00Height = 15
    $iRowAboutSubtitle01Height = 15

    ;;VERSION
    $iColumnAboutVersion00  = 00
    $iColumnAboutVersion01  = 10

    $iColumnAboutVersion00Wdith = $iGUIAboutWidthDefault
    $iColumnAboutVersion01Width = $iColumnAboutSubtitle00Wdith - 20

    $iRowAboutVersion00 = $iRowAboutSubtitle00 + $iRowAboutSubtitle00Height
    $iRowAboutVersion01 = $iRowAboutVersion00 + 25

    $iRowAboutVersion00Height = 30
    $iRowAboutVersion01Height = 25

    ;;CREDITS
    $iColumnAboutCredits00  = 00
    $iColumnAboutCredits01  = 10

    $iColumnAboutCredits00Wdith = $iGUIAboutWidthDefault
    $iColumnAboutCredits01Width = $iColumnAboutSubtitle00Wdith - 20

    $iRowAboutCredits00 = $iRowAboutVersion00 + $iRowAboutVersion00Height
    $iRowAboutCredits01 = $iRowAboutCredits00 + 25

    $iRowAboutCredits00Height = 70
    $iRowAboutCredits01Height = 45

    $iGUIAboutHeightDefault = $iRowAboutCredits00 + $iRowAboutCredits00Height + 10

    ;;DECLARE GUI
      ;GUICreate('Summary', 400, 500, -1, -1, BitOR($WS_SIZEBOX, $WS_EX_TOPMOST), '', $hGUIMain)
      ;Global $idGUIAbout = GUICreate($sWindowTitle, $iGUIAboutWidthDefault, $iGUIAboutHeightDefault, -1, -1, -1, $WS_EX_TOPMOST, $idParentGUI)
      Global $idGUIAbout = GUICreate($sWindowTitle, $iGUIAboutWidthDefault, $iGUIAboutHeightDefault, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), '', $idParentGUI)

      ;;GRAPHIC
      GUICtrlCreateIcon($sGraphic, -1, $iColumnAboutHeader01 + 12, $iRowAboutHeader01, $iColumnAboutHeader01Width, $iRowAboutHeader01Height, -1)

      ;;TITLE
      GUICtrlCreateLabel($sTitle, $iColumnAboutTitle01, $iRowAboutTitle01, $iColumnAboutTitle01Width, $iRowAboutTitle01Height, $SS_CENTER)
      GUICtrlSetFont(-1, 14, $FW_BOLD)

      ;;SUBTITLE
      GUICtrlCreateLabel($sSubtitle, $iColumnAboutSubtitle01, $iRowAboutSubtitle01, $iColumnAboutSubtitle01Width, $iRowAboutSubtitle01Height, $SS_CENTER)
      GUICtrlSetFont(-1, 10)

      ;;VERSION
      GUICtrlCreateLabel($sVersion, $iColumnAboutVersion01, $iRowAboutVersion01, $iColumnAboutVersion01Width, $iRowAboutVersion01Height, $SS_CENTER)

      ;;CREDITS
      GUICtrlCreateLabel($sCredits, $iColumnAboutCredits01, $iRowAboutCredits01, $iColumnAboutCredits01Width, $iRowAboutCredits01Height, $SS_CENTER)
      GUICtrlSetState(-1, $GUI_DISABLE)

    GUISetState(@SW_DISABLE, $idParentGUI)
    GUISetState(@SW_SHOWNORMAL, $idGUIAbout)

    While 1
      Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
          GUISetState(@SW_ENABLE, $idParentGUI)
          GUIDelete($idGUIAbout)
          ExitLoop
      EndSwitch
    WEnd
  EndFunc
#EndRegion














;;=====================================================================================================================================================================
;;================================================================== LINE OF CODE REWRITE SEPARATION ==================================================================
;;=====================================================================================================================================================================



#Region - HELPDESK CONTACT FORM
  Func ContactHelpdesk()
    GUIContactReadTemplates()
    ContactHelpdeskMain()
    Return
  EndFunc

  Func ContactHelpdeskMain()
    ;; DEFINE MAIN WINDOW
    ;   - needs tab mappings (assign where pressing tab moves the cursor to)
    ;   - needs to handle email send errors
    ;   - needs to validate email format
    ;   - link to Snipping Tool somewhere?
    ;   - BeOS email icon somewhere?
    ;   - needs GUI busy state
    ;
    ;    _____________________________________________________________
    ;   |                                           [ - ] [ = ] [ X ] |
    ;   |_____________________________________________________________|
    ;   |  _________                                                  |
    ;   | |         |           To: _helpdesk@domain.com_____________ | < use helpdesk email from GUI, not editable or maybe dropdown of possible helpdesk email address?
    ;   | |         |         From: _Your email address______________ | < use logged-in username + @domain.com, not editable
    ;   | |         |                                                 |
    ;   | |  Send   |         Name: _Your first and last name________ | < require, default text is grayed-out "Enter your first and last name."
    ;   | |         |  Employee ID: _Your employee number____________ | < require, default text is grayed-out "Enter your employee ID number."
    ;   | |         |                                                 |
    ;   | |_________|      Subject: _________________________________ | < generate generic if none is provided
    ;   |                                                             |
    ;   |              Enter a detailed description of your request:  |
    ;   |              _____________________________________________  |
    ;   |             |                                             | | < require, scrollable, default text is grayed-out and offers suggestions. what suggestions?
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |                                             | |
    ;   |             |_____________________________________________| |
    ;   |                                                             |
    ;   |              Attachment: ____________________________ [...] | < capable of receiving drag-and-drop, button to open "Select File" dialog
    ;   |                                                             |
    ;   |              The following details will automatically be    |
    ;   |              included in your request:                      |
    ;   |              _____________________________________________  |
    ;   |             |                                             | | < scrollable, disabled, output of summary string
    ;   |             |                                             | |
    ;   |  _________  |                                             | |
    ;   | |         | |                                             | |
    ;   | | Cancel  | |                                             | |
    ;   | |_________| |_____________________________________________| |
    ;   |_____________________________________________________________|

    Global $lTemplates

    ;; COLUMNS
    ;columns, left
    $columnContactLeft00 = 0
    $columnContactLeft01 = 10

    ;columns, left, widths
    $columnContactLeft00Width = 100
    $columnContactLeft01Width = $columnContactLeft00Width - 20  ;total width of column minus spacing left and right

    ;columns, right
    $columnContactRight00 = $columnContactLeft00Width
    $columnContactRight01 = $columnContactRight00   ;label
    $columnContactRight02 = $columnContactRight01 + 72  ;values

    ;columns, right, widths
    $columnContactRight00Width = 300    ;total of the following two
    $columnContactRight01Width = 72     ;duplicate in $columnContactRight02
    $columnContactRight02Width = 228
    $columnContactRight03Width = $columnContactRight00Width     ;items spanning whole column

    ;window boundary
    $columnContactBounds = $columnContactLeft00Width + $columnContactRight00Width + 10   ;right edge of window

    ;; ROWS
    ;rows, left
    $rowContactLeft00 = 0
    $rowContactLeft01 = 10
    $rowContactLeft02 = 92

    ;rows, left, heights
    $rowContactLeft00Height = 0
    $rowContactLeft01Height = 72
    $rowContactLeft02Height = 80

    ;rows, right
    $rowContactRightSpacing = 30   ;height of columns of text
    $rowContactRightSpacer = 22
    $rowContactRight00 = 0
    $rowContactRight01 = $rowContactRight00 + 10
    $rowContactRight02 = $rowContactRight01 + $rowContactRightSpacing + 10  ;additional offset to create space after Template
    $rowContactRight03 = $rowContactRight02 + $rowContactRightSpacing
    $rowContactRight04 = $rowContactRight03 + $rowContactRightSpacing
    $rowContactRight05 = $rowContactRight04 + $rowContactRightSpacing
    $rowContactRight06 = $rowContactRight05 + $rowContactRightSpacing
    $rowContactRight07 = $rowContactRight06 + $rowContactRightSpacing
    $rowContactRight08 = $rowContactRight07 + $rowContactRightSpacing
    $rowContactRight09 = $rowContactRight08 + $rowContactRightSpacing + 92  ;after input box, adjustment from previous row
    $rowContactRight10 = $rowContactRight09 + $rowContactRightSpacing
    $rowContactRight11 = $rowContactRight10 + $rowContactRightSpacing
    $rowContactRight12 = $rowContactRight11 + $rowContactRightSpacing
    $rowContactRight13 = $rowContactRight12 + $rowContactRightSpacing
    $rowContactRight14 = $rowContactRight13 + $rowContactRightSpacing
    $rowContactRight15 = $rowContactRight14 + $rowContactRightSpacing
    $rowContactRight16 = $rowContactRight15 + $rowContactRightSpacing
    $rowContactRight17 = $rowContactRight16 + $rowContactRightSpacing
    $rowContactRight18 = $rowContactRight17 + $rowContactRightSpacing
    $rowContactRight19 = $rowContactRight18 + $rowContactRightSpacing
    $rowContactRight20 = $rowContactRight19 + $rowContactRightSpacing
    $rowContactRight21 = $rowContactRight20 + $rowContactRightSpacing
    $rowContactRight22 = $rowContactRight21 + $rowContactRightSpacing
    $rowContactRight23 = $rowContactRight22 + $rowContactRightSpacing
    $rowContactRight24 = $rowContactRight23 + $rowContactRightSpacing
    $rowContactRight25 = $rowContactRight24 + $rowContactRightSpacing

    ;rows, right, heights
    $rowContactRightHeights  = $rowContactRightSpacing - 9  ;input fields should come to 21 tall
    $rowContactRight00Height = $rowContactRightHeights
    $rowContactRight01Height = $rowContactRightHeights
    $rowContactRight02Height = $rowContactRightHeights
    $rowContactRight03Height = $rowContactRightHeights
    $rowContactRight04Height = $rowContactRightHeights
    $rowContactRight05Height = $rowContactRightHeights
    $rowContactRight06Height = $rowContactRightHeights
    $rowContactRight07Height = $rowContactRightHeights
    $rowContactRight08Height = $rowContactRightHeights + 92 ;input box, duplicate in section above
    $rowContactRight09Height = $rowContactRightHeights
    $rowContactRight10Height = $rowContactRightHeights
    $rowContactRight11Height = $rowContactRightHeights
    $rowContactRight12Height = $rowContactRightHeights
    $rowContactRight13Height = $rowContactRightHeights
    $rowContactRight14Height = $rowContactRightHeights
    $rowContactRight15Height = $rowContactRightHeights
    $rowContactRight16Height = $rowContactRightHeights
    $rowContactRight17Height = $rowContactRightHeights
    $rowContactRight18Height = $rowContactRightHeights
    $rowContactRight19Height = $rowContactRightHeights
    $rowContactRight20Height = $rowContactRightHeights
    $rowContactRight21Height = $rowContactRightHeights
    $rowContactRight22Height = $rowContactRightHeights
    $rowContactRight23Height = $rowContactRightHeights
    $rowContactRight24Height = $rowContactRightHeights
    $rowContactRight25Height = $rowContactRightHeights

    ;window boundary
    $rowContactBounds = $rowContactRight12 + 10    ;bottom edge of window, last used row in right column plus adjustment.

    ;columns, left, from bottom
    $columnContactLeft_00 = 0
    $columnContactLeft_01 = 10

    ;columns, left, widths
    $columnContactLeft_00Width = $columnContactLeft00Width
    $columnContactLeft_01Width = $columnContactLeft_00Width - 20

    ;rows, left, from bottom
    $rowContactLeftSpacing = 80
    $rowContactLeftSpacer = 75 ;high number means less space between, up to $rowMainLeftSpacing
    $rowContactLeft_00 = $rowContactBounds - 5
    $rowContactLeft_01 = $rowContactLeft_00 - $rowContactLeftSpacing
    $rowContactLeft_02 = $rowContactLeft_01 - $rowContactLeftSpacing
    $rowContactLeft_03 = $rowContactLeft_02 - $rowContactLeftSpacing
    $rowContactLeft_04 = $rowContactLeft_03 - $rowContactLeftSpacing
    $rowContactLeft_05 = $rowContactLeft_04 - $rowContactLeftSpacing
    $rowContactLeft_06 = $rowContactLeft_05 - $rowContactLeftSpacing
    $rowContactLeft_07 = $rowContactLeft_06 - $rowContactLeftSpacing
    $rowContactLeft_08 = $rowContactLeft_07 - $rowContactLeftSpacing
    $rowContactLeft_09 = $rowContactLeft_08 - $rowContactLeftSpacing
    $rowContactLeft_10 = $rowContactLeft_09 - $rowContactLeftSpacing

    ;rows, left, from bottom heights
    $rowContactLeftHeights = $rowContactLeftSpacing - 5
    $rowContactLeft_00Height = 0
    $rowContactLeft_01Height = $rowContactLeftHeights
    $rowContactLeft_02Height = $rowContactLeftHeights
    $rowContactLeft_03Height = $rowContactLeftHeights
    $rowContactLeft_04Height = $rowContactLeftHeights
    $rowContactLeft_05Height = $rowContactLeftHeights
    $rowContactLeft_06Height = $rowContactLeftHeights
    $rowContactLeft_07Height = $rowContactLeftHeights
    $rowContactLeft_08Height = $rowContactLeftHeights
    $rowContactLeft_09Height = $rowContactLeftHeights
    $rowContactLeft_10Height = $rowContactLeftHeights

    ;;CLEAR VARIABLES
    Global $sContactFormFrom = ''
    Global $sContactFormTo = ''
    Global $sContactFormCC = ''
    Global $sContactFormBCC = ''
    Global $sContactFormSubject = ''
    Global $sContactFormName = ''
    Global $sContactFormEmployeeID = ''
    Global $sContactFormPhone = ''
    Global $sContactFormLocation = ''
    Global $sContactFormBody = ''
    Global $sContactFormAttachmentPath = ''
    Global $sContactFormAttachmentName = ''
    Global $sContactFormScreenshotPath = ''
    Global $sContactFormScreenshotName = ''
    Global $sContactFormAttachments = ''
    Global $bContactFormSubmitSuccess = False

    ;;BUILD CONTACT HELPDESK WINDOW
    Global $idGUIContact = GUICreate('Create an ' & $sMainHelpdesk_Title & ' Request', $columnContactBounds, $rowContactBounds, -1, -1, -1, $WS_EX_TOPMOST)   ;$hGUIMain

    ;;LEFT COLUMN, TOP
    $idGraphicContact = GUICtrlCreateIcon($sAppInstallPath & '\Support\BeOS_Customize_wrench.ico', -1, $columnContactLeft01, $rowContactLeft01, 96, 96, -1, $GUI_WS_EX_PARENTDRAG)

    ;;LEFT COLUMN, BOTTOM
    Global $idButtonContactLeftSend = GUICtrlCreateButton('Submit Request', $columnContactLeft_01, $rowContactLeft_01, $columnContactLeft_01Width, $rowContactLeft_01Height, BitOR($BS_MULTILINE, $BS_CENTER, $BS_VCENTER))

    ;;RIGHT COLUMN, TOP, LABELS
    $sLabelTemplate   = 'Template:  '
    $sLabelTo         = 'To:  '
    $sLabelFrom       = 'From:  '
    $sLabelSubject    = 'Subject:  '
    $sLabelName       = 'Your Name:  '
    $sLabelEmployeeID = 'Employee ID:  '
    $sLabelPhone      = 'Phone:  '
    $sLabelLocation   = 'Location:  '
    $sLabelBody       = 'Enter a detailed description of your ' & $sMainHelpdesk_Title & ' request:'
    $sLabelAttachment = 'Attachment'
    $sLabelScreenshot = 'Screenshot'
    $sLabelIncluded   = 'All fields are required. Details from About This Computer are automatically included with this request.'

    $rowLabelOffset = 4

    $idLabelContactRightTemplate          = GUICtrlCreateLabel($sLabelTemplate,     $columnContactRight01, $rowContactRight01 + $rowLabelOffset, $columnContactRight01Width, $rowContactRight01Height - $rowLabelOffset, $SS_RIGHT)
    $idLabelContactRightSubject           = GUICtrlCreateLabel($sLabelSubject,      $columnContactRight01, $rowContactRight02 + $rowLabelOffset, $columnContactRight01Width, $rowContactRight02Height - $rowLabelOffset, $SS_RIGHT)
    $idLabelContactRightName              = GUICtrlCreateLabel($sLabelName,         $columnContactRight01, $rowContactRight03 + $rowLabelOffset, $columnContactRight01Width, $rowContactRight03Height - $rowLabelOffset, $SS_RIGHT)
    $idLabelContactRightEmployeeID        = GUICtrlCreateLabel($sLabelEmployeeID,   $columnContactRight01, $rowContactRight04 + $rowLabelOffset, $columnContactRight01Width, $rowContactRight04Height - $rowLabelOffset, $SS_RIGHT)
    $idLabelContactRightPhone             = GUICtrlCreateLabel($sLabelPhone,        $columnContactRight01, $rowContactRight05 + $rowLabelOffset, $columnContactRight01Width, $rowContactRight05Height - $rowLabelOffset, $SS_RIGHT)
    $idLabelContactRightLocation          = GUICtrlCreateLabel($sLabelLocation,     $columnContactRight01, $rowContactRight06 + $rowLabelOffset, $columnContactRight01Width, $rowContactRight06Height - $rowLabelOffset, $SS_RIGHT)
    $idLabelContactRightBody              = GUICtrlCreateLabel($sLabelBody,         $columnContactRight01, $rowContactRight07, $columnContactRight03Width,                   $rowContactRight07Height - 4)
    $idButtonContactRightPickAttachment   = GUICtrlCreateButton($sLabelAttachment,  $columnContactRight01, $rowContactRight09 - 1, $columnContactRight01Width,               $rowContactRight09Height + 2, $BS_CENTER)
    $idButtonContactRightTakeScreenshot   = GUICtrlCreateButton($sLabelScreenshot,  $columnContactRight01, $rowContactRight10 - 1, $columnContactRight01Width,               $rowContactRight10Height + 2, $BS_CENTER)
    $idLabelContactRightIncluded          = GUICtrlCreateLabel($sLabelIncluded,     $columnContactRight01, $rowContactRight11, $columnContactRight03Width,                   $rowContactRight11Height+10)
      GUICtrlSetState($idLabelContactRightIncluded, $GUI_DISABLE)

    ;; RIGHT COLUMN, TOP, VALUES
    $sDefaultInputSubject    = 'Summarize your ' & $sMainHelpdesk_Title & ' request'
    $sDefaultInputName       = 'Enter your first and last name'
    $sDefaultInputEmployeeID = 'Enter your employee ID number'
    $sDefaultInputPhone      = 'Enter your phone number'
    $sDefaultInputLocation   = 'Enter the department, site, aisle, address, etc.'
    $sDefaultInputBody       = @CRLF & @CRLF & $sSummaryString

    $rowInputBoxOffset = 13

    Global $idInputContactRightTemplate           = GUICtrlCreateCombo ('', $columnContactRight02,                     $rowContactRight01, $columnContactRight02Width,                        $rowContactRight01Height, $CBS_DROPDOWNLIST)
      GUICtrlSetData($idInputContactRightTemplate, $lTemplates)
    Global $idInputContactRightSubject            = GUICtrlCreateInput('', $columnContactRight02,                      $rowContactRight02, $columnContactRight02Width,                        $rowContactRight02Height)
      _GUICtrlEdit_SetCueBanner($idInputContactRightSubject, $sDefaultInputSubject)
    Global $idInputContactRightName               = GUICtrlCreateInput('', $columnContactRight02,                      $rowContactRight03, $columnContactRight02Width,                        $rowContactRight03Height)
      _GUICtrlEdit_SetCueBanner($idInputContactRightName, $sDefaultInputName)
    Global $idInputContactRightEmployeeID         = GUICtrlCreateInput('', $columnContactRight02,                      $rowContactRight04, $columnContactRight02Width,                        $rowContactRight04Height)
      _GUICtrlEdit_SetCueBanner($idInputContactRightEmployeeID, $sDefaultInputEmployeeID)
    Global $idInputContactRightPhone              = GUICtrlCreateInput('', $columnContactRight02,                      $rowContactRight05, $columnContactRight02Width,                        $rowContactRight05Height)
      _GUICtrlEdit_SetCueBanner($idInputContactRightPhone, $sDefaultInputPhone)
    Global $idInputContactRightLocation           = GUICtrlCreateInput('', $columnContactRight02,                      $rowContactRight06, $columnContactRight02Width,                        $rowContactRight06Height)
      _GUICtrlEdit_SetCueBanner($idInputContactRightLocation, $sDefaultInputLocation)
    Global $idInputContactRightBody               = _GUICtrlRichEdit_Create($idGUIContact, '', $columnContactRight01,  $rowContactRight08 - $rowInputBoxOffset, $columnContactRight03Width,   $rowContactRight08Height + $rowInputBoxOffset, BitOR($ES_AUTOVSCROLL,$ES_WANTRETURN,$WS_VSCROLL,$ES_MULTILINE))
    Global $idInputContactRightAttachmentPath     = GUICtrlCreateInput('', $columnContactRight02 + 4,                  $rowContactRight09, $columnContactRight02Width - 28 - 3,               $rowContactRight09Height, BitOR($ES_AUTOHSCROLL,$ES_READONLY))
    Global $idButtonContactRightClearAttachment   = GUICtrlCreateButton('X', $columnContactRight02 + 205,              $rowContactRight09 - 1, 23,                                            $rowContactRight09Height + 2)
    Global $idInputContactRightScreenshotPath     = GUICtrlCreateInput('', $columnContactRight02 + 4,                  $rowContactRight10, $columnContactRight02Width - 28 - 3,               $rowContactRight10Height, BitOR($ES_AUTOHSCROLL,$ES_READONLY))
    Global $idButtonContactRightClearScreenshot   = GUICtrlCreateButton('X', $columnContactRight02 + 205,              $rowContactRight10 - 1, 23,                                            $rowContactRight10Height + 2)

    ;;GATHER GUI ELEMENTS INTO ARRAYS
    Global $aContactCombos[1]
      $aContactCombos[00] = $idInputContactRightTemplate

    Global $aContactInputs[8]
      $aContactInputs[00] = $idInputContactRightSubject
      $aContactInputs[01] = $idInputContactRightName
      $aContactInputs[02] = $idInputContactRightEmployeeID
      $aContactInputs[03] = $idInputContactRightPhone
      $aContactInputs[04] = $idInputContactRightLocation
      $aContactInputs[05] = $idInputContactRightBody
      $aContactInputs[06] = $idInputContactRightAttachmentPath
      $aContactInputs[07] = $idInputContactRightScreenshotPath

    Global $aContactButtons[5]
      $aContactButtons[00] = $idButtonContactLeftSend
      $aContactButtons[01] = $idButtonContactRightPickAttachment
      $aContactButtons[02] = $idButtonContactRightClearAttachment
      $aContactButtons[03] = $idButtonContactRightTakeScreenshot
      $aContactButtons[04] = $idButtonContactRightClearScreenshot

    ;;DISPLAY THE GUI
    Global $idContactLastFocus  ;pre-decalre
    GUIContactSetDefaults() ;set defaults
    GUISetState(@SW_SHOWNORMAL, $idGUIContact) ;show GUI
    ControlFocus($idGUIContact, '', $idInputContactRightSubject)  ;set text cursor focus
    $idContactLastFocus = ControlGetFocus($idGUIContact)  ;save focus

    ;;CATCH INPUT BOX FOCUS MESSAGES
    GUIRegisterMsg($WM_COMMAND, "ED_WM_COMMAND")

    ;;WAIT FOR INPUT
    Local $aMsg
    While 1
      $aMsg = GUIGetMsg(1)  ;use advanced parameter
      Switch $aMsg[1] ;check which GUI sent the message
        Case $idGUIContact
          Switch $aMsg[0]
            ;; COMBO BOXES
            Case $idInputContactRightTemplate
              GUIContactSetBusyDefaults() ;set GUI busy

              $iButtonPressed = MsgBox(BitOR($MB_OK, $MB_ICONQUESTION, $MB_TOPMOST, $MB_SETFOREGROUND, $MB_YESNO, $MB_DEFBUTTON2), 'Load Template', 'Entered information will be lost. Load template?', 0, $idGUIContact)
              If $iButtonPressed = $IDYES Then
                GUIContactLoadTemplate()
              EndIf

              GUIContactSetDefaults() ;set GUI defaults

            ;; BUTTONS
            Case $idButtonContactRightPickAttachment
              GUIContactSetBusyDefaults() ;set GUI busy

              ;present file open dialog
              $sFileOpenPathPath = FileOpenDialog('Select a file to attach...', @DesktopDir, 'All (*.*)' , BitOR($FD_FILEMUSTEXIST, $FD_PATHMUSTEXIST), '', $idGUIContact)
              If StringIsSpace($sFileOpenPathPath) = False Then
                $sContactFormAttachmentPath = $sFileOpenPathPath
                $aTemp = StringSplit($sContactFormAttachmentPath, '\')
                $sContactFormAttachmentName = $aTemp[$aTemp[0]]
                GUICtrlSetData($idInputContactRightAttachmentPath, $sContactFormAttachmentName)
              EndIf

              GUIContactSetDefaults() ;set GUI defaults
            Case $idButtonContactRightClearAttachment
              ;clear attachment
              $sContactFormAttachmentPath = ''
              $sContactFormAttachmentName = ''
              GUICtrlSetData($idInputContactRightAttachmentPath, $sContactFormAttachmentName)

              GUIContactSetDefaults() ;set GUI defaults
            Case $idButtonContactRightTakeScreenshot
              GUIContactSetBusyDefaults() ;set GUI busy

              ;hide Contact GUI
              GUISetState(@SW_HIDE, $idGUIContact) ;hide GUI

              GUIContactScreenshotButton()

              ;display Contact GUI
              GUISetState(@SW_SHOWNORMAL, $idGUIContact) ;show GUI

              GUIContactSetDefaults() ;set GUI defaults
            Case $idButtonContactRightClearScreenshot
              ;clear screenshot
              If FileExists($sContactFormScreenshotPath) = True Then FileDelete($sContactFormScreenshotPath)  ;delete screenshot
              $sContactFormScreenshotPath = ''
              $sContactFormScreenshotName = ''
              GUICtrlSetData($idInputContactRightScreenshotPath, $sContactFormScreenshotName)

              GUIContactSetDefaults() ;set GUI defaults
            Case $idButtonContactLeftSend
              GUIContactSetBusyDefaults() ;set GUI busy

              ;change button text
              $sButtonText = GUICtrlRead($idButtonContactLeftSend)
              GUICtrlSetData($idButtonContactLeftSend, 'Working...')

              ;go to Send function
              GUIContactSendButton()

              ;restore button text
              GUICtrlSetData($idButtonContactLeftSend, $sButtonText)

              If $bContactFormSubmitSuccess = True Then
                GUIContactClose()
                ExitLoop
              EndIf

              GUIContactSetDefaults() ;set GUI defaults if returned

            ;; CLOSE
            Case $GUI_EVENT_CLOSE
              GUIContactSetBusyDefaults() ;set GUI busy

              $iButtonPressed = MsgBox(BitOR($MB_OK, $MB_ICONQUESTION, $MB_TOPMOST, $MB_SETFOREGROUND, $MB_YESNO, $MB_DEFBUTTON2), 'Close Window', 'Entered information will be lost. Close window?', 0, $idGUIContact)

              ;user confirmed closing
              If $iButtonPressed = $IDYES Then
                GUIContactClose()
                ExitLoop
              EndIf

              ;user canceled closing
              GUIContactSetDefaults() ;set GUI defaults
          EndSwitch
      EndSwitch
    WEnd
  EndFunc

  ;;CLOSE CONTACT GUI GRACEFULLY
  Func GUIContactClose()
    GUIDelete($idGUIContact)  ;delete Contact GUI
    GUISetState(@SW_ENABLE, $hGUIMain) ;show main GUI
    If FileExists($sContactFormScreenshotPath) = True Then FileDelete($sContactFormScreenshotPath)  ;delete screenshot
  EndFunc

  #Region - Form Operations
    Func GUIContactScreenshotButton()
      ;present screenshot dialog
      $sDialogText = 'Arrange your screen so the desired windows are visible. Minimize anything you do not want included in the screenshot. This dialog will not be included.' & @CRLF & @CRLF & 'Take screenshot?'
      $iButtonPressed = MsgBox(BitOR($MB_OK, $MB_ICONQUESTION, $MB_TOPMOST, $MB_SETFOREGROUND, $MB_YESNO, $MB_DEFBUTTON2), 'Prepare for Screenshot', $sDialogText, 0, $idGUIContact)

      Switch $iButtonPressed
        Case $IDYES
          $aDesktopSize = WinGetPos("Program Manager")  ;get full size of desktop

          $sTempFileName = 'Screenshot-' & @YEAR & '-' & @MON & '-' & @MDAY & '--' & @HOUR & '-' & @MIN & '-' & @SEC & '.png'
          $sTempFilePath = $sAppTempPath & '\' & $sTempFileName
          If FileExists($sTempFilePath) = True Then FileDelete($sTempFilePath)  ;delete screeenshot if somehow it already exists

          Sleep(300)  ;wait for MsgBox to go away

          $bSaveScreenshot = _ScreenCapture_Capture($sTempFilePath, 0, 0, $aDesktopSize[2], $aDesktopSize[3], True)
          If $bSaveScreenshot = True Then
            ShellExecute($sTempFilePath)
            If FileExists($sContactFormScreenshotPath) = True Then FileDelete($sContactFormScreenshotPath)  ;delete old screenshot
            $sContactFormScreenshotPath = $sTempFilePath
            $sContactFormScreenshotName = $sTempFileName
            GUICtrlSetData($idInputContactRightScreenshotPath, $sContactFormScreenshotName)
          Else
            MsgBox(BitOR($MB_OK, $MB_ICONERROR, $MB_TOPMOST, $MB_SETFOREGROUND), 'Error', 'An error has occurred.' & @CRLF & @CRLF & '(Unable to save screenshot.)', 0, $idGUIContact)
          EndIf
      EndSwitch
    EndFunc

    Func GUIContactSendButton()
      ;   Sending:
      ;   - change to busy GUI, send button text changes to "Busy..."?
      ;   - validate required fields are filled, use function that tests for string for blank characters (spaces, tabs, etc.), return to GUI if fail
      ;   - validate email address format is valid, return to GUI if fail
      ;   - validate email attachment size?
      ;   - generate email.exe command: "from" email should be one from GUI field, should use smtp.domain.com, should CC "from" email in GUI
      ;   - run with email.exe and wait for return codes
      ;   - if success, display dialog, tell user to check inbox for copy, OK in dialog closes GUI, returns to ATC
      ;   - if fail, display dialog with reason, return to GUI

      ;read input fields to variables
      GUIContactReadForm()

      ;validate variables
      Global $bContactFormValid = True
      GUIContactValidateForm()
      If $bContactFormValid = False Then Return

      ;generate body for email
      GUIContactGenerateBody()

      ;attempt to submit ticket
      GUIContactSubmitTicket()
    EndFunc

    Func GUIContactReadTemplates()
      ;Generated variables:
      ;
      ; $aContactTemplates[$i]
      ; $lTemplates

      ;empty $lTemplates
      $lTemplates = ''

      ;location of templates
      Global $sContactTemplatesDir = $sAppInstallPath & '\Support\Templates'

      ;read dir of templates into array
      Global $aContactTemplates = ''
      $aContactTemplates = _FileListToArrayRec($sContactTemplatesDir, '*.xml|*-sample.xml', $FLTAR_FILES + $FLTAR_NOHIDDEN + $FLTAR_NOSYSTEM + $FLTAR_NOLINK, $FLTAR_RECUR, $FLTAR_SORT, $FLTAR_FULLPATH)
        ;should return array of file paths, $array[0] is number of file paths returned

      ;populate variable to be used by Templates combo box
      For $i = 1 To UBound($aContactTemplates) - 1
        $aTemp = StringSplit($aContactTemplates[$i], '\')
        $sTempFileName = $aTemp[$aTemp[0]]
        $sTemplateTitle = StringTrimRight($sTempFileName, 4)
        $lTemplates &= "|" & $sTemplateTitle
      Next
    EndFunc

    Func GUIContactLoadTemplate()
      ;; returns the following variables:
      ;;
      ;; $sTemplateFromAddress
      ;; $sTemplateToAddress
      ;; $sTemplateCCAddress
      ;; $sTemplateBCCAddress
      ;; $sTemplateSubject
      ;; $sTemplateName
      ;; $sTemplateEmployeeID
      ;; $sTemplatePhone
      ;; $sTemplateLocation
      ;; $sTemplateBody
      ;; $sTemplatePath

      Global $sTemplateFromAddress = ''
      Global $sTemplateToAddress = ''
      Global $sTemplateCCAddress = ''
      Global $sTemplateBCCAddress = ''
      Global $sTemplateSubject = ''
      Global $sTemplateName = ''
      Global $sTemplateEmployeeID = ''
      Global $sTemplatePhone = ''
      Global $sTemplateLocation = ''
      Global $sTemplateBody = ''
      Global $sTemplateAttachmentPath = ''

      ;load selected template into GUI
      $sTemplateSelecton = GUICtrlRead($idInputContactRightTemplate)
      $sTemplateSelectionPath = $sContactTemplatesDir & '\' & $sTemplateSelecton & '.xml'

      ;parse template into variables
      If FileExists($sTemplateSelectionPath) Then  ;if the path really does exist
        Local $hFileOpen = FileOpen($sTemplateSelectionPath,  $FO_READ)  ;open file
        If Not ($hFileOpen = '-1') Then  ;do if file opens successfully
          $string = FileRead($hFileOpen)  ;read contents of file into one big string

          ;reg exp file contents into parts of the array
          $aTemplateFromAddress = StringRegExp($string, '<FromAddress>(.*)</FromAddress>', 1)
          $aTemplateToAddress = StringRegExp($string, '<ToAddress>(.*)</ToAddress>', 1)
          $aTemplateCCAddress = StringRegExp($string, '<CCAddress>(.*)</CCAddress>', 1)
          $aTemplateBCCAddress = StringRegExp($string, '<BCCAddress>(.*)</BCCAddress>', 1)
          $aTemplateSubject = StringRegExp($string, '<Subject>(.*)</Subject>', 1)
          $aTemplateName = StringRegExp($string, '<Name>(.*)</Name>', 1)
          $aTemplateEmployeeID = StringRegExp($string, '<EmployeeID>(.*)</EmployeeID>', 1)
          $aTemplatePhone = StringRegExp($string, '<Phone>(.*)</Phone>', 1)
          $aTemplateLocation = StringRegExp($string, '<Location>(.*)</Location>', 1)
          $aTemplateBody = StringRegExp($string, '(?s)<Body>(.*)</Body>', 1)  ;(?s) allows matching across multiple lines
          $aTemplateAttachmentPath = StringRegExp($string, '<AttachmentPath>(.*)</AttachmentPath>', 1)

          ;load RegExp arrays into string variables
          If _elementExists($aTemplateFromAddress, 0) = True     Then $sTemplateFromAddress = $aTemplateFromAddress[0]
          If _elementExists($aTemplateToAddress, 0) = True       Then $sTemplateToAddress = $aTemplateToAddress[0]
          If _elementExists($aTemplateCCAddress, 0) = True       Then $sTemplateCCAddress = $aTemplateCCAddress[0]
          If _elementExists($aTemplateBCCAddress, 0) = True      Then $sTemplateBCCAddress = $aTemplateBCCAddress[0]
          If _elementExists($aTemplateSubject, 0) = True         Then $sTemplateSubject = $aTemplateSubject[0]
          If _elementExists($aTemplateName, 0) = True            Then $sTemplateName = $aTemplateName[0]
          If _elementExists($aTemplateEmployeeID, 0) = True      Then $sTemplateEmployeeID = $aTemplateEmployeeID[0]
          If _elementExists($aTemplatePhone, 0) = True           Then $sTemplatePhone = $aTemplatePhone[0]
          If _elementExists($aTemplateLocation, 0) = True        Then $sTemplateLocation = $aTemplateLocation[0]
          If _elementExists($aTemplateBody, 0) = True            Then $sTemplateBody = $aTemplateBody[0]
          If _elementExists($aTemplateAttachmentPath, 0) = True  Then $sTemplateAttachmentPath = $aTemplateAttachmentPath[0]
        EndIf
      EndIf

      ;update GUI with template variables
      ;;from
      ;;to
      ;;cc
      ;;bcc
      If StringIsSpace($sTemplateSubject) = False Then GUICtrlSetData($idInputContactRightSubject, $sTemplateSubject)  ;;subject
      If StringIsSpace($sTemplateName) = False Then GUICtrlSetData($idInputContactRightName, $sTemplateName)  ;;name
      If StringIsSpace($sTemplateEmployeeID) = False Then GUICtrlSetData($idInputContactRightEmployeeID, $sTemplateEmployeeID)  ;;employee ID
      If StringIsSpace($sTemplatePhone) = False Then GUICtrlSetData($idInputContactRightPhone, $sTemplatePhone)  ;;phone
      If StringIsSpace($sTemplateLocation) = False Then GUICtrlSetData($idInputContactRightLocation, $sTemplateLocation)  ;;location
      If StringIsSpace($sTemplateBody) = False Then _GUICtrlRichEdit_SetText($idInputContactRightBody, $sTemplateBody)  ;;body
      ;;attachment
    EndFunc

    Func GUIContactReadForm()
    ;returned variables:
    ;
    ; $sContactFormFrom
    ; $sContactFormTo
    ; $sContactFormCC
    ; $sContactFormBCC
    ; $sContactFormSubject
    ; $sContactFormName
    ; $sContactFormEmployeeID
    ; $sContactFormPhone
    ; $sContactFormLocation
    ; $sContactFormBody
    ; $sContactFormAttachments

      ;read user input fields and behind-the-scenes variables to final variables

      If StringIsSpace($sTemplateFromAddress) = False Then
        $sContactFormFrom = $sTemplateFromAddress
      Else
        $sContactFormFrom = $sCurrentUsername & '@' & $sOrgDomain
      EndIf
      If StringIsSpace($sTemplateToAddress) = False Then
        $sContactFormTo = $sTemplateToAddress
      Else
        $sContactFormTo = $sMainHelpdesk_EmailAddress
      EndIf
      If StringIsSpace($sTemplateCCAddress) = False Then
        $sContactFormCC = $sTemplateCCAddress
      Else
        $sContactFormCC = ''
      EndIf
      If StringIsSpace($sTemplateBCCAddress) = False Then
        $sContactFormBCC = $sTemplateBCCAddress
      Else
        $sContactFormBCC = ''
      EndIf
      $sContactFormSubject = GUICtrlRead($idInputContactRightSubject)
      $sContactFormName = GUICtrlRead($idInputContactRightName)
      $sContactFormEmployeeID = GUICtrlRead($idInputContactRightEmployeeID)
      $sContactFormPhone = GUICtrlRead($idInputContactRightPhone)
      $sContactFormLocation = GUICtrlRead($idInputContactRightLocation)
      $sContactFormBody = _GUICtrlRichEdit_GetText($idInputContactRightBody)
      $sContactFormAttachments = $sContactFormAttachmentPath & ';' & $sContactFormScreenshotPath & ';' & $sTemplateAttachmentPath
    EndFunc

    Func GUIContactValidateForm()
      ;validate input fields

      ;test From email format
      If (_IsValidEmail($sContactFormFrom) = False) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONERROR, $MB_TOPMOST, $MB_SETFOREGROUND), 'Error', 'Please contact the ' & $sOrgName & ' ' & $sMainHelpdesk_Title & ' by phone at ' & $sMainHelpdesk_PhoneNumber & '.' & @CRLF & @CRLF & '(About This Computer ''From'' address is misconfigured.)', 0, $idGUIContact)
        ;MsgBox(BitOR($MB_OK, $MB_ICONERROR, $MB_TOPMOST, $MB_SETFOREGROUND), 'Failure', '''From'' email address is invalid. Please contact the ' & $sOrgName & ' ' & $sMainHelpdesk_Title & ' by phone at ' & $sMainHelpdesk_PhoneNumber & '.', 0, $idGUIContact)
        Return
      EndIf

      ;test To email format
      If (_IsValidEmail($sContactFormTo) = False) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONERROR, $MB_TOPMOST, $MB_SETFOREGROUND), 'Error', 'Please contact the ' & $sOrgName & ' ' & $sMainHelpdesk_Title & ' by phone at ' & $sMainHelpdesk_PhoneNumber & '.' & @CRLF & @CRLF & '(About This Computer ''To'' address is misconfigured.)', 0, $idGUIContact)
        Return
      EndIf

      ;test Subject is present
      If (StringIsSpace($sContactFormSubject) = 1) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Missing Information', 'You must include a subject.', 0, $idGUIContact)
        $idContactLastFocus = GUICtrlGetHandle($idInputContactRightSubject)
        Return
      EndIf

      ;test Name is present
      If (StringIsSpace($sContactFormName) = 1) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Missing Information', 'You must include your name.', 0, $idGUIContact)
        $idContactLastFocus = GUICtrlGetHandle($idInputContactRightName)
        Return
      EndIf

      ;test Employee ID is present
      If (StringIsSpace($sContactFormEmployeeID) = 1) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Missing Information', 'You must include your employee ID.', 0, $idGUIContact)
        $idContactLastFocus = GUICtrlGetHandle($idInputContactRightEmployeeID)
        Return
      EndIf

      ;;test Employee ID is only digits
      ;If (StringIsDigit($sContactFormEmployeeID) = 0) Then $bContactFormValid = False
      ;If $bContactFormValid = False Then
      ;  MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Missing Information', 'Your Employee ID must be only numbers.', 0, $idGUIContact)
      ;  $idContactLastFocus = GUICtrlGetHandle($idInputContactRightEmployeeID)
      ;  Return
      ;EndIf

      ;test Phone is present
      If (StringIsSpace($sContactFormPhone) = 1) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Missing Information', 'You must include your phone number.', 0, $idGUIContact)
        $idContactLastFocus = GUICtrlGetHandle($idInputContactRightPhone)
        Return
      EndIf

      ;test Location is present
      If (StringIsSpace($sContactFormLocation) = 1) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Missing Information', 'You must include a location.', 0, $idGUIContact)
        $idContactLastFocus = GUICtrlGetHandle($idInputContactRightLocation)
        Return
      EndIf

      ;test Body is present
      If (StringIsSpace($sContactFormBody) = 1) Then $bContactFormValid = False
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Missing Information', 'You must include a detailed description of your request.', 0, $idGUIContact)
        $idContactLastFocus = $idInputContactRightBody
        Return
      EndIf

      ;test attachment size
      If (StringIsSpace($sContactFormAttachmentPath) = 0) Then
        $sAttachmentSizeB = FileGetSize($sContactFormAttachmentPath)
        $sAttachmentSizeKB = $sAttachmentSizeB / 1024
        $sAttachmentSizeMB = Round($sAttachmentSizeKB / 1024, 2)
        $sAttachmentMaxSizeKB = 10240
        $sAttachmentMaxSizeMB = Round($sAttachmentMaxSizeKB / 1024, 2)
        If $sAttachmentSizeKB > 10240 Then $bContactFormValid = False
      EndIf
      If $bContactFormValid = False Then
        MsgBox(BitOR($MB_OK, $MB_ICONWARNING, $MB_TOPMOST, $MB_SETFOREGROUND), 'Attachment Too Large', 'The attached file size (' & $sAttachmentSizeMB & ' MB) is larger than the maximum allowed size (' & $sAttachmentMaxSizeMB & ' MB).', 0, $idGUIContact)
        $idContactLastFocus = $idInputContactRightBody
        Return
      EndIf
    EndFunc

    Func GUIContactGenerateBody()
      ;generate email body from ticket form and ATC

      Local $sEmailBody = _
        'Name: ' & $sContactFormName & @CRLF & _
        'Employee ID: ' & $sContactFormEmployeeID & @CRLF & _
        'Phone: ' & $sContactFormPhone & @CRLF & _
        'Location: ' & $sContactFormLocation & @CRLF & _
        'Attached File: ' & $sContactFormAttachmentName & @CRLF & _
        'Attached Screenshot: ' & $sContactFormScreenshotName & @CRLF & _
        '' & @CRLF & _
        'Subject: ' & $sContactFormSubject & @CRLF & _
        'Description:' & @CRLF & _
        $sContactFormBody & @CRLF & _
        '' & @CRLF & _
        'Information about the requestor''s computer:' & @CRLF & _
        $sSummaryString & @CRLF & _
        'This ' & $sMainHelpdesk_Title & ' request was created using About This Computer.'

      ;Global $sContactFormBodyComplete = StringReplace($sEmailBody, @CRLF, '%0D%0A') ;generate HTML-friendly line returns
      Global $sContactFormBodyComplete = $sEmailBody
    EndFunc

    Func GUIContactSubmitTicket()
      ;Assign SendEmail variables
      Local $s_SmtpServer = 'smtp.' & $sOrgDomain
      Local $s_Username = ''
      Local $s_Password = ''
      Local $s_FromName = $sContactFormName
      Local $s_FromAddress = $sContactFormFrom
      Local $s_ToAddress = $sContactFormTo
      Local $s_Subject = $sContactFormSubject
      Local $s_Body = $sContactFormBodyComplete
      Local $s_AttachFiles = $sContactFormAttachments
      Local $s_CcAddress = $sContactFormCC
      Local $s_BccAddress = $sContactFormBCC
      Local $s_Importance = 'Normal'
      Local $i_IPPort = 25
      Local $b_SSL = False
      Local $b_IsHTMLBody = False
      Local $i_DSNOptions = $g__cdoDSNDefault ;$g__cdoDSNFailure
      Local $sEMLPath_SaveBefore = ''
      Local $sEMLPath_SaveAfter = ''

      ;generate debug MsgBox
      ;Local $sText = $s_SmtpServer & ', ' & $s_Username & ', ' & $s_Password & ', ' & $s_FromName & ', ' & $s_FromAddress & ', ' & $s_ToAddress & ', ' & $s_Subject & ', ' & $s_Body & ', ' & $s_AttachFiles & ', ' & $s_CcAddress & ', ' & $s_BccAddress & ', ' & $s_Importance & ', ' & $i_IPPort & ', ' & $b_SSL & ', ' & $b_IsHTMLBody & ', ' & $i_DSNOptions & ', ' & $sEMLPath_SaveBefore & ', ' & $sEMLPath_SaveAfter
      ;MsgBox(BitOR($MB_OK, $MB_ICONINFORMATION, $MB_TOPMOST, $MB_SETFOREGROUND), 'SMTP Command Params', $sText, 0, $idGUIContact)

      ;call SendEmail function and assign return code
      $sErrorCode = _SMTP_SendEmail($s_SmtpServer, $s_Username, $s_Password, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject, $s_Body, $s_AttachFiles, $s_CcAddress, $s_BccAddress, $s_Importance, $i_IPPort, $b_SSL, $b_IsHTMLBody, $i_DSNOptions, $sEMLPath_SaveBefore, $sEMLPath_SaveAfter)

      ;debug error code
      ;MsgBox(BitOR($MB_OK, $MB_ICONINFORMATION, $MB_TOPMOST, $MB_SETFOREGROUND), '_SMTP_SendEmail', 'Return code: ' & $sErrorCode, 0, $idGUIContact)

      ;act on return code
      Switch $sErrorCode
        Case '0'
          $bContactFormSubmitSuccess = True
          MsgBox(BitOR($MB_OK, $MB_ICONINFORMATION, $MB_TOPMOST, $MB_SETFOREGROUND), 'Request Submitted', 'Your ' & $sMainHelpdesk_Title & ' request has been submitted.' & @CRLF & @CRLF & 'Check the inbox of ' & $sContactFormFrom & ' for a confirmation email.' & @CRLF & @CRLF & 'If you do not receive a confirmation email, contact the ' & $sOrgName & ' ' & $sMainHelpdesk_Title & ' by phone at ' & $sMainHelpdesk_PhoneNumber & '.', 0, $idGUIContact)
        Case Else
          $bContactFormSubmitSuccess = False
          MsgBox(BitOR($MB_OK, $MB_ICONERROR, $MB_TOPMOST, $MB_SETFOREGROUND), 'Error', 'Unable to submit request. Please contact the ' & $sOrgName & ' ' & $sMainHelpdesk_Title & ' by phone at ' & $sMainHelpdesk_PhoneNumber & '.' & @CRLF & @CRLF & '(' & $sErrorCode & ')', 0, $idGUIContact)
      EndSwitch
    EndFunc
  #EndRegion

  #Region - GUI Input Box Focus
    Func ED_WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
      #forceref $hWnd, $iMsg
      Local $iCode = BitShift($wParam, 16)
      Switch $lParam
        Case GUICtrlGetHandle($idInputContactRightSubject)
          $idContactLastFocus = GUICtrlGetHandle($idInputContactRightSubject)
        Case GUICtrlGetHandle($idInputContactRightName)
          $idContactLastFocus = GUICtrlGetHandle($idInputContactRightName)
        Case GUICtrlGetHandle($idInputContactRightEmployeeID)
          $idContactLastFocus = GUICtrlGetHandle($idInputContactRightEmployeeID)
        Case GUICtrlGetHandle($idInputContactRightPhone)
          $idContactLastFocus = GUICtrlGetHandle($idInputContactRightPhone)
        Case GUICtrlGetHandle($idInputContactRightLocation)
          $idContactLastFocus = GUICtrlGetHandle($idInputContactRightLocation)
        Case GUICtrlGetHandle($idInputContactRightBody)
          $idContactLastFocus = $idInputContactRightBody
      EndSwitch

      Return $GUI_RUNDEFMSG
    EndFunc
  #EndRegion

  #Region - GUI STATES
  ;; SET GUI DEFAULTS
    Func GUIContactSetDefaults()
      ;set overall defaults
      GUIContactSetComboDefaults()
      GUIContactSetInputDefaults()
      ControlFocus($idGUIContact, '', $idContactLastFocus) ;reset focus to last known
      GUIContactGUIMainSetButtonDefaults()

      ;enable Body input box
      WinSetState($idInputContactRightBody, '', @SW_ENABLE)
    EndFunc

  ;; SET GUI BUSY DEFAULTS
    Func GUIContactSetBusyDefaults()
      GUIContactSetCombos($GUI_DISABLE)
      GUIContactSetInputs($GUI_DISABLE)
      GUIContactGUIMainSetButtons($GUI_DISABLE)

      WinSetState($idInputContactRightBody, '', @SW_DISABLE)
    EndFunc

  ;; SET COMBOBOX DEFAULTS
    Func GUIContactSetComboDefaults()
      ;only enable templates combobox if templates exist
      If $aContactTemplates = '' Then
        GUIContactSetCombos($GUI_DISABLE)
      Else
        GUIContactSetCombos($GUI_ENABLE)
      EndIf
    EndFunc

  ;; SET INPUT DEFAULTS
    Func GUIContactSetInputDefaults()
      GUIContactSetInputs($GUI_ENABLE)

      ;disable attachment path field
      ToggleGUIControl($idInputContactRightAttachmentPath, $GUI_DISABLE)

      ;disable screenshot path field
      ToggleGUIControl($idInputContactRightScreenshotPath, $GUI_DISABLE)
    EndFunc

  ;; SET BUTTON DEFAULTS
    Func GUIContactGUIMainSetButtonDefaults()
      GUIContactGUIMainSetButtons($GUI_ENABLE)

      Switch (StringIsSpace(GUICtrlRead($idInputContactRightAttachmentPath)))
        Case True
          ToggleGUIControl($idButtonContactRightClearAttachment, $GUI_DISABLE)
        Case False
          ToggleGUIControl($idButtonContactRightClearAttachment, $GUI_ENABLE)
      EndSwitch

      Switch (StringIsSpace(GUICtrlRead($idInputContactRightScreenshotPath)))
        Case True
          ToggleGUIControl($idButtonContactRightClearScreenshot, $GUI_DISABLE)
        Case False
          ToggleGUIControl($idButtonContactRightClearScreenshot, $GUI_ENABLE)
      EndSwitch
    EndFunc

  ;; SET ALL COMBO BOXES WITH OPTION
    Func GUIContactSetCombos($Option)
      ;$GUI_ENABLE
      ;$GUI_DISABLE

      For $i = 0 To UBound($aContactCombos) - 1
        ToggleGUIControl($aContactCombos[$i], $Option)
      Next
    EndFunc

  ;; SET ALL INPUTS WITH OPTION
    Func GUIContactSetInputs($Option)
      ;$GUI_ENABLE
      ;$GUI_DISABLE

      For $i = 0 To UBound($aContactInputs) - 1
        ToggleGUIControl($aContactInputs[$i], $Option)
      Next
    EndFunc

  ;; SET ALL BUTTONS WITH OPTION
    Func GUIContactGUIMainSetButtons($Option)
      ;$GUI_ENABLE
      ;$GUI_DISABLE

      For $i = 0 To UBound($aContactButtons) - 1
        ToggleGUIControl($aContactButtons[$i], $Option)
      Next
    EndFunc
  #EndRegion
#EndRegion



;;=====================================================================================================================================================================
;;================================================================== LINE OF CODE REWRITE SEPARATION ==================================================================
;;=====================================================================================================================================================================






















#Region -- TOOLS
  Func ToggleGUIControl($idGUIControl, $Option)
    ;;TOGGLE GUI CONTROL STATE
    ;; Change a GUI control's state only if the desired state is different than the current state.
    ;; This is an attempt to prevent a flickering GUI when states change
    ;;
    ;; $GUI_ENABLE
    ;; $GUI_DISABLE
    ;; $GUI_CHECKED
    ;; $GUI_UNCHECKED
    ;; $GUI_CHECKENABLE
    ;; $GUI_UNCHECKENABLE
    ;; $GUI_CHECKDISABLE
    ;; $GUI_UNCHECKDISABLE

    Switch $Option
      Case $GUI_ENABLE, $GUI_DISABLE
        If Not BitAND(GUICtrlGetState($idGUIControl), $Option) Then GUICtrlSetState($idGUIControl, $Option)
      Case $GUI_CHECKED, $GUI_UNCHECKED
        If Not BitAND(GUICtrlRead($idGUIControl), $Option) Then GUICtrlSetState($idGUIControl, $Option)
      Case $GUI_CHECKENABLE
        If Not BitAND(GUICtrlGetState($idGUIControl), $GUI_ENABLE) Then GUICtrlSetState($idGUIControl, $GUI_ENABLE)
        If Not BitAND(GUICtrlRead($idGUIControl), $GUI_CHECKED) Then GUICtrlSetState($idGUIControl, $GUI_CHECKED)
      Case $GUI_UNCHECKENABLE
        If Not BitAND(GUICtrlGetState($idGUIControl), $GUI_ENABLE) Then GUICtrlSetState($idGUIControl, $GUI_ENABLE)
        If Not BitAND(GUICtrlRead($idGUIControl), $GUI_UNCHECKED) Then GUICtrlSetState($idGUIControl, $GUI_UNCHECKED)
      Case $GUI_CHECKDISABLE
        If Not BitAND(GUICtrlGetState($idGUIControl), $GUI_DISABLE) Then GUICtrlSetState($idGUIControl, $GUI_DISABLE)
        If Not BitAND(GUICtrlRead($idGUIControl), $GUI_CHECKED) Then GUICtrlSetState($idGUIControl, $GUI_CHECKED)
      Case $GUI_UNCHECKDISABLE
        If Not BitAND(GUICtrlGetState($idGUIControl), $GUI_DISABLE) Then GUICtrlSetState($idGUIControl, $GUI_DISABLE)
        If Not BitAND(GUICtrlRead($idGUIControl), $GUI_UNCHECKED) Then GUICtrlSetState($idGUIControl, $GUI_UNCHECKED)
    EndSwitch
  EndFunc

  Func StandardRunCmd($cmd)
    ;;STANDARDIZED COMMAND CALL
    ;; $cmd = 'net share C=C:\ /GRANT:EVERYONE,FULL'
    ;; StandardRunCmd($cmd)

    Run(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
  EndFunc

  Func StandardRunWaitCmd($cmd)
    ;;STANDARDIZED COMMAND CALL AND WAIT
    ;; $cmd = 'net share C=C:\ /GRANT:EVERYONE,FULL'
    ;; StandardRunCmd($cmd)

    RunWait(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
  EndFunc

  Func _IsValidEmail($email)
    ;;VALIDATE PROVIDED EMAIL ADDRESS
    ;;https://www.autoitscript.com/forum/topic/101396-check-if-an-email-address-is-valid/?do=findComment&comment=721006
    If StringRegExp($email, "^([a-zA-Z0-9_\-])([a-zA-Z0-9_\-\.]*)@(\[((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}|((([a-zA-Z0-9\-]+)\.)+))([a-zA-Z]{2,}|(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\])$") Then
      ;MsgBox(4096, '', 'Input is valid email address format.')
      Return True
    Else
      ;MsgBox(4096, '', 'Error, input is not valid email address format.')
      Return False
    EndIf
  EndFunc
#EndRegion

#Region -- END
  Func End()
    ;;SAFE CLOSE AND EXIT
    GUIDelete($hGUIMain)
    TraySetState(2)
    SoftExit()
  EndFunc

  Func SoftExit()
    ;;SOFT EXIT
    ReadComputerSchedule(False)
    ;DirRemove(@TempDir & '\' & $sAppOrg, $DIR_REMOVE)
    ;_SelfDelete(5,0)
    HardExit()
  EndFunc

  Func HardExit()
    ;;HARD EXIT
    Exit
  EndFunc

  Exit
#EndRegion