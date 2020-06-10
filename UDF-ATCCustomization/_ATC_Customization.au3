#include-once

; #FUNCTION# ====================================================================================================================
; Name ..........: _ATC_Customization
; Description ...: Declares, reads, and/or sets defaults for all About This Computer customization items.
; Syntax ........: _ATC_Customization([$__sAppRegistryPath = ...], [$iOption = 'Default'])
; Parameters ....: $__sAppRegistryPath - [optional] Path to registry key with values to be modified.
;                  $iOption            - [optional] Specify which options to perform. Default is 'Default'.
;                    'Default' = Perform default options ('Declare' and 'Read').
;                    'Declare' = Declare global vairables.
;                    'Read'    = Read configuration from registry.
;                    'Write'   = Write configuration to registry. Requires elevation.
; Return values .: Success - None
;                  Failure - None
; Author ........: briankyncl.com
; Modified ......: 2020-02-17
; Remarks .......: None
; Example .......: No
; ===============================================================================================================================

Func _ATC_Customization($__sAppRegistryPath = 'HKEY_LOCAL_MACHINE\Software\briankyncl.com\About This Computer', $iOption = 'Default')
  ;;READ AND/OR WRITE ABOUT THIS COMPUTER CUSTOMIZATION

  ;;Declare global customization variables
  If $iOption = 'Default' Or $iOption = 'Declare' Then
    ;;Generic Organization
      Global $sOrgName = 'Contoso'
      Global $sOrgDomain = 'contoso.com'
      Global $sOrgFQDomain = 'corp.' & $sOrgDomain

    ;;General
      Global $bMainGeneral_StartAtLogin = 1
      Global $bMainGeneral_DisableExit = 1

      Global $iMainTray_Icon = 1

      Global $bMainAssetTag_ShowAssetTag = 0
      Global $bMainAssetTag_ReadFromBIOS = 1
      Global $bMainAssetTag_Custom = 0
      Global $sMainAssetTag_Custom = ''

      Global $bMainCustomDetails_ShowCustomDetails = 0
      Local  $sCustomDetailsTestText = 'Line 1' & @CRLF & 'Line 2' & @CRLF & 'Line 3' & @CRLF & 'Line 4' & @CRLF & 'Line 5' & @CRLF & @CRLF & _
                                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
      ;Global $sMainCustomDetails_FreeText = $sCustomDetailsTestText
      Global $sMainCustomDetails_FreeText = ''

      Global $bMainHelpdesk_ShowHelpdesk = 0
      Global $sMainHelpdesk_Title = ''
      Global $bMainHelpdesk_ShowEmail = 1
      Global $sMainHelpdesk_EmailTitle = 'Email'
      Global $sMainHelpdesk_EmailAddress = ''
      Global $bMainHelpdesk_ShowPhone = 1
      Global $sMainHelpdesk_PhoneTitle = 'Phone'
      Global $sMainHelpdesk_PhoneNumber = ''
      Global $bMainHelpdesk_ShowWebsite = 0
      Global $sMainHelpdesk_WebsiteTitle = 'Website'
      Global $sMainHelpdesk_WebsiteAddress = ''
      Global $bMainHelpdesk_ShowAlternate = 0
      Global $sMainHelpdesk_AlternateTitle = ''
      Global $sMainHelpdesk_AlternateAddress = ''

      Global $bMainLCM_ShowLCMInfo = 0
      Global $bMainLCM_ReadFromFileSystem = 1
      Global $bMainLCM_CustomXJCode = 0
      Global $sMainLCM_CustomXJCode = ''
      Global $bMainLCM_CustomRCRCode = 0
      Global $sMainLCM_CustomRCRCode = ''

    ;;Tools
      Global $bTools_EnableToolsMenu = 1

      Global $bToolsGeneral_CredentialManager = 1
      Global $bToolsGeneral_DeviceManager = 1
      Global $bToolsGeneral_DevicesAndPrinters = 1
      Global $bToolsGeneral_InternetOptions = 1
      Global $bToolsGeneral_MailAccounts = 1
      Global $bToolsGeneral_NetworkConnections = 1
      Global $bToolsGeneral_PrintManagement = 1
      Global $bToolsGeneral_ProgramsAndFeatures = 1
      Global $bToolsGeneral_SearchDirectory = 0
      Global $bToolsGeneral_Services = 1
      Global $bToolsGeneral_SystemProperties = 1
      Global $bToolsGeneral_WindowsUpdate = 1

      Global $bToolsLoginScript_ShowLoginScript = 0
      Global $bToolsLoginScript_ReadFromActiveDirectory = 1
      Global $bToolsLoginScript_Custom = 0
      Global $sToolsLoginScript_Custom = ''

      Global $bToolsHomeDrive_ShowHomeDrive = 0
      Global $sToolsHomeDrive_Title = ''
      Global $bToolsHomeDrive_ReadFromActiveDirectory = 1
      Global $bToolsHomeDrive_MapDrive = 0
      Global $sToolsHomeDrive_DriveLetter = 'Z:'
      Global $sToolsHomeDrive_MapDrivePath = ''
      Global $bToolsHomeDrive_Custom = 0
      Global $sToolsHomeDrive_CustomName = ''
      Global $sToolsHomeDrive_CustomPath = ''

      Global $bCustomToolsCommand1_Enable = 0
      Global $sCustomToolsCommand1_DisplayName = ''
      Global $sCustomToolsCommand1_Command = ''
      Global $bCustomToolsCommand2_Enable = 0
      Global $sCustomToolsCommand2_DisplayName = ''
      Global $sCustomToolsCommand2_Command = ''
      Global $bCustomToolsCommand3_Enable = 0
      Global $sCustomToolsCommand3_DisplayName = ''
      Global $sCustomToolsCommand3_Command = ''
      Global $bCustomToolsCommand4_Enable = 0
      Global $sCustomToolsCommand4_DisplayName = ''
      Global $sCustomToolsCommand4_Command = ''
      Global $bCustomToolsCommand5_Enable = 0
      Global $sCustomToolsCommand5_DisplayName = ''
      Global $sCustomToolsCommand5_Command = ''

    ;;Help Menu
      Global $bHelpLink1_Enable = 0
      Global $sHelpLink1_DisplayName = ''
      Global $sHelpLink1_Command = ''
      Global $bHelpLink2_Enable = 0
      Global $sHelpLink2_DisplayName = ''
      Global $sHelpLink2_Command = ''
      Global $bHelpLink3_Enable = 0
      Global $sHelpLink3_DisplayName = ''
      Global $sHelpLink3_Command = ''
      Global $bHelpLink4_Enable = 0
      Global $sHelpLink4_DisplayName = ''
      Global $sHelpLink4_Command = ''
      Global $bHelpLink5_Enable = 0
      Global $sHelpLink5_DisplayName = ''
      Global $sHelpLink5_Command = ''

    ;;Services
      Global $bServicesService1_Enable = 0
      Global $sServicesService1_DisplayName = ''
      Global $sServicesService1_Name = ''
      Global $bServicesService2_Enable = 0
      Global $sServicesService2_DisplayName = ''
      Global $sServicesService2_Name = ''
      Global $bServicesService3_Enable = 0
      Global $sServicesService3_DisplayName = ''
      Global $sServicesService3_Name = ''
      Global $bServicesService4_Enable = 0
      Global $sServicesService4_DisplayName = ''
      Global $sServicesService4_Name = ''
      Global $bServicesService5_Enable = 0
      Global $sServicesService5_DisplayName = ''
      Global $sServicesService5_Name = ''

    ;;Contact Form
      Global $bContact_EnableContactForm = 0
      Global $sContactGeneral_ButtonText = ''
      Global $bContactGeneral_ShowEmployeeIDField = 0

      Global $bContactRecipient_UseHelpdeskEmail = 1
      Global $bContactRecipient_Custom = 0
      Global $sContactRecipient_Custom = ''

      Global $bContactSender_ReadFromAD = 1
      Global $bContactSender_Custom = 0
      Global $sContactSender_Custom = ''
      Global $bContactSender_EnableEmailField = 0

      Global $sContactSMTP_Server = ''
      Global $sContactSMTP_Port = ''
      Global $bContactSMTP_EnableSSL = 0
      Global $sContactSMTP_Username = ''
      Global $sContactSMTP_Password = ''
  EndIf

  ;;Read customization from Windows Registry
  If $iOption = 'Default' Or $iOption = 'Read' Then
    If RegRead($__sAppRegistryPath, 'bMainGeneral_StartAtLogin')                 Then $bMainGeneral_StartAtLogin                 = RegRead($__sAppRegistryPath, 'bMainGeneral_StartAtLogin')
    If RegRead($__sAppRegistryPath, 'bMainGeneral_DisableExit')                  Then $bMainGeneral_DisableExit                  = RegRead($__sAppRegistryPath, 'bMainGeneral_DisableExit')
    If RegRead($__sAppRegistryPath, 'iMainTray_Icon')                            Then $iMainTray_Icon                            = RegRead($__sAppRegistryPath, 'iMainTray_Icon')
    If RegRead($__sAppRegistryPath, 'bMainAssetTag_ShowAssetTag')                Then $bMainAssetTag_ShowAssetTag                = RegRead($__sAppRegistryPath, 'bMainAssetTag_ShowAssetTag')
    If RegRead($__sAppRegistryPath, 'bMainAssetTag_ReadFromBIOS')                Then $bMainAssetTag_ReadFromBIOS                = RegRead($__sAppRegistryPath, 'bMainAssetTag_ReadFromBIOS')
    If RegRead($__sAppRegistryPath, 'bMainAssetTag_Custom')                      Then $bMainAssetTag_Custom                      = RegRead($__sAppRegistryPath, 'bMainAssetTag_Custom')
    If RegRead($__sAppRegistryPath, 'sMainAssetTag_Custom')                      Then $sMainAssetTag_Custom                      = RegRead($__sAppRegistryPath, 'sMainAssetTag_Custom')
    If RegRead($__sAppRegistryPath, 'bMainCustomDetails_ShowCustomDetails')      Then $bMainCustomDetails_ShowCustomDetails      = RegRead($__sAppRegistryPath, 'bMainCustomDetails_ShowCustomDetails')
    If RegRead($__sAppRegistryPath, 'sMainCustomDetails_FreeText')               Then $sMainCustomDetails_FreeText               = RegRead($__sAppRegistryPath, 'sMainCustomDetails_FreeText')
    If RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowHelpdesk')                Then $bMainHelpdesk_ShowHelpdesk                = RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowHelpdesk')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_Title')                       Then $sMainHelpdesk_Title                       = RegRead($__sAppRegistryPath, 'sMainHelpdesk_Title')
    If RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowEmail')                   Then $bMainHelpdesk_ShowEmail                   = RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowEmail')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_EmailTitle')                  Then $sMainHelpdesk_EmailTitle                  = RegRead($__sAppRegistryPath, 'sMainHelpdesk_EmailTitle')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_EmailAddress')                Then $sMainHelpdesk_EmailAddress                = RegRead($__sAppRegistryPath, 'sMainHelpdesk_EmailAddress')
    If RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowPhone')                   Then $bMainHelpdesk_ShowPhone                   = RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowPhone')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_PhoneTitle')                  Then $sMainHelpdesk_PhoneTitle                  = RegRead($__sAppRegistryPath, 'sMainHelpdesk_PhoneTitle')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_PhoneNumber')                 Then $sMainHelpdesk_PhoneNumber                 = RegRead($__sAppRegistryPath, 'sMainHelpdesk_PhoneNumber')
    If RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowWebsite')                 Then $bMainHelpdesk_ShowWebsite                 = RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowWebsite')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_WebsiteTitle')                Then $sMainHelpdesk_WebsiteTitle                = RegRead($__sAppRegistryPath, 'sMainHelpdesk_WebsiteTitle')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_WebsiteAddress')              Then $sMainHelpdesk_WebsiteAddress              = RegRead($__sAppRegistryPath, 'sMainHelpdesk_WebsiteAddress')
    If RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowAlternate')               Then $bMainHelpdesk_ShowAlternate               = RegRead($__sAppRegistryPath, 'bMainHelpdesk_ShowAlternate')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_AlternateTitle')              Then $sMainHelpdesk_AlternateTitle              = RegRead($__sAppRegistryPath, 'sMainHelpdesk_AlternateTitle')
    If RegRead($__sAppRegistryPath, 'sMainHelpdesk_AlternateAddress')            Then $sMainHelpdesk_AlternateAddress            = RegRead($__sAppRegistryPath, 'sMainHelpdesk_AlternateAddress')
    If RegRead($__sAppRegistryPath, 'bMainLCM_ShowLCMInfo')                      Then $bMainLCM_ShowLCMInfo                      = RegRead($__sAppRegistryPath, 'bMainLCM_ShowLCMInfo')
    If RegRead($__sAppRegistryPath, 'bMainLCM_ReadFromFileSystem')               Then $bMainLCM_ReadFromFileSystem               = RegRead($__sAppRegistryPath, 'bMainLCM_ReadFromFileSystem')
    If RegRead($__sAppRegistryPath, 'bMainLCM_CustomXJCode')                     Then $bMainLCM_CustomXJCode                     = RegRead($__sAppRegistryPath, 'bMainLCM_CustomXJCode')
    If RegRead($__sAppRegistryPath, 'sMainLCM_CustomXJCode')                     Then $sMainLCM_CustomXJCode                     = RegRead($__sAppRegistryPath, 'sMainLCM_CustomXJCode')
    If RegRead($__sAppRegistryPath, 'bMainLCM_CustomRCRCode')                    Then $bMainLCM_CustomRCRCode                    = RegRead($__sAppRegistryPath, 'bMainLCM_CustomRCRCode')
    If RegRead($__sAppRegistryPath, 'sMainLCM_CustomRCRCode')                    Then $sMainLCM_CustomRCRCode                    = RegRead($__sAppRegistryPath, 'sMainLCM_CustomRCRCode')
    If RegRead($__sAppRegistryPath, 'bTools_EnableToolsMenu')                    Then $bTools_EnableToolsMenu                    = RegRead($__sAppRegistryPath, 'bTools_EnableToolsMenu')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_CredentialManager')           Then $bToolsGeneral_CredentialManager           = RegRead($__sAppRegistryPath, 'bToolsGeneral_CredentialManager')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_DeviceManager')               Then $bToolsGeneral_DeviceManager               = RegRead($__sAppRegistryPath, 'bToolsGeneral_DeviceManager')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_DevicesAndPrinters')          Then $bToolsGeneral_DevicesAndPrinters          = RegRead($__sAppRegistryPath, 'bToolsGeneral_DevicesAndPrinters')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_InternetOptions')             Then $bToolsGeneral_InternetOptions             = RegRead($__sAppRegistryPath, 'bToolsGeneral_InternetOptions')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_MailAccounts')                Then $bToolsGeneral_MailAccounts                = RegRead($__sAppRegistryPath, 'bToolsGeneral_MailAccounts')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_NetworkConnections')          Then $bToolsGeneral_NetworkConnections          = RegRead($__sAppRegistryPath, 'bToolsGeneral_NetworkConnections')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_PrintManagement')             Then $bToolsGeneral_PrintManagement             = RegRead($__sAppRegistryPath, 'bToolsGeneral_PrintManagement')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_ProgramsAndFeatures')         Then $bToolsGeneral_ProgramsAndFeatures         = RegRead($__sAppRegistryPath, 'bToolsGeneral_ProgramsAndFeatures')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_SearchDirectory')             Then $bToolsGeneral_SearchDirectory             = RegRead($__sAppRegistryPath, 'bToolsGeneral_SearchDirectory')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_Services')                    Then $bToolsGeneral_Services                    = RegRead($__sAppRegistryPath, 'bToolsGeneral_Services')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_SystemProperties')            Then $bToolsGeneral_SystemProperties            = RegRead($__sAppRegistryPath, 'bToolsGeneral_SystemProperties')
    If RegRead($__sAppRegistryPath, 'bToolsGeneral_WindowsUpdate')               Then $bToolsGeneral_WindowsUpdate               = RegRead($__sAppRegistryPath, 'bToolsGeneral_WindowsUpdate')
    If RegRead($__sAppRegistryPath, 'bToolsHomeDrive_ShowHomeDrive')             Then $bToolsHomeDrive_ShowHomeDrive             = RegRead($__sAppRegistryPath, 'bToolsHomeDrive_ShowHomeDrive')
    If RegRead($__sAppRegistryPath, 'sToolsHomeDrive_Title')                     Then $sToolsHomeDrive_Title                     = RegRead($__sAppRegistryPath, 'sToolsHomeDrive_Title')
    If RegRead($__sAppRegistryPath, 'bToolsHomeDrive_ReadFromActiveDirectory')   Then $bToolsHomeDrive_ReadFromActiveDirectory   = RegRead($__sAppRegistryPath, 'bToolsHomeDrive_ReadFromActiveDirectory')
    If RegRead($__sAppRegistryPath, 'bToolsHomeDrive_MapDrive')                  Then $bToolsHomeDrive_MapDrive                  = RegRead($__sAppRegistryPath, 'bToolsHomeDrive_MapDrive')
    If RegRead($__sAppRegistryPath, 'sToolsHomeDrive_MapDrivePath')              Then $sToolsHomeDrive_MapDrivePath              = RegRead($__sAppRegistryPath, 'sToolsHomeDrive_MapDrivePath')
    If RegRead($__sAppRegistryPath, 'sToolsHomeDrive_DriveLetter')               Then $sToolsHomeDrive_DriveLetter               = RegRead($__sAppRegistryPath, 'sToolsHomeDrive_DriveLetter')
    If RegRead($__sAppRegistryPath, 'bToolsHomeDrive_Custom')                    Then $bToolsHomeDrive_Custom                    = RegRead($__sAppRegistryPath, 'bToolsHomeDrive_Custom')
    If RegRead($__sAppRegistryPath, 'sToolsHomeDrive_CustomName')                Then $sToolsHomeDrive_CustomName                = RegRead($__sAppRegistryPath, 'sToolsHomeDrive_CustomName')
    If RegRead($__sAppRegistryPath, 'sToolsHomeDrive_CustomPath')                Then $sToolsHomeDrive_CustomPath                = RegRead($__sAppRegistryPath, 'sToolsHomeDrive_CustomPath')
    If RegRead($__sAppRegistryPath, 'bToolsLoginScript_ShowLoginScript')         Then $bToolsLoginScript_ShowLoginScript         = RegRead($__sAppRegistryPath, 'bToolsLoginScript_ShowLoginScript')
    If RegRead($__sAppRegistryPath, 'bToolsLoginScript_ReadFromActiveDirectory') Then $bToolsLoginScript_ReadFromActiveDirectory = RegRead($__sAppRegistryPath, 'bToolsLoginScript_ReadFromActiveDirectory')
    If RegRead($__sAppRegistryPath, 'bToolsLoginScript_Custom')                  Then $bToolsLoginScript_Custom                  = RegRead($__sAppRegistryPath, 'bToolsLoginScript_Custom')
    If RegRead($__sAppRegistryPath, 'sToolsLoginScript_Custom')                  Then $sToolsLoginScript_Custom                  = RegRead($__sAppRegistryPath, 'sToolsLoginScript_Custom')
    If RegRead($__sAppRegistryPath, 'bCustomToolsCommand1_Enable')               Then $bCustomToolsCommand1_Enable               = RegRead($__sAppRegistryPath, 'bCustomToolsCommand1_Enable')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand1_DisplayName')          Then $sCustomToolsCommand1_DisplayName          = RegRead($__sAppRegistryPath, 'sCustomToolsCommand1_DisplayName')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand1_Command')              Then $sCustomToolsCommand1_Command              = RegRead($__sAppRegistryPath, 'sCustomToolsCommand1_Command')
    If RegRead($__sAppRegistryPath, 'bCustomToolsCommand2_Enable')               Then $bCustomToolsCommand2_Enable               = RegRead($__sAppRegistryPath, 'bCustomToolsCommand2_Enable')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand2_DisplayName')          Then $sCustomToolsCommand2_DisplayName          = RegRead($__sAppRegistryPath, 'sCustomToolsCommand2_DisplayName')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand2_Command')              Then $sCustomToolsCommand2_Command              = RegRead($__sAppRegistryPath, 'sCustomToolsCommand2_Command')
    If RegRead($__sAppRegistryPath, 'bCustomToolsCommand3_Enable')               Then $bCustomToolsCommand3_Enable               = RegRead($__sAppRegistryPath, 'bCustomToolsCommand3_Enable')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand3_DisplayName')          Then $sCustomToolsCommand3_DisplayName          = RegRead($__sAppRegistryPath, 'sCustomToolsCommand3_DisplayName')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand3_Command')              Then $sCustomToolsCommand3_Command              = RegRead($__sAppRegistryPath, 'sCustomToolsCommand3_Command')
    If RegRead($__sAppRegistryPath, 'bCustomToolsCommand4_Enable')               Then $bCustomToolsCommand4_Enable               = RegRead($__sAppRegistryPath, 'bCustomToolsCommand4_Enable')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand4_DisplayName')          Then $sCustomToolsCommand4_DisplayName          = RegRead($__sAppRegistryPath, 'sCustomToolsCommand4_DisplayName')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand4_Command')              Then $sCustomToolsCommand4_Command              = RegRead($__sAppRegistryPath, 'sCustomToolsCommand4_Command')
    If RegRead($__sAppRegistryPath, 'bCustomToolsCommand5_Enable')               Then $bCustomToolsCommand5_Enable               = RegRead($__sAppRegistryPath, 'bCustomToolsCommand5_Enable')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand5_DisplayName')          Then $sCustomToolsCommand5_DisplayName          = RegRead($__sAppRegistryPath, 'sCustomToolsCommand5_DisplayName')
    If RegRead($__sAppRegistryPath, 'sCustomToolsCommand5_Command')              Then $sCustomToolsCommand5_Command              = RegRead($__sAppRegistryPath, 'sCustomToolsCommand5_Command')
    If RegRead($__sAppRegistryPath, 'bHelpLink1_Enable')                         Then $bHelpLink1_Enable                         = RegRead($__sAppRegistryPath, 'bHelpLink1_Enable')
    If RegRead($__sAppRegistryPath, 'sHelpLink1_DisplayName')                    Then $sHelpLink1_DisplayName                    = RegRead($__sAppRegistryPath, 'sHelpLink1_DisplayName')
    If RegRead($__sAppRegistryPath, 'sHelpLink1_Command')                        Then $sHelpLink1_Command                        = RegRead($__sAppRegistryPath, 'sHelpLink1_Command')
    If RegRead($__sAppRegistryPath, 'bHelpLink2_Enable')                         Then $bHelpLink2_Enable                         = RegRead($__sAppRegistryPath, 'bHelpLink2_Enable')
    If RegRead($__sAppRegistryPath, 'sHelpLink2_DisplayName')                    Then $sHelpLink2_DisplayName                    = RegRead($__sAppRegistryPath, 'sHelpLink2_DisplayName')
    If RegRead($__sAppRegistryPath, 'sHelpLink2_Command')                        Then $sHelpLink2_Command                        = RegRead($__sAppRegistryPath, 'sHelpLink2_Command')
    If RegRead($__sAppRegistryPath, 'bHelpLink3_Enable')                         Then $bHelpLink3_Enable                         = RegRead($__sAppRegistryPath, 'bHelpLink3_Enable')
    If RegRead($__sAppRegistryPath, 'sHelpLink3_DisplayName')                    Then $sHelpLink3_DisplayName                    = RegRead($__sAppRegistryPath, 'sHelpLink3_DisplayName')
    If RegRead($__sAppRegistryPath, 'sHelpLink3_Command')                        Then $sHelpLink3_Command                        = RegRead($__sAppRegistryPath, 'sHelpLink3_Command')
    If RegRead($__sAppRegistryPath, 'bHelpLink4_Enable')                         Then $bHelpLink4_Enable                         = RegRead($__sAppRegistryPath, 'bHelpLink4_Enable')
    If RegRead($__sAppRegistryPath, 'sHelpLink4_DisplayName')                    Then $sHelpLink4_DisplayName                    = RegRead($__sAppRegistryPath, 'sHelpLink4_DisplayName')
    If RegRead($__sAppRegistryPath, 'sHelpLink4_Command')                        Then $sHelpLink4_Command                        = RegRead($__sAppRegistryPath, 'sHelpLink4_Command')
    If RegRead($__sAppRegistryPath, 'bHelpLink5_Enable')                         Then $bHelpLink5_Enable                         = RegRead($__sAppRegistryPath, 'bHelpLink5_Enable')
    If RegRead($__sAppRegistryPath, 'sHelpLink5_DisplayName')                    Then $sHelpLink5_DisplayName                    = RegRead($__sAppRegistryPath, 'sHelpLink5_DisplayName')
    If RegRead($__sAppRegistryPath, 'sHelpLink5_Command')                        Then $sHelpLink5_Command                        = RegRead($__sAppRegistryPath, 'sHelpLink5_Command')
    If RegRead($__sAppRegistryPath, 'bServicesService1_Enable')                  Then $bServicesService1_Enable                  = RegRead($__sAppRegistryPath, 'bServicesService1_Enable')
    If RegRead($__sAppRegistryPath, 'sServicesService1_DisplayName')             Then $sServicesService1_DisplayName             = RegRead($__sAppRegistryPath, 'sServicesService1_DisplayName')
    If RegRead($__sAppRegistryPath, 'sServicesService1_Name')                    Then $sServicesService1_Name                    = RegRead($__sAppRegistryPath, 'sServicesService1_Name')
    If RegRead($__sAppRegistryPath, 'bServicesService2_Enable')                  Then $bServicesService2_Enable                  = RegRead($__sAppRegistryPath, 'bServicesService2_Enable')
    If RegRead($__sAppRegistryPath, 'sServicesService2_DisplayName')             Then $sServicesService2_DisplayName             = RegRead($__sAppRegistryPath, 'sServicesService2_DisplayName')
    If RegRead($__sAppRegistryPath, 'sServicesService2_Name')                    Then $sServicesService2_Name                    = RegRead($__sAppRegistryPath, 'sServicesService2_Name')
    If RegRead($__sAppRegistryPath, 'bServicesService3_Enable')                  Then $bServicesService3_Enable                  = RegRead($__sAppRegistryPath, 'bServicesService3_Enable')
    If RegRead($__sAppRegistryPath, 'sServicesService3_DisplayName')             Then $sServicesService3_DisplayName             = RegRead($__sAppRegistryPath, 'sServicesService3_DisplayName')
    If RegRead($__sAppRegistryPath, 'sServicesService3_Name')                    Then $sServicesService3_Name                    = RegRead($__sAppRegistryPath, 'sServicesService3_Name')
    If RegRead($__sAppRegistryPath, 'bServicesService4_Enable')                  Then $bServicesService4_Enable                  = RegRead($__sAppRegistryPath, 'bServicesService4_Enable')
    If RegRead($__sAppRegistryPath, 'sServicesService4_DisplayName')             Then $sServicesService4_DisplayName             = RegRead($__sAppRegistryPath, 'sServicesService4_DisplayName')
    If RegRead($__sAppRegistryPath, 'sServicesService4_Name')                    Then $sServicesService4_Name                    = RegRead($__sAppRegistryPath, 'sServicesService4_Name')
    If RegRead($__sAppRegistryPath, 'bServicesService5_Enable')                  Then $bServicesService5_Enable                  = RegRead($__sAppRegistryPath, 'bServicesService5_Enable')
    If RegRead($__sAppRegistryPath, 'sServicesService5_DisplayName')             Then $sServicesService5_DisplayName             = RegRead($__sAppRegistryPath, 'sServicesService5_DisplayName')
    If RegRead($__sAppRegistryPath, 'sServicesService5_Name')                    Then $sServicesService5_Name                    = RegRead($__sAppRegistryPath, 'sServicesService5_Name')
    If RegRead($__sAppRegistryPath, 'bContact_EnableContactForm')                Then $bContact_EnableContactForm                = RegRead($__sAppRegistryPath, 'bContact_EnableContactForm')
    If RegRead($__sAppRegistryPath, 'sContactGeneral_ButtonText')                Then $sContactGeneral_ButtonText                = RegRead($__sAppRegistryPath, 'sContactGeneral_ButtonText')
    If RegRead($__sAppRegistryPath, 'bContactGeneral_ShowEmployeeIDField')       Then $bContactGeneral_ShowEmployeeIDField       = RegRead($__sAppRegistryPath, 'bContactGeneral_ShowEmployeeIDField')
    If RegRead($__sAppRegistryPath, 'bContactRecipient_UseHelpdeskEmail')        Then $bContactRecipient_UseHelpdeskEmail        = RegRead($__sAppRegistryPath, 'bContactRecipient_UseHelpdeskEmail')
    If RegRead($__sAppRegistryPath, 'bContactRecipient_Custom')                  Then $bContactRecipient_Custom                  = RegRead($__sAppRegistryPath, 'bContactRecipient_Custom')
    If RegRead($__sAppRegistryPath, 'sContactRecipient_Custom')                  Then $sContactRecipient_Custom                  = RegRead($__sAppRegistryPath, 'sContactRecipient_Custom')
    If RegRead($__sAppRegistryPath, 'bContactSender_ReadFromAD')                 Then $bContactSender_ReadFromAD                 = RegRead($__sAppRegistryPath, 'bContactSender_ReadFromAD')
    If RegRead($__sAppRegistryPath, 'bContactSender_Custom')                     Then $bContactSender_Custom                     = RegRead($__sAppRegistryPath, 'bContactSender_Custom')
    If RegRead($__sAppRegistryPath, 'sContactSender_Custom')                     Then $sContactSender_Custom                     = RegRead($__sAppRegistryPath, 'sContactSender_Custom')
    If RegRead($__sAppRegistryPath, 'bContactSender_EnableEmailField')           Then $bContactSender_EnableEmailField           = RegRead($__sAppRegistryPath, 'bContactSender_EnableEmailField')
    If RegRead($__sAppRegistryPath, 'sContactSMTP_Server')                       Then $sContactSMTP_Server                       = RegRead($__sAppRegistryPath, 'sContactSMTP_Server')
    If RegRead($__sAppRegistryPath, 'sContactSMTP_Port')                         Then $sContactSMTP_Port                         = RegRead($__sAppRegistryPath, 'sContactSMTP_Port')
    If RegRead($__sAppRegistryPath, 'bContactSMTP_EnableSSL')                    Then $bContactSMTP_EnableSSL                    = RegRead($__sAppRegistryPath, 'bContactSMTP_EnableSSL')
    If RegRead($__sAppRegistryPath, 'sContactSMTP_Username')                     Then $sContactSMTP_Username                     = RegRead($__sAppRegistryPath, 'sContactSMTP_Username')
    If RegRead($__sAppRegistryPath, 'sContactSMTP_Password')                     Then $sContactSMTP_Password                     = RegRead($__sAppRegistryPath, 'sContactSMTP_Password')
  EndIf

  ;;Write customization to Windows Registry
  If $iOption = 'Stage' Then
    RegWrite($__sAppRegistryPath, 'bMainGeneral_StartAtLogin',                 'REG_DWORD', $bMainGeneral_StartAtLogin)
    RegWrite($__sAppRegistryPath, 'bMainGeneral_DisableExit',                  'REG_DWORD', $bMainGeneral_DisableExit)
    RegWrite($__sAppRegistryPath, 'iMainTray_Icon',                            'REG_DWORD', $iMainTray_Icon)
    RegWrite($__sAppRegistryPath, 'bMainAssetTag_ShowAssetTag',                'REG_DWORD', $bMainAssetTag_ShowAssetTag)
    RegWrite($__sAppRegistryPath, 'bMainAssetTag_ReadFromBIOS',                'REG_DWORD', $bMainAssetTag_ReadFromBIOS)
    RegWrite($__sAppRegistryPath, 'bMainAssetTag_Custom',                      'REG_DWORD', $bMainAssetTag_Custom)
    RegWrite($__sAppRegistryPath, 'sMainAssetTag_Custom',                      'REG_SZ',    $sMainAssetTag_Custom)
    RegWrite($__sAppRegistryPath, 'bMainCustomDetails_ShowCustomDetails',      'REG_DWORD', $bMainCustomDetails_ShowCustomDetails)
    RegWrite($__sAppRegistryPath, 'sMainCustomDetails_FreeText',               'REG_SZ',    $sMainCustomDetails_FreeText)
    RegWrite($__sAppRegistryPath, 'bMainLCM_ShowLCMInfo',                      'REG_DWORD', $bMainLCM_ShowLCMInfo)
    RegWrite($__sAppRegistryPath, 'bMainLCM_ReadFromFileSystem',               'REG_DWORD', $bMainLCM_ReadFromFileSystem)
    RegWrite($__sAppRegistryPath, 'bMainLCM_CustomXJCode',                     'REG_DWORD', $bMainLCM_CustomXJCode)
    RegWrite($__sAppRegistryPath, 'sMainLCM_CustomXJCode',                     'REG_SZ',    $sMainLCM_CustomXJCode)
    RegWrite($__sAppRegistryPath, 'bMainLCM_CustomRCRCode',                    'REG_DWORD', $bMainLCM_CustomRCRCode)
    RegWrite($__sAppRegistryPath, 'sMainLCM_CustomRCRCode',                    'REG_SZ',    $sMainLCM_CustomRCRCode)
    RegWrite($__sAppRegistryPath, 'bMainHelpdesk_ShowHelpdesk',                'REG_DWORD', $bMainHelpdesk_ShowHelpdesk)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_Title',                       'REG_SZ',    $sMainHelpdesk_Title)
    RegWrite($__sAppRegistryPath, 'bMainHelpdesk_ShowEmail',                   'REG_DWORD', $bMainHelpdesk_ShowEmail)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_EmailTitle',                  'REG_SZ',    $sMainHelpdesk_EmailTitle)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_EmailAddress',                'REG_SZ',    $sMainHelpdesk_EmailAddress)
    RegWrite($__sAppRegistryPath, 'bMainHelpdesk_ShowPhone',                   'REG_DWORD', $bMainHelpdesk_ShowPhone)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_PhoneTitle',                  'REG_SZ',    $sMainHelpdesk_PhoneTitle)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_PhoneNumber',                 'REG_SZ',    $sMainHelpdesk_PhoneNumber)
    RegWrite($__sAppRegistryPath, 'bMainHelpdesk_ShowWebsite',                 'REG_DWORD', $bMainHelpdesk_ShowWebsite)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_WebsiteTitle',                'REG_SZ',    $sMainHelpdesk_WebsiteTitle)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_WebsiteAddress',              'REG_SZ',    $sMainHelpdesk_WebsiteAddress)
    RegWrite($__sAppRegistryPath, 'bMainHelpdesk_ShowAlternate',               'REG_DWORD', $bMainHelpdesk_ShowAlternate)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_AlternateTitle',              'REG_SZ',    $sMainHelpdesk_AlternateTitle)
    RegWrite($__sAppRegistryPath, 'sMainHelpdesk_AlternateAddress',            'REG_SZ',    $sMainHelpdesk_AlternateAddress)
    RegWrite($__sAppRegistryPath, 'bTools_EnableToolsMenu',                    'REG_DWORD', $bTools_EnableToolsMenu)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_CredentialManager',           'REG_DWORD', $bToolsGeneral_CredentialManager)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_DeviceManager',               'REG_DWORD', $bToolsGeneral_DeviceManager)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_DevicesAndPrinters',          'REG_DWORD', $bToolsGeneral_DevicesAndPrinters)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_InternetOptions',             'REG_DWORD', $bToolsGeneral_InternetOptions)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_MailAccounts',                'REG_DWORD', $bToolsGeneral_MailAccounts)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_NetworkConnections',          'REG_DWORD', $bToolsGeneral_NetworkConnections)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_PrintManagement',             'REG_DWORD', $bToolsGeneral_PrintManagement)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_ProgramsAndFeatures',         'REG_DWORD', $bToolsGeneral_ProgramsAndFeatures)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_SearchDirectory',             'REG_DWORD', $bToolsGeneral_SearchDirectory)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_Services',                    'REG_DWORD', $bToolsGeneral_Services)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_SystemProperties',            'REG_DWORD', $bToolsGeneral_SystemProperties)
    RegWrite($__sAppRegistryPath, 'bToolsGeneral_WindowsUpdate',               'REG_DWORD', $bToolsGeneral_WindowsUpdate)
    RegWrite($__sAppRegistryPath, 'bToolsHomeDrive_ShowHomeDrive',             'REG_DWORD', $bToolsHomeDrive_ShowHomeDrive)
    RegWrite($__sAppRegistryPath, 'sToolsHomeDrive_Title',                     'REG_SZ',    $sToolsHomeDrive_Title)
    RegWrite($__sAppRegistryPath, 'bToolsHomeDrive_ReadFromActiveDirectory',   'REG_DWORD', $bToolsHomeDrive_ReadFromActiveDirectory)
    RegWrite($__sAppRegistryPath, 'bToolsHomeDrive_MapDrive',                  'REG_DWORD', $bToolsHomeDrive_MapDrive)
    RegWrite($__sAppRegistryPath, 'sToolsHomeDrive_MapDrivePath',              'REG_SZ',    $sToolsHomeDrive_MapDrivePath)
    RegWrite($__sAppRegistryPath, 'sToolsHomeDrive_DriveLetter',               'REG_SZ',    $sToolsHomeDrive_DriveLetter)
    RegWrite($__sAppRegistryPath, 'bToolsHomeDrive_Custom',                    'REG_DWORD', $bToolsHomeDrive_Custom)
    RegWrite($__sAppRegistryPath, 'sToolsHomeDrive_CustomName',                'REG_SZ',    $sToolsHomeDrive_CustomName)
    RegWrite($__sAppRegistryPath, 'sToolsHomeDrive_CustomPath',                'REG_SZ',    $sToolsHomeDrive_CustomPath)
    RegWrite($__sAppRegistryPath, 'bToolsLoginScript_ShowLoginScript',         'REG_DWORD', $bToolsLoginScript_ShowLoginScript)
    RegWrite($__sAppRegistryPath, 'bToolsLoginScript_ReadFromActiveDirectory', 'REG_DWORD', $bToolsLoginScript_ReadFromActiveDirectory)
    RegWrite($__sAppRegistryPath, 'bToolsLoginScript_Custom',                  'REG_DWORD', $bToolsLoginScript_Custom)
    RegWrite($__sAppRegistryPath, 'sToolsLoginScript_Custom',                  'REG_SZ',    $sToolsLoginScript_Custom)
    RegWrite($__sAppRegistryPath, 'bCustomToolsCommand1_Enable',               'REG_DWORD', $bCustomToolsCommand1_Enable)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand1_DisplayName',          'REG_SZ',    $sCustomToolsCommand1_DisplayName)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand1_Command',              'REG_SZ',    $sCustomToolsCommand1_Command)
    RegWrite($__sAppRegistryPath, 'bCustomToolsCommand2_Enable',               'REG_DWORD', $bCustomToolsCommand2_Enable)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand2_DisplayName',          'REG_SZ',    $sCustomToolsCommand2_DisplayName)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand2_Command',              'REG_SZ',    $sCustomToolsCommand2_Command)
    RegWrite($__sAppRegistryPath, 'bCustomToolsCommand3_Enable',               'REG_DWORD', $bCustomToolsCommand3_Enable)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand3_DisplayName',          'REG_SZ',    $sCustomToolsCommand3_DisplayName)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand3_Command',              'REG_SZ',    $sCustomToolsCommand3_Command)
    RegWrite($__sAppRegistryPath, 'bCustomToolsCommand4_Enable',               'REG_DWORD', $bCustomToolsCommand4_Enable)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand4_DisplayName',          'REG_SZ',    $sCustomToolsCommand4_DisplayName)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand4_Command',              'REG_SZ',    $sCustomToolsCommand4_Command)
    RegWrite($__sAppRegistryPath, 'bCustomToolsCommand5_Enable',               'REG_DWORD', $bCustomToolsCommand5_Enable)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand5_DisplayName',          'REG_SZ',    $sCustomToolsCommand5_DisplayName)
    RegWrite($__sAppRegistryPath, 'sCustomToolsCommand5_Command',              'REG_SZ',    $sCustomToolsCommand5_Command)
    RegWrite($__sAppRegistryPath, 'bHelpLink1_Enable',                         'REG_DWORD', $bHelpLink1_Enable)
    RegWrite($__sAppRegistryPath, 'sHelpLink1_DisplayName',                    'REG_SZ',    $sHelpLink1_DisplayName)
    RegWrite($__sAppRegistryPath, 'sHelpLink1_Command',                        'REG_SZ',    $sHelpLink1_Command)
    RegWrite($__sAppRegistryPath, 'bHelpLink2_Enable',                         'REG_DWORD', $bHelpLink2_Enable)
    RegWrite($__sAppRegistryPath, 'sHelpLink2_DisplayName',                    'REG_SZ',    $sHelpLink2_DisplayName)
    RegWrite($__sAppRegistryPath, 'sHelpLink2_Command',                        'REG_SZ',    $sHelpLink2_Command)
    RegWrite($__sAppRegistryPath, 'bHelpLink3_Enable',                         'REG_DWORD', $bHelpLink3_Enable)
    RegWrite($__sAppRegistryPath, 'sHelpLink3_DisplayName',                    'REG_SZ',    $sHelpLink3_DisplayName)
    RegWrite($__sAppRegistryPath, 'sHelpLink3_Command',                        'REG_SZ',    $sHelpLink3_Command)
    RegWrite($__sAppRegistryPath, 'bHelpLink4_Enable',                         'REG_DWORD', $bHelpLink4_Enable)
    RegWrite($__sAppRegistryPath, 'sHelpLink4_DisplayName',                    'REG_SZ',    $sHelpLink4_DisplayName)
    RegWrite($__sAppRegistryPath, 'sHelpLink4_Command',                        'REG_SZ',    $sHelpLink4_Command)
    RegWrite($__sAppRegistryPath, 'bHelpLink5_Enable',                         'REG_DWORD', $bHelpLink5_Enable)
    RegWrite($__sAppRegistryPath, 'sHelpLink5_DisplayName',                    'REG_SZ',    $sHelpLink5_DisplayName)
    RegWrite($__sAppRegistryPath, 'sHelpLink5_Command',                        'REG_SZ',    $sHelpLink5_Command)
    RegWrite($__sAppRegistryPath, 'bServicesService1_Enable',                  'REG_DWORD', $bServicesService1_Enable)
    RegWrite($__sAppRegistryPath, 'sServicesService1_DisplayName',             'REG_SZ',    $sServicesService1_DisplayName)
    RegWrite($__sAppRegistryPath, 'sServicesService1_Name',                    'REG_SZ',    $sServicesService1_Name)
    RegWrite($__sAppRegistryPath, 'bServicesService2_Enable',                  'REG_DWORD', $bServicesService2_Enable)
    RegWrite($__sAppRegistryPath, 'sServicesService2_DisplayName',             'REG_SZ',    $sServicesService2_DisplayName)
    RegWrite($__sAppRegistryPath, 'sServicesService2_Name',                    'REG_SZ',    $sServicesService2_Name)
    RegWrite($__sAppRegistryPath, 'bServicesService3_Enable',                  'REG_DWORD', $bServicesService3_Enable)
    RegWrite($__sAppRegistryPath, 'sServicesService3_DisplayName',             'REG_SZ',    $sServicesService3_DisplayName)
    RegWrite($__sAppRegistryPath, 'sServicesService3_Name',                    'REG_SZ',    $sServicesService3_Name)
    RegWrite($__sAppRegistryPath, 'bServicesService4_Enable',                  'REG_DWORD', $bServicesService4_Enable)
    RegWrite($__sAppRegistryPath, 'sServicesService4_DisplayName',             'REG_SZ',    $sServicesService4_DisplayName)
    RegWrite($__sAppRegistryPath, 'sServicesService4_Name',                    'REG_SZ',    $sServicesService4_Name)
    RegWrite($__sAppRegistryPath, 'bServicesService5_Enable',                  'REG_DWORD', $bServicesService5_Enable)
    RegWrite($__sAppRegistryPath, 'sServicesService5_DisplayName',             'REG_SZ',    $sServicesService5_DisplayName)
    RegWrite($__sAppRegistryPath, 'sServicesService5_Name',                    'REG_SZ',    $sServicesService5_Name)
    RegWrite($__sAppRegistryPath, 'bContact_EnableContactForm',                'REG_DWORD', $bContact_EnableContactForm)
    RegWrite($__sAppRegistryPath, 'sContactGeneral_ButtonText',                'REG_SZ',    $sContactGeneral_ButtonText)
    RegWrite($__sAppRegistryPath, 'bContactGeneral_ShowEmployeeIDField',       'REG_DWORD', $bContactGeneral_ShowEmployeeIDField)
    RegWrite($__sAppRegistryPath, 'bContactRecipient_UseHelpdeskEmail',        'REG_DWORD', $bContactRecipient_UseHelpdeskEmail)
    RegWrite($__sAppRegistryPath, 'bContactRecipient_Custom',                  'REG_DWORD', $bContactRecipient_Custom)
    RegWrite($__sAppRegistryPath, 'sContactRecipient_Custom',                  'REG_SZ',    $sContactRecipient_Custom)
    RegWrite($__sAppRegistryPath, 'bContactSender_ReadFromAD',                 'REG_DWORD', $bContactSender_ReadFromAD)
    RegWrite($__sAppRegistryPath, 'bContactSender_Custom',                     'REG_DWORD', $bContactSender_Custom)
    RegWrite($__sAppRegistryPath, 'sContactSender_Custom',                     'REG_SZ',    $sContactSender_Custom)
    RegWrite($__sAppRegistryPath, 'bContactSender_EnableEmailField',           'REG_DWORD', $bContactSender_EnableEmailField)
    RegWrite($__sAppRegistryPath, 'sContactSMTP_Server',                       'REG_SZ',    $sContactSMTP_Server)
    RegWrite($__sAppRegistryPath, 'sContactSMTP_Port',                         'REG_SZ',    $sContactSMTP_Port)
    RegWrite($__sAppRegistryPath, 'bContactSMTP_EnableSSL',                    'REG_DWORD', $bContactSMTP_EnableSSL)
    RegWrite($__sAppRegistryPath, 'sContactSMTP_Username',                     'REG_SZ',    $sContactSMTP_Username)
    RegWrite($__sAppRegistryPath, 'sContactSMTP_Password',                     'REG_SZ',    $sContactSMTP_Password)
  EndIf
EndFunc