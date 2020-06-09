#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Images\BeOS_Customize_info.ico
#AutoIt3Wrapper_Outfile=Compiled\Configurator.exe
#AutoIt3Wrapper_Outfile_x64=Compiled\Configurator_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=About This Computer Configurator
#AutoIt3Wrapper_Res_Description=About This Computer Configurator
#AutoIt3Wrapper_Res_Fileversion=1.0.0.13
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
  #include <ButtonConstants.au3>
  #include <EditConstants.au3>
  #include <FileConstants.au3>
  #include <FontConstants.au3>
  #include <GUIConstantsEx.au3>
  #include <GUIEdit.au3>
  #include <GUIStatusBar.au3>
  #include <MsgBoxConstants.au3>
  #include <StaticConstants.au3>
  #include <StatusBarConstants.au3>
  #include <TrayConstants.au3>
  #include <WindowsConstants.au3>
#EndRegion

Main()  ;;Main application
End()   ;;Exit app gracefully if code should ever find itself here.

#Region -- STARTUP
  Func StartupCoreGlobals()
    ;;DECLARE CORE GLOBALS

    ;;APP INFO
    Global $sAppOrg         = 'briankyncl.com'
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
    Global $sAppParentLogo        = $sAppTempPath & '\ATC-BeOS_Customize_info.ico'

    DirCreate($sAppTempPath)

    ;;APP ASSETS
    FileInstall('Images\BeOS_Customize_wrench.ico', $sAppLogo, $FC_OVERWRITE)
    FileInstall('Images\BeOS_Customize_info.ico', $sAppParentLogo, $FC_OVERWRITE)
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
    Global $GUI_CHECKENABLE = $GUI_CHECKED + $GUI_ENABLE
    Global $GUI_UNCHECKENABLE = $GUI_UNCHECKED + $GUI_ENABLE
    Global $GUI_CHECKDISABLE = $GUI_CHECKED + $GUI_DISABLE
    Global $GUI_UNCHECKDISABLE = $GUI_UNCHECKED + $GUI_DISABLE
    Global $hGUIMain
    Global $lDriveLetters = 'D:|E:|F:|G:|H:|I:|J:|K:|L:|M:|N:|O:|P:|Q:|R:|S:|T:|U:|V:|W:|X:|Y:|Z:'
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

    ;GUILoad('Registry')  ;;refresh GUI to reflect settings from registry
    ;GUILoad('Default')
      ;;Would require _ATC_Customization($sAppRegistryPath, 'Read') to have been ran recently
    ;GUILoad('Validate') --> actually part of GUIState('Ready')

    ;;DISPLAY GUI(s)
    ;; Display main GUI and wait for user input.
    ;GUIState('Default')  ;;Fill and set GUI based on defaults in _ATC_Customization. Otherwise GUI could have "empty" state and break functions.
    ;GUIState('Ready','TabGeneral')  ;;Evaluate selections and enable/disable associated GUI elements.
    ;GUIState('Busy')  ;;Disable all GUI elements
    ;  --> maybe each section of the GUI should have a function for applying a state (busy, ready, disabled?)
    ;_ATC_Customization($sAppRegistryPath, 'Write')
    ;GUIValidate()  ;validate user inputs, bring invalid selections to foreground.

    GUILoad('Default')
    GUIState('Ready')






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
      Global $iGUIMainWidthDefault = 840  ;;900
      Global $iGUIMainHeightDefault = 455
      Global $iGUIMainMenuBarHeight = 20
      Global $iGUIMainStatusBarHeight = 23

      Global $iGUIMainTabAllButtonHeight = 29  ;;height of a standard button
      Global $iGUIMainTabAllButtonHeightLarge = 40  ;;height of a big button

      ;;GRID OVERALL LEFT (BUTTONS AND LOGO)
        Global $iGUIMainColumnLeft00 = 0  ;;left bound of left column
        Global $iGUIMainColumnLeft01 = $iGUIMainColumnLeft00 + 10  ;;buttons
        Global $iGUIMainColumnLeft02 = $iGUIMainColumnLeft00 + 10  ;;image

        Global $iGUIMainColumnLeft00Width = 148  ;;total width of left column holding logo and buttons
        Global $iGUIMainColumnLeft01Width = 128  ;;width of logo image  ;;128
        Global $iGUIMainColumnLeft02Width = $iGUIMainColumnLeft00Width - 15  ;;total width minus spacing for buttons

        Global $iGUIMainRowLeft00 = 0
        Global $iGUIMainRowLeft00Height = $iGUIMainHeightDefault
        Global $iGUIMainRowLeft01 = $iGUIMainRowLeft00 + 20  ;;top bound of logo image
        Global $iGUIMainRowLeft01Height = 128  ;;height of the logo image
        Global $iGUIMainRowLeft02 = $iGUIMainHeightDefault - 10 - $iGUIMainTabAllButtonHeightLarge  ;;top bound of bottom button
        Global $iGUIMainRowLeft02Height = $iGUIMainTabAllButtonHeightLarge ;;height of bottom button  ;;52
        Global $iGUIMainRowLeft03 = $iGUIMainRowLeft02 - 10 - $iGUIMainTabAllButtonHeight  ;;top bound of next button up
        Global $iGUIMainRowLeft03Height = $iGUIMainTabAllButtonHeight  ;;height of next button up  ;;38

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

      Global $iGUIMainTabAllCheckboxesWidth = 125  ;;standard width of the left elements within a group control (usually a checkbox to the left of an input field)

      ;;GRID ALL TABS (SIZING SHARED BY ALL CONTROLS)
        ;;MISC
        Global $iGUIMainTabAllChromeCheckboxHeight = 17  ;;Height of a checkbox control
        Global $iGUIMainTabAllChromeCheckboxSpacer = 3  ;;Height of space between two checkbox controls
        Global $iGUIMainTabAllChromeCheckboxSpacerExterior = 5  ;;Height of space between exterior checkbox and associated group
        Global $iGUIMainTabAllChromeCheckboxSpacerFinal = 7  ;;Height of spacer between last checkbox and group boundary
        Global $iGUIMainTabAllChromeCheckboxOffset = 2  ;;distance to offset checkboxes so they look vertically centered next to label control

        Global $iGUIMainTabAllChromeInputHeight = 21  ;;Height of an input control
        Global $iGUIMainTabAllChromeInputSpacer = 9  ;;Space between unrelated input controls  ;;9
        Global $iGUIMainTabAllChromeInputSpacerSmall = 4  ;;Space between related input controls (as in helpdesk section)  ;;4

        Global $iGUIMainTabAllPaddingVertical = 15
        Global $iGUIMainTabAllPaddingTop = 10

        Global $iGUIMainTabAllChromeGroupTop = 23  ;;Space between top of group and first element  ;;18
        Global $iGUIMainTabAllChromeGroupBottom = 12  ;;Space from last element to bottom of group control  ;;7

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
        Global $iGUIMainTabAllColumnLeft01Width = $iGUIMainTabAllColumnLeft00Width - 15  ;;width of group minus spacing
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
        Global $iGUIMainTabAllColumnRight01Width = $iGUIMainTabAllColumnRight00Width - 17  ;;width of group minus spacing
        Global $iGUIMainTabAllColumnRight02Width = $iGUIMainTabAllCheckboxesWidth  ;;width of checkbox controls
        Global $iGUIMainTabAllColumnRight03Width = $iGUIMainTabAllColumnLeft01Width - $iGUIMainTabAllColumnRight02Width - 12  ;;width of input controls. remaining width minus spacers

    ;;GRID TAB MAIN (CONTROLS INSIDE THE MAIN TAB)
      ;;GRID GROUP GENERAL (CONTROLS IN THE GENERAL GROUP IN THE MAIN TAB)
        ;;COLUMNS
        Global $iGUIMainTabMainGeneralColumn00      = $iGUIMainTabAllColumnLeft00  ;;left bound of tab control minus chrome
        Global $iGUIMainTabMainGeneralColumn00Width = $iGUIMainTabAllColumnLeft00Width  ;;total width of left column
        Global $iGUIMainTabMainGeneralColumn01      = $iGUIMainTabAllColumnLeft01  ;;left bound of controls in the tab (usually a group boundary)
        Global $iGUIMainTabMainGeneralColumn01Width = $iGUIMainTabAllColumnLeft01Width  ;;width of group minus spacing
        Global $iGUIMainTabMainGeneralColumn02      = $iGUIMainTabAllColumnLeft02  ;;left bound of controls in the group (usually a checkbox)
        Global $iGUIMainTabMainGeneralColumn02Width = $iGUIMainTabMainGeneralColumn01Width - 12  ;;width of checkbox controls minus spacing

        ;;ROWS
        Global $iGUIMainTabMainGeneralRow00       = $iGUIMainTabAllRow00  ;;top bound of region for the group box
        Global $iGUIMainTabMainGeneralRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabMainGeneralRow01       = $iGUIMainTabMainGeneralRow00  ;;row holding space between outer region and top of group box
        Global $iGUIMainTabMainGeneralRow01Height = $iGUIMainTabAllPaddingTop  ;;row between region and group box
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
        Global $iGUIMainTabMainGeneralRow07Height = $iGUIMainTabAllChromeCheckboxSpacerFinal  ;;row between last checkbox and bottom of group

        ;;OVERALL
        $iGUIMainTabMainGeneralRow02Height = $iGUIMainTabMainGeneralRow03Height + _
                                             $iGUIMainTabMainGeneralRow04Height + _
                                             $iGUIMainTabMainGeneralRow05Height + _
                                             $iGUIMainTabMainGeneralRow06Height + _
                                             $iGUIMainTabMainGeneralRow07Height
        $iGUIMainTabMainGeneralRow00Height = $iGUIMainTabMainGeneralRow02Height + _
                                             $iGUIMainTabMainGeneralRow01Height

      ;;GRID GROUP TRAY ICON (CONTROLS IN THE TRAY ICON GROUP OF THE MAIN TAB)
        ;;MISC
        Local $iGUIMainTabTrayIconRadioWidth = 20
        Local $iGUIMainTabTrayIconImageWidth = 24
        Local $iGUIMainTabTrayIconSpacerSmall = 0
        Local $iGUIMainTabTrayIconSpacerLarge = 15

        ;;COLUMNS
        Global $iGUIMainTabMainTrayIconColumn00      = $iGUIMainTabAllColumnLeft00  ;;left bound of tab control minus chrome
        Global $iGUIMainTabMainTrayIconColumn00Width = $iGUIMainTabAllColumnLeft00Width  ;;total width of left column
        Global $iGUIMainTabMainTrayIconColumn01      = $iGUIMainTabAllColumnLeft01  ;;left bound of controls in the tab (usually a group boundary)
        Global $iGUIMainTabMainTrayIconColumn01Width = $iGUIMainTabAllColumnLeft01Width  ;;width of width of group control
        Global $iGUIMainTabMainTrayIconColumn02      = $iGUIMainTabAllColumnLeft02  ;;first radio button
        Global $iGUIMainTabMainTrayIconColumn02Width = $iGUIMainTabTrayIconRadioWidth  ;;first radio button
        Global $iGUIMainTabMainTrayIconColumn03      = $iGUIMainTabMainTrayIconColumn02 + $iGUIMainTabMainTrayIconColumn02Width  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn03Width = $iGUIMainTabTrayIconSpacerSmall  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn04      = $iGUIMainTabMainTrayIconColumn03 + $iGUIMainTabMainTrayIconColumn03Width  ;;first image
        Global $iGUIMainTabMainTrayIconColumn04Width = $iGUIMainTabTrayIconImageWidth  ;;first image
        Global $iGUIMainTabMainTrayIconColumn05      = $iGUIMainTabMainTrayIconColumn04 + $iGUIMainTabMainTrayIconColumn04Width  ;;space between first image and second radio button
        Global $iGUIMainTabMainTrayIconColumn05Width = $iGUIMainTabTrayIconSpacerLarge  ;;space between first image and second radio button
        Global $iGUIMainTabMainTrayIconColumn06      = $iGUIMainTabMainTrayIconColumn05 + $iGUIMainTabMainTrayIconColumn05Width  ;;second radio button
        Global $iGUIMainTabMainTrayIconColumn06Width = $iGUIMainTabTrayIconRadioWidth  ;;second radio button
        Global $iGUIMainTabMainTrayIconColumn07      = $iGUIMainTabMainTrayIconColumn06 + $iGUIMainTabMainTrayIconColumn06Width  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn07Width = $iGUIMainTabTrayIconSpacerSmall  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn08      = $iGUIMainTabMainTrayIconColumn07 + $iGUIMainTabMainTrayIconColumn07Width  ;;second image
        Global $iGUIMainTabMainTrayIconColumn08Width = $iGUIMainTabTrayIconImageWidth  ;;second image
        Global $iGUIMainTabMainTrayIconColumn09      = $iGUIMainTabMainTrayIconColumn08 + $iGUIMainTabMainTrayIconColumn08Width  ;;space between second image and third radio button
        Global $iGUIMainTabMainTrayIconColumn09Width = $iGUIMainTabTrayIconSpacerLarge  ;;space between second image and third radio button
        Global $iGUIMainTabMainTrayIconColumn10      = $iGUIMainTabMainTrayIconColumn09 + $iGUIMainTabMainTrayIconColumn09Width  ;;third radio button
        Global $iGUIMainTabMainTrayIconColumn10Width = $iGUIMainTabTrayIconRadioWidth  ;;third radio button
        Global $iGUIMainTabMainTrayIconColumn11      = $iGUIMainTabMainTrayIconColumn10 + $iGUIMainTabMainTrayIconColumn10Width  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn11Width = $iGUIMainTabTrayIconSpacerSmall  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn12      = $iGUIMainTabMainTrayIconColumn11 + $iGUIMainTabMainTrayIconColumn11Width  ;;third image
        Global $iGUIMainTabMainTrayIconColumn12Width = $iGUIMainTabTrayIconImageWidth  ;;third image
        Global $iGUIMainTabMainTrayIconColumn13      = $iGUIMainTabMainTrayIconColumn12 + $iGUIMainTabMainTrayIconColumn12Width  ;;space between second image and fourth radio button
        Global $iGUIMainTabMainTrayIconColumn13Width = $iGUIMainTabTrayIconSpacerLarge  ;;space between second image and fourth radio button
        Global $iGUIMainTabMainTrayIconColumn14      = $iGUIMainTabMainTrayIconColumn13 + $iGUIMainTabMainTrayIconColumn13Width  ;;fourth radio button
        Global $iGUIMainTabMainTrayIconColumn14Width = $iGUIMainTabTrayIconRadioWidth  ;;fourth radio button
        Global $iGUIMainTabMainTrayIconColumn15      = $iGUIMainTabMainTrayIconColumn14 + $iGUIMainTabMainTrayIconColumn14Width  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn15Width = $iGUIMainTabTrayIconSpacerSmall  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn16      = $iGUIMainTabMainTrayIconColumn15 + $iGUIMainTabMainTrayIconColumn15Width  ;;fourth image
        Global $iGUIMainTabMainTrayIconColumn16Width = $iGUIMainTabTrayIconImageWidth  ;;fourth image
        Global $iGUIMainTabMainTrayIconColumn17      = $iGUIMainTabMainTrayIconColumn16 + $iGUIMainTabMainTrayIconColumn16Width  ;;space between second image and fifth radio button
        Global $iGUIMainTabMainTrayIconColumn17Width = $iGUIMainTabTrayIconSpacerLarge  ;;space between second image and fifth radio button
        Global $iGUIMainTabMainTrayIconColumn18      = $iGUIMainTabMainTrayIconColumn17 + $iGUIMainTabMainTrayIconColumn17Width  ;;fifth radio button
        Global $iGUIMainTabMainTrayIconColumn18Width = $iGUIMainTabTrayIconRadioWidth  ;;fifth radio button
        Global $iGUIMainTabMainTrayIconColumn19      = $iGUIMainTabMainTrayIconColumn18 + $iGUIMainTabMainTrayIconColumn18Width  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn19Width = $iGUIMainTabTrayIconSpacerSmall  ;;space between radio button and associated image
        Global $iGUIMainTabMainTrayIconColumn20      = $iGUIMainTabMainTrayIconColumn19 + $iGUIMainTabMainTrayIconColumn19Width  ;;fifth image
        Global $iGUIMainTabMainTrayIconColumn20Width = $iGUIMainTabTrayIconImageWidth  ;;fifth image
        Global $iGUIMainTabMainTrayIconColumn21      = $iGUIMainTabMainTrayIconColumn20 + $iGUIMainTabMainTrayIconColumn20Width  ;;space between second image and sixth radio button
        Global $iGUIMainTabMainTrayIconColumn21Width = $iGUIMainTabTrayIconSpacerLarge  ;;space between second image and sixth radio button

        ;;ROWS
        Global $iGUIMainTabMainTrayIconRow00       = $iGUIMainTabMainGeneralRow00 + $iGUIMainTabMainGeneralRow00Height
        Global $iGUIMainTabMainTrayIconRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabMainTrayIconRow01       = $iGUIMainTabMainTrayIconRow00  ;;row holding space between outer region and top of group box
        Global $iGUIMainTabMainTrayIconRow01Height = $iGUIMainTabAllPaddingVertical  ;;row between region and group box
        Global $iGUIMainTabMainTrayIconRow02       = $iGUIMainTabMainTrayIconRow01 + $iGUIMainTabMainTrayIconRow01Height  ;;group
        Global $iGUIMainTabMainTrayIconRow02Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabMainTrayIconRow03       = $iGUIMainTabMainTrayIconRow02  ;;spacer
        Global $iGUIMainTabMainTrayIconRow03Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabMainTrayIconRow04       = $iGUIMainTabMainTrayIconRow03 + $iGUIMainTabMainTrayIconRow03Height  ;;radio buttons and images
        Global $iGUIMainTabMainTrayIconRow04Height = $iGUIMainTabTrayIconImageWidth
        Global $iGUIMainTabMainTrayIconRow05       = $iGUIMainTabMainTrayIconRow04 + $iGUIMainTabMainTrayIconRow04Height  ;;final spacer
        Global $iGUIMainTabMainTrayIconRow05Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabMainTrayIconRow02Height = $iGUIMainTabMainTrayIconRow03Height + _
                                              $iGUIMainTabMainTrayIconRow04Height + _
                                              $iGUIMainTabMainTrayIconRow05Height
        $iGUIMainTabMainTrayIconRow00Height = $iGUIMainTabMainTrayIconRow02Height + _
                                              $iGUIMainTabMainTrayIconRow01Height

      ;;GRID GROUP ASSET TAG (CONTROLS ASSOCIATED WITH THE ASSET TAG GROUP OF THE MAIN TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabMainAssetTagColumn00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabMainAssetTagColumn00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabMainAssetTagColumn01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabMainAssetTagColumn01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabMainAssetTagColumn02      = $iGUIMainTabAllColumnLeft02  ;;radio button
        Global $iGUIMainTabMainAssetTagColumn02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabMainAssetTagColumn03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabMainAssetTagColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabMainAssetTagRow00       = $iGUIMainTabMainTrayIconRow00 + $iGUIMainTabMainTrayIconRow00Height  ;;top bound of region for the group box
        Global $iGUIMainTabMainAssetTagRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabMainAssetTagRow01       = $iGUIMainTabMainAssetTagRow00  ;;row holding space between outer region and top of group box
        Global $iGUIMainTabMainAssetTagRow01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabMainAssetTagRow02       = $iGUIMainTabMainAssetTagRow01 + $iGUIMainTabMainAssetTagRow01Height  ;;exterior checkbox
        Global $iGUIMainTabMainAssetTagRow02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabMainAssetTagRow03       = $iGUIMainTabMainAssetTagRow02 + $iGUIMainTabMainAssetTagRow02Height  ;;space between exterior checkbox and group
        Global $iGUIMainTabMainAssetTagRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabMainAssetTagRow04       = $iGUIMainTabMainAssetTagRow03 + $iGUIMainTabMainAssetTagRow03Height  ;;group box
        Global $iGUIMainTabMainAssetTagRow04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabMainAssetTagRow05       = $iGUIMainTabMainAssetTagRow04  ;;row between top of group and first checkbox
        Global $iGUIMainTabMainAssetTagRow05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabMainAssetTagRow06       = $iGUIMainTabMainAssetTagRow05 + $iGUIMainTabMainAssetTagRow05Height  ;;"Read from BIOS"
        Global $iGUIMainTabMainAssetTagRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainAssetTagRow07       = $iGUIMainTabMainAssetTagRow06 + $iGUIMainTabMainAssetTagRow06Height  ;;spacer
        Global $iGUIMainTabMainAssetTagRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabMainAssetTagRow08       = $iGUIMainTabMainAssetTagRow07 + $iGUIMainTabMainAssetTagRow07Height  ;;"Custom:"
        Global $iGUIMainTabMainAssetTagRow08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainAssetTagRow09       = $iGUIMainTabMainAssetTagRow08 + $iGUIMainTabMainAssetTagRow08Height  ;;final spacer
        Global $iGUIMainTabMainAssetTagRow09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabMainAssetTagRow04Height = $iGUIMainTabMainAssetTagRow05Height + _
                                              $iGUIMainTabMainAssetTagRow06Height + _
                                              $iGUIMainTabMainAssetTagRow07Height + _
                                              $iGUIMainTabMainAssetTagRow08Height + _
                                              $iGUIMainTabMainAssetTagRow09Height
        $iGUIMainTabMainAssetTagRow00Height = $iGUIMainTabMainAssetTagRow04Height + _
                                              $iGUIMainTabMainAssetTagRow01Height + _
                                              $iGUIMainTabMainAssetTagRow02Height + _
                                              $iGUIMainTabMainAssetTagRow03Height

      ;;GRID GROUP CUSTOM DETAILS (CONTROLS ASSOCIATED WITH THE CUSTOM DETAILS GROUP OF THE MAIN TAB)
        ;;MISC
          ;;Width and height of this edit control should visually match the real box in About This Computer.

        ;;COLUMNS
        Global $iGUIMainTabMainCustomDetailsColumn00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabMainCustomDetailsColumn00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabMainCustomDetailsColumn01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabMainCustomDetailsColumn01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabMainCustomDetailsColumn02      = $iGUIMainTabAllColumnLeft02  ;;edit control
        Global $iGUIMainTabMainCustomDetailsColumn02Width = 296 ;;$iGUIMainTabMainCustomDetailsColumn01Width - 22

        Global $iGUIMainTabMainCustomDetailsColumn02Offset = (($iGUIMainTabMainCustomDetailsColumn01Width - 22) - $iGUIMainTabMainCustomDetailsColumn02Width) / 2

        ;;ROWS
        Global $iGUIMainTabMainCustomDetailsRow00       = $iGUIMainTabMainAssetTagRow00 + $iGUIMainTabMainAssetTagRow00Height  ;;top bound of region for the group box
        Global $iGUIMainTabMainCustomDetailsRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabMainCustomDetailsRow01       = $iGUIMainTabMainCustomDetailsRow00  ;;row holding space between outer region and top of group box
        Global $iGUIMainTabMainCustomDetailsRow01Height = $iGUIMainTabAllPaddingVertical  ;;row between region and exterior checkbox
        Global $iGUIMainTabMainCustomDetailsRow02       = $iGUIMainTabMainCustomDetailsRow01 + $iGUIMainTabMainCustomDetailsRow01Height  ;;exterior checkbox
        Global $iGUIMainTabMainCustomDetailsRow02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabMainCustomDetailsRow03       = $iGUIMainTabMainCustomDetailsRow02 + $iGUIMainTabMainCustomDetailsRow02Height  ;;space between exterior checkbox and group
        Global $iGUIMainTabMainCustomDetailsRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabMainCustomDetailsRow04       = $iGUIMainTabMainCustomDetailsRow03 + $iGUIMainTabMainCustomDetailsRow03Height  ;;group box
        Global $iGUIMainTabMainCustomDetailsRow04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabMainCustomDetailsRow05       = $iGUIMainTabMainCustomDetailsRow04  ;;row between top of group and first checkbox
        Global $iGUIMainTabMainCustomDetailsRow05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabMainCustomDetailsRow06       = $iGUIMainTabMainCustomDetailsRow05 + $iGUIMainTabMainCustomDetailsRow05Height  ;;Edit control
        Global $iGUIMainTabMainCustomDetailsRow06Height = 58
        Global $iGUIMainTabMainCustomDetailsRow07       = $iGUIMainTabMainCustomDetailsRow06 + $iGUIMainTabMainCustomDetailsRow06Height  ;;final spacer
        Global $iGUIMainTabMainCustomDetailsRow07Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabMainCustomDetailsRow04Height = $iGUIMainTabMainCustomDetailsRow05Height + _
                                                   $iGUIMainTabMainCustomDetailsRow06Height + _
                                                   $iGUIMainTabMainCustomDetailsRow07Height
        $iGUIMainTabMainCustomDetailsRow00Height = $iGUIMainTabMainCustomDetailsRow04Height + _
                                                   $iGUIMainTabMainCustomDetailsRow01Height + _
                                                   $iGUIMainTabMainCustomDetailsRow02Height + _
                                                   $iGUIMainTabMainCustomDetailsRow03Height

      ;;GRID GROUP HELPDESK (CONTROLS ASSOCIATED WITH THE HELPDESK GROUP OF THE MAIN TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabMainHelpdeskColumn00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabMainHelpdeskColumn00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabMainHelpdeskColumn01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabMainHelpdeskColumn01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabMainHelpdeskColumn02      = $iGUIMainTabAllColumnRight02  ;;checkbox
        Global $iGUIMainTabMainHelpdeskColumn02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabMainHelpdeskColumn03      = $iGUIMainTabAllColumnRight03  ;;input
        Global $iGUIMainTabMainHelpdeskColumn03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabMainHelpdeskRow00       = $iGUIMainTabAllRow00  ;;top bound of region
        Global $iGUIMainTabMainHelpdeskRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabMainHelpdeskRow01       = $iGUIMainTabMainHelpdeskRow00  ;;row holding space between outer region and top of group box
        Global $iGUIMainTabMainHelpdeskRow01Height = $iGUIMainTabAllPaddingTop  ;;row between region and exterior checkbox
        Global $iGUIMainTabMainHelpdeskRow02       = $iGUIMainTabMainHelpdeskRow01 + $iGUIMainTabMainHelpdeskRow01Height  ;;exterior checkbox
        Global $iGUIMainTabMainHelpdeskRow02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabMainHelpdeskRow03       = $iGUIMainTabMainHelpdeskRow02 + $iGUIMainTabMainHelpdeskRow02Height  ;;space between exterior checkbox and group
        Global $iGUIMainTabMainHelpdeskRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabMainHelpdeskRow04       = $iGUIMainTabMainHelpdeskRow03 + $iGUIMainTabMainHelpdeskRow03Height  ;;group box
        Global $iGUIMainTabMainHelpdeskRow04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabMainHelpdeskRow05       = $iGUIMainTabMainHelpdeskRow04  ;;row between top of group and first checkbox
        Global $iGUIMainTabMainHelpdeskRow05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabMainHelpdeskRow06       = $iGUIMainTabMainHelpdeskRow05 + $iGUIMainTabMainHelpdeskRow05Height  ;;"Title:"
        Global $iGUIMainTabMainHelpdeskRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow07       = $iGUIMainTabMainHelpdeskRow06 + $iGUIMainTabMainHelpdeskRow06Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow07Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabMainHelpdeskRow08       = $iGUIMainTabMainHelpdeskRow07 + $iGUIMainTabMainHelpdeskRow07Height  ;;"Show Email"
        Global $iGUIMainTabMainHelpdeskRow08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow09       = $iGUIMainTabMainHelpdeskRow08 + $iGUIMainTabMainHelpdeskRow08Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow09Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabMainHelpdeskRow10       = $iGUIMainTabMainHelpdeskRow09 + $iGUIMainTabMainHelpdeskRow09Height  ;;input box
        Global $iGUIMainTabMainHelpdeskRow10Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow11       = $iGUIMainTabMainHelpdeskRow10 + $iGUIMainTabMainHelpdeskRow10Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow11Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabMainHelpdeskRow12       = $iGUIMainTabMainHelpdeskRow11 + $iGUIMainTabMainHelpdeskRow11Height  ;;"Show Phone"
        Global $iGUIMainTabMainHelpdeskRow12Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow13       = $iGUIMainTabMainHelpdeskRow12 + $iGUIMainTabMainHelpdeskRow12Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow13Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabMainHelpdeskRow14       = $iGUIMainTabMainHelpdeskRow13 + $iGUIMainTabMainHelpdeskRow13Height  ;;input box
        Global $iGUIMainTabMainHelpdeskRow14Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow15       = $iGUIMainTabMainHelpdeskRow14 + $iGUIMainTabMainHelpdeskRow14Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow15Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabMainHelpdeskRow16       = $iGUIMainTabMainHelpdeskRow15 + $iGUIMainTabMainHelpdeskRow15Height  ;;"Show Website"
        Global $iGUIMainTabMainHelpdeskRow16Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow17       = $iGUIMainTabMainHelpdeskRow16 + $iGUIMainTabMainHelpdeskRow16Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow17Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabMainHelpdeskRow18       = $iGUIMainTabMainHelpdeskRow17 + $iGUIMainTabMainHelpdeskRow17Height  ;;input box
        Global $iGUIMainTabMainHelpdeskRow18Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow19       = $iGUIMainTabMainHelpdeskRow18 + $iGUIMainTabMainHelpdeskRow18Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow19Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabMainHelpdeskRow20       = $iGUIMainTabMainHelpdeskRow19 + $iGUIMainTabMainHelpdeskRow19Height  ;;"Show Alternate"
        Global $iGUIMainTabMainHelpdeskRow20Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow21       = $iGUIMainTabMainHelpdeskRow20 + $iGUIMainTabMainHelpdeskRow20Height  ;;spacer
        Global $iGUIMainTabMainHelpdeskRow21Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabMainHelpdeskRow22       = $iGUIMainTabMainHelpdeskRow21 + $iGUIMainTabMainHelpdeskRow21Height  ;;input box
        Global $iGUIMainTabMainHelpdeskRow22Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabMainHelpdeskRow23       = $iGUIMainTabMainHelpdeskRow22 + $iGUIMainTabMainHelpdeskRow22Height  ;;final spacer
        Global $iGUIMainTabMainHelpdeskRow23Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabMainHelpdeskRow04Height = $iGUIMainTabMainHelpdeskRow05Height + _
                                              $iGUIMainTabMainHelpdeskRow06Height + _
                                              $iGUIMainTabMainHelpdeskRow07Height + _
                                              $iGUIMainTabMainHelpdeskRow08Height + _
                                              $iGUIMainTabMainHelpdeskRow09Height + _
                                              $iGUIMainTabMainHelpdeskRow10Height + _
                                              $iGUIMainTabMainHelpdeskRow11Height + _
                                              $iGUIMainTabMainHelpdeskRow12Height + _
                                              $iGUIMainTabMainHelpdeskRow13Height + _
                                              $iGUIMainTabMainHelpdeskRow14Height + _
                                              $iGUIMainTabMainHelpdeskRow15Height + _
                                              $iGUIMainTabMainHelpdeskRow16Height + _
                                              $iGUIMainTabMainHelpdeskRow17Height + _
                                              $iGUIMainTabMainHelpdeskRow18Height + _
                                              $iGUIMainTabMainHelpdeskRow19Height + _
                                              $iGUIMainTabMainHelpdeskRow20Height + _
                                              $iGUIMainTabMainHelpdeskRow21Height + _
                                              $iGUIMainTabMainHelpdeskRow22Height + _
                                              $iGUIMainTabMainHelpdeskRow23Height
        $iGUIMainTabMainHelpdeskRow00Height = $iGUIMainTabMainHelpdeskRow04Height + _
                                              $iGUIMainTabMainHelpdeskRow01Height + _
                                              $iGUIMainTabMainHelpdeskRow02Height + _
                                              $iGUIMainTabMainHelpdeskRow03Height

    ;;GRID TAB TOOLS (CONTROLS INSIDE THE TOOLS TAB)
      ;;GRID GROUP GENERAL (CONTROLS IN THE GENERAL GROUP IN THE TOOLS TAB)
        ;;COLUMNS
        Global $iGUIMainTabToolsGeneralColumn00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabToolsGeneralColumn00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabToolsGeneralColumn01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabToolsGeneralColumn01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabToolsGeneralColumn02      = $iGUIMainTabAllColumnLeft02  ;;checkboxes left
        Global $iGUIMainTabToolsGeneralColumn02Width = ($iGUIMainTabToolsGeneralColumn01Width / 2) - 6
        Global $iGUIMainTabToolsGeneralColumn03      = $iGUIMainTabToolsGeneralColumn02 + $iGUIMainTabToolsGeneralColumn02Width  ;;checkboxes right
        Global $iGUIMainTabToolsGeneralColumn03Width = $iGUIMainTabToolsGeneralColumn02Width

        ;;ROWS
        Global $iGUIMainTabToolsGeneralRow00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabToolsGeneralRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabToolsGeneralRow01       = $iGUIMainTabToolsGeneralRow00  ;;spacer
        Global $iGUIMainTabToolsGeneralRow01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabToolsGeneralRow02       = $iGUIMainTabToolsGeneralRow01 + $iGUIMainTabToolsGeneralRow01Height  ;;exterior checkbox
        Global $iGUIMainTabToolsGeneralRow02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsGeneralRow03       = $iGUIMainTabToolsGeneralRow02 + $iGUIMainTabToolsGeneralRow02Height  ;;spacer
        Global $iGUIMainTabToolsGeneralRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabToolsGeneralRow04       = $iGUIMainTabToolsGeneralRow03 + $iGUIMainTabToolsGeneralRow03Height  ;;group
        Global $iGUIMainTabToolsGeneralRow04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabToolsGeneralRow05       = $iGUIMainTabToolsGeneralRow04  ;;spacer
        Global $iGUIMainTabToolsGeneralRow05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabToolsGeneralRow06       = $iGUIMainTabToolsGeneralRow05 + $iGUIMainTabToolsGeneralRow05Height  ;;Credential Manager
        Global $iGUIMainTabToolsGeneralRow06Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsGeneralRow07       = $iGUIMainTabToolsGeneralRow06 + $iGUIMainTabToolsGeneralRow06Height  ;;spacer
        Global $iGUIMainTabToolsGeneralRow07Height = $iGUIMainTabAllChromeCheckboxSpacer
        Global $iGUIMainTabToolsGeneralRow08       = $iGUIMainTabToolsGeneralRow07 + $iGUIMainTabToolsGeneralRow07Height  ;;Device Manager
        Global $iGUIMainTabToolsGeneralRow08Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsGeneralRow09       = $iGUIMainTabToolsGeneralRow08 + $iGUIMainTabToolsGeneralRow08Height  ;;spacer
        Global $iGUIMainTabToolsGeneralRow09Height = $iGUIMainTabAllChromeCheckboxSpacer
        Global $iGUIMainTabToolsGeneralRow10       = $iGUIMainTabToolsGeneralRow09 + $iGUIMainTabToolsGeneralRow09Height  ;;Devices and Printers
        Global $iGUIMainTabToolsGeneralRow10Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsGeneralRow11       = $iGUIMainTabToolsGeneralRow10 + $iGUIMainTabToolsGeneralRow10Height  ;;spacer
        Global $iGUIMainTabToolsGeneralRow11Height = $iGUIMainTabAllChromeCheckboxSpacer
        Global $iGUIMainTabToolsGeneralRow12       = $iGUIMainTabToolsGeneralRow11 + $iGUIMainTabToolsGeneralRow11Height  ;;Internet Options
        Global $iGUIMainTabToolsGeneralRow12Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsGeneralRow13       = $iGUIMainTabToolsGeneralRow12 + $iGUIMainTabToolsGeneralRow12Height  ;;spacer
        Global $iGUIMainTabToolsGeneralRow13Height = $iGUIMainTabAllChromeCheckboxSpacer
        Global $iGUIMainTabToolsGeneralRow14       = $iGUIMainTabToolsGeneralRow13 + $iGUIMainTabToolsGeneralRow13Height  ;;Mail Accounts
        Global $iGUIMainTabToolsGeneralRow14Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsGeneralRow15       = $iGUIMainTabToolsGeneralRow14 + $iGUIMainTabToolsGeneralRow14Height  ;;spacer
        Global $iGUIMainTabToolsGeneralRow15Height = $iGUIMainTabAllChromeCheckboxSpacer
        Global $iGUIMainTabToolsGeneralRow16       = $iGUIMainTabToolsGeneralRow15 + $iGUIMainTabToolsGeneralRow15Height  ;;Network Connections
        Global $iGUIMainTabToolsGeneralRow16Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsGeneralRow17       = $iGUIMainTabToolsGeneralRow16 + $iGUIMainTabToolsGeneralRow16Height  ;;final spacer
        Global $iGUIMainTabToolsGeneralRow17Height = $iGUIMainTabAllChromeCheckboxSpacerFinal

        ;;OVERALL
        $iGUIMainTabToolsGeneralRow04Height = $iGUIMainTabToolsGeneralRow05Height + _
                                              $iGUIMainTabToolsGeneralRow06Height + _
                                              $iGUIMainTabToolsGeneralRow07Height + _
                                              $iGUIMainTabToolsGeneralRow08Height + _
                                              $iGUIMainTabToolsGeneralRow09Height + _
                                              $iGUIMainTabToolsGeneralRow10Height + _
                                              $iGUIMainTabToolsGeneralRow11Height + _
                                              $iGUIMainTabToolsGeneralRow12Height + _
                                              $iGUIMainTabToolsGeneralRow13Height + _
                                              $iGUIMainTabToolsGeneralRow14Height + _
                                              $iGUIMainTabToolsGeneralRow15Height + _
                                              $iGUIMainTabToolsGeneralRow16Height + _
                                              $iGUIMainTabToolsGeneralRow17Height
        $iGUIMainTabToolsGeneralRow00Height = $iGUIMainTabToolsGeneralRow04Height + _
                                              $iGUIMainTabToolsGeneralRow01Height + _
                                              $iGUIMainTabToolsGeneralRow02Height + _
                                              $iGUIMainTabToolsGeneralRow03Height

      ;;GRID GROUP LOGIN SCRIPT (CONTROLS ASSOCIATED WITH THE LOGIN SCRIPT GROUP OF THE TOOLS TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabToolsLoginScriptColumn00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabToolsLoginScriptColumn00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabToolsLoginScriptColumn01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabToolsLoginScriptColumn01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabToolsLoginScriptColumn02      = $iGUIMainTabAllColumnLeft02  ;;radio button
        Global $iGUIMainTabToolsLoginScriptColumn02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabToolsLoginScriptColumn03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabToolsLoginScriptColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabToolsLoginScriptRow00       = $iGUIMainTabToolsGeneralRow00 + $iGUIMainTabToolsGeneralRow00Height  ;;region
        Global $iGUIMainTabToolsLoginScriptRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabToolsLoginScriptRow01       = $iGUIMainTabToolsLoginScriptRow00  ;;spacer
        Global $iGUIMainTabToolsLoginScriptRow01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabToolsLoginScriptRow02       = $iGUIMainTabToolsLoginScriptRow01 + $iGUIMainTabToolsLoginScriptRow01Height  ;;exterior checkbox
        Global $iGUIMainTabToolsLoginScriptRow02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsLoginScriptRow03       = $iGUIMainTabToolsLoginScriptRow02 + $iGUIMainTabToolsLoginScriptRow02Height  ;;spacer
        Global $iGUIMainTabToolsLoginScriptRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabToolsLoginScriptRow04       = $iGUIMainTabToolsLoginScriptRow03 + $iGUIMainTabToolsLoginScriptRow03Height  ;;group
        Global $iGUIMainTabToolsLoginScriptRow04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabToolsLoginScriptRow05       = $iGUIMainTabToolsLoginScriptRow04  ;;spacer
        Global $iGUIMainTabToolsLoginScriptRow05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabToolsLoginScriptRow06       = $iGUIMainTabToolsLoginScriptRow05 + $iGUIMainTabToolsLoginScriptRow05Height  ;;"Read from Active Directory"
        Global $iGUIMainTabToolsLoginScriptRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabToolsLoginScriptRow07       = $iGUIMainTabToolsLoginScriptRow06 + $iGUIMainTabToolsLoginScriptRow06Height  ;;spacer
        Global $iGUIMainTabToolsLoginScriptRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabToolsLoginScriptRow08       = $iGUIMainTabToolsLoginScriptRow07 + $iGUIMainTabToolsLoginScriptRow07Height  ;;"Custom:"
        Global $iGUIMainTabToolsLoginScriptRow08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabToolsLoginScriptRow09       = $iGUIMainTabToolsLoginScriptRow08 + $iGUIMainTabToolsLoginScriptRow08Height  ;;final spacer
        Global $iGUIMainTabToolsLoginScriptRow09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabToolsLoginScriptRow04Height = $iGUIMainTabToolsLoginScriptRow05Height + _
                                                  $iGUIMainTabToolsLoginScriptRow06Height + _
                                                  $iGUIMainTabToolsLoginScriptRow07Height + _
                                                  $iGUIMainTabToolsLoginScriptRow08Height + _
                                                  $iGUIMainTabToolsLoginScriptRow09Height
        $iGUIMainTabToolsLoginScriptRow00Height = $iGUIMainTabToolsLoginScriptRow04Height + _
                                                  $iGUIMainTabToolsLoginScriptRow01Height + _
                                                  $iGUIMainTabToolsLoginScriptRow02Height + _
                                                  $iGUIMainTabToolsLoginScriptRow03Height

      ;;GRID GROUP HOME DRIVE (CONTROLS ASSOCIATED WITH THE HOME DRIVE GROUP OF THE TOOLS TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabToolsHomeDriveColumn00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabToolsHomeDriveColumn00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabToolsHomeDriveColumn01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabToolsHomeDriveColumn01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabToolsHomeDriveColumn02      = $iGUIMainTabAllColumnRight02  ;;radio button
        Global $iGUIMainTabToolsHomeDriveColumn02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabToolsHomeDriveColumn03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabToolsHomeDriveColumn03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabToolsHomeDriveRow00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabToolsHomeDriveRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabToolsHomeDriveRow01       = $iGUIMainTabToolsHomeDriveRow00  ;;spacer
        Global $iGUIMainTabToolsHomeDriveRow01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabToolsHomeDriveRow02       = $iGUIMainTabToolsHomeDriveRow01 + $iGUIMainTabToolsHomeDriveRow01Height  ;;exterior checkbox
        Global $iGUIMainTabToolsHomeDriveRow02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabToolsHomeDriveRow03       = $iGUIMainTabToolsHomeDriveRow02 + $iGUIMainTabToolsHomeDriveRow02Height  ;;spacer
        Global $iGUIMainTabToolsHomeDriveRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabToolsHomeDriveRow04       = $iGUIMainTabToolsHomeDriveRow03 + $iGUIMainTabToolsHomeDriveRow03Height  ;;group
        Global $iGUIMainTabToolsHomeDriveRow04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabToolsHomeDriveRow05       = $iGUIMainTabToolsHomeDriveRow04  ;;spacer
        Global $iGUIMainTabToolsHomeDriveRow05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabToolsHomeDriveRow06       = $iGUIMainTabToolsHomeDriveRow05 + $iGUIMainTabToolsHomeDriveRow05Height  ;;"Title:"
        Global $iGUIMainTabToolsHomeDriveRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabToolsHomeDriveRow07       = $iGUIMainTabToolsHomeDriveRow06 + $iGUIMainTabToolsHomeDriveRow06Height  ;;spacer
        Global $iGUIMainTabToolsHomeDriveRow07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabToolsHomeDriveRow08       = $iGUIMainTabToolsHomeDriveRow07 + $iGUIMainTabToolsHomeDriveRow07Height  ;;"Read from Active Directory"
        Global $iGUIMainTabToolsHomeDriveRow08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabToolsHomeDriveRow09       = $iGUIMainTabToolsHomeDriveRow08 + $iGUIMainTabToolsHomeDriveRow08Height  ;;spacer
        Global $iGUIMainTabToolsHomeDriveRow09Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabToolsHomeDriveRow10       = $iGUIMainTabToolsHomeDriveRow09 + $iGUIMainTabToolsHomeDriveRow09Height  ;;"Map Drive"
        Global $iGUIMainTabToolsHomeDriveRow10Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabToolsHomeDriveRow11       = $iGUIMainTabToolsHomeDriveRow10 + $iGUIMainTabToolsHomeDriveRow10Height  ;;spacer
        Global $iGUIMainTabToolsHomeDriveRow11Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabToolsHomeDriveRow12       = $iGUIMainTabToolsHomeDriveRow11 + $iGUIMainTabToolsHomeDriveRow11Height  ;;"Create and Open"
        Global $iGUIMainTabToolsHomeDriveRow12Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabToolsHomeDriveRow13       = $iGUIMainTabToolsHomeDriveRow12 + $iGUIMainTabToolsHomeDriveRow12Height  ;;spacer
        Global $iGUIMainTabToolsHomeDriveRow13Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabToolsHomeDriveRow14       = $iGUIMainTabToolsHomeDriveRow13 + $iGUIMainTabToolsHomeDriveRow13Height  ;;Shortcut Name
        Global $iGUIMainTabToolsHomeDriveRow14Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabToolsHomeDriveRow15       = $iGUIMainTabToolsHomeDriveRow14 + $iGUIMainTabToolsHomeDriveRow14Height  ;;final spacer
        Global $iGUIMainTabToolsHomeDriveRow15Height = $iGUIMainTabAllChromeGroupBottom  ;;10

        ;;OVERALL
        $iGUIMainTabToolsHomeDriveRow04Height = $iGUIMainTabToolsHomeDriveRow05Height + _
                                                $iGUIMainTabToolsHomeDriveRow06Height + _
                                                $iGUIMainTabToolsHomeDriveRow07Height + _
                                                $iGUIMainTabToolsHomeDriveRow08Height + _
                                                $iGUIMainTabToolsHomeDriveRow09Height + _
                                                $iGUIMainTabToolsHomeDriveRow10Height + _
                                                $iGUIMainTabToolsHomeDriveRow11Height + _
                                                $iGUIMainTabToolsHomeDriveRow12Height + _
                                                $iGUIMainTabToolsHomeDriveRow13Height + _
                                                $iGUIMainTabToolsHomeDriveRow14Height + _
                                                $iGUIMainTabToolsHomeDriveRow15Height
        $iGUIMainTabToolsHomeDriveRow00Height = $iGUIMainTabToolsHomeDriveRow04Height + _
                                                $iGUIMainTabToolsHomeDriveRow01Height + _
                                                $iGUIMainTabToolsHomeDriveRow02Height + _
                                                $iGUIMainTabToolsHomeDriveRow03Height

    ;;GRID TAB CUSTOM TOOLS (CONTROLS INSIDE THE CUSTOM TOOLS TAB)
      ;;GRID GROUP CUSTOM TOOL 1 (CONTROLS ASSOCIATED WITH THE CUSTOM TOOL 1 GROUP OF THE CUSTOM TOOLS TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabCustomToolsCommand1Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabCustomToolsCommand1Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabCustomToolsCommand1Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabCustomToolsCommand1Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabCustomToolsCommand1Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabCustomToolsCommand1Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabCustomToolsCommand1Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabCustomToolsCommand1Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabCustomToolsCommand1Row00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabCustomToolsCommand1Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabCustomToolsCommand1Row01       = $iGUIMainTabCustomToolsCommand1Row00  ;;spacer
        Global $iGUIMainTabCustomToolsCommand1Row01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabCustomToolsCommand1Row02       = $iGUIMainTabCustomToolsCommand1Row01 + $iGUIMainTabCustomToolsCommand1Row01Height  ;;exterior checkbox
        Global $iGUIMainTabCustomToolsCommand1Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabCustomToolsCommand1Row03       = $iGUIMainTabCustomToolsCommand1Row02 + $iGUIMainTabCustomToolsCommand1Row02Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand1Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabCustomToolsCommand1Row04       = $iGUIMainTabCustomToolsCommand1Row03 + $iGUIMainTabCustomToolsCommand1Row03Height  ;;group
        Global $iGUIMainTabCustomToolsCommand1Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabCustomToolsCommand1Row05       = $iGUIMainTabCustomToolsCommand1Row04  ;;spacer
        Global $iGUIMainTabCustomToolsCommand1Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabCustomToolsCommand1Row06       = $iGUIMainTabCustomToolsCommand1Row05 + $iGUIMainTabCustomToolsCommand1Row05Height  ;;"Display Name:"
        Global $iGUIMainTabCustomToolsCommand1Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand1Row07       = $iGUIMainTabCustomToolsCommand1Row06 + $iGUIMainTabCustomToolsCommand1Row06Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand1Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabCustomToolsCommand1Row08       = $iGUIMainTabCustomToolsCommand1Row07 + $iGUIMainTabCustomToolsCommand1Row07Height  ;;"URL:"
        Global $iGUIMainTabCustomToolsCommand1Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand1Row09       = $iGUIMainTabCustomToolsCommand1Row08 + $iGUIMainTabCustomToolsCommand1Row08Height  ;;final spacer
        Global $iGUIMainTabCustomToolsCommand1Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabCustomToolsCommand1Row04Height = $iGUIMainTabCustomToolsCommand1Row05Height + _
                                           $iGUIMainTabCustomToolsCommand1Row06Height + _
                                           $iGUIMainTabCustomToolsCommand1Row07Height + _
                                           $iGUIMainTabCustomToolsCommand1Row08Height + _
                                           $iGUIMainTabCustomToolsCommand1Row09Height
        $iGUIMainTabCustomToolsCommand1Row00Height = $iGUIMainTabCustomToolsCommand1Row04Height + _
                                           $iGUIMainTabCustomToolsCommand1Row01Height + _
                                           $iGUIMainTabCustomToolsCommand1Row02Height + _
                                           $iGUIMainTabCustomToolsCommand1Row03Height

      ;;GRID GROUP CUSTOM TOOL 2 (CONTROLS ASSOCIATED WITH THE CUSTOM TOOL 2 GROUP OF THE CUSTOM TOOLS TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabCustomToolsCommand2Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabCustomToolsCommand2Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabCustomToolsCommand2Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabCustomToolsCommand2Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabCustomToolsCommand2Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabCustomToolsCommand2Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabCustomToolsCommand2Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabCustomToolsCommand2Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabCustomToolsCommand2Row00       = $iGUIMainTabCustomToolsCommand1Row00 + $iGUIMainTabCustomToolsCommand1Row00Height  ;;region
        Global $iGUIMainTabCustomToolsCommand2Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabCustomToolsCommand2Row01       = $iGUIMainTabCustomToolsCommand2Row00  ;;spacer
        Global $iGUIMainTabCustomToolsCommand2Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabCustomToolsCommand2Row02       = $iGUIMainTabCustomToolsCommand2Row01 + $iGUIMainTabCustomToolsCommand2Row01Height  ;;exterior checkbox
        Global $iGUIMainTabCustomToolsCommand2Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabCustomToolsCommand2Row03       = $iGUIMainTabCustomToolsCommand2Row02 + $iGUIMainTabCustomToolsCommand2Row02Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand2Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabCustomToolsCommand2Row04       = $iGUIMainTabCustomToolsCommand2Row03 + $iGUIMainTabCustomToolsCommand2Row03Height  ;;group
        Global $iGUIMainTabCustomToolsCommand2Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabCustomToolsCommand2Row05       = $iGUIMainTabCustomToolsCommand2Row04  ;;spacer
        Global $iGUIMainTabCustomToolsCommand2Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabCustomToolsCommand2Row06       = $iGUIMainTabCustomToolsCommand2Row05 + $iGUIMainTabCustomToolsCommand2Row05Height  ;;"Display Name:"
        Global $iGUIMainTabCustomToolsCommand2Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand2Row07       = $iGUIMainTabCustomToolsCommand2Row06 + $iGUIMainTabCustomToolsCommand2Row06Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand2Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabCustomToolsCommand2Row08       = $iGUIMainTabCustomToolsCommand2Row07 + $iGUIMainTabCustomToolsCommand2Row07Height  ;;"URL:"
        Global $iGUIMainTabCustomToolsCommand2Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand2Row09       = $iGUIMainTabCustomToolsCommand2Row08 + $iGUIMainTabCustomToolsCommand2Row08Height  ;;final spacer
        Global $iGUIMainTabCustomToolsCommand2Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabCustomToolsCommand2Row04Height = $iGUIMainTabCustomToolsCommand2Row05Height + _
                                           $iGUIMainTabCustomToolsCommand2Row06Height + _
                                           $iGUIMainTabCustomToolsCommand2Row07Height + _
                                           $iGUIMainTabCustomToolsCommand2Row08Height + _
                                           $iGUIMainTabCustomToolsCommand2Row09Height
        $iGUIMainTabCustomToolsCommand2Row00Height = $iGUIMainTabCustomToolsCommand2Row04Height + _
                                           $iGUIMainTabCustomToolsCommand2Row01Height + _
                                           $iGUIMainTabCustomToolsCommand2Row02Height + _
                                           $iGUIMainTabCustomToolsCommand2Row03Height

      ;;GRID GROUP CUSTOM TOOL 3 (CONTROLS ASSOCIATED WITH THE CUSTOM TOOL 3 GROUP OF THE CUSTOM TOOLS TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabCustomToolsCommand3Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabCustomToolsCommand3Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabCustomToolsCommand3Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabCustomToolsCommand3Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabCustomToolsCommand3Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabCustomToolsCommand3Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabCustomToolsCommand3Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabCustomToolsCommand3Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabCustomToolsCommand3Row00       = $iGUIMainTabCustomToolsCommand2Row00 + $iGUIMainTabCustomToolsCommand2Row00Height  ;;region
        Global $iGUIMainTabCustomToolsCommand3Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabCustomToolsCommand3Row01       = $iGUIMainTabCustomToolsCommand3Row00  ;;spacer
        Global $iGUIMainTabCustomToolsCommand3Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabCustomToolsCommand3Row02       = $iGUIMainTabCustomToolsCommand3Row01 + $iGUIMainTabCustomToolsCommand3Row01Height  ;;exterior checkbox
        Global $iGUIMainTabCustomToolsCommand3Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabCustomToolsCommand3Row03       = $iGUIMainTabCustomToolsCommand3Row02 + $iGUIMainTabCustomToolsCommand3Row02Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand3Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabCustomToolsCommand3Row04       = $iGUIMainTabCustomToolsCommand3Row03 + $iGUIMainTabCustomToolsCommand3Row03Height  ;;group
        Global $iGUIMainTabCustomToolsCommand3Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabCustomToolsCommand3Row05       = $iGUIMainTabCustomToolsCommand3Row04  ;;spacer
        Global $iGUIMainTabCustomToolsCommand3Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabCustomToolsCommand3Row06       = $iGUIMainTabCustomToolsCommand3Row05 + $iGUIMainTabCustomToolsCommand3Row05Height  ;;"Display Name:"
        Global $iGUIMainTabCustomToolsCommand3Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand3Row07       = $iGUIMainTabCustomToolsCommand3Row06 + $iGUIMainTabCustomToolsCommand3Row06Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand3Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabCustomToolsCommand3Row08       = $iGUIMainTabCustomToolsCommand3Row07 + $iGUIMainTabCustomToolsCommand3Row07Height  ;;"URL:"
        Global $iGUIMainTabCustomToolsCommand3Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand3Row09       = $iGUIMainTabCustomToolsCommand3Row08 + $iGUIMainTabCustomToolsCommand3Row08Height  ;;final spacer
        Global $iGUIMainTabCustomToolsCommand3Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabCustomToolsCommand3Row04Height = $iGUIMainTabCustomToolsCommand3Row05Height + _
                                           $iGUIMainTabCustomToolsCommand3Row06Height + _
                                           $iGUIMainTabCustomToolsCommand3Row07Height + _
                                           $iGUIMainTabCustomToolsCommand3Row08Height + _
                                           $iGUIMainTabCustomToolsCommand3Row09Height
        $iGUIMainTabCustomToolsCommand3Row00Height = $iGUIMainTabCustomToolsCommand3Row04Height + _
                                           $iGUIMainTabCustomToolsCommand3Row01Height + _
                                           $iGUIMainTabCustomToolsCommand3Row02Height + _
                                           $iGUIMainTabCustomToolsCommand3Row03Height

      ;;GRID GROUP CUSTOM TOOL 4 (CONTROLS ASSOCIATED WITH THE CUSTOM TOOL 4 GROUP OF THE CUSTOM TOOLS TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabCustomToolsCommand4Column00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabCustomToolsCommand4Column00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabCustomToolsCommand4Column01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabCustomToolsCommand4Column01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabCustomToolsCommand4Column02      = $iGUIMainTabAllColumnRight02  ;;label
        Global $iGUIMainTabCustomToolsCommand4Column02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabCustomToolsCommand4Column03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabCustomToolsCommand4Column03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabCustomToolsCommand4Row00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabCustomToolsCommand4Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabCustomToolsCommand4Row01       = $iGUIMainTabCustomToolsCommand4Row00  ;;spacer
        Global $iGUIMainTabCustomToolsCommand4Row01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabCustomToolsCommand4Row02       = $iGUIMainTabCustomToolsCommand4Row01 + $iGUIMainTabCustomToolsCommand4Row01Height  ;;exterior checkbox
        Global $iGUIMainTabCustomToolsCommand4Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabCustomToolsCommand4Row03       = $iGUIMainTabCustomToolsCommand4Row02 + $iGUIMainTabCustomToolsCommand4Row02Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand4Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabCustomToolsCommand4Row04       = $iGUIMainTabCustomToolsCommand4Row03 + $iGUIMainTabCustomToolsCommand4Row03Height  ;;group
        Global $iGUIMainTabCustomToolsCommand4Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabCustomToolsCommand4Row05       = $iGUIMainTabCustomToolsCommand4Row04  ;;spacer
        Global $iGUIMainTabCustomToolsCommand4Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabCustomToolsCommand4Row06       = $iGUIMainTabCustomToolsCommand4Row05 + $iGUIMainTabCustomToolsCommand4Row05Height  ;;"Display Name:"
        Global $iGUIMainTabCustomToolsCommand4Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand4Row07       = $iGUIMainTabCustomToolsCommand4Row06 + $iGUIMainTabCustomToolsCommand4Row06Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand4Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabCustomToolsCommand4Row08       = $iGUIMainTabCustomToolsCommand4Row07 + $iGUIMainTabCustomToolsCommand4Row07Height  ;;"URL:"
        Global $iGUIMainTabCustomToolsCommand4Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand4Row09       = $iGUIMainTabCustomToolsCommand4Row08 + $iGUIMainTabCustomToolsCommand4Row08Height  ;;final spacer
        Global $iGUIMainTabCustomToolsCommand4Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabCustomToolsCommand4Row04Height = $iGUIMainTabCustomToolsCommand4Row05Height + _
                                           $iGUIMainTabCustomToolsCommand4Row06Height + _
                                           $iGUIMainTabCustomToolsCommand4Row07Height + _
                                           $iGUIMainTabCustomToolsCommand4Row08Height + _
                                           $iGUIMainTabCustomToolsCommand4Row09Height
        $iGUIMainTabCustomToolsCommand4Row00Height = $iGUIMainTabCustomToolsCommand4Row04Height + _
                                           $iGUIMainTabCustomToolsCommand4Row01Height + _
                                           $iGUIMainTabCustomToolsCommand4Row02Height + _
                                           $iGUIMainTabCustomToolsCommand4Row03Height

      ;;GRID GROUP CUSTOM TOOL 5 (CONTROLS ASSOCIATED WITH THE CUSTOM TOOL 5 GROUP OF THE CUSTOM TOOLS TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabCustomToolsCommand5Column00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabCustomToolsCommand5Column00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabCustomToolsCommand5Column01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabCustomToolsCommand5Column01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabCustomToolsCommand5Column02      = $iGUIMainTabAllColumnRight02  ;;label
        Global $iGUIMainTabCustomToolsCommand5Column02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabCustomToolsCommand5Column03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabCustomToolsCommand5Column03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabCustomToolsCommand5Row00       = $iGUIMainTabCustomToolsCommand4Row00 + $iGUIMainTabCustomToolsCommand4Row00Height  ;;region
        Global $iGUIMainTabCustomToolsCommand5Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabCustomToolsCommand5Row01       = $iGUIMainTabCustomToolsCommand5Row00  ;;spacer
        Global $iGUIMainTabCustomToolsCommand5Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabCustomToolsCommand5Row02       = $iGUIMainTabCustomToolsCommand5Row01 + $iGUIMainTabCustomToolsCommand5Row01Height  ;;exterior checkbox
        Global $iGUIMainTabCustomToolsCommand5Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabCustomToolsCommand5Row03       = $iGUIMainTabCustomToolsCommand5Row02 + $iGUIMainTabCustomToolsCommand5Row02Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand5Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabCustomToolsCommand5Row04       = $iGUIMainTabCustomToolsCommand5Row03 + $iGUIMainTabCustomToolsCommand5Row03Height  ;;group
        Global $iGUIMainTabCustomToolsCommand5Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabCustomToolsCommand5Row05       = $iGUIMainTabCustomToolsCommand5Row04  ;;spacer
        Global $iGUIMainTabCustomToolsCommand5Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabCustomToolsCommand5Row06       = $iGUIMainTabCustomToolsCommand5Row05 + $iGUIMainTabCustomToolsCommand5Row05Height  ;;"Display Name:"
        Global $iGUIMainTabCustomToolsCommand5Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand5Row07       = $iGUIMainTabCustomToolsCommand5Row06 + $iGUIMainTabCustomToolsCommand5Row06Height  ;;spacer
        Global $iGUIMainTabCustomToolsCommand5Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabCustomToolsCommand5Row08       = $iGUIMainTabCustomToolsCommand5Row07 + $iGUIMainTabCustomToolsCommand5Row07Height  ;;"URL:"
        Global $iGUIMainTabCustomToolsCommand5Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabCustomToolsCommand5Row09       = $iGUIMainTabCustomToolsCommand5Row08 + $iGUIMainTabCustomToolsCommand5Row08Height  ;;final spacer
        Global $iGUIMainTabCustomToolsCommand5Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabCustomToolsCommand5Row04Height = $iGUIMainTabCustomToolsCommand5Row05Height + _
                                           $iGUIMainTabCustomToolsCommand5Row06Height + _
                                           $iGUIMainTabCustomToolsCommand5Row07Height + _
                                           $iGUIMainTabCustomToolsCommand5Row08Height + _
                                           $iGUIMainTabCustomToolsCommand5Row09Height
        $iGUIMainTabCustomToolsCommand5Row00Height = $iGUIMainTabCustomToolsCommand5Row04Height + _
                                           $iGUIMainTabCustomToolsCommand5Row01Height + _
                                           $iGUIMainTabCustomToolsCommand5Row02Height + _
                                           $iGUIMainTabCustomToolsCommand5Row03Height

    ;;GRID TAB HELP (CONTROLS INSIDE THE HELP TAB)
      ;;GRID GROUP LINK 1 (CONTROLS ASSOCIATED WITH THE LINK 1 GROUP OF THE HELP TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabHelpLink1Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabHelpLink1Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabHelpLink1Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabHelpLink1Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabHelpLink1Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabHelpLink1Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabHelpLink1Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabHelpLink1Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabHelpLink1Row00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabHelpLink1Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabHelpLink1Row01       = $iGUIMainTabHelpLink1Row00  ;;spacer
        Global $iGUIMainTabHelpLink1Row01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabHelpLink1Row02       = $iGUIMainTabHelpLink1Row01 + $iGUIMainTabHelpLink1Row01Height  ;;exterior checkbox
        Global $iGUIMainTabHelpLink1Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabHelpLink1Row03       = $iGUIMainTabHelpLink1Row02 + $iGUIMainTabHelpLink1Row02Height  ;;spacer
        Global $iGUIMainTabHelpLink1Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabHelpLink1Row04       = $iGUIMainTabHelpLink1Row03 + $iGUIMainTabHelpLink1Row03Height  ;;group
        Global $iGUIMainTabHelpLink1Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabHelpLink1Row05       = $iGUIMainTabHelpLink1Row04  ;;spacer
        Global $iGUIMainTabHelpLink1Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabHelpLink1Row06       = $iGUIMainTabHelpLink1Row05 + $iGUIMainTabHelpLink1Row05Height  ;;"Display Name:"
        Global $iGUIMainTabHelpLink1Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink1Row07       = $iGUIMainTabHelpLink1Row06 + $iGUIMainTabHelpLink1Row06Height  ;;spacer
        Global $iGUIMainTabHelpLink1Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabHelpLink1Row08       = $iGUIMainTabHelpLink1Row07 + $iGUIMainTabHelpLink1Row07Height  ;;"URL:"
        Global $iGUIMainTabHelpLink1Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink1Row09       = $iGUIMainTabHelpLink1Row08 + $iGUIMainTabHelpLink1Row08Height  ;;final spacer
        Global $iGUIMainTabHelpLink1Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabHelpLink1Row04Height = $iGUIMainTabHelpLink1Row05Height + _
                                           $iGUIMainTabHelpLink1Row06Height + _
                                           $iGUIMainTabHelpLink1Row07Height + _
                                           $iGUIMainTabHelpLink1Row08Height + _
                                           $iGUIMainTabHelpLink1Row09Height
        $iGUIMainTabHelpLink1Row00Height = $iGUIMainTabHelpLink1Row04Height + _
                                           $iGUIMainTabHelpLink1Row01Height + _
                                           $iGUIMainTabHelpLink1Row02Height + _
                                           $iGUIMainTabHelpLink1Row03Height

      ;;GRID GROUP LINK 2 (CONTROLS ASSOCIATED WITH THE LINK 2 GROUP OF THE HELP TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabHelpLink2Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabHelpLink2Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabHelpLink2Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabHelpLink2Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabHelpLink2Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabHelpLink2Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabHelpLink2Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabHelpLink2Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabHelpLink2Row00       = $iGUIMainTabHelpLink1Row00 + $iGUIMainTabHelpLink1Row00Height  ;;region
        Global $iGUIMainTabHelpLink2Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabHelpLink2Row01       = $iGUIMainTabHelpLink2Row00  ;;spacer
        Global $iGUIMainTabHelpLink2Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabHelpLink2Row02       = $iGUIMainTabHelpLink2Row01 + $iGUIMainTabHelpLink2Row01Height  ;;exterior checkbox
        Global $iGUIMainTabHelpLink2Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabHelpLink2Row03       = $iGUIMainTabHelpLink2Row02 + $iGUIMainTabHelpLink2Row02Height  ;;spacer
        Global $iGUIMainTabHelpLink2Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabHelpLink2Row04       = $iGUIMainTabHelpLink2Row03 + $iGUIMainTabHelpLink2Row03Height  ;;group
        Global $iGUIMainTabHelpLink2Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabHelpLink2Row05       = $iGUIMainTabHelpLink2Row04  ;;spacer
        Global $iGUIMainTabHelpLink2Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabHelpLink2Row06       = $iGUIMainTabHelpLink2Row05 + $iGUIMainTabHelpLink2Row05Height  ;;"Display Name:"
        Global $iGUIMainTabHelpLink2Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink2Row07       = $iGUIMainTabHelpLink2Row06 + $iGUIMainTabHelpLink2Row06Height  ;;spacer
        Global $iGUIMainTabHelpLink2Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabHelpLink2Row08       = $iGUIMainTabHelpLink2Row07 + $iGUIMainTabHelpLink2Row07Height  ;;"URL:"
        Global $iGUIMainTabHelpLink2Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink2Row09       = $iGUIMainTabHelpLink2Row08 + $iGUIMainTabHelpLink2Row08Height  ;;final spacer
        Global $iGUIMainTabHelpLink2Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabHelpLink2Row04Height = $iGUIMainTabHelpLink2Row05Height + _
                                           $iGUIMainTabHelpLink2Row06Height + _
                                           $iGUIMainTabHelpLink2Row07Height + _
                                           $iGUIMainTabHelpLink2Row08Height + _
                                           $iGUIMainTabHelpLink2Row09Height
        $iGUIMainTabHelpLink2Row00Height = $iGUIMainTabHelpLink2Row04Height + _
                                           $iGUIMainTabHelpLink2Row01Height + _
                                           $iGUIMainTabHelpLink2Row02Height + _
                                           $iGUIMainTabHelpLink2Row03Height

      ;;GRID GROUP LINK 3 (CONTROLS ASSOCIATED WITH THE LINK 3 GROUP OF THE HELP TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabHelpLink3Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabHelpLink3Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabHelpLink3Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabHelpLink3Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabHelpLink3Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabHelpLink3Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabHelpLink3Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabHelpLink3Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabHelpLink3Row00       = $iGUIMainTabHelpLink2Row00 + $iGUIMainTabHelpLink2Row00Height  ;;region
        Global $iGUIMainTabHelpLink3Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabHelpLink3Row01       = $iGUIMainTabHelpLink3Row00  ;;spacer
        Global $iGUIMainTabHelpLink3Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabHelpLink3Row02       = $iGUIMainTabHelpLink3Row01 + $iGUIMainTabHelpLink3Row01Height  ;;exterior checkbox
        Global $iGUIMainTabHelpLink3Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabHelpLink3Row03       = $iGUIMainTabHelpLink3Row02 + $iGUIMainTabHelpLink3Row02Height  ;;spacer
        Global $iGUIMainTabHelpLink3Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabHelpLink3Row04       = $iGUIMainTabHelpLink3Row03 + $iGUIMainTabHelpLink3Row03Height  ;;group
        Global $iGUIMainTabHelpLink3Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabHelpLink3Row05       = $iGUIMainTabHelpLink3Row04  ;;spacer
        Global $iGUIMainTabHelpLink3Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabHelpLink3Row06       = $iGUIMainTabHelpLink3Row05 + $iGUIMainTabHelpLink3Row05Height  ;;"Display Name:"
        Global $iGUIMainTabHelpLink3Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink3Row07       = $iGUIMainTabHelpLink3Row06 + $iGUIMainTabHelpLink3Row06Height  ;;spacer
        Global $iGUIMainTabHelpLink3Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabHelpLink3Row08       = $iGUIMainTabHelpLink3Row07 + $iGUIMainTabHelpLink3Row07Height  ;;"URL:"
        Global $iGUIMainTabHelpLink3Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink3Row09       = $iGUIMainTabHelpLink3Row08 + $iGUIMainTabHelpLink3Row08Height  ;;final spacer
        Global $iGUIMainTabHelpLink3Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabHelpLink3Row04Height = $iGUIMainTabHelpLink3Row05Height + _
                                           $iGUIMainTabHelpLink3Row06Height + _
                                           $iGUIMainTabHelpLink3Row07Height + _
                                           $iGUIMainTabHelpLink3Row08Height + _
                                           $iGUIMainTabHelpLink3Row09Height
        $iGUIMainTabHelpLink3Row00Height = $iGUIMainTabHelpLink3Row04Height + _
                                           $iGUIMainTabHelpLink3Row01Height + _
                                           $iGUIMainTabHelpLink3Row02Height + _
                                           $iGUIMainTabHelpLink3Row03Height

      ;;GRID GROUP LINK 4 (CONTROLS ASSOCIATED WITH THE LINK 4 GROUP OF THE HELP TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabHelpLink4Column00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabHelpLink4Column00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabHelpLink4Column01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabHelpLink4Column01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabHelpLink4Column02      = $iGUIMainTabAllColumnRight02  ;;label
        Global $iGUIMainTabHelpLink4Column02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabHelpLink4Column03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabHelpLink4Column03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabHelpLink4Row00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabHelpLink4Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabHelpLink4Row01       = $iGUIMainTabHelpLink4Row00  ;;spacer
        Global $iGUIMainTabHelpLink4Row01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabHelpLink4Row02       = $iGUIMainTabHelpLink4Row01 + $iGUIMainTabHelpLink4Row01Height  ;;exterior checkbox
        Global $iGUIMainTabHelpLink4Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabHelpLink4Row03       = $iGUIMainTabHelpLink4Row02 + $iGUIMainTabHelpLink4Row02Height  ;;spacer
        Global $iGUIMainTabHelpLink4Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabHelpLink4Row04       = $iGUIMainTabHelpLink4Row03 + $iGUIMainTabHelpLink4Row03Height  ;;group
        Global $iGUIMainTabHelpLink4Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabHelpLink4Row05       = $iGUIMainTabHelpLink4Row04  ;;spacer
        Global $iGUIMainTabHelpLink4Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabHelpLink4Row06       = $iGUIMainTabHelpLink4Row05 + $iGUIMainTabHelpLink4Row05Height  ;;"Display Name:"
        Global $iGUIMainTabHelpLink4Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink4Row07       = $iGUIMainTabHelpLink4Row06 + $iGUIMainTabHelpLink4Row06Height  ;;spacer
        Global $iGUIMainTabHelpLink4Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabHelpLink4Row08       = $iGUIMainTabHelpLink4Row07 + $iGUIMainTabHelpLink4Row07Height  ;;"URL:"
        Global $iGUIMainTabHelpLink4Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink4Row09       = $iGUIMainTabHelpLink4Row08 + $iGUIMainTabHelpLink4Row08Height  ;;final spacer
        Global $iGUIMainTabHelpLink4Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabHelpLink4Row04Height = $iGUIMainTabHelpLink4Row05Height + _
                                           $iGUIMainTabHelpLink4Row06Height + _
                                           $iGUIMainTabHelpLink4Row07Height + _
                                           $iGUIMainTabHelpLink4Row08Height + _
                                           $iGUIMainTabHelpLink4Row09Height
        $iGUIMainTabHelpLink4Row00Height = $iGUIMainTabHelpLink4Row04Height + _
                                           $iGUIMainTabHelpLink4Row01Height + _
                                           $iGUIMainTabHelpLink4Row02Height + _
                                           $iGUIMainTabHelpLink4Row03Height

      ;;GRID GROUP LINK 5 (CONTROLS ASSOCIATED WITH THE LINK 5 GROUP OF THE HELP TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabHelpLink5Column00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabHelpLink5Column00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabHelpLink5Column01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabHelpLink5Column01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabHelpLink5Column02      = $iGUIMainTabAllColumnRight02  ;;label
        Global $iGUIMainTabHelpLink5Column02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabHelpLink5Column03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabHelpLink5Column03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabHelpLink5Row00       = $iGUIMainTabHelpLink4Row00 + $iGUIMainTabHelpLink4Row00Height  ;;region
        Global $iGUIMainTabHelpLink5Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabHelpLink5Row01       = $iGUIMainTabHelpLink5Row00  ;;spacer
        Global $iGUIMainTabHelpLink5Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabHelpLink5Row02       = $iGUIMainTabHelpLink5Row01 + $iGUIMainTabHelpLink5Row01Height  ;;exterior checkbox
        Global $iGUIMainTabHelpLink5Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabHelpLink5Row03       = $iGUIMainTabHelpLink5Row02 + $iGUIMainTabHelpLink5Row02Height  ;;spacer
        Global $iGUIMainTabHelpLink5Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabHelpLink5Row04       = $iGUIMainTabHelpLink5Row03 + $iGUIMainTabHelpLink5Row03Height  ;;group
        Global $iGUIMainTabHelpLink5Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabHelpLink5Row05       = $iGUIMainTabHelpLink5Row04  ;;spacer
        Global $iGUIMainTabHelpLink5Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabHelpLink5Row06       = $iGUIMainTabHelpLink5Row05 + $iGUIMainTabHelpLink5Row05Height  ;;"Display Name:"
        Global $iGUIMainTabHelpLink5Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink5Row07       = $iGUIMainTabHelpLink5Row06 + $iGUIMainTabHelpLink5Row06Height  ;;spacer
        Global $iGUIMainTabHelpLink5Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabHelpLink5Row08       = $iGUIMainTabHelpLink5Row07 + $iGUIMainTabHelpLink5Row07Height  ;;"URL:"
        Global $iGUIMainTabHelpLink5Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabHelpLink5Row09       = $iGUIMainTabHelpLink5Row08 + $iGUIMainTabHelpLink5Row08Height  ;;final spacer
        Global $iGUIMainTabHelpLink5Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabHelpLink5Row04Height = $iGUIMainTabHelpLink5Row05Height + _
                                           $iGUIMainTabHelpLink5Row06Height + _
                                           $iGUIMainTabHelpLink5Row07Height + _
                                           $iGUIMainTabHelpLink5Row08Height + _
                                           $iGUIMainTabHelpLink5Row09Height
        $iGUIMainTabHelpLink5Row00Height = $iGUIMainTabHelpLink5Row04Height + _
                                           $iGUIMainTabHelpLink5Row01Height + _
                                           $iGUIMainTabHelpLink5Row02Height + _
                                           $iGUIMainTabHelpLink5Row03Height

    ;;GRID TAB SERVICES (CONTROLS INSIDE THE SERVICES TAB)
      ;;GRID GROUP SERVICE 1 (CONTROLS ASSOCIATED WITH THE SERVICE 1 GROUP OF THE SERVICES TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabServicesService1Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabServicesService1Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabServicesService1Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabServicesService1Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabServicesService1Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabServicesService1Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabServicesService1Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabServicesService1Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabServicesService1Row00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabServicesService1Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabServicesService1Row01       = $iGUIMainTabServicesService1Row00  ;;spacer
        Global $iGUIMainTabServicesService1Row01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabServicesService1Row02       = $iGUIMainTabServicesService1Row01 + $iGUIMainTabServicesService1Row01Height  ;;exterior checkbox
        Global $iGUIMainTabServicesService1Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabServicesService1Row03       = $iGUIMainTabServicesService1Row02 + $iGUIMainTabServicesService1Row02Height  ;;spacer
        Global $iGUIMainTabServicesService1Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabServicesService1Row04       = $iGUIMainTabServicesService1Row03 + $iGUIMainTabServicesService1Row03Height  ;;group
        Global $iGUIMainTabServicesService1Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabServicesService1Row05       = $iGUIMainTabServicesService1Row04  ;;spacer
        Global $iGUIMainTabServicesService1Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabServicesService1Row06       = $iGUIMainTabServicesService1Row05 + $iGUIMainTabServicesService1Row05Height  ;;"Display Name:"
        Global $iGUIMainTabServicesService1Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService1Row07       = $iGUIMainTabServicesService1Row06 + $iGUIMainTabServicesService1Row06Height  ;;spacer
        Global $iGUIMainTabServicesService1Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabServicesService1Row08       = $iGUIMainTabServicesService1Row07 + $iGUIMainTabServicesService1Row07Height  ;;"URL:"
        Global $iGUIMainTabServicesService1Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService1Row09       = $iGUIMainTabServicesService1Row08 + $iGUIMainTabServicesService1Row08Height  ;;final spacer
        Global $iGUIMainTabServicesService1Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabServicesService1Row04Height = $iGUIMainTabServicesService1Row05Height + _
                                                  $iGUIMainTabServicesService1Row06Height + _
                                                  $iGUIMainTabServicesService1Row07Height + _
                                                  $iGUIMainTabServicesService1Row08Height + _
                                                  $iGUIMainTabServicesService1Row09Height
        $iGUIMainTabServicesService1Row00Height = $iGUIMainTabServicesService1Row04Height + _
                                                  $iGUIMainTabServicesService1Row01Height + _
                                                  $iGUIMainTabServicesService1Row02Height + _
                                                  $iGUIMainTabServicesService1Row03Height

      ;;GRID GROUP SERVICE 2 (CONTROLS ASSOCIATED WITH THE SERVICE 2 GROUP OF THE SERVICES TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabServicesService2Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabServicesService2Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabServicesService2Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabServicesService2Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabServicesService2Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabServicesService2Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabServicesService2Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabServicesService2Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabServicesService2Row00       = $iGUIMainTabServicesService1Row00 + $iGUIMainTabServicesService1Row00Height  ;;region
        Global $iGUIMainTabServicesService2Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabServicesService2Row01       = $iGUIMainTabServicesService2Row00  ;;spacer
        Global $iGUIMainTabServicesService2Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabServicesService2Row02       = $iGUIMainTabServicesService2Row01 + $iGUIMainTabServicesService2Row01Height  ;;exterior checkbox
        Global $iGUIMainTabServicesService2Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabServicesService2Row03       = $iGUIMainTabServicesService2Row02 + $iGUIMainTabServicesService2Row02Height  ;;spacer
        Global $iGUIMainTabServicesService2Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabServicesService2Row04       = $iGUIMainTabServicesService2Row03 + $iGUIMainTabServicesService2Row03Height  ;;group
        Global $iGUIMainTabServicesService2Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabServicesService2Row05       = $iGUIMainTabServicesService2Row04  ;;spacer
        Global $iGUIMainTabServicesService2Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabServicesService2Row06       = $iGUIMainTabServicesService2Row05 + $iGUIMainTabServicesService2Row05Height  ;;"Display Name:"
        Global $iGUIMainTabServicesService2Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService2Row07       = $iGUIMainTabServicesService2Row06 + $iGUIMainTabServicesService2Row06Height  ;;spacer
        Global $iGUIMainTabServicesService2Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabServicesService2Row08       = $iGUIMainTabServicesService2Row07 + $iGUIMainTabServicesService2Row07Height  ;;"URL:"
        Global $iGUIMainTabServicesService2Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService2Row09       = $iGUIMainTabServicesService2Row08 + $iGUIMainTabServicesService2Row08Height  ;;final spacer
        Global $iGUIMainTabServicesService2Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabServicesService2Row04Height = $iGUIMainTabServicesService2Row05Height + _
                                                  $iGUIMainTabServicesService2Row06Height + _
                                                  $iGUIMainTabServicesService2Row07Height + _
                                                  $iGUIMainTabServicesService2Row08Height + _
                                                  $iGUIMainTabServicesService2Row09Height
        $iGUIMainTabServicesService2Row00Height = $iGUIMainTabServicesService2Row04Height + _
                                                  $iGUIMainTabServicesService2Row01Height + _
                                                  $iGUIMainTabServicesService2Row02Height + _
                                                  $iGUIMainTabServicesService2Row03Height

      ;;GRID GROUP SERVICE 3 (CONTROLS ASSOCIATED WITH THE SERVICE 3 GROUP OF THE SERVICES TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabServicesService3Column00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabServicesService3Column00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabServicesService3Column01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabServicesService3Column01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabServicesService3Column02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabServicesService3Column02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabServicesService3Column03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabServicesService3Column03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabServicesService3Row00       = $iGUIMainTabServicesService2Row00 + $iGUIMainTabServicesService2Row00Height  ;;region
        Global $iGUIMainTabServicesService3Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabServicesService3Row01       = $iGUIMainTabServicesService3Row00  ;;spacer
        Global $iGUIMainTabServicesService3Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabServicesService3Row02       = $iGUIMainTabServicesService3Row01 + $iGUIMainTabServicesService3Row01Height  ;;exterior checkbox
        Global $iGUIMainTabServicesService3Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabServicesService3Row03       = $iGUIMainTabServicesService3Row02 + $iGUIMainTabServicesService3Row02Height  ;;spacer
        Global $iGUIMainTabServicesService3Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabServicesService3Row04       = $iGUIMainTabServicesService3Row03 + $iGUIMainTabServicesService3Row03Height  ;;group
        Global $iGUIMainTabServicesService3Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabServicesService3Row05       = $iGUIMainTabServicesService3Row04  ;;spacer
        Global $iGUIMainTabServicesService3Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabServicesService3Row06       = $iGUIMainTabServicesService3Row05 + $iGUIMainTabServicesService3Row05Height  ;;"Display Name:"
        Global $iGUIMainTabServicesService3Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService3Row07       = $iGUIMainTabServicesService3Row06 + $iGUIMainTabServicesService3Row06Height  ;;spacer
        Global $iGUIMainTabServicesService3Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabServicesService3Row08       = $iGUIMainTabServicesService3Row07 + $iGUIMainTabServicesService3Row07Height  ;;"URL:"
        Global $iGUIMainTabServicesService3Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService3Row09       = $iGUIMainTabServicesService3Row08 + $iGUIMainTabServicesService3Row08Height  ;;final spacer
        Global $iGUIMainTabServicesService3Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabServicesService3Row04Height = $iGUIMainTabServicesService3Row05Height + _
                                                  $iGUIMainTabServicesService3Row06Height + _
                                                  $iGUIMainTabServicesService3Row07Height + _
                                                  $iGUIMainTabServicesService3Row08Height + _
                                                  $iGUIMainTabServicesService3Row09Height
        $iGUIMainTabServicesService3Row00Height = $iGUIMainTabServicesService3Row04Height + _
                                                  $iGUIMainTabServicesService3Row01Height + _
                                                  $iGUIMainTabServicesService3Row02Height + _
                                                  $iGUIMainTabServicesService3Row03Height

      ;;GRID GROUP SERVICE 4 (CONTROLS ASSOCIATED WITH THE SERVICE 4 GROUP OF THE SERVICES TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabServicesService4Column00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabServicesService4Column00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabServicesService4Column01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabServicesService4Column01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabServicesService4Column02      = $iGUIMainTabAllColumnRight02  ;;label
        Global $iGUIMainTabServicesService4Column02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabServicesService4Column03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabServicesService4Column03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabServicesService4Row00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabServicesService4Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabServicesService4Row01       = $iGUIMainTabServicesService4Row00  ;;spacer
        Global $iGUIMainTabServicesService4Row01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabServicesService4Row02       = $iGUIMainTabServicesService4Row01 + $iGUIMainTabServicesService4Row01Height  ;;exterior checkbox
        Global $iGUIMainTabServicesService4Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabServicesService4Row03       = $iGUIMainTabServicesService4Row02 + $iGUIMainTabServicesService4Row02Height  ;;spacer
        Global $iGUIMainTabServicesService4Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabServicesService4Row04       = $iGUIMainTabServicesService4Row03 + $iGUIMainTabServicesService4Row03Height  ;;group
        Global $iGUIMainTabServicesService4Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabServicesService4Row05       = $iGUIMainTabServicesService4Row04  ;;spacer
        Global $iGUIMainTabServicesService4Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabServicesService4Row06       = $iGUIMainTabServicesService4Row05 + $iGUIMainTabServicesService4Row05Height  ;;"Display Name:"
        Global $iGUIMainTabServicesService4Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService4Row07       = $iGUIMainTabServicesService4Row06 + $iGUIMainTabServicesService4Row06Height  ;;spacer
        Global $iGUIMainTabServicesService4Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabServicesService4Row08       = $iGUIMainTabServicesService4Row07 + $iGUIMainTabServicesService4Row07Height  ;;"URL:"
        Global $iGUIMainTabServicesService4Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService4Row09       = $iGUIMainTabServicesService4Row08 + $iGUIMainTabServicesService4Row08Height  ;;final spacer
        Global $iGUIMainTabServicesService4Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabServicesService4Row04Height = $iGUIMainTabServicesService4Row05Height + _
                                                  $iGUIMainTabServicesService4Row06Height + _
                                                  $iGUIMainTabServicesService4Row07Height + _
                                                  $iGUIMainTabServicesService4Row08Height + _
                                                  $iGUIMainTabServicesService4Row09Height
        $iGUIMainTabServicesService4Row00Height = $iGUIMainTabServicesService4Row04Height + _
                                                  $iGUIMainTabServicesService4Row01Height + _
                                                  $iGUIMainTabServicesService4Row02Height + _
                                                  $iGUIMainTabServicesService4Row03Height

      ;;GRID GROUP SERVICE 5 (CONTROLS ASSOCIATED WITH THE SERVICE 5 GROUP OF THE SERVICES TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabServicesService5Column00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabServicesService5Column00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabServicesService5Column01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabServicesService5Column01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabServicesService5Column02      = $iGUIMainTabAllColumnRight02  ;;label
        Global $iGUIMainTabServicesService5Column02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabServicesService5Column03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabServicesService5Column03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabServicesService5Row00       = $iGUIMainTabServicesService4Row00 + $iGUIMainTabServicesService4Row00Height  ;;region
        Global $iGUIMainTabServicesService5Row00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabServicesService5Row01       = $iGUIMainTabServicesService5Row00  ;;spacer
        Global $iGUIMainTabServicesService5Row01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabServicesService5Row02       = $iGUIMainTabServicesService5Row01 + $iGUIMainTabServicesService5Row01Height  ;;exterior checkbox
        Global $iGUIMainTabServicesService5Row02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabServicesService5Row03       = $iGUIMainTabServicesService5Row02 + $iGUIMainTabServicesService5Row02Height  ;;spacer
        Global $iGUIMainTabServicesService5Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabServicesService5Row04       = $iGUIMainTabServicesService5Row03 + $iGUIMainTabServicesService5Row03Height  ;;group
        Global $iGUIMainTabServicesService5Row04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabServicesService5Row05       = $iGUIMainTabServicesService5Row04  ;;spacer
        Global $iGUIMainTabServicesService5Row05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabServicesService5Row06       = $iGUIMainTabServicesService5Row05 + $iGUIMainTabServicesService5Row05Height  ;;"Display Name:"
        Global $iGUIMainTabServicesService5Row06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService5Row07       = $iGUIMainTabServicesService5Row06 + $iGUIMainTabServicesService5Row06Height  ;;spacer
        Global $iGUIMainTabServicesService5Row07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabServicesService5Row08       = $iGUIMainTabServicesService5Row07 + $iGUIMainTabServicesService5Row07Height  ;;"URL:"
        Global $iGUIMainTabServicesService5Row08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabServicesService5Row09       = $iGUIMainTabServicesService5Row08 + $iGUIMainTabServicesService5Row08Height  ;;final spacer
        Global $iGUIMainTabServicesService5Row09Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabServicesService5Row04Height = $iGUIMainTabServicesService5Row05Height + _
                                                  $iGUIMainTabServicesService5Row06Height + _
                                                  $iGUIMainTabServicesService5Row07Height + _
                                                  $iGUIMainTabServicesService5Row08Height + _
                                                  $iGUIMainTabServicesService5Row09Height
        $iGUIMainTabServicesService5Row00Height = $iGUIMainTabServicesService5Row04Height + _
                                                  $iGUIMainTabServicesService5Row01Height + _
                                                  $iGUIMainTabServicesService5Row02Height + _
                                                  $iGUIMainTabServicesService5Row03Height

    ;;GRID TAB CONTACT FORM (CONTROLS INSIDE THE HELPDESK CONTACT FORM TAB)
      ;;GRID GROUP GENERAL (CONTROLS ASSOCIATED WITH THE GENERAL GROUP OF THE CONTACT FORM TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabContactGeneralColumn00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabContactGeneralColumn00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabContactGeneralColumn01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabContactGeneralColumn01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabContactGeneralColumn02      = $iGUIMainTabAllColumnLeft02  ;;label
        Global $iGUIMainTabContactGeneralColumn02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabContactGeneralColumn03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabContactGeneralColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabContactGeneralRow00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabContactGeneralRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabContactGeneralRow01       = $iGUIMainTabContactGeneralRow00  ;;spacer
        Global $iGUIMainTabContactGeneralRow01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabContactGeneralRow02       = $iGUIMainTabContactGeneralRow01 + $iGUIMainTabContactGeneralRow01Height  ;;exterior checkbox
        Global $iGUIMainTabContactGeneralRow02Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabContactGeneralRow03       = $iGUIMainTabContactGeneralRow02 + $iGUIMainTabContactGeneralRow02Height  ;;spacer
        Global $iGUIMainTabContactGeneralRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
        Global $iGUIMainTabContactGeneralRow04       = $iGUIMainTabContactGeneralRow03 + $iGUIMainTabContactGeneralRow03Height  ;;group
        Global $iGUIMainTabContactGeneralRow04Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabContactGeneralRow05       = $iGUIMainTabContactGeneralRow04  ;;spacer
        Global $iGUIMainTabContactGeneralRow05Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabContactGeneralRow06       = $iGUIMainTabContactGeneralRow05 + $iGUIMainTabContactGeneralRow05Height  ;;"Button text:"
        Global $iGUIMainTabContactGeneralRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactGeneralRow07       = $iGUIMainTabContactGeneralRow06 + $iGUIMainTabContactGeneralRow06Height  ;;spacer
        Global $iGUIMainTabContactGeneralRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabContactGeneralRow08       = $iGUIMainTabContactGeneralRow07 + $iGUIMainTabContactGeneralRow07Height  ;;"Show employee ID..."
        Global $iGUIMainTabContactGeneralRow08Height = $iGUIMainTabAllChromeCheckboxHeight
        Global $iGUIMainTabContactGeneralRow09       = $iGUIMainTabContactGeneralRow08 + $iGUIMainTabContactGeneralRow08Height  ;;final spacer
        Global $iGUIMainTabContactGeneralRow09Height = $iGUIMainTabAllChromeCheckboxSpacerFinal + $iGUIMainTabAllChromeCheckboxOffset

        ;;OVERALL
        $iGUIMainTabContactGeneralRow04Height = $iGUIMainTabContactGeneralRow05Height + _
                                                $iGUIMainTabContactGeneralRow06Height + _
                                                $iGUIMainTabContactGeneralRow07Height + _
                                                $iGUIMainTabContactGeneralRow08Height + _
                                                $iGUIMainTabContactGeneralRow09Height
        $iGUIMainTabContactGeneralRow00Height = $iGUIMainTabContactGeneralRow04Height + _
                                                $iGUIMainTabContactGeneralRow01Height + _
                                                $iGUIMainTabContactGeneralRow02Height + _
                                                $iGUIMainTabContactGeneralRow03Height

      ;;GRID GROUP RECIPIENT (CONTROLS ASSOCIATED WITH THE RECIPIENT GROUP OF THE CONTACT FORM TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabContactRecipientColumn00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabContactRecipientColumn00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabContactRecipientColumn01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabContactRecipientColumn01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabContactRecipientColumn02      = $iGUIMainTabAllColumnLeft02  ;;radio
        Global $iGUIMainTabContactRecipientColumn02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabContactRecipientColumn03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabContactRecipientColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabContactRecipientRow00       = $iGUIMainTabContactGeneralRow00 + $iGUIMainTabContactGeneralRow00Height  ;;region
        Global $iGUIMainTabContactRecipientRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabContactRecipientRow01       = $iGUIMainTabContactRecipientRow00  ;;spacer
        Global $iGUIMainTabContactRecipientRow01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabContactRecipientRow02       = $iGUIMainTabContactRecipientRow01 + $iGUIMainTabContactRecipientRow01Height  ;;group
        Global $iGUIMainTabContactRecipientRow02Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabContactRecipientRow03       = $iGUIMainTabContactRecipientRow02  ;;spacer
        Global $iGUIMainTabContactRecipientRow03Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabContactRecipientRow04       = $iGUIMainTabContactRecipientRow03 + $iGUIMainTabContactRecipientRow03Height  ;;"Use helpdesk email..."
        Global $iGUIMainTabContactRecipientRow04Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactRecipientRow05       = $iGUIMainTabContactRecipientRow04 + $iGUIMainTabContactRecipientRow04Height  ;;spacer
        Global $iGUIMainTabContactRecipientRow05Height = $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabContactRecipientRow06       = $iGUIMainTabContactRecipientRow05 + $iGUIMainTabContactRecipientRow05Height  ;;"Custom:"
        Global $iGUIMainTabContactRecipientRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactRecipientRow07       = $iGUIMainTabContactRecipientRow06 + $iGUIMainTabContactRecipientRow06Height  ;;final spacer
        Global $iGUIMainTabContactRecipientRow07Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabContactRecipientRow02Height = $iGUIMainTabContactRecipientRow03Height + _
                                                  $iGUIMainTabContactRecipientRow04Height + _
                                                  $iGUIMainTabContactRecipientRow05Height + _
                                                  $iGUIMainTabContactRecipientRow06Height + _
                                                  $iGUIMainTabContactRecipientRow07Height
        $iGUIMainTabContactRecipientRow00Height = $iGUIMainTabContactRecipientRow02Height + _
                                                  $iGUIMainTabContactRecipientRow01Height

      ;;GRID GROUP SENDER (CONTROLS ASSOCIATED WITH THE SENDER GROUP OF THE CONTACT FORM TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabContactSenderColumn00      = $iGUIMainTabAllColumnLeft00  ;;region
        Global $iGUIMainTabContactSenderColumn00Width = $iGUIMainTabAllColumnLeft00Width
        Global $iGUIMainTabContactSenderColumn01      = $iGUIMainTabAllColumnLeft01  ;;group
        Global $iGUIMainTabContactSenderColumn01Width = $iGUIMainTabAllColumnLeft01Width
        Global $iGUIMainTabContactSenderColumn02      = $iGUIMainTabAllColumnLeft02  ;;radio
        Global $iGUIMainTabContactSenderColumn02Width = $iGUIMainTabAllColumnLeft02Width
        Global $iGUIMainTabContactSenderColumn03      = $iGUIMainTabAllColumnLeft03  ;;input box
        Global $iGUIMainTabContactSenderColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12

        ;;ROWS
        Global $iGUIMainTabContactSenderRow00       = $iGUIMainTabContactRecipientRow00 + $iGUIMainTabContactRecipientRow00Height  ;;region
        Global $iGUIMainTabContactSenderRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabContactSenderRow01       = $iGUIMainTabContactSenderRow00  ;;spacer
        Global $iGUIMainTabContactSenderRow01Height = $iGUIMainTabAllPaddingVertical
        Global $iGUIMainTabContactSenderRow02       = $iGUIMainTabContactSenderRow01 + $iGUIMainTabContactSenderRow01Height  ;;group
        Global $iGUIMainTabContactSenderRow02Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabContactSenderRow03       = $iGUIMainTabContactSenderRow02  ;;spacer
        Global $iGUIMainTabContactSenderRow03Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabContactSenderRow04       = $iGUIMainTabContactSenderRow03 + $iGUIMainTabContactSenderRow03Height  ;;"Read from Active Directory"
        Global $iGUIMainTabContactSenderRow04Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSenderRow05       = $iGUIMainTabContactSenderRow04 + $iGUIMainTabContactSenderRow04Height  ;;spacer
        Global $iGUIMainTabContactSenderRow05Height = $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabContactSenderRow06       = $iGUIMainTabContactSenderRow05 + $iGUIMainTabContactSenderRow05Height  ;;"Current username"
        Global $iGUIMainTabContactSenderRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSenderRow07       = $iGUIMainTabContactSenderRow06 + $iGUIMainTabContactSenderRow06Height  ;;spacer
        Global $iGUIMainTabContactSenderRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
        Global $iGUIMainTabContactSenderRow08       = $iGUIMainTabContactSenderRow07 + $iGUIMainTabContactSenderRow07Height  ;;"Show email field"
        Global $iGUIMainTabContactSEnderRow08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSenderRow09       = $iGUIMainTabContactSenderRow08 + $iGUIMainTabContactSenderRow08Height  ;;final spacer
        Global $iGUIMainTabContactSenderRow09Height = $iGUIMainTabAllChromeCheckboxSpacerFinal

        ;;OVERALL
        $iGUIMainTabContactSenderRow02Height = $iGUIMainTabContactSenderRow03Height + _
                                               $iGUIMainTabContactSenderRow04Height + _
                                               $iGUIMainTabContactSenderRow05Height + _
                                               $iGUIMainTabContactSenderRow06Height + _
                                               $iGUIMainTabContactSenderRow07Height + _
                                               $iGUIMainTabContactSenderRow08Height + _
                                               $iGUIMainTabContactSenderRow09Height
        $iGUIMainTabContactSenderRow00Height = $iGUIMainTabContactSenderRow02Height + _
                                               $iGUIMainTabContactSenderRow01Height

      ;;GRID GROUP SMTP (CONTROLS ASSOCIATED WITH THE SMTP SETTINGS GROUP OF THE CONTACT FORM TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabContactSMTPColumn00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabContactSMTPColumn00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabContactSMTPColumn01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabContactSMTPColumn01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabContactSMTPColumn02      = $iGUIMainTabAllColumnRight02  ;;checkbox
        Global $iGUIMainTabContactSMTPColumn02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabContactSMTPColumn03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabContactSMTPColumn03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabContactSMTPRow00       = $iGUIMainTabAllRow00  ;;region
        Global $iGUIMainTabContactSMTPRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabContactSMTPRow01       = $iGUIMainTabContactSMTPRow00  ;;spacer
        Global $iGUIMainTabContactSMTPRow01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabContactSMTPRow02       = $iGUIMainTabContactSMTPRow01 + $iGUIMainTabContactSMTPRow01Height  ;;group
        Global $iGUIMainTabContactSMTPRow02Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabContactSMTPRow03       = $iGUIMainTabContactSMTPRow02  ;;spacer
        Global $iGUIMainTabContactSMTPRow03Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabContactSMTPRow04       = $iGUIMainTabContactSMTPRow03 + $iGUIMainTabContactSMTPRow03Height  ;;"Server:"
        Global $iGUIMainTabContactSMTPRow04Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSMTPRow05       = $iGUIMainTabContactSMTPRow04 + $iGUIMainTabContactSMTPRow04Height  ;;spacer
        Global $iGUIMainTabContactSMTPRow05Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabContactSMTPRow06       = $iGUIMainTabContactSMTPRow05 + $iGUIMainTabContactSMTPRow05Height  ;;"Port:"
        Global $iGUIMainTabContactSMTPRow06Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSMTPRow07       = $iGUIMainTabContactSMTPRow06 + $iGUIMainTabContactSMTPRow06Height  ;;spacer
        Global $iGUIMainTabContactSMTPRow07Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabContactSMTPRow08       = $iGUIMainTabContactSMTPRow07 + $iGUIMainTabContactSMTPRow07Height  ;;"Use SSL/TLS"
        Global $iGUIMainTabContactSMTPRow08Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSMTPRow09       = $iGUIMainTabContactSMTPRow08 + $iGUIMainTabContactSMTPRow08Height  ;;spacer
        Global $iGUIMainTabContactSMTPRow09Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabContactSMTPRow10       = $iGUIMainTabContactSMTPRow09 + $iGUIMainTabContactSMTPRow09Height  ;;"Username"
        Global $iGUIMainTabContactSMTPRow10Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSMTPRow11       = $iGUIMainTabContactSMTPRow10 + $iGUIMainTabContactSMTPRow10Height  ;;spacer
        Global $iGUIMainTabContactSMTPRow11Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabContactSMTPRow12       = $iGUIMainTabContactSMTPRow11 + $iGUIMainTabContactSMTPRow11Height  ;;"Password"
        Global $iGUIMainTabContactSMTPRow12Height = $iGUIMainTabAllChromeInputHeight
        Global $iGUIMainTabContactSMTPRow13       = $iGUIMainTabContactSMTPRow12 + $iGUIMainTabContactSMTPRow12Height  ;;final spacer
        Global $iGUIMainTabContactSMTPRow13Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabContactSMTPRow02Height = $iGUIMainTabContactSMTPRow03Height + _
                                             $iGUIMainTabContactSMTPRow04Height + _
                                             $iGUIMainTabContactSMTPRow05Height + _
                                             $iGUIMainTabContactSMTPRow06Height + _
                                             $iGUIMainTabContactSMTPRow07Height + _
                                             $iGUIMainTabContactSMTPRow08Height + _
                                             $iGUIMainTabContactSMTPRow09Height + _
                                             $iGUIMainTabContactSMTPRow10Height + _
                                             $iGUIMainTabContactSMTPRow11Height + _
                                             $iGUIMainTabContactSMTPRow12Height + _
                                             $iGUIMainTabContactSMTPRow13Height
        $iGUIMainTabContactSMTPRow00Height = $iGUIMainTabContactSMTPRow02Height + _
                                             $iGUIMainTabContactSMTPRow01Height

      ;;GRID GROUP TEST (CONTROLS ASSOCIATED WITH THE TEST SETTINGS GROUP OF THE CONTACT FORM TAB)
        ;;MISC
          ;asdf

        ;;COLUMNS
        Global $iGUIMainTabContactTestColumn00      = $iGUIMainTabAllColumnRight00  ;;region
        Global $iGUIMainTabContactTestColumn00Width = $iGUIMainTabAllColumnRight00Width
        Global $iGUIMainTabContactTestColumn01      = $iGUIMainTabAllColumnRight01  ;;group
        Global $iGUIMainTabContactTestColumn01Width = $iGUIMainTabAllColumnRight01Width
        Global $iGUIMainTabContactTestColumn02      = $iGUIMainTabAllColumnRight02  ;;checkbox
        Global $iGUIMainTabContactTestColumn02Width = $iGUIMainTabAllColumnRight02Width
        Global $iGUIMainTabContactTestColumn03      = $iGUIMainTabAllColumnRight03  ;;input box
        Global $iGUIMainTabContactTestColumn03Width = $iGUIMainTabAllColumnRight03Width - 12

        ;;ROWS
        Global $iGUIMainTabContactTestRow00       = $iGUIMainTabContactSMTPRow00 + $iGUIMainTabContactSMTPRow00Height  ;;region
        Global $iGUIMainTabContactTestRow00Height = 0  ;;height of entire region. Defined below.
        Global $iGUIMainTabContactTestRow01       = $iGUIMainTabContactTestRow00  ;;spacer
        Global $iGUIMainTabContactTestRow01Height = $iGUIMainTabAllPaddingTop
        Global $iGUIMainTabContactTestRow02       = $iGUIMainTabContactTestRow01 + $iGUIMainTabContactTestRow01Height  ;;group
        Global $iGUIMainTabContactTestRow02Height = 0  ;;height of group box. Defined below.
        Global $iGUIMainTabContactTestRow03       = $iGUIMainTabContactTestRow02  ;;spacer
        Global $iGUIMainTabContactTestRow03Height = $iGUIMainTabAllChromeGroupTop
        Global $iGUIMainTabContactTestRow04       = $iGUIMainTabContactTestRow03 + $iGUIMainTabContactTestRow03Height  ;;"Send Test Email"
        Global $iGUIMainTabContactTestRow04Height = $iGUIMainTabAllChromeInputHeight * 3
        Global $iGUIMainTabContactTestRow05       = $iGUIMainTabContactTestRow04 + $iGUIMainTabContactTestRow04Height  ;;spacer
        Global $iGUIMainTabContactTestRow05Height = $iGUIMainTabAllChromeInputSpacer
        Global $iGUIMainTabContactTestRow06       = $iGUIMainTabContactTestRow05 + $iGUIMainTabContactTestRow05Height  ;;"Result:"
        Global $iGUIMainTabContactTestRow06Height = $iGUIMainTabAllButtonHeight
        Global $iGUIMainTabContactTestRow07       = $iGUIMainTabContactTestRow06 + $iGUIMainTabContactTestRow06Height  ;;final spacer
        Global $iGUIMainTabContactTestRow07Height = $iGUIMainTabAllChromeGroupBottom

        ;;OVERALL
        $iGUIMainTabContactTestRow02Height = $iGUIMainTabContactTestRow03Height + _
                                             $iGUIMainTabContactTestRow04Height + _
                                             $iGUIMainTabContactTestRow05Height + _
                                             $iGUIMainTabContactTestRow06Height + _
                                             $iGUIMainTabContactTestRow07Height
        $iGUIMainTabContactTestRow00Height = $iGUIMainTabContactTestRow02Height + _
                                             $iGUIMainTabContactTestRow01Height

    ;;ADJUSTMENTS
      ;adjustments for entire gui declarations? changes to window boundaries?

  EndFunc

  Func GUIBuild()
    ;;CREATE MAIN GUI
    ;; Requires GUIDefine() to have been previously ran.

    ;;DECLARE MAIN WINDOW
    Global $hGUIMain = GUICreate('About This Computer Configurator', $iGUIMainWidthDefault, $iGUIMainHeightDefault + $iGUIMainMenuBarHeight + $iGUIMainStatusBarHeight, -1, -1)

    ;;MENU BAR
      ;;File
        Global $idMenuMainFile = GUICtrlCreateMenu('&File')

        Global $idMenuItemMainFileImportEdit = GUICtrlCreateMenuItem('Import configuration and edit...', $idMenuMainFile, -1)
        Global $idMenuItemMainFileImportSave = GUICtrlCreateMenuItem('Import configuration and save...', $idMenuMainFile, -1)
        Global $idMenuItemMainFileExportUnsaved = GUICtrlCreateMenuItem('Export unsaved configuration...', $idMenuMainFile, -1)
        Global $idMenuItemMainFileExportSaved = GUICtrlCreateMenuItem('Export existing configuration...', $idMenuMainFile, -1)
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

    ;;STATUS BAR
      $hStatusBarMain = _GUICtrlStatusBar_Create($hGUIMain, '', '', $SBARS_SIZEGRIP)
      _GUICtrlStatusBar_SetText($hStatusBarMain, '')

    ;;MAIN WINDOW ELEMENTS - LEFT
      $idGraphicMainLogo = GUICtrlCreateIcon($sAppLogo, -1, $iGUIMainColumnLeft02 + 12, $iGUIMainRowLeft01, $iGUIMainColumnLeft01Width, $iGUIMainRowLeft01Height, -1, $GUI_WS_EX_PARENTDRAG)

      Global $idButtonMainLeftApply = GUICtrlCreateButton('Apply', $iGUIMainColumnLeft01, $iGUIMainRowLeft03, $iGUIMainColumnLeft02Width, $iGUIMainRowLeft03Height)
      Global $idButtonMainLeftCancel = GUICtrlCreateButton('Cancel', $iGUIMainColumnLeft01, $iGUIMainRowLeft02, $iGUIMainColumnLeft02Width, $iGUIMainRowLeft02Height)

    ;;MAIN WINDOW ELEMENTS - RIGHT
      Global $idTabMain = GUICtrlCreateTab($iGUIMainColumnRight01, $iGUIMainRowRight01, $iGUIMainColumnRight01Width, $iGUIMainRowRight01Height)

      ;;TAB MAIN
        $idTabMain = GUICtrlCreateTabItem('Main')

        ;;GROUP GENERAL
          Global $idGroupMain_General = GUICtrlCreateGroup('General', _
            $iGUIMainTabMainGeneralColumn01, $iGUIMainTabMainGeneralRow02, $iGUIMainTabMainGeneralColumn01Width, $iGUIMainTabMainGeneralRow02Height)
          Global $idCheckboxMainGeneral_StartAtLogin = GUICtrlCreateCheckbox('Start About This Computer at user login', _
            $iGUIMainTabMainGeneralColumn02, $iGUIMainTabMainGeneralRow04, $iGUIMainTabMainGeneralColumn02Width, $iGUIMainTabMainGeneralRow04Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxMainGeneral_DisableExit = GUICtrlCreateCheckbox('Disable exiting About This Computer', _
            $iGUIMainTabMainGeneralColumn02, $iGUIMainTabMainGeneralRow06, $iGUIMainTabMainGeneralColumn02Width, $iGUIMainTabMainGeneralRow06Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

        ;;GROUP TRAY ICON
          Global $idGroupMain_TrayIcon = GUICtrlCreateGroup('Tray Icon', _
            $iGUIMainTabMainTrayIconColumn01, $iGUIMainTabMainTrayIconRow02, $iGUIMainTabMainTrayIconColumn01Width, $iGUIMainTabMainTrayIconRow02Height)

          ;;gold star icon
          Global $idRadioMainTrayIcon_First = GUICtrlCreateRadio('', _
            $iGUIMainTabMainTrayIconColumn02, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn02Width, $iGUIMainTabMainTrayIconRow04Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          GUICtrlCreateIcon('shell32.dll', 44, _
            $iGUIMainTabMainTrayIconColumn04, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn04Width, $iGUIMainTabMainTrayIconRow04Height)

          ;;BeOS info icon
          Global $idRadioMainTrayIcon_Second = GUICtrlCreateRadio('', _
            $iGUIMainTabMainTrayIconColumn06, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn06Width, $iGUIMainTabMainTrayIconRow04Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          GUICtrlCreateIcon($sAppParentLogo, -1, _
            $iGUIMainTabMainTrayIconColumn08, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn08Width, $iGUIMainTabMainTrayIconRow04Height)

          ;;system info icon
          Global $idRadioMainTrayIcon_Third = GUICtrlCreateRadio('', _
            $iGUIMainTabMainTrayIconColumn10, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn10Width, $iGUIMainTabMainTrayIconRow04Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          GUICtrlCreateIcon('shell32.dll', 16783, _
            $iGUIMainTabMainTrayIconColumn12, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn12Width, $iGUIMainTabMainTrayIconRow04Height)

          ;;system question mark icon
          Global $idRadioMainTrayIcon_Fourth = GUICtrlCreateRadio('', _
            $iGUIMainTabMainTrayIconColumn14, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn14Width, $iGUIMainTabMainTrayIconRow04Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          GUICtrlCreateIcon('shell32.dll', 24, _
            $iGUIMainTabMainTrayIconColumn16, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn16Width, $iGUIMainTabMainTrayIconRow04Height)

          ;;system info bubble
          Global $idRadioMainTrayIcon_Fifth = GUICtrlCreateRadio('', _
            $iGUIMainTabMainTrayIconColumn18, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn18Width, $iGUIMainTabMainTrayIconRow04Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          GUICtrlCreateIcon('shell32.dll', 1001, _
            $iGUIMainTabMainTrayIconColumn20, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn20Width, $iGUIMainTabMainTrayIconRow04Height)

        ;;GROUP ASSET TAG
          Global $idCheckboxMainAssetTag_ShowAssetTag = GUICtrlCreateCheckbox('Show asset tag in Hardware section', _
            $iGUIMainTabMainAssetTagColumn01, $iGUIMainTabMainAssetTagRow02, $iGUIMainTabMainAssetTagColumn01Width, $iGUIMainTabMainAssetTagRow02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupMain_AssetTag = GUICtrlCreateGroup('Asset Tag', _
            $iGUIMainTabMainAssetTagColumn01, $iGUIMainTabMainAssetTagRow04, $iGUIMainTabMainAssetTagColumn01Width, $iGUIMainTabMainAssetTagRow04Height)

          Global $idRadioMainAssetTag_ReadFromBIOS = GUICtrlCreateRadio('Read asset tag from BIOS', _
            $iGUIMainTabMainAssetTagColumn02, $iGUIMainTabMainAssetTagRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainAssetTagColumn02Width + $iGUIMainTabMainAssetTagColumn03Width, $iGUIMainTabMainAssetTagRow06Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idRadioMainAssetTag_Custom = GUICtrlCreateRadio('Custom:', _
            $iGUIMainTabMainAssetTagColumn02, $iGUIMainTabMainAssetTagRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainAssetTagColumn02Width, $iGUIMainTabMainAssetTagRow08Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputMainAssetTag_Custom = GUICtrlCreateInput('', _
            $iGUIMainTabMainAssetTagColumn03, $iGUIMainTabMainAssetTagRow08, $iGUIMainTabMainAssetTagColumn03Width, $iGUIMainTabMainAssetTagRow08Height)
            _GUICtrlEdit_SetCueBanner($idInputMainAssetTag_Custom, '100123', True)

        ;;GROUP CUSTOM DETAILS
          Global $idCheckboxMainCustomDetails_ShowCustomDetails = GUICtrlCreateCheckbox('Show custom details section', _
            $iGUIMainTabMainCustomDetailsColumn01, $iGUIMainTabMainCustomDetailsRow02, $iGUIMainTabMainCustomDetailsColumn01Width, $iGUIMainTabMainCustomDetailsRow02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupMain_CustomDetails = GUICtrlCreateGroup('Custom Details', _
            $iGUIMainTabMainCustomDetailsColumn01, $iGUIMainTabMainCustomDetailsRow04, $iGUIMainTabMainCustomDetailsColumn01Width, $iGUIMainTabMainCustomDetailsRow04Height)

          Global $idEditMainCustomDetails_FreeText = GUICtrlCreateEdit('', _
            $iGUIMainTabMainCustomDetailsColumn02 + $iGUIMainTabMainCustomDetailsColumn02Offset, $iGUIMainTabMainCustomDetailsRow06, 296, $iGUIMainTabMainCustomDetailsRow06Height, _
            BitOR($ES_MULTILINE, $ES_WANTRETURN, $WS_VSCROLL, $ES_AUTOVSCROLL))

        ;;GROUP HELPDESK
          Global $idCheckboxMainHelpdesk_ShowHelpdesk = GUICtrlCreateCheckbox('Show Helpdesk section', _
            $iGUIMainTabMainHelpdeskColumn01, $iGUIMainTabMainHelpdeskRow02, $iGUIMainTabMainHelpdeskColumn01Width, $iGUIMainTabMainHelpdeskRow02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupMain_Helpdesk = GUICtrlCreateGroup('Helpdesk', _
            $iGUIMainTabMainHelpdeskColumn01, $iGUIMainTabMainHelpdeskRow04, $iGUIMainTabMainHelpdeskColumn01Width, $iGUIMainTabMainHelpdeskRow04Height)

          Global $idLabelMainHelpdesk_Header = GUICtrlCreateLabel('Section Header:', _
            $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputMainHelpdesk_Title = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow06, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow06Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_Title, $sOrgName & ' IT Helpdesk', True)

          Global $idCheckboxMainHelpdesk_ShowEmail = GUICtrlCreateCheckbox('Show email', _
            $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow08Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputMainHelpdesk_EmailTitle = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow08, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow08Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_EmailTitle, 'Email', True)
          Global $idInputMainHelpdesk_EmailAddress = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow10, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow10Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_EmailAddress, 'helpdesk@' & $sOrgDomain, True)

          Global $idCheckboxMainHelpdesk_ShowPhone = GUICtrlCreateCheckbox('Show phone', _
            $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow12 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow12Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputMainHelpdesk_PhoneTitle = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow12, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow12Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_PhoneTitle, 'Phone', True)
          Global $idInputMainHelpdesk_PhoneNumber = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow14, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow14Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_PhoneNumber, '1-888-555-5555', True)

          Global $idCheckboxMainHelpdesk_ShowWebsite = GUICtrlCreateCheckbox('Show website', _
            $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow16 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow16Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputMainHelpdesk_WebsiteTitle = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow16, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow16Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_WebsiteTitle, 'Website', True)
          Global $idInputMainHelpdesk_WebsiteAddress = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow18, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow18Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_WebsiteAddress, 'https://helpdesk.' & $sOrgDomain & '/', True)

          Global $idCheckboxMainHelpdesk_ShowAlternate = GUICtrlCreateCheckbox('Show alternate contact information', _
            $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow20 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow20Height - $iGUIMainTabAllChromeCheckboxOffset + $iGUIMainTabMainHelpdeskRow21Height + $iGUIMainTabMainHelpdeskRow22Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputMainHelpdesk_AlternateTitle = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow20, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow20Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_AlternateTitle, 'Reset a Password', True)
          Global $idInputMainHelpdesk_AlternateAddress = GUICtrlCreateInput('', _
            $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow22, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow22Height)
            _GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_AlternateAddress, '1-800-555-1234', True)

      ;;TAB TOOLS MENU
        $idTabToolsMenu = GUICtrlCreateTabItem('Tools Menu')

        ;;GROUP GENERAL
          Global $idCheckboxTools_EnableToolsMenu = GUICtrlCreateCheckbox('Enable Tools menu', _
            $iGUIMainTabToolsGeneralColumn01, $iGUIMainTabToolsGeneralRow02, $iGUIMainTabToolsGeneralColumn01Width, $iGUIMainTabToolsGeneralRow02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupTools_General = GUICtrlCreateGroup('General', _
            $iGUIMainTabToolsGeneralColumn01, $iGUIMainTabToolsGeneralRow04, $iGUIMainTabToolsGeneralColumn01Width, $iGUIMainTabToolsGeneralRow04Height)

          ;;LEFT CHECKBOXES
          Global $idCheckboxToolsGeneral_CredentialManager = GUICtrlCreateCheckbox('Credential Manager', _
            $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow06, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow06Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_DeviceManager = GUICtrlCreateCheckbox('Device Manager', _
            $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow08, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow08Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_DevicesAndPrinters = GUICtrlCreateCheckbox('Devices and Printers', _
            $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow10, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow10Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_InternetOptions = GUICtrlCreateCheckbox('Internet Options', _
            $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow12, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow12Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_MailAccounts = GUICtrlCreateCheckbox('Mail Accounts', _
            $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow14, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow14Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_NetworkConnections = GUICtrlCreateCheckbox('Network Connections', _
            $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow16, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow16Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          ;;RIGHT CHECKBOXES
          Global $idCheckboxToolsGeneral_PrintManagement = GUICtrlCreateCheckbox('Print Management', _
            $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow06, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow06Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_ProgramsAndFeatures = GUICtrlCreateCheckbox('Programs and Features', _
            $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow08, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow08Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_SearchDirectory = GUICtrlCreateCheckbox('Search Directory', _
            $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow10, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow10Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_Services = GUICtrlCreateCheckbox('Services', _
            $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow12, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow12Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_SystemProperties = GUICtrlCreateCheckbox('System Properties', _
            $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow14, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow14Height, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idCheckboxToolsGeneral_WindowsUpdate = GUICtrlCreateCheckbox('Windows Update', _
            $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow16, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow16Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

        ;;GROUP LOGIN SCRIPT
          Global $idCheckboxToolsLoginScript_ShowLoginScript = GUICtrlCreateCheckbox('Show login script in Tools menu', _
            $iGUIMainTabToolsLoginScriptColumn01, $iGUIMainTabToolsLoginScriptRow02, $iGUIMainTabToolsLoginScriptColumn01Width, $iGUIMainTabToolsLoginScriptRow02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupTools_LoginScript = GUICtrlCreateGroup('Login Script', _
            $iGUIMainTabToolsLoginScriptColumn01, $iGUIMainTabToolsLoginScriptRow04, $iGUIMainTabToolsLoginScriptColumn01Width, $iGUIMainTabToolsLoginScriptRow04Height)

          Global $idRadioToolsLoginScript_ReadFromActiveDirectory = GUICtrlCreateRadio("Read user's login script from Active Directory", _
            $iGUIMainTabToolsLoginScriptColumn02, $iGUIMainTabToolsLoginScriptRow06, $iGUIMainTabToolsLoginScriptColumn02Width + $iGUIMainTabToolsLoginScriptColumn03Width, $iGUIMainTabToolsLoginScriptRow06Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idRadioToolsLoginScript_Custom = GUICtrlCreateRadio('Path to script:', _
            $iGUIMainTabToolsLoginScriptColumn02, $iGUIMainTabToolsLoginScriptRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsLoginScriptColumn02Width, $iGUIMainTabToolsLoginScriptRow08Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputToolsLoginScript_Custom = GUICtrlCreateInput('', _
            $iGUIMainTabToolsLoginScriptColumn03, $iGUIMainTabToolsLoginScriptRow08, $iGUIMainTabToolsLoginScriptColumn03Width, $iGUIMainTabToolsLoginScriptRow08Height)
            _GUICtrlEdit_SetCueBanner($idInputToolsLoginScript_Custom, '\\' & $sOrgFQDomain & '\NETLOGON\login.vbs', True)

        ;;GROUP HOME DRIVE
          Global $idCheckboxToolsHomeDrive_ShowHomeDrive = GUICtrlCreateCheckbox('Show home drive in Tools menu', _
            $iGUIMainTabToolsHomeDriveColumn01, $iGUIMainTabToolsHomeDriveRow02, $iGUIMainTabToolsHomeDriveColumn01Width, $iGUIMainTabToolsHomeDriveRow02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupTools_HomeDrive = GUICtrlCreateGroup('Home Drive', _
            $iGUIMainTabToolsHomeDriveColumn01, $iGUIMainTabToolsHomeDriveRow04, $iGUIMainTabToolsHomeDriveColumn01Width, $iGUIMainTabToolsHomeDriveRow04Height)

          Global $idLabelToolsHomeDrive_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsHomeDriveColumn02Width, $iGUIMainTabToolsHomeDriveRow06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputToolsHomeDrive_Title = GUICtrlCreateInput('', _
            $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow06, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow06Height)
            _GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_Title, 'Map Home (Z:) Drive', True)

          Global $idRadioToolsHomeDrive_ReadFromActiveDirectory = GUICtrlCreateRadio("Read user's home drive from Active Directory", _
            $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsHomeDriveColumn02Width + $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow08Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idRadioToolsHomeDrive_MapDrive = GUICtrlCreateRadio('Map drive', _
            $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow10 + $iGUIMainTabAllChromeCheckboxOffset, 68, $iGUIMainTabToolsHomeDriveRow10Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idComboToolsHomeDrive_MapDriveLetter = GUICtrlCreateCombo('', _
            $iGUIMainTabToolsHomeDriveColumn02 + 68, $iGUIMainTabToolsHomeDriveRow10, 40, $iGUIMainTabToolsHomeDriveRow10Height)
          Global $idLabelToolsHomeDrive_To = GUICtrlCreateLabel('to', _
            $iGUIMainTabToolsHomeDriveColumn02 + 68 + 40 + 5, $iGUIMainTabToolsHomeDriveRow10 + $iGUIMainTabAllChromeCheckboxOffset, 15, $iGUIMainTabToolsHomeDriveRow10Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputToolsHomeDrive_MapDrivePath = GUICtrlCreateInput('', _
            $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow10, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow10Height)
            _GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_MapDrivePath, '\\fileserver\home\%USERNAME%', True)

          Global $idRadioToolsHomeDrive_Custom = GUICtrlCreateRadio('Create and open Network Places shortcut to:', _
            $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow12 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsHomeDriveColumn02Width, $iGUIMainTabToolsHomeDriveRow12Height + $iGUIMainTabToolsHomeDriveRow14Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputToolsHomeDrive_CustomName = GUICtrlCreateInput('', _
            $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow12, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow12Height)
            _GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_CustomName, "%USERNAME%'s Home Folder", True)
          Global $idInputToolsHomeDrive_CustomPath = GUICtrlCreateInput('', _
            $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow14, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow14Height)
            _GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_CustomPath, '\\fileserver\home\%USERNAME%', True)

      ;;TAB CUSTOM TOOL MENU
        $idTabCustomTools = GUICtrlCreateTabItem('Custom Tools')

        ;;GROUP CUSTOM TOOL 1
          Global $idCheckboxCustomToolsCommand1_Enable = GUICtrlCreateCheckbox('Show custom tool 1 in Tools menu', _
            $iGUIMainTabCustomToolsCommand1Column01, $iGUIMainTabCustomToolsCommand1Row02, $iGUIMainTabCustomToolsCommand1Column01Width, $iGUIMainTabCustomToolsCommand1Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupCustomTools_Command1 = GUICtrlCreateGroup('Custom Tool 1', _
            $iGUIMainTabCustomToolsCommand1Column01, $iGUIMainTabCustomToolsCommand1Row04, $iGUIMainTabCustomToolsCommand1Column01Width, $iGUIMainTabCustomToolsCommand1Row04Height)

          Global $idLabelCustomToolsCommand1_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabCustomToolsCommand1Column02, $iGUIMainTabCustomToolsCommand1Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand1Column02Width, $iGUIMainTabCustomToolsCommand1Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand1_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand1Column03, $iGUIMainTabCustomToolsCommand1Row06, $iGUIMainTabCustomToolsCommand1Column03Width, $iGUIMainTabCustomToolsCommand1Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand1_DisplayName, 'App Catalog', True)

          Global $idLabelCustomToolsCommand1_Command = GUICtrlCreateLabel('Command:', _
            $iGUIMainTabCustomToolsCommand1Column02, $iGUIMainTabCustomToolsCommand1Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand1Column02Width, $iGUIMainTabCustomToolsCommand1Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand1_Command = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand1Column03, $iGUIMainTabCustomToolsCommand1Row08, $iGUIMainTabCustomToolsCommand1Column03Width, $iGUIMainTabCustomToolsCommand1Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand1_Command, '"iexplore.exe" https://sccmserver/CMApplicationCatalog', True)

        ;;GROUP CUSTOM TOOL 2
          Global $idCheckboxCustomToolsCommand2_Enable = GUICtrlCreateCheckbox('Show custom tool 2 in Tools menu', _
            $iGUIMainTabCustomToolsCommand2Column01, $iGUIMainTabCustomToolsCommand2Row02, $iGUIMainTabCustomToolsCommand2Column01Width, $iGUIMainTabCustomToolsCommand2Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupCustomTools_Command2 = GUICtrlCreateGroup('Custom Tool 2', _
            $iGUIMainTabCustomToolsCommand2Column01, $iGUIMainTabCustomToolsCommand2Row04, $iGUIMainTabCustomToolsCommand2Column01Width, $iGUIMainTabCustomToolsCommand2Row04Height)

          Global $idLabelCustomToolsCommand2_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabCustomToolsCommand2Column02, $iGUIMainTabCustomToolsCommand2Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand2Column02Width, $iGUIMainTabCustomToolsCommand2Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand2_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand2Column03, $iGUIMainTabCustomToolsCommand2Row06, $iGUIMainTabCustomToolsCommand2Column03Width, $iGUIMainTabCustomToolsCommand2Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand2_DisplayName, 'Close All Network Shares', True)

          Global $idLabelCustomToolsCommand2_Command = GUICtrlCreateLabel('Command:', _
            $iGUIMainTabCustomToolsCommand2Column02, $iGUIMainTabCustomToolsCommand2Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand2Column02Width, $iGUIMainTabCustomToolsCommand2Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand2_Command = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand2Column03, $iGUIMainTabCustomToolsCommand2Row08, $iGUIMainTabCustomToolsCommand2Column03Width, $iGUIMainTabCustomToolsCommand2Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand2_Command, 'net use /delete *', True)

        ;;GROUP CUSTOM TOOL 3
          Global $idCheckboxCustomToolsCommand3_Enable = GUICtrlCreateCheckbox('Show custom tool 3 in Tools menu', _
            $iGUIMainTabCustomToolsCommand3Column01, $iGUIMainTabCustomToolsCommand3Row02, $iGUIMainTabCustomToolsCommand3Column01Width, $iGUIMainTabCustomToolsCommand3Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupCustomTools_Command3 = GUICtrlCreateGroup('Custom Tool 3', _
            $iGUIMainTabCustomToolsCommand3Column01, $iGUIMainTabCustomToolsCommand3Row04, $iGUIMainTabCustomToolsCommand3Column01Width, $iGUIMainTabCustomToolsCommand3Row04Height)

          Global $idLabelCustomToolsCommand3_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabCustomToolsCommand3Column02, $iGUIMainTabCustomToolsCommand3Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand3Column02Width, $iGUIMainTabCustomToolsCommand3Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand3_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand3Column03, $iGUIMainTabCustomToolsCommand3Row06, $iGUIMainTabCustomToolsCommand3Column03Width, $iGUIMainTabCustomToolsCommand3Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand3_DisplayName, '', True)

          Global $idLabelCustomToolsCommand3_Command = GUICtrlCreateLabel('Command:', _
            $iGUIMainTabCustomToolsCommand3Column02, $iGUIMainTabCustomToolsCommand3Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand3Column02Width, $iGUIMainTabCustomToolsCommand3Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand3_Command = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand3Column03, $iGUIMainTabCustomToolsCommand3Row08, $iGUIMainTabCustomToolsCommand3Column03Width, $iGUIMainTabCustomToolsCommand3Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand3_Command, '', True)

        ;;GROUP CUSTOM TOOL 4
          Global $idCheckboxCustomToolsCommand4_Enable = GUICtrlCreateCheckbox('Show custom tool 4 in Tools menu', _
            $iGUIMainTabCustomToolsCommand4Column01, $iGUIMainTabCustomToolsCommand4Row02, $iGUIMainTabCustomToolsCommand4Column01Width, $iGUIMainTabCustomToolsCommand4Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupCustomTools_Command4 = GUICtrlCreateGroup('Custom Tool 4', _
            $iGUIMainTabCustomToolsCommand4Column01, $iGUIMainTabCustomToolsCommand4Row04, $iGUIMainTabCustomToolsCommand4Column01Width, $iGUIMainTabCustomToolsCommand4Row04Height)

          Global $idLabelCustomToolsCommand4_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabCustomToolsCommand4Column02, $iGUIMainTabCustomToolsCommand4Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand4Column02Width, $iGUIMainTabCustomToolsCommand4Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand4_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand4Column03, $iGUIMainTabCustomToolsCommand4Row06, $iGUIMainTabCustomToolsCommand4Column03Width, $iGUIMainTabCustomToolsCommand4Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand4_DisplayName, '', True)

          Global $idLabelCustomToolsCommand4_Command = GUICtrlCreateLabel('Command:', _
            $iGUIMainTabCustomToolsCommand4Column02, $iGUIMainTabCustomToolsCommand4Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand4Column02Width, $iGUIMainTabCustomToolsCommand4Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand4_Command = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand4Column03, $iGUIMainTabCustomToolsCommand4Row08, $iGUIMainTabCustomToolsCommand4Column03Width, $iGUIMainTabCustomToolsCommand4Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand4_Command, '', True)

        ;;GROUP CUSTOM TOOL 5
          Global $idCheckboxCustomToolsCommand5_Enable = GUICtrlCreateCheckbox('Show custom tool 5 in Tools menu', _
            $iGUIMainTabCustomToolsCommand5Column01, $iGUIMainTabCustomToolsCommand5Row02, $iGUIMainTabCustomToolsCommand5Column01Width, $iGUIMainTabCustomToolsCommand5Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupCustomTools_Command5 = GUICtrlCreateGroup('Custom Tool 5', _
            $iGUIMainTabCustomToolsCommand5Column01, $iGUIMainTabCustomToolsCommand5Row04, $iGUIMainTabCustomToolsCommand5Column01Width, $iGUIMainTabCustomToolsCommand5Row04Height)

          Global $idLabelCustomToolsCommand5_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabCustomToolsCommand5Column02, $iGUIMainTabCustomToolsCommand5Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand5Column02Width, $iGUIMainTabCustomToolsCommand5Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand5_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand5Column03, $iGUIMainTabCustomToolsCommand5Row06, $iGUIMainTabCustomToolsCommand5Column03Width, $iGUIMainTabCustomToolsCommand5Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand5_DisplayName, '', True)

          Global $idLabelCustomToolsCommand5_Command = GUICtrlCreateLabel('Command:', _
            $iGUIMainTabCustomToolsCommand5Column02, $iGUIMainTabCustomToolsCommand5Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand5Column02Width, $iGUIMainTabCustomToolsCommand5Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputCustomToolsCommand5_Command = GUICtrlCreateInput('', _
            $iGUIMainTabCustomToolsCommand5Column03, $iGUIMainTabCustomToolsCommand5Row08, $iGUIMainTabCustomToolsCommand5Column03Width, $iGUIMainTabCustomToolsCommand5Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand5_Command, '', True)

      ;;TAB HELP MENU
        $idTabHelpMenu = GUICtrlCreateTabItem('Help Menu')

        ;;GROUP LINK 1
          Global $idCheckboxHelpLink1_Enable = GUICtrlCreateCheckbox('Show link 1 in Help menu', _
            $iGUIMainTabHelpLink1Column01, $iGUIMainTabHelpLink1Row02, $iGUIMainTabHelpLink1Column01Width, $iGUIMainTabHelpLink1Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupHelp_Link1 = GUICtrlCreateGroup('Link 1', _
            $iGUIMainTabHelpLink1Column01, $iGUIMainTabHelpLink1Row04, $iGUIMainTabHelpLink1Column01Width, $iGUIMainTabHelpLink1Row04Height)

          Global $idLabelHelpLink1_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabHelpLink1Column02, $iGUIMainTabHelpLink1Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink1Column02Width, $iGUIMainTabHelpLink1Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink1_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink1Column03, $iGUIMainTabHelpLink1Row06, $iGUIMainTabHelpLink1Column03Width, $iGUIMainTabHelpLink1Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink1_DisplayName, 'LogMeIn Rescue', True)

          Global $idLabelHelpLink1_Command = GUICtrlCreateLabel('URL:', _
            $iGUIMainTabHelpLink1Column02, $iGUIMainTabHelpLink1Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink1Column02Width, $iGUIMainTabHelpLink1Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink1_Command = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink1Column03, $iGUIMainTabHelpLink1Row08, $iGUIMainTabHelpLink1Column03Width, $iGUIMainTabHelpLink1Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink1_Command, 'https://logmein123.com/', True)

        ;;GROUP LINK 2
          Global $idCheckboxHelpLink2_Enable = GUICtrlCreateCheckbox('Show link 2 in Help menu', _
            $iGUIMainTabHelpLink2Column01, $iGUIMainTabHelpLink2Row02, $iGUIMainTabHelpLink2Column01Width, $iGUIMainTabHelpLink2Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupHelp_Link2 = GUICtrlCreateGroup('Link 2', _
            $iGUIMainTabHelpLink2Column01, $iGUIMainTabHelpLink2Row04, $iGUIMainTabHelpLink2Column01Width, $iGUIMainTabHelpLink2Row04Height)

          Global $idLabelHelpLink2_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabHelpLink2Column02, $iGUIMainTabHelpLink2Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink2Column02Width, $iGUIMainTabHelpLink2Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink2_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink2Column03, $iGUIMainTabHelpLink2Row06, $iGUIMainTabHelpLink2Column03Width, $iGUIMainTabHelpLink2Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink2_DisplayName, $sOrgName & ' Intranet', True)

          Global $idLabelHelpLink2_Command = GUICtrlCreateLabel('URL:', _
            $iGUIMainTabHelpLink2Column02, $iGUIMainTabHelpLink2Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink2Column02Width, $iGUIMainTabHelpLink2Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink2_Command = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink2Column03, $iGUIMainTabHelpLink2Row08, $iGUIMainTabHelpLink2Column03Width, $iGUIMainTabHelpLink2Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink2_Command, 'https://intranet.' & $sOrgDomain & '/', True)

        ;;GROUP LINK 3
          Global $idCheckboxHelpLink3_Enable = GUICtrlCreateCheckbox('Show link 3 in Help menu', _
            $iGUIMainTabHelpLink3Column01, $iGUIMainTabHelpLink3Row02, $iGUIMainTabHelpLink3Column01Width, $iGUIMainTabHelpLink3Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupHelp_Link3 = GUICtrlCreateGroup('Link 3', _
            $iGUIMainTabHelpLink3Column01, $iGUIMainTabHelpLink3Row04, $iGUIMainTabHelpLink3Column01Width, $iGUIMainTabHelpLink3Row04Height)

          Global $idLabelHelpLink3_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabHelpLink3Column02, $iGUIMainTabHelpLink3Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink3Column02Width, $iGUIMainTabHelpLink3Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink3_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink3Column03, $iGUIMainTabHelpLink3Row06, $iGUIMainTabHelpLink3Column03Width, $iGUIMainTabHelpLink3Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink3_DisplayName, $sOrgName & ' IT Helpdesk', True)

          Global $idLabelHelpLink3_Command = GUICtrlCreateLabel('URL:', _
            $iGUIMainTabHelpLink3Column02, $iGUIMainTabHelpLink3Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink3Column02Width, $iGUIMainTabHelpLink3Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink3_Command = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink3Column03, $iGUIMainTabHelpLink3Row08, $iGUIMainTabHelpLink3Column03Width, $iGUIMainTabHelpLink3Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink3_Command, 'https://helpdesk.' & $sOrgDomain & '/', True)

        ;;GROUP LINK 4
          Global $idCheckboxHelpLink4_Enable = GUICtrlCreateCheckbox('Show link 4 in Help menu', _
            $iGUIMainTabHelpLink4Column01, $iGUIMainTabHelpLink4Row02, $iGUIMainTabHelpLink4Column01Width, $iGUIMainTabHelpLink4Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupHelp_Link4 = GUICtrlCreateGroup('Link 4', _
            $iGUIMainTabHelpLink4Column01, $iGUIMainTabHelpLink4Row04, $iGUIMainTabHelpLink4Column01Width, $iGUIMainTabHelpLink4Row04Height)

          Global $idLabelHelpLink4_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabHelpLink4Column02, $iGUIMainTabHelpLink4Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink4Column02Width, $iGUIMainTabHelpLink4Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink4_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink4Column03, $iGUIMainTabHelpLink4Row06, $iGUIMainTabHelpLink4Column03Width, $iGUIMainTabHelpLink4Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink4_DisplayName, 'Password Self-Service', True)

          Global $idLabelHelpLink4_Command = GUICtrlCreateLabel('URL:', _
            $iGUIMainTabHelpLink4Column02, $iGUIMainTabHelpLink4Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink4Column02Width, $iGUIMainTabHelpLink4Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink4_Command = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink4Column03, $iGUIMainTabHelpLink4Row08, $iGUIMainTabHelpLink4Column03Width, $iGUIMainTabHelpLink4Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink4_Command, 'https://passwords.' & $sOrgDomain & '/', True)

        ;;GROUP LINK 5
          Global $idCheckboxHelpLink5_Enable = GUICtrlCreateCheckbox('Show link 5 in Help menu', _
            $iGUIMainTabHelpLink5Column01, $iGUIMainTabHelpLink5Row02, $iGUIMainTabHelpLink5Column01Width, $iGUIMainTabHelpLink5Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupHelp_Link5 = GUICtrlCreateGroup('Link 5', _
            $iGUIMainTabHelpLink5Column01, $iGUIMainTabHelpLink5Row04, $iGUIMainTabHelpLink5Column01Width, $iGUIMainTabHelpLink5Row04Height)

          Global $idLabelHelpLink5_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabHelpLink5Column02, $iGUIMainTabHelpLink5Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink5Column02Width, $iGUIMainTabHelpLink5Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink5_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink5Column03, $iGUIMainTabHelpLink5Row06, $iGUIMainTabHelpLink5Column03Width, $iGUIMainTabHelpLink5Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink5_DisplayName, '', True)

          Global $idLabelHelpLink5_Command = GUICtrlCreateLabel('URL:', _
            $iGUIMainTabHelpLink5Column02, $iGUIMainTabHelpLink5Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink5Column02Width, $iGUIMainTabHelpLink5Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputHelpLink5_Command = GUICtrlCreateInput('', _
            $iGUIMainTabHelpLink5Column03, $iGUIMainTabHelpLink5Row08, $iGUIMainTabHelpLink5Column03Width, $iGUIMainTabHelpLink5Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputHelpLink5_Command, '', True)

      ;;TAB SERVICES
        $idTabServices = GUICtrlCreateTabItem('Services')

        ;;GROUP SERVICE 1
          Global $idCheckboxServicesService1_Enable = GUICtrlCreateCheckbox('Show service 1 status in summary text', _
            $iGUIMainTabServicesService1Column01, $iGUIMainTabServicesService1Row02, $iGUIMainTabServicesService1Column01Width, $iGUIMainTabServicesService1Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupServices_Service1 = GUICtrlCreateGroup('Service 1', _
            $iGUIMainTabServicesService1Column01, $iGUIMainTabServicesService1Row04, $iGUIMainTabServicesService1Column01Width, $iGUIMainTabServicesService1Row04Height)

          Global $idLabelServicesService1_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabServicesService1Column02, $iGUIMainTabServicesService1Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService1Column02Width, $iGUIMainTabServicesService1Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService1_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService1Column03, $iGUIMainTabServicesService1Row06, $iGUIMainTabServicesService1Column03Width, $iGUIMainTabServicesService1Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService1_DisplayName, 'Windows Update', True)

          Global $idLabelServicesService1_Name = GUICtrlCreateLabel('Service Name:', _
            $iGUIMainTabServicesService1Column02, $iGUIMainTabServicesService1Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService1Column02Width, $iGUIMainTabServicesService1Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService1_Name = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService1Column03, $iGUIMainTabServicesService1Row08, $iGUIMainTabServicesService1Column03Width, $iGUIMainTabServicesService1Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService1_Name, 'wuauserv', True)

        ;;GROUP SERVICE 2
          Global $idCheckboxServicesService2_Enable = GUICtrlCreateCheckbox('Show service 2 status in summary text', _
            $iGUIMainTabServicesService2Column01, $iGUIMainTabServicesService2Row02, $iGUIMainTabServicesService2Column01Width, $iGUIMainTabServicesService2Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupServices_Service2 = GUICtrlCreateGroup('Service 2', _
            $iGUIMainTabServicesService2Column01, $iGUIMainTabServicesService2Row04, $iGUIMainTabServicesService2Column01Width, $iGUIMainTabServicesService2Row04Height)

          Global $idLabelServicesService2_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabServicesService2Column02, $iGUIMainTabServicesService2Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService2Column02Width, $iGUIMainTabServicesService2Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService2_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService2Column03, $iGUIMainTabServicesService2Row06, $iGUIMainTabServicesService2Column03Width, $iGUIMainTabServicesService2Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService2_DisplayName, 'SCCM Client (SMS Agent Host)', True)

          Global $idLabelServicesService2_Name = GUICtrlCreateLabel('Service Name:', _
            $iGUIMainTabServicesService2Column02, $iGUIMainTabServicesService2Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService2Column02Width, $iGUIMainTabServicesService2Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService2_Name = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService2Column03, $iGUIMainTabServicesService2Row08, $iGUIMainTabServicesService2Column03Width, $iGUIMainTabServicesService2Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService2_Name, 'CcmExec', True)

        ;;GROUP SERVICE 3
          Global $idCheckboxServicesService3_Enable = GUICtrlCreateCheckbox('Show service 3 status in summary text', _
            $iGUIMainTabServicesService3Column01, $iGUIMainTabServicesService3Row02, $iGUIMainTabServicesService3Column01Width, $iGUIMainTabServicesService3Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupServices_Service3 = GUICtrlCreateGroup('Service 3', _
            $iGUIMainTabServicesService3Column01, $iGUIMainTabServicesService3Row04, $iGUIMainTabServicesService3Column01Width, $iGUIMainTabServicesService3Row04Height)

          Global $idLabelServicesService3_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabServicesService3Column02, $iGUIMainTabServicesService3Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService3Column02Width, $iGUIMainTabServicesService3Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService3_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService3Column03, $iGUIMainTabServicesService3Row06, $iGUIMainTabServicesService3Column03Width, $iGUIMainTabServicesService3Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService3_DisplayName, 'CrowdStrike Windows Sensor', True)

          Global $idLabelServicesService3_Name = GUICtrlCreateLabel('Service Name:', _
            $iGUIMainTabServicesService3Column02, $iGUIMainTabServicesService3Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService3Column02Width, $iGUIMainTabServicesService3Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService3_Name = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService3Column03, $iGUIMainTabServicesService3Row08, $iGUIMainTabServicesService3Column03Width, $iGUIMainTabServicesService3Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService3_Name, 'CSFalconService', True)

        ;;GROUP SERVICE 4
          Global $idCheckboxServicesService4_Enable = GUICtrlCreateCheckbox('Show service 4 status in summary text', _
            $iGUIMainTabServicesService4Column01, $iGUIMainTabServicesService4Row02, $iGUIMainTabServicesService4Column01Width, $iGUIMainTabServicesService4Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupServices_Service4 = GUICtrlCreateGroup('Service 4', _
            $iGUIMainTabServicesService4Column01, $iGUIMainTabServicesService4Row04, $iGUIMainTabServicesService4Column01Width, $iGUIMainTabServicesService4Row04Height)

          Global $idLabelServicesService4_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabServicesService4Column02, $iGUIMainTabServicesService4Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService4Column02Width, $iGUIMainTabServicesService4Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService4_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService4Column03, $iGUIMainTabServicesService4Row06, $iGUIMainTabServicesService4Column03Width, $iGUIMainTabServicesService4Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService4_DisplayName, 'BeyondTrust PowerBroker', True)

          Global $idLabelServicesService4_Name = GUICtrlCreateLabel('Service Name:', _
            $iGUIMainTabServicesService4Column02, $iGUIMainTabServicesService4Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService4Column02Width, $iGUIMainTabServicesService4Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService4_Name = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService4Column03, $iGUIMainTabServicesService4Row08, $iGUIMainTabServicesService4Column03Width, $iGUIMainTabServicesService4Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService4_Name, 'BTService', True)

        ;;GROUP SERVICE 5
          Global $idCheckboxServicesService5_Enable = GUICtrlCreateCheckbox('Show service 5 status in summary text', _
            $iGUIMainTabServicesService5Column01, $iGUIMainTabServicesService5Row02, $iGUIMainTabServicesService5Column01Width, $iGUIMainTabServicesService5Row02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupServices_Service5 = GUICtrlCreateGroup('Service 5', _
            $iGUIMainTabServicesService5Column01, $iGUIMainTabServicesService5Row04, $iGUIMainTabServicesService5Column01Width, $iGUIMainTabServicesService5Row04Height)

          Global $idLabelServicesService5_DisplayName = GUICtrlCreateLabel('Display Name:', _
            $iGUIMainTabServicesService5Column02, $iGUIMainTabServicesService5Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService5Column02Width, $iGUIMainTabServicesService5Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService5_DisplayName = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService5Column03, $iGUIMainTabServicesService5Row06, $iGUIMainTabServicesService5Column03Width, $iGUIMainTabServicesService5Row06Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService5_DisplayName, 'Splunk Universal Forwarder', True)

          Global $idLabelServicesService5_Name = GUICtrlCreateLabel('Service Name:', _
            $iGUIMainTabServicesService5Column02, $iGUIMainTabServicesService5Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService5Column02Width, $iGUIMainTabServicesService5Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputServicesService5_Name = GUICtrlCreateInput('', _
            $iGUIMainTabServicesService5Column03, $iGUIMainTabServicesService5Row08, $iGUIMainTabServicesService5Column03Width, $iGUIMainTabServicesService5Row08Height)
            _GUICtrlEdit_SetCueBanner($idInputServicesService5_Name, 'SplunkForwarder', True)

      ;;TAB HELPDESK CONTACT FORM
        $idTabContactForm = GUICtrlCreateTabItem('Helpdesk Contact Form')

        ;;GROUP GENERAL
          Global $idCheckboxContact_EnableContactForm = GUICtrlCreateCheckbox('Enable helpdesk contact form', _
            $iGUIMainTabContactGeneralColumn01, $iGUIMainTabContactGeneralRow02, $iGUIMainTabContactGeneralColumn01Width, $iGUIMainTabContactGeneralRow02Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idGroupContact_General = GUICtrlCreateGroup('General', _
            $iGUIMainTabContactGeneralColumn01, $iGUIMainTabContactGeneralRow04, $iGUIMainTabContactGeneralColumn01Width, $iGUIMainTabContactGeneralRow04Height)

          Global $idLabelContactGeneral_ButtonText = GUICtrlCreateLabel('Button text:', _
            $iGUIMainTabContactGeneralColumn02, $iGUIMainTabContactGeneralRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactGeneralColumn02Width, $iGUIMainTabContactGeneralRow06Height - $iGUIMainTabAllChromeCheckboxOffset)
          Global $idInputContactGeneral_ButtonText = GUICtrlCreateInput('', _
            $iGUIMainTabContactGeneralColumn03, $iGUIMainTabContactGeneralRow06, $iGUIMainTabContactGeneralColumn03Width, $iGUIMainTabContactGeneralRow06Height)
            _GUICtrlEdit_SetCueBanner($idInputContactGeneral_ButtonText, 'Create an IT Helpdesk Request', True)

          Global $idCheckboxContactGeneral_ShowEmployeeIDField = GUICtrlCreateCheckbox('Show Employee ID field in contact form', _
            $iGUIMainTabContactGeneralColumn02, $iGUIMainTabContactGeneralRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactGeneralColumn02Width + $iGUIMainTabContactGeneralColumn03Width, $iGUIMainTabContactGeneralRow08Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))

        ;;GROUP RECIPIENT
          Global $idGroupContact_Recipient = GUICtrlCreateGroup('Recipient', _
            $iGUIMainTabContactRecipientColumn01, $iGUIMainTabContactRecipientRow02, $iGUIMainTabContactRecipientColumn01Width, $iGUIMainTabContactRecipientRow02Height)

          Global $idRadioContactRecipient_UseHelpdeskEmail = GUICtrlCreateRadio('Read helpdesk email from About This Computer', _
            $iGUIMainTabContactRecipientColumn02, $iGUIMainTabContactRecipientRow04, $iGUIMainTabContactRecipientColumn02Width + $iGUIMainTabContactRecipientColumn03Width, $iGUIMainTabContactRecipientRow04Height, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idRadioContactRecipient_Custom = GUICtrlCreateRadio('Custom:', _
            $iGUIMainTabContactRecipientColumn02, $iGUIMainTabContactRecipientRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactRecipientColumn02Width, $iGUIMainTabContactRecipientRow06Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputContactRecipient_Custom = GUICtrlCreateInput('', _
            $iGUIMainTabContactRecipientColumn03, $iGUIMainTabContactRecipientRow06, $iGUIMainTabContactRecipientColumn03Width, $iGUIMainTabContactRecipientRow06Height)
            _GUICtrlEdit_SetCueBanner($idInputContactRecipient_Custom, 'helpdesk@' & $sOrgDomain, True)

        ;;GROUP SENDER
          Global $idGroupContact_Sender = GUICtrlCreateGroup('Sender', _
            $iGUIMainTabContactSenderColumn01, $iGUIMainTabContactSenderRow02, $iGUIMainTabContactSenderColumn01Width, $iGUIMainTabContactSenderRow02Height)

          Global $idRadioContactSender_ReadFromAD = GUICtrlCreateRadio("Read user's email address from Active Directory", _
            $iGUIMainTabContactSenderColumn02, $iGUIMainTabContactSenderRow04 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSenderColumn02Width + $iGUIMainTabContactSenderColumn03Width, $iGUIMainTabContactSenderRow04Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idRadioContactSender_Custom = GUICtrlCreateRadio('Current username @', _
            $iGUIMainTabContactSenderColumn02, $iGUIMainTabContactSenderRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSenderColumn02Width, $iGUIMainTabContactSenderRow06Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputContactSender_Custom = GUICtrlCreateInput('', _
            $iGUIMainTabContactSenderColumn03, $iGUIMainTabContactSenderRow06, $iGUIMainTabContactSenderColumn03Width, $iGUIMainTabContactSenderRow06Height)
            _GUICtrlEdit_SetCueBanner($idInputContactSender_Custom, $sOrgDomain, True)

          Global $idRadioContactSender_EnableEmailField = GUICtrlCreateRadio('Enable Email field in contact form', _
            $iGUIMainTabContactSenderColumn02, $iGUIMainTabContactSenderRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSenderColumn02Width + $iGUIMainTabContactSenderColumn03Width, $iGUIMainTabContactSEnderRow08Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))

        ;;GROUP SMTP
          Global $idGroupContact_SMTP = GUICtrlCreateGroup('SMTP Server Settings', _
            $iGUIMainTabContactSMTPColumn01, $iGUIMainTabContactSMTPRow02, $iGUIMainTabContactSMTPColumn01Width, $iGUIMainTabContactSMTPRow02Height)

          Global $idLabelContactSMTP_Server = GUICtrlCreateLabel('Server:', _
            $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow04 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow04Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputContactSMTP_Server = GUICtrlCreateInput('', _
            $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow04, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow04Height)
            _GUICtrlEdit_SetCueBanner($idInputContactSMTP_Server, 'smtp.' & $sOrgDomain, True)

          Global $idLabelContactSMTP_Port = GUICtrlCreateLabel('Port:', _
            $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow06Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputContactSMTP_Port = GUICtrlCreateInput('', _
            $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow06, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow06Height)
            _GUICtrlEdit_SetCueBanner($idInputContactSMTP_Port, '25, 465, 587', True)

          Global $idCheckboxContactSMTP_EnableSSL = GUICtrlCreateCheckbox('Enable secure connection (SSL/TLS)', _
            $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width + $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow08Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))

          Global $idLabelContactSMTP_Username = GUICtrlCreateLabel('Username:', _
            $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow10 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow10Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputContactSMTP_Username = GUICtrlCreateInput('', _
            $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow10, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow10Height)
            _GUICtrlEdit_SetCueBanner($idInputContactSMTP_Username, '', True)

          Global $idLabelContactSMTP_Password = GUICtrlCreateLabel('Password:', _
            $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow12 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow12Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputContactSMTP_Password = GUICtrlCreateInput('', _
            $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow12, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow12Height)
            _GUICtrlEdit_SetCueBanner($idInputContactSMTP_Password, '', True)

        ;;GROUP TEST
          Global $idGroupContact_Test = GUICtrlCreateGroup('Test Settings', _
            $iGUIMainTabContactTestColumn01, $iGUIMainTabContactTestRow02, $iGUIMainTabContactTestColumn01Width, $iGUIMainTabContactTestRow02Height)

          Global $idLabelContactTest_Result = GUICtrlCreateLabel('Result:', _
            $iGUIMainTabContactTestColumn02, $iGUIMainTabContactTestRow04 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactTestColumn02Width, $iGUIMainTabContactTestRow04Height - $iGUIMainTabAllChromeCheckboxOffset, _
            BitOR($BS_MULTILINE, $BS_TOP))
          Global $idInputContactTest_Result = GUICtrlCreateEdit('', _
            $iGUIMainTabContactTestColumn03, $iGUIMainTabContactTestRow04, $iGUIMainTabContactTestColumn03Width, $iGUIMainTabContactTestRow04Height, _
            BitOR($ES_MULTILINE, $ES_WANTRETURN, $WS_VSCROLL, $ES_AUTOVSCROLL, $ES_READONLY))

          Global $idGroupContact_SendTestEmail = GUICtrlCreateButton('Send Test Email', _
            $iGUIMainTabContactTestColumn03, $iGUIMainTabContactTestRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactTestColumn03Width, $iGUIMainTabContactTestRow06Height - $iGUIMainTabAllChromeCheckboxOffset)

      GUICtrlCreateTabItem('')  ;;terminate tab structure

    ;;GATHER GUI ELEMENTS
      ;;Menus
        Global $aMenusMain[3]
          $aMenusMain[0] = $idMenuMainFile
          $aMenusMain[1] = $idMenuMainEdit
          $aMenusMain[2] = $idMenuMainHelp

      ;;Buttons
        Global $aButtonsMain[3]
          $aButtonsMain[0] = $idButtonMainLeftApply
          $aButtonsMain[1] = $idButtonMainLeftCancel
          $aButtonsMain[2] = $idGroupContact_SendTestEmail

      ;;Checkboxes
        Global $aCheckboxesMain[42]
          $aCheckboxesMain[00] = $idCheckboxMainGeneral_StartAtLogin
          $aCheckboxesMain[01] = $idCheckboxMainGeneral_DisableExit
          $aCheckboxesMain[02] = $idCheckboxMainAssetTag_ShowAssetTag
          $aCheckboxesMain[03] = $idCheckboxMainCustomDetails_ShowCustomDetails
          $aCheckboxesMain[04] = $idCheckboxMainHelpdesk_ShowHelpdesk
          $aCheckboxesMain[05] = $idCheckboxMainHelpdesk_ShowEmail
          $aCheckboxesMain[06] = $idCheckboxMainHelpdesk_ShowPhone
          $aCheckboxesMain[07] = $idCheckboxMainHelpdesk_ShowWebsite
          $aCheckboxesMain[08] = $idCheckboxMainHelpdesk_ShowAlternate
          $aCheckboxesMain[09] = $idCheckboxTools_EnableToolsMenu
          $aCheckboxesMain[10] = $idCheckboxToolsGeneral_CredentialManager
          $aCheckboxesMain[11] = $idCheckboxToolsGeneral_DeviceManager
          $aCheckboxesMain[12] = $idCheckboxToolsGeneral_DevicesAndPrinters
          $aCheckboxesMain[13] = $idCheckboxToolsGeneral_InternetOptions
          $aCheckboxesMain[14] = $idCheckboxToolsGeneral_MailAccounts
          $aCheckboxesMain[15] = $idCheckboxToolsGeneral_NetworkConnections
          $aCheckboxesMain[16] = $idCheckboxToolsGeneral_PrintManagement
          $aCheckboxesMain[17] = $idCheckboxToolsGeneral_ProgramsAndFeatures
          $aCheckboxesMain[18] = $idCheckboxToolsGeneral_SearchDirectory
          $aCheckboxesMain[19] = $idCheckboxToolsGeneral_Services
          $aCheckboxesMain[20] = $idCheckboxToolsGeneral_SystemProperties
          $aCheckboxesMain[21] = $idCheckboxToolsGeneral_WindowsUpdate
          $aCheckboxesMain[22] = $idCheckboxToolsLoginScript_ShowLoginScript
          $aCheckboxesMain[23] = $idCheckboxToolsHomeDrive_ShowHomeDrive
          $aCheckboxesMain[24] = $idCheckboxCustomToolsCommand1_Enable
          $aCheckboxesMain[25] = $idCheckboxCustomToolsCommand2_Enable
          $aCheckboxesMain[26] = $idCheckboxCustomToolsCommand3_Enable
          $aCheckboxesMain[27] = $idCheckboxCustomToolsCommand4_Enable
          $aCheckboxesMain[28] = $idCheckboxCustomToolsCommand5_Enable
          $aCheckboxesMain[29] = $idCheckboxHelpLink1_Enable
          $aCheckboxesMain[30] = $idCheckboxHelpLink2_Enable
          $aCheckboxesMain[31] = $idCheckboxHelpLink3_Enable
          $aCheckboxesMain[32] = $idCheckboxHelpLink4_Enable
          $aCheckboxesMain[33] = $idCheckboxHelpLink5_Enable
          $aCheckboxesMain[34] = $idCheckboxServicesService1_Enable
          $aCheckboxesMain[35] = $idCheckboxServicesService2_Enable
          $aCheckboxesMain[36] = $idCheckboxServicesService3_Enable
          $aCheckboxesMain[37] = $idCheckboxServicesService4_Enable
          $aCheckboxesMain[38] = $idCheckboxServicesService5_Enable
          $aCheckboxesMain[39] = $idCheckboxContact_EnableContactForm
          $aCheckboxesMain[40] = $idCheckboxContactGeneral_ShowEmployeeIDField
          $aCheckboxesMain[41] = $idCheckboxContactSMTP_EnableSSL

      ;;Radios
        Global $aRadiosMain[17]
          $aRadiosMain[00] = $idRadioMainTrayIcon_First
          $aRadiosMain[01] = $idRadioMainTrayIcon_Second
          $aRadiosMain[02] = $idRadioMainTrayIcon_Third
          $aRadiosMain[03] = $idRadioMainTrayIcon_Fourth
          $aRadiosMain[04] = $idRadioMainTrayIcon_Fifth
          $aRadiosMain[05] = $idRadioMainAssetTag_ReadFromBIOS
          $aRadiosMain[06] = $idRadioMainAssetTag_Custom
          $aRadiosMain[07] = $idRadioToolsLoginScript_ReadFromActiveDirectory
          $aRadiosMain[08] = $idRadioToolsLoginScript_Custom
          $aRadiosMain[09] = $idRadioToolsHomeDrive_ReadFromActiveDirectory
          $aRadiosMain[10] = $idRadioToolsHomeDrive_MapDrive
          $aRadiosMain[11] = $idRadioToolsHomeDrive_Custom
          $aRadiosMain[12] = $idRadioContactRecipient_UseHelpdeskEmail
          $aRadiosMain[13] = $idRadioContactRecipient_Custom
          $aRadiosMain[14] = $idRadioContactSender_ReadFromAD
          $aRadiosMain[15] = $idRadioContactSender_Custom
          $aRadiosMain[16] = $idRadioContactSender_EnableEmailField

      ;;Inputs
        Global $aInputsMain[52]
          $aInputsMain[00] = $idInputMainAssetTag_Custom
          $aInputsMain[01] = $idInputMainHelpdesk_Title
          $aInputsMain[02] = $idInputMainHelpdesk_EmailTitle
          $aInputsMain[03] = $idInputMainHelpdesk_EmailAddress
          $aInputsMain[04] = $idInputMainHelpdesk_PhoneTitle
          $aInputsMain[05] = $idInputMainHelpdesk_PhoneNumber
          $aInputsMain[06] = $idInputMainHelpdesk_WebsiteTitle
          $aInputsMain[07] = $idInputMainHelpdesk_WebsiteAddress
          $aInputsMain[08] = $idInputMainHelpdesk_AlternateTitle
          $aInputsMain[09] = $idInputMainHelpdesk_AlternateAddress
          $aInputsMain[10] = $idInputToolsLoginScript_Custom
          $aInputsMain[11] = $idInputToolsHomeDrive_Title
          $aInputsMain[12] = $idInputToolsHomeDrive_MapDrivePath
          $aInputsMain[13] = $idInputToolsHomeDrive_CustomName
          $aInputsMain[14] = $idInputToolsHomeDrive_CustomPath
          $aInputsMain[15] = $idInputCustomToolsCommand1_DisplayName
          $aInputsMain[16] = $idInputCustomToolsCommand1_Command
          $aInputsMain[17] = $idInputCustomToolsCommand2_DisplayName
          $aInputsMain[18] = $idInputCustomToolsCommand2_Command
          $aInputsMain[19] = $idInputCustomToolsCommand3_DisplayName
          $aInputsMain[20] = $idInputCustomToolsCommand3_Command
          $aInputsMain[21] = $idInputCustomToolsCommand4_DisplayName
          $aInputsMain[22] = $idInputCustomToolsCommand4_Command
          $aInputsMain[23] = $idInputCustomToolsCommand5_DisplayName
          $aInputsMain[24] = $idInputCustomToolsCommand5_Command
          $aInputsMain[25] = $idInputHelpLink1_DisplayName
          $aInputsMain[26] = $idInputHelpLink1_Command
          $aInputsMain[27] = $idInputHelpLink2_DisplayName
          $aInputsMain[28] = $idInputHelpLink2_Command
          $aInputsMain[29] = $idInputHelpLink3_DisplayName
          $aInputsMain[30] = $idInputHelpLink3_Command
          $aInputsMain[31] = $idInputHelpLink4_DisplayName
          $aInputsMain[32] = $idInputHelpLink4_Command
          $aInputsMain[33] = $idInputHelpLink5_DisplayName
          $aInputsMain[34] = $idInputHelpLink5_Command
          $aInputsMain[35] = $idInputServicesService1_DisplayName
          $aInputsMain[36] = $idInputServicesService1_Name
          $aInputsMain[37] = $idInputServicesService2_DisplayName
          $aInputsMain[38] = $idInputServicesService2_Name
          $aInputsMain[39] = $idInputServicesService3_DisplayName
          $aInputsMain[40] = $idInputServicesService3_Name
          $aInputsMain[41] = $idInputServicesService4_DisplayName
          $aInputsMain[42] = $idInputServicesService4_Name
          $aInputsMain[43] = $idInputServicesService5_DisplayName
          $aInputsMain[44] = $idInputServicesService5_Name
          $aInputsMain[45] = $idInputContactGeneral_ButtonText
          $aInputsMain[46] = $idInputContactRecipient_Custom
          $aInputsMain[47] = $idInputContactSender_Custom
          $aInputsMain[48] = $idInputContactSMTP_Server
          $aInputsMain[49] = $idInputContactSMTP_Port
          $aInputsMain[50] = $idInputContactSMTP_Username
          $aInputsMain[51] = $idInputContactSMTP_Password

      ;;Edits
        Global $aEditsMain[2]
          $aEditsMain[0] = $idEditMainCustomDetails_FreeText
          $aEditsMain[1] = $idInputContactTest_Result

      ;;Combos (Dropdowns)
        Global $aCombosMain[1]
          $aCombosMain[0] = $idComboToolsHomeDrive_MapDriveLetter

      ;;Status Bars
        Global $aStatusBarsMain[1]
          $aStatusBarsMain[0] = $hStatusBarMain

    GUISetState(@SW_SHOW)  ;;TODO: remove
  EndFunc
#EndRegion








#Region -- GUI OPERATIONS
  Func GUILoad($sGUILoadSource = 'Default', $sGUITabName = 'All')
    ;;LOAD DATA INTO GUI ELEMENTS
    ;; Load selections and data into GUI elements based on specified source.
    ;; Default, Registry, External file

    Switch $sGUILoadSource
      Case 'Default'
        ;;Apply the most basic, default state of the GUI, so that it is never "empty".
        _ATC_Customization('','Declare')  ;;Load default values into variables
      Case 'Registry'
        ;;Ready configuration from registry.
        _ATC_Customization('','Read')  ;;Load default values into variables
    EndSwitch

    ;;Actually load data into GUI elements. Possibly break out per tab or source.
    GUITabLoad($sGUITabName)
  EndFunc

  Func GUITabLoad($sGUITabName = 'All')
    ;;LOAD DATA INTO TAB GUI ELEMENTS
    ;; Load selections and data into the GUI elements of the specificed tab, based on specified source.
    ;; This function should ONLY load data into fields, or check/uncheck items. Should not change enable/disable state.

    Switch $sGUITabName
      Case 'General', 'All'
        ;;GENERAL TAB
        ;;General Section
          ToggleGUIControl($idCheckboxMainGeneral_StartAtLogin, $bMainGeneral_StartAtLogin)
          ToggleGUIControl($idCheckboxMainGeneral_DisableExit, $bMainGeneral_DisableExit)

        ;;Tray Icon Section
          Switch $iMainTray_Icon
            Case 1
              ToggleGUIControl($idRadioMainTrayIcon_First, $GUI_CHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Second, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Third, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fourth, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fifth, $GUI_UNCHECKED)
            Case 2
              ToggleGUIControl($idRadioMainTrayIcon_First, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Second, $GUI_CHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Third, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fourth, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fifth, $GUI_UNCHECKED)
            Case 3
              ToggleGUIControl($idRadioMainTrayIcon_First, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Second, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Third, $GUI_CHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fourth, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fifth, $GUI_UNCHECKED)
            Case 4
              ToggleGUIControl($idRadioMainTrayIcon_First, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Second, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Third, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fourth, $GUI_CHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fifth, $GUI_UNCHECKED)
            Case 5
              ToggleGUIControl($idRadioMainTrayIcon_First, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Second, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Third, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fourth, $GUI_UNCHECKED)
              ToggleGUIControl($idRadioMainTrayIcon_Fifth, $GUI_CHECKED)
          EndSwitch

        ;;Asset Tag Section
          ToggleGUIControl($idCheckboxMainAssetTag_ShowAssetTag, $bMainAssetTag_ShowAssetTag)
          ToggleGUIControl($idRadioMainAssetTag_ReadFromBIOS, $bMainAssetTag_ReadFromBIOS)
          ToggleGUIControl($idRadioMainAssetTag_Custom, $bMainAssetTag_Custom)
          GUICtrlSetData($idInputMainAssetTag_Custom, $sMainAssetTag_Custom)

        ;;Custom Details section
          ToggleGUIControl($idCheckboxMainCustomDetails_ShowCustomDetails, $bMainCustomDetails_ShowCustomDetails)
          GUICtrlSetData($idEditMainCustomDetails_FreeText, $sMainCustomDetails_FreeText)

        ;;Helpdesk Section
          ToggleGUIControl($idCheckboxMainHelpdesk_ShowHelpdesk, $bMainHelpdesk_ShowHelpdesk)
          GUICtrlSetData($idInputMainHelpdesk_Title, $sMainHelpdesk_Title)
          ToggleGUIControl($idCheckboxMainHelpdesk_ShowEmail, $bMainHelpdesk_ShowEmail)
          GUICtrlSetData($idInputMainHelpdesk_EmailTitle, $sMainHelpdesk_EmailTitle)
          GUICtrlSetData($idInputMainHelpdesk_EmailAddress, $sMainHelpdesk_EmailAddress)
          ToggleGUIControl($idCheckboxMainHelpdesk_ShowPhone, $bMainHelpdesk_ShowPhone)
          GUICtrlSetData($idInputMainHelpdesk_PhoneTitle, $sMainHelpdesk_PhoneTitle)
          GUICtrlSetData($idInputMainHelpdesk_PhoneNumber, $sMainHelpdesk_PhoneNumber)
          ToggleGUIControl($idCheckboxMainHelpdesk_ShowWebsite, $bMainHelpdesk_ShowWebsite)
          GUICtrlSetData($idInputMainHelpdesk_WebsiteTitle, $sMainHelpdesk_WebsiteTitle)
          GUICtrlSetData($idInputMainHelpdesk_WebsiteAddress, $sMainHelpdesk_WebsiteAddress)
          ToggleGUIControl($idCheckboxMainHelpdesk_ShowAlternate, $bMainHelpdesk_ShowAlternate)
          GUICtrlSetData($idInputMainHelpdesk_AlternateTitle, $sMainHelpdesk_AlternateTitle)
          GUICtrlSetData($idInputMainHelpdesk_AlternateAddress, $sMainHelpdesk_AlternateAddress)

        ContinueCase

      Case 'ToolsMenu', 'All'
        ;;TOOLS MENU TAB
        ;;General Section
          ToggleGUIControl($idCheckboxTools_EnableToolsMenu, $bTools_EnableToolsMenu)
          ToggleGUIControl($idCheckboxToolsGeneral_CredentialManager, $bToolsGeneral_CredentialManager)
          ToggleGUIControl($idCheckboxToolsGeneral_DeviceManager, $bToolsGeneral_DeviceManager)
          ToggleGUIControl($idCheckboxToolsGeneral_DevicesAndPrinters, $bToolsGeneral_DevicesAndPrinters)
          ToggleGUIControl($idCheckboxToolsGeneral_InternetOptions, $bToolsGeneral_InternetOptions)
          ToggleGUIControl($idCheckboxToolsGeneral_MailAccounts, $bToolsGeneral_MailAccounts)
          ToggleGUIControl($idCheckboxToolsGeneral_NetworkConnections, $bToolsGeneral_NetworkConnections)
          ToggleGUIControl($idCheckboxToolsGeneral_PrintManagement, $bToolsGeneral_PrintManagement)
          ToggleGUIControl($idCheckboxToolsGeneral_ProgramsAndFeatures, $bToolsGeneral_ProgramsAndFeatures)
          ToggleGUIControl($idCheckboxToolsGeneral_SearchDirectory, $bToolsGeneral_SearchDirectory)
          ToggleGUIControl($idCheckboxToolsGeneral_Services, $bToolsGeneral_Services)
          ToggleGUIControl($idCheckboxToolsGeneral_SystemProperties, $bToolsGeneral_SystemProperties)
          ToggleGUIControl($idCheckboxToolsGeneral_WindowsUpdate, $bToolsGeneral_WindowsUpdate)

        ;;Login Script Section
          ToggleGUIControl($idCheckboxToolsLoginScript_ShowLoginScript, $bToolsLoginScript_ShowLoginScript)
          ToggleGUIControl($idRadioToolsLoginScript_ReadFromActiveDirectory, $bToolsLoginScript_ReadFromActiveDirectory)
          ToggleGUIControl($idRadioToolsLoginScript_Custom, $bToolsLoginScript_Custom)
          GUICtrlSetData($idInputToolsLoginScript_Custom, $sToolsLoginScript_Custom)

        ;;Home Drive Section
          ToggleGUIControl($idCheckboxToolsHomeDrive_ShowHomeDrive, $bToolsHomeDrive_ShowHomeDrive)
          GUICtrlSetData($idInputToolsHomeDrive_Title, $sToolsHomeDrive_Title)
          ToggleGUIControl($idRadioToolsHomeDrive_ReadFromActiveDirectory, $bToolsHomeDrive_ReadFromActiveDirectory)
          ToggleGUIControl($idRadioToolsHomeDrive_MapDrive, $bToolsHomeDrive_MapDrive)
          GUICtrlSetData($idComboToolsHomeDrive_MapDriveLetter, $lDriveLetters, $sToolsHomeDrive_DriveLetter)
          GUICtrlSetData($idInputToolsHomeDrive_MapDrivePath, $sToolsHomeDrive_MapDrivePath)
          ToggleGUIControl($idRadioToolsHomeDrive_Custom, $bToolsHomeDrive_Custom)
          GUICtrlSetData($idInputToolsHomeDrive_CustomName, $sToolsHomeDrive_CustomName)
          GUICtrlSetData($idInputToolsHomeDrive_CustomPath, $sToolsHomeDrive_CustomPath)

        ContinueCase

      Case 'CustomTools', 'All'
        ;;CUSTOM TOOLS TAB
        ;asdf

        ContinueCase

      Case 'HelpMenu', 'All'
        ;;HELP MENU TAB
        ;asdf

        ContinueCase

      Case 'Services', 'All'
        ;;SERVICES TAB
        ;asdf

        ContinueCase

      Case 'ContactForm', 'All'
        ;;CONTACT FORM TAB
        ;asdf
    EndSwitch
  EndFunc






  Func GUIState($sGUIDesiredState = 'Ready', $sGUITabName = 'All')
    ;;SET STATE OF GUI ELEMENTS
    ;; Set the state of GUI elements (disabled, enabled) based on current selections.
    ;; Busy, Ready

    ;;Actually set GUI element states. Possibly break out per tab or state.
    GUITabState($sGUITabName, $sGUIDesiredState)
  EndFunc

  Func GUITabState($sGUITabName = 'All', $sGUITabDesiredState = 'Ready')
    ;;SET STATE OF TAB GUI ELEMENTS
    ;; Set the state of GUI elements within the desired tab based on the parameters provided.
    ;; This function should ONLY change enable/disable state. Not load data into fields or change checked/unchecked.

    Switch $sGUITabDesiredState
      Case 'Ready'
        ;;Set state of GUI elements based on current selections.

        Switch $sGUITabName
          Case 'General', 'All'
            ;;GENERAL TAB
            ;;General Section
              ToggleGUIControl($idCheckboxMainGeneral_StartAtLogin, $GUI_ENABLE)
              ToggleGUIControl($idCheckboxMainGeneral_DisableExit, $GUI_ENABLE)

            ;;Tray Icon Section
              ToggleGUIControl($idRadioMainTrayIcon_First, $GUI_ENABLE)
              ToggleGUIControl($idRadioMainTrayIcon_Second, $GUI_ENABLE)
              ToggleGUIControl($idRadioMainTrayIcon_Third, $GUI_ENABLE)
              ToggleGUIControl($idRadioMainTrayIcon_Fourth, $GUI_ENABLE)
              ToggleGUIControl($idRadioMainTrayIcon_Fifth, $GUI_ENABLE)

            ;;Asset Tag Section
              ToggleGUIControl($idCheckboxMainAssetTag_ShowAssetTag, $GUI_ENABLE)
              If GUICtrlRead($idCheckboxMainAssetTag_ShowAssetTag) = $GUI_CHECKED Then
                ToggleGUIControl($idRadioMainAssetTag_ReadFromBIOS, $GUI_ENABLE)
                ToggleGUIControl($idRadioMainAssetTag_Custom, $GUI_ENABLE)
                If GUICtrlRead($idRadioMainAssetTag_Custom) = $GUI_CHECKED Then
                  ;;Enable/disable input box based on "Custom:" selection
                  ToggleGUIControl($idInputMainAssetTag_Custom, $GUI_ENABLE)
                Else
                  ToggleGUIControl($idInputMainAssetTag_Custom, $GUI_DISABLE)
                EndIf
              Else
                ToggleGUIControl($idRadioMainAssetTag_ReadFromBIOS, $GUI_DISABLE)
                ToggleGUIControl($idRadioMainAssetTag_Custom, $GUI_DISABLE)
                ToggleGUIControl($idInputMainAssetTag_Custom, $GUI_DISABLE)
              EndIf

            ;;Custom Details Section
              ToggleGUIControl($idCheckboxMainCustomDetails_ShowCustomDetails, $GUI_ENABLE)
              If GUICtrlRead($idCheckboxMainCustomDetails_ShowCustomDetails) = $GUI_CHECKED Then
                ToggleGUIControl($idEditMainCustomDetails_FreeText, $GUI_ENABLE)
              Else
                ToggleGUIControl($idEditMainCustomDetails_FreeText, $GUI_DISABLE)
              EndIf

            ;;Helpdesk Section
              ToggleGUIControl($idCheckboxMainHelpdesk_ShowHelpdesk, $GUI_ENABLE)
              If GUICtrlRead($idCheckboxMainHelpdesk_ShowHelpdesk) = $GUI_CHECKED Then
                ToggleGUIControl($idLabelMainHelpdesk_Header, $GUI_ENABLE)
                ToggleGUIControl($idInputMainHelpdesk_Title, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowEmail, $GUI_ENABLE)
                If GUICtrlRead($idCheckboxMainHelpdesk_ShowEmail) = $GUI_CHECKED Then
                  ToggleGUIControl($idInputMainHelpdesk_EmailTitle, $GUI_ENABLE)
                  ToggleGUIControl($idInputMainHelpdesk_EmailAddress, $GUI_ENABLE)
                Else
                  ToggleGUIControl($idInputMainHelpdesk_EmailTitle, $GUI_DISABLE)
                  ToggleGUIControl($idInputMainHelpdesk_EmailAddress, $GUI_DISABLE)
                EndIf
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowPhone, $GUI_ENABLE)
                If GUICtrlRead($idCheckboxMainHelpdesk_ShowPhone) = $GUI_CHECKED Then
                  ToggleGUIControl($idInputMainHelpdesk_PhoneTitle, $GUI_ENABLE)
                  ToggleGUIControl($idInputMainHelpdesk_PhoneNumber, $GUI_ENABLE)
                Else
                  ToggleGUIControl($idInputMainHelpdesk_PhoneTitle, $GUI_DISABLE)
                  ToggleGUIControl($idInputMainHelpdesk_PhoneNumber, $GUI_DISABLE)
                EndIf
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowWebsite, $GUI_ENABLE)
                If GUICtrlRead($idCheckboxMainHelpdesk_ShowWebsite) = $GUI_CHECKED Then
                  ToggleGUIControl($idInputMainHelpdesk_WebsiteTitle, $GUI_ENABLE)
                  ToggleGUIControl($idInputMainHelpdesk_WebsiteAddress, $GUI_ENABLE)
                Else
                  ToggleGUIControl($idInputMainHelpdesk_WebsiteTitle, $GUI_DISABLE)
                  ToggleGUIControl($idInputMainHelpdesk_WebsiteAddress, $GUI_DISABLE)
                EndIf
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowAlternate, $GUI_ENABLE)
                If GUICtrlRead($idCheckboxMainHelpdesk_ShowAlternate) = $GUI_CHECKED Then
                  ToggleGUIControl($idInputMainHelpdesk_AlternateTitle, $GUI_ENABLE)
                  ToggleGUIControl($idInputMainHelpdesk_AlternateAddress, $GUI_ENABLE)
                Else
                  ToggleGUIControl($idInputMainHelpdesk_AlternateTitle, $GUI_DISABLE)
                  ToggleGUIControl($idInputMainHelpdesk_AlternateAddress, $GUI_DISABLE)
                EndIf
              Else
                ToggleGUIControl($idLabelMainHelpdesk_Header, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_Title, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowEmail, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_EmailTitle, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_EmailAddress, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowPhone, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_PhoneTitle, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_PhoneNumber, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowWebsite, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_WebsiteTitle, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_WebsiteAddress, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxMainHelpdesk_ShowAlternate, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_AlternateTitle, $GUI_DISABLE)
                ToggleGUIControl($idInputMainHelpdesk_AlternateAddress, $GUI_DISABLE)
              EndIf

            ContinueCase

          Case 'ToolsMenu', 'All'
            ;;TOOLS MENU TAB
            ;;General Section
              ToggleGUIControl($idCheckboxTools_EnableToolsMenu, $GUI_ENABLE)
              If GUICtrlRead($idCheckboxTools_EnableToolsMenu) = $GUI_CHECKED Then
                ToggleGUIControl($idCheckboxToolsGeneral_CredentialManager, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_DeviceManager, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_DevicesAndPrinters, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_InternetOptions, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_MailAccounts, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_NetworkConnections, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_PrintManagement, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_ProgramsAndFeatures, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_SearchDirectory, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_Services, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_SystemProperties, $GUI_ENABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_WindowsUpdate, $GUI_ENABLE)
              Else
                ToggleGUIControl($idCheckboxToolsGeneral_CredentialManager, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_DeviceManager, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_DevicesAndPrinters, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_InternetOptions, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_MailAccounts, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_NetworkConnections, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_PrintManagement, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_ProgramsAndFeatures, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_SearchDirectory, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_Services, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_SystemProperties, $GUI_DISABLE)
                ToggleGUIControl($idCheckboxToolsGeneral_WindowsUpdate, $GUI_DISABLE)
              EndIf

            ;;Login Script Section
              If GUICtrlRead($idCheckboxTools_EnableToolsMenu) = $GUI_CHECKED Then
                ToggleGUIControl($idCheckboxToolsLoginScript_ShowLoginScript, $GUI_ENABLE)
                If GUICtrlRead($idCheckboxToolsLoginScript_ShowLoginScript) = $GUI_CHECKED Then
                  ToggleGUIControl($idRadioToolsLoginScript_ReadFromActiveDirectory, $GUI_ENABLE)
                  ToggleGUIControl($idRadioToolsLoginScript_Custom, $GUI_ENABLE)
                  If GUICtrlRead($idRadioToolsLoginScript_Custom) = $GUI_CHECKED Then
                    ;;Enable/disable input box based on "Custom:" selection
                    ToggleGUIControl($idInputToolsLoginScript_Custom, $GUI_ENABLE)
                  Else
                    ToggleGUIControl($idInputToolsLoginScript_Custom, $GUI_DISABLE)
                  EndIf
                Else
                  ToggleGUIControl($idRadioToolsLoginScript_ReadFromActiveDirectory, $GUI_DISABLE)
                  ToggleGUIControl($idRadioToolsLoginScript_Custom, $GUI_DISABLE)
                  ToggleGUIControl($idInputToolsLoginScript_Custom, $GUI_DISABLE)
                EndIf
              Else
                ToggleGUIControl($idCheckboxToolsLoginScript_ShowLoginScript, $GUI_DISABLE)
                ToggleGUIControl($idRadioToolsLoginScript_ReadFromActiveDirectory, $GUI_DISABLE)
                ToggleGUIControl($idRadioToolsLoginScript_Custom, $GUI_DISABLE)
                ToggleGUIControl($idInputToolsLoginScript_Custom, $GUI_DISABLE)
              EndIf

            ;;Home Drive Section
              If GUICtrlRead($idCheckboxTools_EnableToolsMenu) = $GUI_CHECKED Then
                ToggleGUIControl($idCheckboxToolsHomeDrive_ShowHomeDrive, $GUI_ENABLE)
                If GUICtrlRead($idCheckboxToolsHomeDrive_ShowHomeDrive) = $GUI_CHECKED Then
                  ToggleGUIControl($idGroupTools_HomeDrive, $GUI_ENABLE)
                  ToggleGUIControl($idLabelToolsHomeDrive_DisplayName, $GUI_ENABLE)
                  ToggleGUIControl($idInputToolsHomeDrive_Title, $GUI_ENABLE)
                  ToggleGUIControl($idRadioToolsHomeDrive_ReadFromActiveDirectory, $GUI_ENABLE)
                  ToggleGUIControl($idRadioToolsHomeDrive_MapDrive, $GUI_ENABLE)
                  If GUICtrlRead($idRadioToolsHomeDrive_MapDrive) = $GUI_CHECKED Then
                    ToggleGUIControl($idComboToolsHomeDrive_MapDriveLetter, $GUI_ENABLE)
                    ToggleGUIControl($idLabelToolsHomeDrive_To, $GUI_ENABLE)
                    ToggleGUIControl($idInputToolsHomeDrive_MapDrivePath, $GUI_ENABLE)
                  Else
                    ToggleGUIControl($idComboToolsHomeDrive_MapDriveLetter, $GUI_DISABLE)
                    ToggleGUIControl($idLabelToolsHomeDrive_To, $GUI_DISABLE)
                    ToggleGUIControl($idInputToolsHomeDrive_MapDrivePath, $GUI_DISABLE)
                  EndIf
                  ToggleGUIControl($idRadioToolsHomeDrive_Custom, $GUI_ENABLE)
                  If GUICtrlRead($idRadioToolsHomeDrive_Custom) = $GUI_CHECKED Then
                    ;;Enable/disable input box based on "Custom:" selection
                    ToggleGUIControl($idInputToolsHomeDrive_CustomName, $GUI_ENABLE)
                    ToggleGUIControl($idInputToolsHomeDrive_CustomPath, $GUI_ENABLE)
                  Else
                    ToggleGUIControl($idInputToolsHomeDrive_CustomName, $GUI_DISABLE)
                    ToggleGUIControl($idInputToolsHomeDrive_CustomPath, $GUI_DISABLE)
                  EndIf
                Else
                  ToggleGUIControl($idGroupTools_HomeDrive, $GUI_DISABLE)
                  ToggleGUIControl($idLabelToolsHomeDrive_DisplayName, $GUI_DISABLE)
                  ToggleGUIControl($idInputToolsHomeDrive_Title, $GUI_DISABLE)
                  ToggleGUIControl($idRadioToolsHomeDrive_ReadFromActiveDirectory, $GUI_DISABLE)
                  ToggleGUIControl($idRadioToolsHomeDrive_MapDrive, $GUI_DISABLE)
                  ToggleGUIControl($idComboToolsHomeDrive_MapDriveLetter, $GUI_DISABLE)
                  ToggleGUIControl($idLabelToolsHomeDrive_To, $GUI_DISABLE)
                  ToggleGUIControl($idInputToolsHomeDrive_MapDrivePath, $GUI_DISABLE)
                  ToggleGUIControl($idRadioToolsHomeDrive_Custom, $GUI_DISABLE)
                  ToggleGUIControl($idInputToolsHomeDrive_CustomName, $GUI_DISABLE)
                  ToggleGUIControl($idInputToolsHomeDrive_CustomPath, $GUI_DISABLE)
                EndIf
              Else
                ToggleGUIControl($idCheckboxToolsHomeDrive_ShowHomeDrive, $GUI_DISABLE)
                ToggleGUIControl($idGroupTools_HomeDrive, $GUI_DISABLE)
                ToggleGUIControl($idLabelToolsHomeDrive_DisplayName, $GUI_DISABLE)
                ToggleGUIControl($idGroupTools_HomeDrive, $GUI_DISABLE)
                ToggleGUIControl($idInputToolsHomeDrive_Title, $GUI_DISABLE)
                ToggleGUIControl($idRadioToolsHomeDrive_ReadFromActiveDirectory, $GUI_DISABLE)
                ToggleGUIControl($idRadioToolsHomeDrive_MapDrive, $GUI_DISABLE)
                ToggleGUIControl($idComboToolsHomeDrive_MapDriveLetter, $GUI_DISABLE)
                ToggleGUIControl($idLabelToolsHomeDrive_To, $GUI_DISABLE)
                ToggleGUIControl($idInputToolsHomeDrive_MapDrivePath, $GUI_DISABLE)
                ToggleGUIControl($idRadioToolsHomeDrive_Custom, $GUI_DISABLE)
                ToggleGUIControl($idInputToolsHomeDrive_CustomName, $GUI_DISABLE)
                ToggleGUIControl($idInputToolsHomeDrive_CustomPath, $GUI_DISABLE)
              EndIf

            ContinueCase

          Case 'CustomTools', 'All'
            ;;CUSTOM TOOLS TAB
            ;asdf

            ContinueCase

          Case 'HelpMenu', 'All'
            ;;HELP MENU TAB
            ;asdf

            ContinueCase

          Case 'Services', 'All'
            ;;SERVICES TAB
            ;asdf

            ContinueCase

          Case 'ContactForm', 'All'
            ;;CONTACT FORM TAB
            ;asdf
        EndSwitch

      ContinueCase

    EndSwitch
  EndFunc


  Func GUIWait()
    ;;WAIT FOR USER INTERACTION
    Local $idMsg

    While 1
      $idMsg = GUIGetMsg()

      If $idMsg = $GUI_EVENT_CLOSE Then ExitLoop
      If $idMsg = $GUI_EVENT_PRIMARYUP Then GUIState('Ready')
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

    For $i = 0 To UBound($aMenusMain) - 1
      ToggleGUIControl($aMenusMain[$i], $Option)
    Next
  EndFunc

  Func GUIMainSetButtons($Option)
    ;;SET ALL BUTTONS WITH OPTION
    ;; $GUI_ENABLE
    ;; $GUI_DISABLE

    For $i = 0 To UBound($aButtonsMain) - 1
      ToggleGUIControl($aButtonsMain[$i], $Option)
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
    ;; This is an attempt to prevent a flickering GUI when states change.
    ;;
    ;; $GUI_ENABLE
    ;; $GUI_DISABLE
    ;; $GUI_CHECKED
    ;; $GUI_UNCHECKED
    ;; $GUI_CHECKENABLE
    ;; $GUI_UNCHECKENABLE
    ;; $GUI_CHECKDISABLE
    ;; $GUI_UNCHECKDISABLE

    If $Option = 0 Then $Option = $GUI_UNCHECKED
    If $Option = 1 Then $Option = $GUI_CHECKED

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