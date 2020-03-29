#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Images\BeOS_info.ico
#AutoIt3Wrapper_Outfile=Compiled\Configurator.exe
#AutoIt3Wrapper_Outfile_x64=Compiled\Configurator_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=About This Computer Configurator
#AutoIt3Wrapper_Res_Description=About This Computer Configurator
#AutoIt3Wrapper_Res_Fileversion=1.0.0.4
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
  #include <EditConstants.au3>
  #include <FileConstants.au3>
  #include <FontConstants.au3>
  #include <GUIConstantsEx.au3>
  #include <MsgBoxConstants.au3>
  #include <StaticConstants.au3>
  #include <TrayConstants.au3>
  #include <WindowsConstants.au3>
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
    Global $GUI_CHECKENABLE
    Global $GUI_UNCHECKENABLE
    Global $GUI_CHECKDISABLE
    Global $GUI_UNCHECKDISABLE

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
    GUIDefine()  ;;declare GUI grid
    GUIBuild()  ;;declare GUI elements (don't need to do anything with default states?)

    GUIRefresh()  ;;refresh GUI to reflect settings from registry
      ;;Would require _ATC_Customization($sAppRegistryPath, 'Read') to have been ran recently

    ;;DISPLAY GUI(s)
    ;; Display main GUI and wait for user input.
    GUIWait()

    ;;GRACEFUL EXIT
    ;; Exit app gracefully if code should ever find itself here.
    End()
  EndFunc
#EndRegion

#Region -- BUILD INTERFACE
  Func GUIDefine()
    ;;DEFINE MAIN GUI
    ;; All commands for defining the base existence of the main GUI

    ;;GRID OVERALL (ENTIRE WINDOW)
      Global $iGUIMainWidthDefault = 900
      Global $iGUIMainHeightDefault = 520

    Global $iGUIMainMenuBarHeight = 20

      ;;GRID OVERALL LEFT (BUTTONS AND LOGO)
        Global $iGUIMainColumnLeft00 = 0  ;;left bound of left column
        Global $iGUIMainColumnLeft01 = $iGUIMainColumnLeft00 + 10  ;;buttons
        Global $iGUIMainColumnLeft02 = $iGUIMainColumnLeft00 + 10  ;;image

        Global $iGUIMainColumnLeft00Width = 148  ;;total width of left column holding logo and buttons
        Global $iGUIMainColumnLeft01Width = 128  ;;width of logo image
        Global $iGUIMainColumnLeft02Width = $iGUIMainColumnLeft00Width - 15  ;;total width minus spacing for buttons

        Global $iGUIMainRowLeftHeights = 50  ;;button heights

        Global $iGUIMainRowLeft00 = 0
        Global $iGUIMainRowLeft01 = $iGUIMainRowLeft00 + 20  ;;top bound of logo image
        Global $iGUIMainRowLeft02 = $iGUIMainHeightDefault - $iGUIMainRowLeftHeights  ;;top bound of bottom button
        Global $iGUIMainRowLeft03 = $iGUIMainRowLeft02 - $iGUIMainRowLeftHeights  ;;top bound of next button up

        Global $iGUIMainRowLeft00Height = $iGUIMainHeightDefault
        Global $iGUIMainRowLeft01Height = 128  ;;height of the logo image
        Global $iGUIMainRowLeft02Height = $iGUIMainRowLeftHeights - 10  ;;height of bottom button
        Global $iGUIMainRowLeft03Height = $iGUIMainRowLeftHeights - 10  ;;height of next button up

      ;;GRID OVERALL RIGHT (TAB CONTROL BOUNDS)
        Global $iGUIMainColumnRight00 = $iGUIMainColumnLeft00Width  ;;left bound of right column
        Global $iGUIMainColumnRight01 = $iGUIMainColumnLeft00Width + 5  ;;left bound of tab control

        Global $iGUIMainColumnRight00Width = $iGUIMainWidthDefault - $iGUIMainColumnLeft00Width  ;;total width of right column holding tab control
        Global $iGUIMainColumnRight01Width = $iGUIMainColumnRight00Width - 15  ;;width of tab control minus spacers

        Global $iGUIMainRowRight00 = 0
        Global $iGUIMainRowRight01 = $iGUIMainRowRight00 + 10  ;;top bound of tab control plus spacer

        Global $iGUIMainRowRight00Height = $iGUIMainHeightDefault
        Global $iGUIMainRowRight01Height = $iGUIMainRowRight00Height - 20  ;;height of tab control minus spacers

    ;;GRID ALL TABS (AREA INSIDE THE TAB CONTROL)
      Global $iGUIMainTabAllChromeTop = 25  ;;offset of top part of tab control chrome (the tabs themselves)
      Global $iGUIMainTabAllChromeBottom = 1  ;;offset of bottom part of tab control chrome
      Global $iGUIMainTabAllChromeLeft = 1  ;;offset of left part of tab control chrome
      Global $iGUIMainTabAllChromeRight = 1  ;;offset of right part of tab control chrome

      Global $iGUIMainTabAllWidthDefault = $iGUIMainColumnRight01Width - $iGUIMainTabAllChromeLeft - $iGUIMainTabAllChromeRight  ;;overall width of space available for tab controls (width of the tab control minus chrome spacing)
      Global $iGUIMainTabAllHeightDefault = $iGUIMainRowRight01Height - $iGUIMainTabAllChromeTop - $iGUIMainTabAllChromeBottom  ;;overall height of space available for tab controls (height of the tab control minus chrome spacing)

      Global $iGUIMainTabAllCheckboxesWidth = 40  ;;standard width of the left elements within a group control (usually a checkbox to the left of an input field)

      ;;GRID ALL TABS (SIZING SHARED BY ALL CONTROLS)
        ;;MISC
        Global $iGUIMainTabAllChromeCheckboxHeight = 17  ;;Height of a checkbox control
        Global $iGUIMainTabAllChromeCheckboxSpacer = 3  ;;Height of space between two checkbox controls
        ;Space after checkbox control
        ;Space between checkbox controls

        ;Height of an input control
        ;Space after input control
        ;Space after common input control (see helpdesk section)

        Global $GUIMainTabAllPadding = 10

        Global $iGUIMainTabAllChromeGroupTop = 18  ;;Space between top of group and first element
        Global $iGUIMainTabAllChromeGroupBottom = 7  ;;Space from last element to bottom of group control

        Global $iGUIMainTabAllRow00 = $iGUIMainRowRight01 + $iGUIMainTabAllChromeTop  ;;top bound of inside of tab control. usable area beneath tabs.
        Global $iGUIMainTabAllRow01 = $iGUIMainTabAllRow00 + 10  ;;top bound of the first control inside the usable tab area.

      ;;GRID ALL TABS LEFT (SIZING SHARED BY ALL LEFT CONTROLS)
        ;;COLUMNS
        Global $iGUIMainTabAllColumnLeft00 = $iGUIMainColumnRight01 + $iGUIMainTabAllChromeLeft  ;;left bound of tab control minus chrome
        Global $iGUIMainTabAllColumnLeft01 = $iGUIMainTabAllColumnLeft00 + 10  ;;left bound of controls in the tab (usually a group boundary)
        Global $iGUIMainTabAllColumnLeft02 = $iGUIMainTabAllColumnLeft01 + 10  ;;left bound of controls in the group (usually a checkbox)
        Global $iGUIMainTabAllColumnLeft03 = $iGUIMainTabAllColumnLeft02 + $iGUIMainTabAllCheckboxesWidth  ;;left bound of controls next to the checkboxes (usually an input field)

        ;;WIDTHS
        Global $iGUIMainTabAllColumnLeft00Width = $iGUIMainTabAllWidthDefault / 2  ;;total width of left column
        Global $iGUIMainTabAllColumnLeft01Width = $iGUIMainTabAllColumnLeft00Width - 15  ;;width of group controls minus spacing
        Global $iGUIMainTabAllColumnLeft02Width = $iGUIMainTabAllCheckboxesWidth  ;;width of checkbox controls
        Global $iGUIMainTabAllColumnLeft03Width = $iGUIMainTabAllColumnLeft01Width - $iGUIMainTabAllColumnLeft02Width - 10  ;;width of input controls. remaining width minus spacers

      ;;GRID ALL TABS RIGHT (SIZING SHARED BY ALL RIGHT CONTROLS)
        ;;COLUMNS
        Global $iGUIMainTabAllColumnRight00 = $iGUIMainTabAllColumnLeft00 + $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabAllColumnRight01 = $iGUIMainTabAllColumnRight00 + 5  ;;left bound of controls in the tab (usually a group boundary)
        Global $iGUIMainTabAllColumnRight02 = $iGUIMainTabAllColumnRight01 + 10  ;;left bound of controls in the group (usually a checkbox)
        Global $iGUIMainTabAllColumnRight03 = $iGUIMainTabAllColumnRight02 + $iGUIMainTabAllCheckboxesWidth  ;;left bound of controls next to the checkboxes (usually an input field)

        ;;WIDTHS
        Global $iGUIMainTabAllColumnRight00Width = $iGUIMainTabAllWidthDefault / 2  ;;total width of right column
        Global $iGUIMainTabAllColumnRight01Width = $iGUIMainTabAllColumnRight00Width - 15  ;;width of group controls minus spacing
        Global $iGUIMainTabAllColumnRight02Width = $iGUIMainTabAllCheckboxesWidth  ;;width of checkbox controls
        Global $iGUIMainTabAllColumnRight03Width = $iGUIMainTabAllColumnLeft01Width - $iGUIMainTabAllColumnRight02Width - 10  ;;width of input controls. remaining width minus spacers

    ;;GRID TAB MAIN (CONTROLS INSIDE THE MAIN TAB)
      ;;GRID GROUP GENERAL (CONTROLS IN THE GENERAL GROUP IN THE MAIN TAB)
        ;;COLUMNS
        Global $iGUIMainTabMainGeneralColumn00      = $iGUIMainTabAllColumnLeft00  ;;left bound of tab control minus chrome
        Global $iGUIMainTabMainGeneralColumn00Width = $iGUIMainTabAllColumnLeft00Width  ;;total width of left column
        Global $iGUIMainTabMainGeneralColumn01      = $iGUIMainTabAllColumnLeft01  ;;left bound of controls in the tab (usually a group boundary)
        Global $iGUIMainTabMainGeneralColumn01Width = $iGUIMainTabAllColumnLeft01Width  ;;width of group controls minus spacing
        Global $iGUIMainTabMainGeneralColumn02      = $iGUIMainTabAllColumnLeft02  ;;left bound of controls in the group (usually a checkbox)
        Global $iGUIMainTabMainGeneralColumn02Width = $iGUIMainTabMainGeneralColumn01Width - 12  ;;width of checkbox controls minus spacing

        ;;ROWS
        Global $iGUIMainTabMainGeneralRow00       = $iGUIMainTabAllRow00  ;;top bound of region for the group box
        Global $iGUIMainTabMainGeneralRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabMainGeneralRow01       = $iGUIMainTabMainGeneralRow00  ;;row holding space between outer region and top of group box
        Global $iGUIMainTabMainGeneralRow01Height = $GUIMainTabAllPadding  ;;row between region and group box
        Global $iGUIMainTabMainGeneralRow02       = $iGUIMainTabMainGeneralRow01 + $iGUIMainTabMainGeneralRow01Height  ;;top bound of the group box
        Global $iGUIMainTabMainGeneralRow02Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabMainGeneralRow03       = $iGUIMainTabMainGeneralRow02  ;;top bound of the row between group box and first checkbox
        Global $iGUIMainTabMainGeneralRow03Height = $iGUIMainTabAllChromeGroupTop  ;;row between top of group and first checkbbox
        Global $iGUIMainTabMainGeneralRow04       = $iGUIMainTabMainGeneralRow03 + $iGUIMainTabMainGeneralRow03Height  ;;first checkbox row
        Global $iGUIMainTabMainGeneralRow04Height = $iGUIMainTabAllChromeCheckboxHeight  ;;first checkbox
        Global $iGUIMainTabMainGeneralRow05       = $iGUIMainTabMainGeneralRow04 + $iGUIMainTabMainGeneralRow04Height  ;;row between first and second checkbox
        Global $iGUIMainTabMainGeneralRow05Height = $iGUIMainTabAllChromeCheckboxSpacer  ;;space between first and second checkbox
        Global $iGUIMainTabMainGeneralRow06       = $iGUIMainTabMainGeneralRow05 + $iGUIMainTabMainGeneralRow05Height  ;;second checkbox row
        Global $iGUIMainTabMainGeneralRow06Height = $iGUIMainTabAllChromeCheckboxHeight  ;;second checkbox
        Global $iGUIMainTabMainGeneralRow07       = $iGUIMainTabMainGeneralRow06 + $iGUIMainTabMainGeneralRow06Height  ;;row between last checkbox and bottom of group
        Global $iGUIMainTabMainGeneralRow07Height = $iGUIMainTabAllChromeGroupBottom  ;;row between last checkbox and bottom of group

        ;;OVERALL
        $iGUIMainTabMainGeneralRow02Height = $iGUIMainTabMainGeneralRow03Height + _
                                             $iGUIMainTabMainGeneralRow04Height + _
                                             $iGUIMainTabMainGeneralRow05Height + _
                                             $iGUIMainTabMainGeneralRow06Height + _
                                             $iGUIMainTabMainGeneralRow07Height
        $iGUIMainTabMainGeneralRow00Height = $iGUIMainTabMainGeneralRow02Height + $iGUIMainTabMainGeneralRow01Height

      ;;GRID GROUP TRAY ICON (CONTROLS IN THE TRAY ICON GROUP OF THE MAIN TAB)
        ;;COLUMNS
        Global $iGUIMainTabMainTrayIconColumn00      = $iGUIMainTabAllColumnLeft00  ;;left bound of tab control minus chrome
        Global $iGUIMainTabMainTrayIconColumn00Width = $iGUIMainTabAllColumnLeft00Width  ;;total width of left column
        Global $iGUIMainTabMainTrayIconColumn01      = $iGUIMainTabAllColumnLeft01  ;;left bound of controls in the tab (usually a group boundary)
        Global $iGUIMainTabMainTrayIconColumn01Width = $iGUIMainTabAllColumnLeft01Width  ;;width of width of group control
        Global $iGUIMainTabMainTrayIconColumn02      = $iGUIMainTabAllColumnLeft02  ;;left bound of controls in the group (usually a checkbox)
        Global $iGUIMainTabMainTrayIconColumn02Width = $iGUIMainTabMainTrayIconColumn01Width - 10  ;;width of checkbox controls minus spacing

        ;;ROWS
        Global $iGUIMainTabMainTrayIconRow00       = $iGUIMainTabMainGeneralRow00 + $iGUIMainTabMainGeneralRow00Height + $GUIMainTabAllPadding
        Global $iGUIMainTabMainTrayIconRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabMainTrayIconRow01       = $iGUIMainTabMainTrayIconRow00  ;;row holding space between outer region and top of group box
        Global $iGUIMainTabMainTrayIconRow01Height = 10  ;;row between region and group box
        Global $iGUIMainTabMainTrayIconRow02       = $iGUIMainTabMainTrayIconRow01  ;;top bound of the group box
        Global $iGUIMainTabMainTrayIconRow02Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabMainTrayIconRow03       = $iGUIMainTabMainTrayIconRow02  ;;top bound of the row between group box and first radio button
        Global $iGUIMainTabMainTrayIconRow03Height = $iGUIMainTabAllChromeGroupTop  ;;row between top of group and first radio button
        Global $iGUIMainTabMainTrayIconRow04       = $iGUIMainTabMainTrayIconRow03 + $iGUIMainTabMainTrayIconRow03Height  ;;radio buttons and images
        Global $iGUIMainTabMainTrayIconRow04Height = 24  ;;height of radio buttons and images
        Global $iGUIMainTabMainTrayIconRow05       = $iGUIMainTabMainTrayIconRow04 + $iGUIMainTabMainTrayIconRow04Height  ;;row before bottom of group
        Global $iGUIMainTabMainTrayIconRow05Height = $iGUIMainTabAllChromeGroupBottom  ;;row before bottom of group

        ;;OVERALL
        $iGUIMainTabMainTrayIconRow02Height = $iGUIMainTabMainTrayIconRow03Height + _
                                              $iGUIMainTabMainTrayIconRow04Height + _
                                              $iGUIMainTabMainTrayIconRow05Height
        $iGUIMainTabMainTrayIconRow00Height = $iGUIMainTabMainTrayIconRow02Height + $iGUIMainTabMainTrayIconRow01Height
  EndFunc

  Func GUIBuild()
    ;;CREATE MAIN GUI
    ;; Requires GUIDefine() to have been ran.

    ;;DECLARE MAIN WINDOW
    Global $hGUIMain = GUICreate('About This Computer Configurator', $iGUIMainWidthDefault, $iGUIMainHeightDefault + $iGUIMainMenuBarHeight, -1, -1)  ;;plus menu bar adjustment

    ;;MENU BAR
      ;;File
        Global $idMenuMainFile = GUICtrlCreateMenu('&File')

        Global $idMenuItemMainFileImport = GUICtrlCreateMenuItem('Import configuration...', $idMenuMainFile, -1)
        Global $idMenuItemMainFileExport = GUICtrlCreateMenuItem('Export configuration...', $idMenuMainFile, -1)
          GUICtrlCreateMenuItem('', $idMenuMainFile, -1) ; create a separator line
        Global $idMenuItemMainFileClose = GUICtrlCreateMenuItem('Exit', $idMenuMainFile, -1)

      ;;Edit
        Global $idMenuMainEdit = GUICtrlCreateMenu('&Edit')

        Global $idMenuItemMainEditCut = GUICtrlCreateMenuItem('Cut', $idMenuMainEdit, -1)
        Global $idMenuItemMainEditCopy = GUICtrlCreateMenuItem('Copy', $idMenuMainEdit, -1)
        Global $idMenuItemMainEditPaste = GUICtrlCreateMenuItem('Paste', $idMenuMainEdit, -1)

      ;;Help
        Global $idMenuMainHelp = GUICtrlCreateMenu('&Help')

        Global $idMenuItemMainHelpDocumentation = GUICtrlCreateMenuItem('Documentation (' & $sAppDocsHost & ')', $idMenuMainHelp, -1)
          GUICtrlCreateMenuItem('', $idMenuMainHelp, -1) ; create a separator line
        Global $idMenuItemMainHelpAbout = GUICtrlCreateMenuItem('About', $idMenuMainHelp, -1)

    ;;MAIN WINDOW ELEMENTS - LEFT
      $idGraphicMainLogo = GUICtrlCreateIcon($sAppLogo, -1, $iGUIMainColumnLeft02 + 12, $iGUIMainRowLeft01, $iGUIMainColumnLeft01Width, $iGUIMainRowLeft01Height, -1, $GUI_WS_EX_PARENTDRAG)

      Global $idButtonMainLeftApply = GUICtrlCreateButton('Apply', $iGUIMainColumnLeft01, $iGUIMainRowLeft03, $iGUIMainColumnLeft02Width, $iGUIMainRowLeft03Height)
      Global $idButtonMainLeftCancel = GUICtrlCreateButton('Cancel', $iGUIMainColumnLeft01, $iGUIMainRowLeft02, $iGUIMainColumnLeft02Width, $iGUIMainRowLeft02Height)

    ;;MAIN WINDOW ELEMENTS - RIGHT
      Global $idTabMain = GUICtrlCreateTab($iGUIMainColumnRight01, $iGUIMainRowRight01, $iGUIMainColumnRight01Width, $iGUIMainRowRight01Height)

      ;;TAB MAIN
        GUICtrlCreateTabItem('Main')

        ;;GROUP GENERAL
          Global $idGroupMainTabMainLeftGeneral = GUICtrlCreateGroup( _
            'General', _
            $iGUIMainTabMainGeneralColumn01, _
            $iGUIMainTabMainGeneralRow02, _
            $iGUIMainTabMainGeneralColumn01Width, _
            $iGUIMainTabMainGeneralRow02Height)
          Global $idCheckboxMainGeneral_StartAtLogin = GUICtrlCreateCheckbox( _
            'Start About This Computer at user login', _
            $iGUIMainTabMainGeneralColumn02, _
            $iGUIMainTabMainGeneralRow04, _
            $iGUIMainTabMainGeneralColumn02Width, _
            $iGUIMainTabMainGeneralRow04Height)
          Global $idCheckboxMainGeneral_DisableExit = GUICtrlCreateCheckbox( _
            'Disable exiting About This Computer', _
            $iGUIMainTabMainGeneralColumn02, _
            $iGUIMainTabMainGeneralRow06, _
            $iGUIMainTabMainGeneralColumn02Width, _
            $iGUIMainTabMainGeneralRow06Height)

        ;;GROUP TRAY ICON
          Local $idGroupMainTabMainLeftTrayIcon = GUICtrlCreateGroup( _
            'Tray Icon', _
            $iGUIMainTabMainTrayIconColumn01, _
            $iGUIMainTabMainTrayIconRow02, _
            $iGUIMainTabMainTrayIconColumn01Width, _
            $iGUIMainTabMainTrayIconRow02Height)

      ;;TAB TOOLS MENU
        GUICtrlCreateTabItem('Tools Menu')

      ;;TAB HELP MENU
        GUICtrlCreateTabItem('Help Menu')

      ;;TAB SERVICES
        GUICtrlCreateTabItem('Services')

      ;;TAB HELPDESK CONTACT FORM
        GUICtrlCreateTabItem('Helpdesk Contact Form')


      GUICtrlCreateTabItem('')  ;;terminate tab structure


    Global $aMainMenus
    Global $aMainButtons

    GUISetState(@SW_SHOW)
  EndFunc
#EndRegion








#Region -- OPERATIONS
  Func GUIWait()
    ;;DISPLAY THE GUI AND WAIT FOR USER INPUT
    Local $idMsg

    While 1
      $idMsg = GUIGetMsg()

      If $idMsg = $GUI_EVENT_CLOSE Then ExitLoop
    WEnd
  EndFunc

  Func MainGUIClose()
    ;;CLOSE MAIN GUI AND RETURN TO TRAY

  EndFunc

  Func GUIRefresh()
    ;;UPDATE MAIN GUI FIELDS

  EndFunc
#EndRegion

#Region -- GUI STATES
  Func GUIMainSetDefaults()
    ;;SET GUI DEFAULTS
    GUIMainSetMenuDefaults()
    GUIMainSetButtonDefaults()
  EndFunc

  Func GUIMainSetBusyDefaults()
    ;;SET GUI BUSY DEFAULTS
    GUIMainSetMenus($GUI_DISABLE)
    GUIMainSetButtons($GUI_DISABLE)
  EndFunc

  Func GUIMainSetMenuDefaults()
    ;;SET MENU DEFAULTS
    GUIMainSetMenus($GUI_ENABLE)
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