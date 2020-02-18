#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Images\BeOS_info.ico
#AutoIt3Wrapper_Outfile=Compiled\Configurator.exe
#AutoIt3Wrapper_Outfile_x64=Compiled\Configurator_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=About This Computer Configurator
#AutoIt3Wrapper_Res_Description=About This Computer Configurator
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
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
  AboutThisComputer_Configurator.au3
  Standalone application for configuring About This Computer.

  Created by Brian Kyncl on 2020-02-17
  Copyright (c) 2020 Brian Kyncl (briankyncl.com). All rights reserved.

  Run elevated.
#COMMENTS-END

#Region -- PRE-FLIGHT
  ;;OPTIONS
  ;;none

  ;;INCLUDES
  #include 'UDF-ATCCustomization\_ATC_Customization.au3'
#EndRegion

Main()  ;;Main application
End()   ;;Exit app gracefully if code should ever find itself here.

#Region -- STARTUP
  Func StartupCoreGlobals()
    ;;DECLARE CORE GLOBALS

    ;;APP INFO
    Global $sAppOrg         = 'com.briankyncl'
    Global $sAppName        = 'About This Computer'
    Global $sAppDisplayName = 'About This Computer Configurator'
    Global $sAppShortName   = 'ATC'
    Global $sAppDocsHost    = 'GitHub'
    Global $sAppDocsFormat  = 'website'
    Global $sAppDocsURL     = 'https://github.com/briankyncl/aboutthiscomputer'

    ;;APP VERSION
    Local  $aFileVersion = StringSplit(FileGetVersion(@AutoItExe), '.')
    Global $sAppBuild    = $aFileVersion[4]
    Global $sAppVersion  = $aFileVersion[1] & '.' & $aFileVersion[2] & '.' & $aFileVersion[3]
    Global $sAppRelease  = '2020-xx-xx'

    ;;APP PATHS
    Global $sAppInstallPath       = @ProgramFilesDir & '\' & $sAppOrg & '\' & $sAppName
    Global $sAppSourcePath        = @ScriptDir
    Global $sAppTempPath          = @TempDir & '\' & $sAppOrg & '\' & $sAppName
    Global $sAppStartMenuPath     = @ProgramsCommonDir & '\' & $sAppName
    Global $sAppRegistryPath      = 'HKEY_LOCAL_MACHINE\Software\' & $sAppOrg & '\' & $sAppName
    Global $sAppLogo              = $sAppTempPath & '\ATC-BeOS_Customize_wrench.ico'

    DirCreate($sAppTempPath)

    ;;APP ASSETS
    FileInstall('Images\BeOS_Customize_wrench.ico', $sAppLogo, $FC_OVERWRITE)
  EndFunc

  Func StartupExeMode()
    ;;PROCESS EXECUTABLE PARAMETERS
    Global $sMainAppExeMode = ''

    If $CmdLine[00] > 0 Then
      ;;One or more parameters were provided.
      Switch $CmdLine[01]
        Case '-import'
          $sMainAppExeMode = 'import'
          $sConfigImportPath = $CmdLine [02]
        Case '-export'
          $sMainAppExeMode = 'export'
          $sConfigExportPath = $CmdLine [02]
        Case Else
          MsgBox(BitOR($MB_OK, $MB_ICONERROR), $sAppDisplayName & ' Startup', 'Unsupported parameter provided. See documentation at ' & $sAppDocsURL)
          SoftExit()
      EndSwitch
    Else
      ;;No parameters provided.
      $sMainAppExeMode = 'gui'
    EndIf
  EndFunc

  Func StartupGlobals()
    ;;DECLARE GLOBAL VARIABLES
    ;;Declare global variables not declared anywhere else.

    ;;Generic globals
    Global $hGUIMain
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

    ;;DECLARE GLOBALS
    ;; Declare globals not declared anywhere else.
    StartupGlobals()

    ;;DECLARE AND READ CUSTOMIZATION
    ;; Declare and read customization variables.
    _ATC_Customization($sAppRegistryPath, 'Declare')
    _ATC_Customization($sAppRegistryPath, 'Read')

    ;;ALTERNATE APP MODES
    Switch $sMainAppExeMode
      Case 'import'
        ;;no GUI, import settings file at path provided, return success code, quit
      Case 'export'
        ;;no GUI, export settings to file at path provided, return success code, quit
      Case Else  ;;'gui'
        ;;full GUI
        ;continue?
    EndSwitch

    ;;STAGE GUIs
    ;; Define main GUI.
    GUIBuild()

    ;;DISPLAY GUI(s)
    ;; Display main GUI and wait for user input.
    GUIWait()

    ;;GRACEFUL EXIT
    ;; Exit app gracefully if code should ever find itself here.
    End()
  EndFunc
#EndRegion

#Region -- BUILD INTERFACE
  Func GUIBuild()
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
        Global $idMenuItemMainToolsPersonalDrive = GUICtrlCreateMenuItem('Map ' & $sHomeFolderName & ' Drive', $idMenuMainTools, -1)
        ;Global $idMenuItemMainToolsSysInfo = GUICtrlCreateMenuItem('System Information', $idMenuMainTools, -1)

      ;;Help
        Global $idMenuMainHelp = GUICtrlCreateMenu('&Help')

        Global $idMenuItemMainHelpLaunchLMIr = GUICtrlCreateMenuItem('LogMeIn Rescue', $idMenuMainHelp, -1)  ;↗
          GUICtrlCreateMenuItem('', $idMenuMainHelp, -1) ; create a separator line
        Global $idMenuItemMainHelpLaunchIntranet = GUICtrlCreateMenuItem($sIntranetName, $idMenuMainHelp, -1)  ;↗
        Global $idMenuItemMainHelpLaunchHDesk = GUICtrlCreateMenuItem($sHelpdeskName, $idMenuMainHelp, -1) ;↗
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
        Global $idButtonMainLeftContactHDesk = GUICtrlCreateButton($sHelpdeskRequestName, $columnMainLeft_01, $rowMainLeft_04, $columnMainLeft_01Width, $rowMainLeft_04Height, BitOR($BS_MULTILINE, $BS_CENTER, $BS_VCENTER))
      Else
        Global $idButtonMainLeftContactHDesk = GUICtrlCreateButton('Copy Summary', $columnMainLeft_01, $rowMainLeft_04, $columnMainLeft_01Width, $rowMainLeft_04Height)
      EndIf

    ;;MAIN WINDOW ELEMENTS - RIGHT COLUMN
      ;;Contact information
        $idGroupMainRightContact = GUICtrlCreateGroup($sOrgName & ' ' & $sHelpdeskName, $columnMainRight01, $rowMainRight01, $columnMainRight00Width + 1, ($rowMainRight04 - $rowMainRight01) + 4)
        $idLabelMainRight01 = GUICtrlCreateLabel('Email: ', $columnMainRight02, $rowMainRight02, $columnMainRight02Width, $rowMainRight02Height, $SS_RIGHT)
        $idLabelMainRight02 = GUICtrlCreateLabel('Phone: ', $columnMainRight02, $rowMainRight03, $columnMainRight02Width, $rowMainRight03Height, $SS_RIGHT)
        $idLabelMainRight02b = GUICtrlCreateLabel('Password Reset: ', $columnMainRight02, $rowMainRight03a, $columnMainRight02Width, $rowMainRight03aHeight, $SS_RIGHT)

        Global $idLabelMainRight01a = GUICtrlCreateEdit($sHelpdeskEmail, $columnMainRight03, $rowMainRight02, $columnMainRight03Width - 1, $rowMainRight02Height, $ES_READONLY, 0)
        Global $idLabelMainRight02a = GUICtrlCreateEdit($sHelpdeskPhone, $columnMainRight03, $rowMainRight03, $columnMainRight03Width - 1, $rowMainRight03Height, $ES_READONLY, 0)
        Global $idLabelMainRight02c = GUICtrlCreateEdit($sHelpdeskCorporatePhone, $columnMainRight03, $rowMainRight03a, $columnMainRight03Width - 1, $rowMainRight03Height, $ES_READONLY, 0)

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

          Global $idLabelMainRight18a = GUICtrlCreateEdit($sLCMXJCode, $columnMainRight03, $rowMainRight27, $columnMainRight03Width - 1, $rowMainRight27Height, $ES_READONLY, 0)
          Global $idLabelMainRight19a = GUICtrlCreateEdit($sLCMCRCode, $columnMainRight03, $rowMainRight28, $columnMainRight03Width - 1, $rowMainRight28Height, $ES_READONLY, 0)
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
          GUIWait()
          ReadComputerSchedule(True)
        Case $idTrayMainExit
          End()
      EndSwitch
    WEnd
  EndFunc

  Func GUIWait()
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
    GUICtrlSetData($idLabelMainRight01a, $sHelpdeskEmail)
    GUICtrlSetData($idLabelMainRight02a, $sHelpdeskPhone)
    GUICtrlSetData($idLabelMainRight02c, $sHelpdeskCorporatePhone)
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
    GUICtrlSetData($idLabelMainRight18a, $sLCMXJCode)
    GUICtrlSetData($idLabelMainRight19a, $sLCMCRCode)
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
      Local $sUserLoginScript = $sLoginScriptPath & '\' & $sADLoginScript
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
      ' • User ' & $sHomeFolderName & ': ' & $sUserHomeDrive & @CRLF & _
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
      ' • Site Code: ' & $sLCMXJCode & @CRLF & _
      ' • CRA: ' & $sLCMCRCode & @CRLF & _
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
      ' • Email: ' & $sHelpdeskEmail & @CRLF & _
      ' • Phone: ' & $sHelpdeskPhone & @CRLF & _
      ' • Password Reset: ' & $sHelpdeskCorporatePhone & @CRLF & _
      ' • Website: ' & $sHelpdeskURL & @CRLF & _
      ' • LMIr URL: ' & $sHelpdeskRemoteSupportURL & @CRLF & _
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
    $sEmailTo = $sHelpdeskEmail
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
    ShellExecute('iexplore.exe', $sSCCMAppCatalogURL, 'C:\Windows\System32')
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
    ShellExecute('iexplore.exe', $sHelpdeskRemoteSupportURL, 'C:\Windows\System32')
  EndFunc

  Func LaunchIntranet()
    ;;LAUNCH INTRANET
    ShellExecute('iexplore.exe', $sIntranetURL, 'C:\Windows\System32')
  EndFunc

  Func LaunchITHelpdesk()
    ;;LAUNCH IT HELPDESK
    ShellExecute('iexplore.exe', $sHelpdeskURL, 'C:\Windows\System32')
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
    SoftExit()
  EndFunc

  Func SoftExit()
    ;;SOFT EXIT
    HardExit()
  EndFunc

  Func HardExit()
    ;;HARD EXIT
    Exit
  EndFunc

  Exit
#EndRegion