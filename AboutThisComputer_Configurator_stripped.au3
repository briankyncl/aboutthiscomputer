#NoTrayIcon
#Region
#AutoIt3Wrapper_Icon=Images\BeOS_Customize_info.ico
#AutoIt3Wrapper_Outfile=Compiled\Configurator.exe
#AutoIt3Wrapper_Outfile_x64=Compiled\Configurator_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=About This Computer Configurator
#AutoIt3Wrapper_Res_Description=About This Computer Configurator
#AutoIt3Wrapper_Res_Fileversion=1.0.0.12
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=Copyright (c) 2020 Brian Kyncl (briankyncl.com). All rights reserved.
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Add_Constants=n
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mo
#EndRegion
#Region -- PRE-FLIGHT
Func _ATC_Customization($__sAppRegistryPath = 'HKEY_LOCAL_MACHINE\Software\briankyncl.com\About This Computer', $iOption = 'Default')
If $iOption = 'Default' Or $iOption = 'Declare' Then
Global $sOrgName = 'Contoso'
Global $sOrgDomain = 'contoso.com'
Global $sOrgFQDomain = 'corp.' & $sOrgDomain
Global $bMainGeneral_StartAtLogin = 1
Global $bMainGeneral_DisableExit = 1
Global $iMainTray_Icon = 1
Global $bMainAssetTag_ShowAssetTag = 0
Global $bMainAssetTag_ReadFromBIOS = 1
Global $bMainAssetTag_Custom = 0
Global $sMainAssetTag_Custom = '100123'
Global $bMainCustomDetails_ShowCustomDetails = 0
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
Global $bToolsHomeDrive_ShowHomeDrive = 0
Global $sToolsHomeDrive_Title = ''
Global $bToolsHomeDrive_ReadFromActiveDirectory = 1
Global $bToolsHomeDrive_MapDrive = 0
Global $sToolsHomeDrive_MapDrivePath = ''
Global $sToolsHomeDrive_DriveLetter = ''
Global $bToolsHomeDrive_Custom = 0
Global $sToolsHomeDrive_CustomName = ''
Global $sToolsHomeDrive_CustomPath = ''
Global $bToolsLoginScript_ShowLoginScript = 0
Global $bToolsLoginScript_ReadFromActiveDirectory = 1
Global $bToolsLoginScript_Custom = 0
Global $sToolsLoginScript_Custom = ''
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
Global Const $BS_GROUPBOX = 0x0007
Global Const $BS_BOTTOM = 0x0800
Global Const $BS_CENTER = 0x0300
Global Const $BS_DEFPUSHBUTTON = 0x0001
Global Const $BS_LEFT = 0x0100
Global Const $BS_MULTILINE = 0x2000
Global Const $BS_PUSHBOX = 0x000A
Global Const $BS_PUSHLIKE = 0x1000
Global Const $BS_RIGHT = 0x0200
Global Const $BS_RIGHTBUTTON = 0x0020
Global Const $BS_TOP = 0x0400
Global Const $BS_VCENTER = 0x0C00
Global Const $BS_FLAT = 0x8000
Global Const $BS_ICON = 0x0040
Global Const $BS_BITMAP = 0x0080
Global Const $BS_NOTIFY = 0x4000
Global Const $BS_SPLITBUTTON = 0x0000000C
Global Const $BS_DEFSPLITBUTTON = 0x0000000D
Global Const $BS_COMMANDLINK = 0x0000000E
Global Const $BS_DEFCOMMANDLINK = 0x0000000F
Global Const $BCSIF_GLYPH = 0x0001
Global Const $BCSIF_IMAGE = 0x0002
Global Const $BCSIF_STYLE = 0x0004
Global Const $BCSIF_SIZE = 0x0008
Global Const $BCSS_NOSPLIT = 0x0001
Global Const $BCSS_STRETCH = 0x0002
Global Const $BCSS_ALIGNLEFT = 0x0004
Global Const $BCSS_IMAGE = 0x0008
Global Const $BUTTON_IMAGELIST_ALIGN_LEFT = 0
Global Const $BUTTON_IMAGELIST_ALIGN_RIGHT = 1
Global Const $BUTTON_IMAGELIST_ALIGN_TOP = 2
Global Const $BUTTON_IMAGELIST_ALIGN_BOTTOM = 3
Global Const $BUTTON_IMAGELIST_ALIGN_CENTER = 4
Global Const $BS_3STATE = 0x0005
Global Const $BS_AUTO3STATE = 0x0006
Global Const $BS_AUTOCHECKBOX = 0x0003
Global Const $BS_CHECKBOX = 0x0002
Global Const $BS_RADIOBUTTON = 0x4
Global Const $BS_AUTORADIOBUTTON = 0x0009
Global Const $BS_OWNERDRAW = 0xB
Global Const $GUI_SS_DEFAULT_BUTTON = 0
Global Const $GUI_SS_DEFAULT_CHECKBOX = 0
Global Const $GUI_SS_DEFAULT_GROUP = 0
Global Const $GUI_SS_DEFAULT_RADIO = 0
Global Const $BCM_FIRST = 0x1600
Global Const $BCM_GETIDEALSIZE = ($BCM_FIRST + 0x0001)
Global Const $BCM_GETIMAGELIST = ($BCM_FIRST + 0x0003)
Global Const $BCM_GETNOTE = ($BCM_FIRST + 0x000A)
Global Const $BCM_GETNOTELENGTH = ($BCM_FIRST + 0x000B)
Global Const $BCM_GETSPLITINFO = ($BCM_FIRST + 0x0008)
Global Const $BCM_GETTEXTMARGIN = ($BCM_FIRST + 0x0005)
Global Const $BCM_SETDROPDOWNSTATE = ($BCM_FIRST + 0x0006)
Global Const $BCM_SETIMAGELIST = ($BCM_FIRST + 0x0002)
Global Const $BCM_SETNOTE = ($BCM_FIRST + 0x0009)
Global Const $BCM_SETSHIELD = ($BCM_FIRST + 0x000C)
Global Const $BCM_SETSPLITINFO = ($BCM_FIRST + 0x0007)
Global Const $BCM_SETTEXTMARGIN = ($BCM_FIRST + 0x0004)
Global Const $BM_CLICK = 0xF5
Global Const $BM_GETCHECK = 0xF0
Global Const $BM_GETIMAGE = 0xF6
Global Const $BM_GETSTATE = 0xF2
Global Const $BM_SETCHECK = 0xF1
Global Const $BM_SETDONTCLICK = 0xF8
Global Const $BM_SETIMAGE = 0xF7
Global Const $BM_SETSTATE = 0xF3
Global Const $BM_SETSTYLE = 0xF4
Global Const $BCN_FIRST = -1250
Global Const $BCN_DROPDOWN = ($BCN_FIRST + 0x0002)
Global Const $BCN_HOTITEMCHANGE = ($BCN_FIRST + 0x0001)
Global Const $BN_CLICKED = 0
Global Const $BN_PAINT = 1
Global Const $BN_HILITE = 2
Global Const $BN_UNHILITE = 3
Global Const $BN_DISABLE = 4
Global Const $BN_DOUBLECLICKED = 5
Global Const $BN_SETFOCUS = 6
Global Const $BN_KILLFOCUS = 7
Global Const $BN_PUSHED = $BN_HILITE
Global Const $BN_UNPUSHED = $BN_UNHILITE
Global Const $BN_DBLCLK = $BN_DOUBLECLICKED
Global Const $BST_CHECKED = 0x1
Global Const $BST_INDETERMINATE = 0x2
Global Const $BST_UNCHECKED = 0x0
Global Const $BST_FOCUS = 0x8
Global Const $BST_PUSHED = 0x4
Global Const $BST_DONTCLICK = 0x000080
Global Const $ES_LEFT = 0
Global Const $ES_CENTER = 1
Global Const $ES_RIGHT = 2
Global Const $ES_MULTILINE = 4
Global Const $ES_UPPERCASE = 8
Global Const $ES_LOWERCASE = 16
Global Const $ES_PASSWORD = 32
Global Const $ES_AUTOVSCROLL = 64
Global Const $ES_AUTOHSCROLL = 128
Global Const $ES_NOHIDESEL = 256
Global Const $ES_OEMCONVERT = 1024
Global Const $ES_READONLY = 2048
Global Const $ES_WANTRETURN = 4096
Global Const $ES_NUMBER = 8192
Global Const $EC_ERR = -1
Global Const $ECM_FIRST = 0X1500
Global Const $EM_CANUNDO = 0xC6
Global Const $EM_CHARFROMPOS = 0xD7
Global Const $EM_EMPTYUNDOBUFFER = 0xCD
Global Const $EM_FMTLINES = 0xC8
Global Const $EM_GETCUEBANNER = ($ECM_FIRST + 2)
Global Const $EM_GETFIRSTVISIBLELINE = 0xCE
Global Const $EM_GETHANDLE = 0xBD
Global Const $EM_GETIMESTATUS = 0xD9
Global Const $EM_GETLIMITTEXT = 0xD5
Global Const $EM_GETLINE = 0xC4
Global Const $EM_GETLINECOUNT = 0xBA
Global Const $EM_GETMARGINS = 0xD4
Global Const $EM_GETMODIFY = 0xB8
Global Const $EM_GETPASSWORDCHAR = 0xD2
Global Const $EM_GETRECT = 0xB2
Global Const $EM_GETSEL = 0xB0
Global Const $EM_GETTHUMB = 0xBE
Global Const $EM_GETWORDBREAKPROC = 0xD1
Global Const $EM_HIDEBALLOONTIP = ($ECM_FIRST + 4)
Global Const $EM_LIMITTEXT = 0xC5
Global Const $EM_LINEFROMCHAR = 0xC9
Global Const $EM_LINEINDEX = 0xBB
Global Const $EM_LINELENGTH = 0xC1
Global Const $EM_LINESCROLL = 0xB6
Global Const $EM_POSFROMCHAR = 0xD6
Global Const $EM_REPLACESEL = 0xC2
Global Const $EM_SCROLL = 0xB5
Global Const $EM_SCROLLCARET = 0x00B7
Global Const $EM_SETCUEBANNER = ($ECM_FIRST + 1)
Global Const $EM_SETHANDLE = 0xBC
Global Const $EM_SETIMESTATUS = 0xD8
Global Const $EM_SETLIMITTEXT = $EM_LIMITTEXT
Global Const $EM_SETMARGINS = 0xD3
Global Const $EM_SETMODIFY = 0xB9
Global Const $EM_SETPASSWORDCHAR = 0xCC
Global Const $EM_SETREADONLY = 0xCF
Global Const $EM_SETRECT = 0xB3
Global Const $EM_SETRECTNP = 0xB4
Global Const $EM_SETSEL = 0xB1
Global Const $EM_SETTABSTOPS = 0xCB
Global Const $EM_SETWORDBREAKPROC = 0xD0
Global Const $EM_SHOWBALLOONTIP = ($ECM_FIRST + 3)
Global Const $EM_UNDO = 0xC7
Global Const $EC_LEFTMARGIN = 0x1
Global Const $EC_RIGHTMARGIN = 0x2
Global Const $EC_USEFONTINFO = 0xFFFF
Global Const $EMSIS_COMPOSITIONSTRING = 0x1
Global Const $EIMES_GETCOMPSTRATONCE = 0x1
Global Const $EIMES_CANCELCOMPSTRINFOCUS = 0x2
Global Const $EIMES_COMPLETECOMPSTRKILLFOCUS = 0x4
Global Const $EN_ALIGN_LTR_EC = 0x700
Global Const $EN_ALIGN_RTL_EC = 0x701
Global Const $EN_CHANGE = 0x300
Global Const $EN_ERRSPACE = 0x500
Global Const $EN_HSCROLL = 0X601
Global Const $EN_KILLFOCUS = 0x200
Global Const $EN_MAXTEXT = 0x501
Global Const $EN_SETFOCUS = 0x100
Global Const $EN_UPDATE = 0x400
Global Const $EN_VSCROLL = 0x602
Global Const $GUI_SS_DEFAULT_EDIT = 0x003010c0
Global Const $GUI_SS_DEFAULT_INPUT = 0x00000080
Global Const $FC_NOOVERWRITE = 0
Global Const $FC_OVERWRITE = 1
Global Const $FC_CREATEPATH = 8
Global Const $FT_MODIFIED = 0
Global Const $FT_CREATED = 1
Global Const $FT_ACCESSED = 2
Global Const $FT_ARRAY = 0
Global Const $FT_STRING = 1
Global Const $FSF_CREATEBUTTON = 1
Global Const $FSF_NEWDIALOG = 2
Global Const $FSF_EDITCONTROL = 4
Global Const $FT_NONRECURSIVE = 0
Global Const $FT_RECURSIVE = 1
Global Const $FO_READ = 0
Global Const $FO_APPEND = 1
Global Const $FO_OVERWRITE = 2
Global Const $FO_CREATEPATH = 8
Global Const $FO_BINARY = 16
Global Const $FO_UNICODE = 32
Global Const $FO_UTF16_LE = 32
Global Const $FO_UTF16_BE = 64
Global Const $FO_UTF8 = 128
Global Const $FO_UTF8_NOBOM = 256
Global Const $FO_ANSI = 512
Global Const $FO_UTF16_LE_NOBOM = 1024
Global Const $FO_UTF16_BE_NOBOM = 2048
Global Const $FO_UTF8_FULL = 16384
Global Const $FO_FULLFILE_DETECT = 16384
Global Const $EOF = -1
Global Const $FD_FILEMUSTEXIST = 1
Global Const $FD_PATHMUSTEXIST = 2
Global Const $FD_MULTISELECT = 4
Global Const $FD_PROMPTCREATENEW = 8
Global Const $FD_PROMPTOVERWRITE = 16
Global Const $CREATE_NEW = 1
Global Const $CREATE_ALWAYS = 2
Global Const $OPEN_EXISTING = 3
Global Const $OPEN_ALWAYS = 4
Global Const $TRUNCATE_EXISTING = 5
Global Const $INVALID_SET_FILE_POINTER = -1
Global Const $FILE_BEGIN = 0
Global Const $FILE_CURRENT = 1
Global Const $FILE_END = 2
Global Const $FILE_ATTRIBUTE_READONLY = 0x00000001
Global Const $FILE_ATTRIBUTE_HIDDEN = 0x00000002
Global Const $FILE_ATTRIBUTE_SYSTEM = 0x00000004
Global Const $FILE_ATTRIBUTE_DIRECTORY = 0x00000010
Global Const $FILE_ATTRIBUTE_ARCHIVE = 0x00000020
Global Const $FILE_ATTRIBUTE_DEVICE = 0x00000040
Global Const $FILE_ATTRIBUTE_NORMAL = 0x00000080
Global Const $FILE_ATTRIBUTE_TEMPORARY = 0x00000100
Global Const $FILE_ATTRIBUTE_SPARSE_FILE = 0x00000200
Global Const $FILE_ATTRIBUTE_REPARSE_POINT = 0x00000400
Global Const $FILE_ATTRIBUTE_COMPRESSED = 0x00000800
Global Const $FILE_ATTRIBUTE_OFFLINE = 0x00001000
Global Const $FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 0x00002000
Global Const $FILE_ATTRIBUTE_ENCRYPTED = 0x00004000
Global Const $FILE_SHARE_READ = 0x00000001
Global Const $FILE_SHARE_WRITE = 0x00000002
Global Const $FILE_SHARE_DELETE = 0x00000004
Global Const $FILE_SHARE_READWRITE = BitOR($FILE_SHARE_READ, $FILE_SHARE_WRITE)
Global Const $FILE_SHARE_ANY = BitOR($FILE_SHARE_READ, $FILE_SHARE_WRITE, $FILE_SHARE_DELETE)
Global Const $GENERIC_ALL = 0x10000000
Global Const $GENERIC_EXECUTE = 0x20000000
Global Const $GENERIC_WRITE = 0x40000000
Global Const $GENERIC_READ = 0x80000000
Global Const $GENERIC_READWRITE = BitOR($GENERIC_READ, $GENERIC_WRITE)
Global Const $FILE_ENCODING_UTF16LE = 32
Global Const $FE_ENTIRE_UTF8 = 1
Global Const $FE_PARTIALFIRST_UTF8 = 2
Global Const $FN_FULLPATH = 0
Global Const $FN_RELATIVEPATH = 1
Global Const $FV_COMMENTS = "Comments"
Global Const $FV_COMPANYNAME = "CompanyName"
Global Const $FV_FILEDESCRIPTION = "FileDescription"
Global Const $FV_FILEVERSION = "FileVersion"
Global Const $FV_INTERNALNAME = "InternalName"
Global Const $FV_LEGALCOPYRIGHT = "LegalCopyright"
Global Const $FV_LEGALTRADEMARKS = "LegalTrademarks"
Global Const $FV_ORIGINALFILENAME = "OriginalFilename"
Global Const $FV_PRODUCTNAME = "ProductName"
Global Const $FV_PRODUCTVERSION = "ProductVersion"
Global Const $FV_PRIVATEBUILD = "PrivateBuild"
Global Const $FV_SPECIALBUILD = "SpecialBuild"
Global Const $FRTA_NOCOUNT = 0
Global Const $FRTA_COUNT = 1
Global Const $FRTA_INTARRAYS = 2
Global Const $FRTA_ENTIRESPLIT = 4
Global Const $FLTA_FILESFOLDERS = 0
Global Const $FLTA_FILES = 1
Global Const $FLTA_FOLDERS = 2
Global Const $FLTAR_FILESFOLDERS = 0
Global Const $FLTAR_FILES = 1
Global Const $FLTAR_FOLDERS = 2
Global Const $FLTAR_NOHIDDEN = 4
Global Const $FLTAR_NOSYSTEM = 8
Global Const $FLTAR_NOLINK = 16
Global Const $FLTAR_NORECUR = 0
Global Const $FLTAR_RECUR = 1
Global Const $FLTAR_NOSORT = 0
Global Const $FLTAR_SORT = 1
Global Const $FLTAR_FASTSORT = 2
Global Const $FLTAR_NOPATH = 0
Global Const $FLTAR_RELPATH = 1
Global Const $FLTAR_FULLPATH = 2
Global Const $PATH_ORIGINAL = 0
Global Const $PATH_DRIVE = 1
Global Const $PATH_DIRECTORY = 2
Global Const $PATH_FILENAME = 3
Global Const $PATH_EXTENSION = 4
Global Const $FW_DONTCARE = 0
Global Const $FW_THIN = 100
Global Const $FW_EXTRALIGHT = 200
Global Const $FW_ULTRALIGHT = 200
Global Const $FW_LIGHT = 300
Global Const $FW_NORMAL = 400
Global Const $FW_REGULAR = 400
Global Const $FW_MEDIUM = 500
Global Const $FW_SEMIBOLD = 600
Global Const $FW_DEMIBOLD = 600
Global Const $FW_BOLD = 700
Global Const $FW_EXTRABOLD = 800
Global Const $FW_ULTRABOLD = 800
Global Const $FW_HEAVY = 900
Global Const $FW_BLACK = 900
Global Const $CF_EFFECTS = 0x100
Global Const $CF_PRINTERFONTS = 0x2
Global Const $CF_SCREENFONTS = 0x1
Global Const $CF_NOSCRIPTSEL = 0x800000
Global Const $CF_INITTOLOGFONTSTRUCT = 0x40
Global Const $LOGPIXELSX = 88
Global Const $LOGPIXELSY = 90
Global Const $ANSI_CHARSET = 0
Global Const $ARABIC_CHARSET = 178
Global Const $BALTIC_CHARSET = 186
Global Const $CHINESEBIG5_CHARSET = 136
Global Const $DEFAULT_CHARSET = 1
Global Const $EASTEUROPE_CHARSET = 238
Global Const $GB2312_CHARSET = 134
Global Const $GREEK_CHARSET = 161
Global Const $HANGEUL_CHARSET = 129
Global Const $HEBREW_CHARSET = 177
Global Const $JOHAB_CHARSET = 130
Global Const $MAC_CHARSET = 77
Global Const $OEM_CHARSET = 255
Global Const $RUSSIAN_CHARSET = 204
Global Const $SHIFTJIS_CHARSET = 128
Global Const $SYMBOL_CHARSET = 2
Global Const $THAI_CHARSET = 222
Global Const $TURKISH_CHARSET = 162
Global Const $VIETNAMESE_CHARSET = 163
Global Const $OUT_CHARACTER_PRECIS = 2
Global Const $OUT_DEFAULT_PRECIS = 0
Global Const $OUT_DEVICE_PRECIS = 5
Global Const $OUT_OUTLINE_PRECIS = 8
Global Const $OUT_PS_ONLY_PRECIS = 10
Global Const $OUT_RASTER_PRECIS = 6
Global Const $OUT_STRING_PRECIS = 1
Global Const $OUT_STROKE_PRECIS = 3
Global Const $OUT_TT_ONLY_PRECIS = 7
Global Const $OUT_TT_PRECIS = 4
Global Const $CLIP_CHARACTER_PRECIS = 1
Global Const $CLIP_DEFAULT_PRECIS = 0
Global Const $CLIP_DFA_DISABLE = 0x0030
Global Const $CLIP_EMBEDDED = 128
Global Const $CLIP_LH_ANGLES = 16
Global Const $CLIP_MASK = 0xF
Global Const $CLIP_DFA_OVERRIDE = 0x0040
Global Const $CLIP_STROKE_PRECIS = 2
Global Const $CLIP_TT_ALWAYS = 32
Global Const $ANTIALIASED_QUALITY = 4
Global Const $DEFAULT_QUALITY = 0
Global Const $DRAFT_QUALITY = 1
Global Const $NONANTIALIASED_QUALITY = 3
Global Const $PROOF_QUALITY = 2
Global Const $CLEARTYPE_QUALITY = 5
Global Const $DEFAULT_PITCH = 0
Global Const $FIXED_PITCH = 1
Global Const $VARIABLE_PITCH = 2
Global Const $FF_DECORATIVE = 80
Global Const $FF_DONTCARE = 0
Global Const $FF_MODERN = 48
Global Const $FF_ROMAN = 16
Global Const $FF_SCRIPT = 64
Global Const $FF_SWISS = 32
Global Const $FS_REGULAR = 0x00
Global Const $FS_BOLD = 0x01
Global Const $FS_ITALIC = 0x02
Global Const $GUI_EVENT_SINGLE = 0
Global Const $GUI_EVENT_ARRAY = 1
Global Const $GUI_EVENT_NONE = 0
Global Const $GUI_EVENT_CLOSE = -3
Global Const $GUI_EVENT_MINIMIZE = -4
Global Const $GUI_EVENT_RESTORE = -5
Global Const $GUI_EVENT_MAXIMIZE = -6
Global Const $GUI_EVENT_PRIMARYDOWN = -7
Global Const $GUI_EVENT_PRIMARYUP = -8
Global Const $GUI_EVENT_SECONDARYDOWN = -9
Global Const $GUI_EVENT_SECONDARYUP = -10
Global Const $GUI_EVENT_MOUSEMOVE = -11
Global Const $GUI_EVENT_RESIZED = -12
Global Const $GUI_EVENT_DROPPED = -13
Global Const $GUI_RUNDEFMSG = 'GUI_RUNDEFMSG'
Global Const $GUI_AVISTOP = 0
Global Const $GUI_AVISTART = 1
Global Const $GUI_AVICLOSE = 2
Global Const $GUI_CHECKED = 1
Global Const $GUI_INDETERMINATE = 2
Global Const $GUI_UNCHECKED = 4
Global Const $GUI_DROPACCEPTED = 8
Global Const $GUI_NODROPACCEPTED = 4096
Global Const $GUI_ACCEPTFILES = $GUI_DROPACCEPTED
Global Const $GUI_SHOW = 16
Global Const $GUI_HIDE = 32
Global Const $GUI_ENABLE = 64
Global Const $GUI_DISABLE = 128
Global Const $GUI_FOCUS = 256
Global Const $GUI_NOFOCUS = 8192
Global Const $GUI_DEFBUTTON = 512
Global Const $GUI_EXPAND = 1024
Global Const $GUI_ONTOP = 2048
Global Const $GUI_FONTNORMAL = 0
Global Const $GUI_FONTITALIC = 2
Global Const $GUI_FONTUNDER = 4
Global Const $GUI_FONTSTRIKE = 8
Global Const $GUI_DOCKAUTO = 0x0001
Global Const $GUI_DOCKLEFT = 0x0002
Global Const $GUI_DOCKRIGHT = 0x0004
Global Const $GUI_DOCKHCENTER = 0x0008
Global Const $GUI_DOCKTOP = 0x0020
Global Const $GUI_DOCKBOTTOM = 0x0040
Global Const $GUI_DOCKVCENTER = 0x0080
Global Const $GUI_DOCKWIDTH = 0x0100
Global Const $GUI_DOCKHEIGHT = 0x0200
Global Const $GUI_DOCKSIZE = 0x0300
Global Const $GUI_DOCKMENUBAR = 0x0220
Global Const $GUI_DOCKSTATEBAR = 0x0240
Global Const $GUI_DOCKALL = 0x0322
Global Const $GUI_DOCKBORDERS = 0x0066
Global Const $GUI_GR_CLOSE = 1
Global Const $GUI_GR_LINE = 2
Global Const $GUI_GR_BEZIER = 4
Global Const $GUI_GR_MOVE = 6
Global Const $GUI_GR_COLOR = 8
Global Const $GUI_GR_RECT = 10
Global Const $GUI_GR_ELLIPSE = 12
Global Const $GUI_GR_PIE = 14
Global Const $GUI_GR_DOT = 16
Global Const $GUI_GR_PIXEL = 18
Global Const $GUI_GR_HINT = 20
Global Const $GUI_GR_REFRESH = 22
Global Const $GUI_GR_PENSIZE = 24
Global Const $GUI_GR_NOBKCOLOR = -2
Global Const $GUI_BKCOLOR_DEFAULT = -1
Global Const $GUI_BKCOLOR_TRANSPARENT = -2
Global Const $GUI_BKCOLOR_LV_ALTERNATE = 0xFE000000
Global Const $GUI_READ_DEFAULT = 0
Global Const $GUI_READ_EXTENDED = 1
Global Const $GUI_CURSOR_NOOVERRIDE = 0
Global Const $GUI_CURSOR_OVERRIDE = 1
Global Const $GUI_WS_EX_PARENTDRAG = 0x00100000
Global Const $GMEM_FIXED = 0x0000
Global Const $GMEM_MOVEABLE = 0x0002
Global Const $GMEM_NOCOMPACT = 0x0010
Global Const $GMEM_NODISCARD = 0x0020
Global Const $GMEM_ZEROINIT = 0x0040
Global Const $GMEM_MODIFY = 0x0080
Global Const $GMEM_DISCARDABLE = 0x0100
Global Const $GMEM_NOT_BANKED = 0x1000
Global Const $GMEM_SHARE = 0x2000
Global Const $GMEM_DDESHARE = 0x2000
Global Const $GMEM_NOTIFY = 0x4000
Global Const $GMEM_LOWER = 0x1000
Global Const $GMEM_VALID_FLAGS = 0x7F72
Global Const $GMEM_INVALID_HANDLE = 0x8000
Global Const $GPTR = BitOR($GMEM_FIXED, $GMEM_ZEROINIT)
Global Const $GHND = BitOR($GMEM_MOVEABLE, $GMEM_ZEROINIT)
Global Const $MEM_COMMIT = 0x00001000
Global Const $MEM_RESERVE = 0x00002000
Global Const $MEM_TOP_DOWN = 0x00100000
Global Const $MEM_SHARED = 0x08000000
Global Const $PAGE_NOACCESS = 0x00000001
Global Const $PAGE_READONLY = 0x00000002
Global Const $PAGE_READWRITE = 0x00000004
Global Const $PAGE_EXECUTE = 0x00000010
Global Const $PAGE_EXECUTE_READ = 0x00000020
Global Const $PAGE_EXECUTE_READWRITE = 0x00000040
Global Const $PAGE_EXECUTE_WRITECOPY = 0x00000080
Global Const $PAGE_GUARD = 0x00000100
Global Const $PAGE_NOCACHE = 0x00000200
Global Const $PAGE_WRITECOMBINE = 0x00000400
Global Const $PAGE_WRITECOPY = 0x00000008
Global Const $MEM_DECOMMIT = 0x00004000
Global Const $MEM_RELEASE = 0x00008000
Global Enum $MEM_LOAD, $MEM_TOTALPHYSRAM, $MEM_AVAILPHYSRAM, $MEM_TOTALPAGEFILE, $MEM_AVAILPAGEFILE, $MEM_TOTALVIRTUAL, $MEM_AVAILVIRTUAL
Global Const $PROCESS_TERMINATE = 0x00000001
Global Const $PROCESS_CREATE_THREAD = 0x00000002
Global Const $PROCESS_SET_SESSIONID = 0x00000004
Global Const $PROCESS_VM_OPERATION = 0x00000008
Global Const $PROCESS_VM_READ = 0x00000010
Global Const $PROCESS_VM_WRITE = 0x00000020
Global Const $PROCESS_DUP_HANDLE = 0x00000040
Global Const $PROCESS_CREATE_PROCESS = 0x00000080
Global Const $PROCESS_SET_QUOTA = 0x00000100
Global Const $PROCESS_SET_INFORMATION = 0x00000200
Global Const $PROCESS_QUERY_INFORMATION = 0x00000400
Global Const $PROCESS_QUERY_LIMITED_INFORMATION = 0x1000
Global Const $PROCESS_SUSPEND_RESUME = 0x00000800
Global Const $PROCESS_ALL_ACCESS = 0x001F0FFF
Global Const $SE_ASSIGNPRIMARYTOKEN_NAME = "SeAssignPrimaryTokenPrivilege"
Global Const $SE_AUDIT_NAME = "SeAuditPrivilege"
Global Const $SE_BACKUP_NAME = "SeBackupPrivilege"
Global Const $SE_CHANGE_NOTIFY_NAME = "SeChangeNotifyPrivilege"
Global Const $SE_CREATE_GLOBAL_NAME = "SeCreateGlobalPrivilege"
Global Const $SE_CREATE_PAGEFILE_NAME = "SeCreatePagefilePrivilege"
Global Const $SE_CREATE_PERMANENT_NAME = "SeCreatePermanentPrivilege"
Global Const $SE_CREATE_SYMBOLIC_LINK_NAME = 'SeCreateSymbolicLinkPrivilege'
Global Const $SE_CREATE_TOKEN_NAME = "SeCreateTokenPrivilege"
Global Const $SE_DEBUG_NAME = "SeDebugPrivilege"
Global Const $SE_ENABLE_DELEGATION_NAME = "SeEnableDelegationPrivilege"
Global Const $SE_IMPERSONATE_NAME = "SeImpersonatePrivilege"
Global Const $SE_INC_BASE_PRIORITY_NAME = "SeIncreaseBasePriorityPrivilege"
Global Const $SE_INC_WORKING_SET_NAME = 'SeIncreaseWorkingSetPrivilege'
Global Const $SE_INCREASE_QUOTA_NAME = "SeIncreaseQuotaPrivilege"
Global Const $SE_LOAD_DRIVER_NAME = "SeLoadDriverPrivilege"
Global Const $SE_LOCK_MEMORY_NAME = "SeLockMemoryPrivilege"
Global Const $SE_MACHINE_ACCOUNT_NAME = "SeMachineAccountPrivilege"
Global Const $SE_MANAGE_VOLUME_NAME = "SeManageVolumePrivilege"
Global Const $SE_PROF_SINGLE_PROCESS_NAME = "SeProfileSingleProcessPrivilege"
Global Const $SE_RELABEL_NAME = 'SeRelabelPrivilege'
Global Const $SE_REMOTE_SHUTDOWN_NAME = "SeRemoteShutdownPrivilege"
Global Const $SE_RESTORE_NAME = "SeRestorePrivilege"
Global Const $SE_SECURITY_NAME = "SeSecurityPrivilege"
Global Const $SE_SHUTDOWN_NAME = "SeShutdownPrivilege"
Global Const $SE_SYNC_AGENT_NAME = "SeSyncAgentPrivilege"
Global Const $SE_SYSTEM_ENVIRONMENT_NAME = "SeSystemEnvironmentPrivilege"
Global Const $SE_SYSTEM_PROFILE_NAME = "SeSystemProfilePrivilege"
Global Const $SE_SYSTEMTIME_NAME = "SeSystemtimePrivilege"
Global Const $SE_TAKE_OWNERSHIP_NAME = "SeTakeOwnershipPrivilege"
Global Const $SE_TCB_NAME = "SeTcbPrivilege"
Global Const $SE_TIME_ZONE_NAME = 'SeTimeZonePrivilege'
Global Const $SE_TRUSTED_CREDMAN_ACCESS_NAME = 'SeTrustedCredManAccessPrivilege'
Global Const $SE_UNSOLICITED_INPUT_NAME = "SeUnsolicitedInputPrivilege"
Global Const $SE_UNDOCK_NAME = "SeUndockPrivilege"
Global Const $SE_PRIVILEGE_ENABLED_BY_DEFAULT = 0x00000001
Global Const $SE_PRIVILEGE_ENABLED = 0x00000002
Global Const $SE_PRIVILEGE_REMOVED = 0x00000004
Global Const $SE_PRIVILEGE_USED_FOR_ACCESS = 0x80000000
Global Const $SE_GROUP_MANDATORY = 0x00000001
Global Const $SE_GROUP_ENABLED_BY_DEFAULT = 0x00000002
Global Const $SE_GROUP_ENABLED = 0x00000004
Global Const $SE_GROUP_OWNER = 0x00000008
Global Const $SE_GROUP_USE_FOR_DENY_ONLY = 0x00000010
Global Const $SE_GROUP_INTEGRITY = 0x00000020
Global Const $SE_GROUP_INTEGRITY_ENABLED = 0x00000040
Global Const $SE_GROUP_RESOURCE = 0x20000000
Global Const $SE_GROUP_LOGON_ID = 0xC0000000
Global Enum $TOKENPRIMARY = 1, $TOKENIMPERSONATION
Global Enum $SECURITYANONYMOUS = 0, $SECURITYIDENTIFICATION, $SECURITYIMPERSONATION, $SECURITYDELEGATION
Global Enum $TOKENUSER = 1, $TOKENGROUPS, $TOKENPRIVILEGES, $TOKENOWNER, $TOKENPRIMARYGROUP, $TOKENDEFAULTDACL, $TOKENSOURCE, $TOKENTYPE, $TOKENIMPERSONATIONLEVEL, $TOKENSTATISTICS, $TOKENRESTRICTEDSIDS, $TOKENSESSIONID, $TOKENGROUPSANDPRIVILEGES, $TOKENSESSIONREFERENCE, $TOKENSANDBOXINERT, $TOKENAUDITPOLICY, $TOKENORIGIN, $TOKENELEVATIONTYPE, $TOKENLINKEDTOKEN, $TOKENELEVATION, $TOKENHASRESTRICTIONS, $TOKENACCESSINFORMATION, $TOKENVIRTUALIZATIONALLOWED, $TOKENVIRTUALIZATIONENABLED, $TOKENINTEGRITYLEVEL, $TOKENUIACCESS, $TOKENMANDATORYPOLICY, $TOKENLOGONSID
Global Const $TOKEN_ASSIGN_PRIMARY = 0x00000001
Global Const $TOKEN_DUPLICATE = 0x00000002
Global Const $TOKEN_IMPERSONATE = 0x00000004
Global Const $TOKEN_QUERY = 0x00000008
Global Const $TOKEN_QUERY_SOURCE = 0x00000010
Global Const $TOKEN_ADJUST_PRIVILEGES = 0x00000020
Global Const $TOKEN_ADJUST_GROUPS = 0x00000040
Global Const $TOKEN_ADJUST_DEFAULT = 0x00000080
Global Const $TOKEN_ADJUST_SESSIONID = 0x00000100
Global Const $TOKEN_ALL_ACCESS = 0x000F01FF
Global Const $TOKEN_READ = 0x00020008
Global Const $TOKEN_WRITE = 0x000200E0
Global Const $TOKEN_EXECUTE = 0x00020000
Global Const $TOKEN_HAS_TRAVERSE_PRIVILEGE = 0x00000001
Global Const $TOKEN_HAS_BACKUP_PRIVILEGE = 0x00000002
Global Const $TOKEN_HAS_RESTORE_PRIVILEGE = 0x00000004
Global Const $TOKEN_HAS_ADMIN_GROUP = 0x00000008
Global Const $TOKEN_IS_RESTRICTED = 0x00000010
Global Const $TOKEN_SESSION_NOT_REFERENCED = 0x00000020
Global Const $TOKEN_SANDBOX_INERT = 0x00000040
Global Const $TOKEN_HAS_IMPERSONATE_PRIVILEGE = 0x00000080
Global Const $RIGHTS_DELETE = 0x00010000
Global Const $READ_CONTROL = 0x00020000
Global Const $WRITE_DAC = 0x00040000
Global Const $WRITE_OWNER = 0x00080000
Global Const $SYNCHRONIZE = 0x00100000
Global Const $ACCESS_SYSTEM_SECURITY = 0x01000000
Global Const $STANDARD_RIGHTS_REQUIRED = 0x000f0000
Global Const $STANDARD_RIGHTS_READ = $READ_CONTROL
Global Const $STANDARD_RIGHTS_WRITE = $READ_CONTROL
Global Const $STANDARD_RIGHTS_EXECUTE = $READ_CONTROL
Global Const $STANDARD_RIGHTS_ALL = 0x001F0000
Global Const $SPECIFIC_RIGHTS_ALL = 0x0000FFFF
Global Enum $NOT_USED_ACCESS = 0, $GRANT_ACCESS, $SET_ACCESS, $DENY_ACCESS, $REVOKE_ACCESS, $SET_AUDIT_SUCCESS, $SET_AUDIT_FAILURE
Global Enum $TRUSTEE_IS_UNKNOWN = 0, $TRUSTEE_IS_USER, $TRUSTEE_IS_GROUP, $TRUSTEE_IS_DOMAIN, $TRUSTEE_IS_ALIAS, $TRUSTEE_IS_WELL_KNOWN_GROUP, $TRUSTEE_IS_DELETED, $TRUSTEE_IS_INVALID, $TRUSTEE_IS_COMPUTER
Global Const $LOGON_WITH_PROFILE = 0x00000001
Global Const $LOGON_NETCREDENTIALS_ONLY = 0x00000002
Global Enum $SIDTYPEUSER = 1, $SIDTYPEGROUP, $SIDTYPEDOMAIN, $SIDTYPEALIAS, $SIDTYPEWELLKNOWNGROUP, $SIDTYPEDELETEDACCOUNT, $SIDTYPEINVALID, $SIDTYPEUNKNOWN, $SIDTYPECOMPUTER, $SIDTYPELABEL
Global Const $SID_ADMINISTRATORS = "S-1-5-32-544"
Global Const $SID_USERS = "S-1-5-32-545"
Global Const $SID_GUESTS = "S-1-5-32-546"
Global Const $SID_ACCOUNT_OPERATORS = "S-1-5-32-548"
Global Const $SID_SERVER_OPERATORS = "S-1-5-32-549"
Global Const $SID_PRINT_OPERATORS = "S-1-5-32-550"
Global Const $SID_BACKUP_OPERATORS = "S-1-5-32-551"
Global Const $SID_REPLICATOR = "S-1-5-32-552"
Global Const $SID_OWNER = "S-1-3-0"
Global Const $SID_EVERYONE = "S-1-1-0"
Global Const $SID_NETWORK = "S-1-5-2"
Global Const $SID_INTERACTIVE = "S-1-5-4"
Global Const $SID_SYSTEM = "S-1-5-18"
Global Const $SID_AUTHENTICATED_USERS = "S-1-5-11"
Global Const $SID_SCHANNEL_AUTHENTICATION = "S-1-5-64-14"
Global Const $SID_DIGEST_AUTHENTICATION = "S-1-5-64-21"
Global Const $SID_NT_SERVICE = "S-1-5-80"
Global Const $SID_UNTRUSTED_MANDATORY_LEVEL = "S-1-16-0"
Global Const $SID_LOW_MANDATORY_LEVEL = "S-1-16-4096"
Global Const $SID_MEDIUM_MANDATORY_LEVEL = "S-1-16-8192"
Global Const $SID_MEDIUM_PLUS_MANDATORY_LEVEL = "S-1-16-8448"
Global Const $SID_HIGH_MANDATORY_LEVEL = "S-1-16-12288"
Global Const $SID_SYSTEM_MANDATORY_LEVEL = "S-1-16-16384"
Global Const $SID_PROTECTED_PROCESS_MANDATORY_LEVEL = "S-1-16-20480"
Global Const $SID_SECURE_PROCESS_MANDATORY_LEVEL = "S-1-16-28672"
Global Const $SID_ALL_SERVICES = "S-1-5-80-0"
Global Const $MB_OK = 0
Global Const $MB_OKCANCEL = 1
Global Const $MB_ABORTRETRYIGNORE = 2
Global Const $MB_YESNOCANCEL = 3
Global Const $MB_YESNO = 4
Global Const $MB_RETRYCANCEL = 5
Global Const $MB_CANCELTRYCONTINUE = 6
Global Const $MB_HELP = 0x4000
Global Const $MB_ICONSTOP = 16
Global Const $MB_ICONERROR = 16
Global Const $MB_ICONHAND = 16
Global Const $MB_ICONQUESTION = 32
Global Const $MB_ICONEXCLAMATION = 48
Global Const $MB_ICONWARNING = 48
Global Const $MB_ICONINFORMATION = 64
Global Const $MB_ICONASTERISK = 64
Global Const $MB_USERICON = 0x00000080
Global Const $MB_DEFBUTTON1 = 0
Global Const $MB_DEFBUTTON2 = 256
Global Const $MB_DEFBUTTON3 = 512
Global Const $MB_DEFBUTTON4 = 768
Global Const $MB_APPLMODAL = 0
Global Const $MB_SYSTEMMODAL = 4096
Global Const $MB_TASKMODAL = 8192
Global Const $MB_DEFAULT_DESKTOP_ONLY = 0x00020000
Global Const $MB_RIGHT = 0x00080000
Global Const $MB_RTLREADING = 0x00100000
Global Const $MB_SETFOREGROUND = 0x00010000
Global Const $MB_TOPMOST = 0x00040000
Global Const $MB_SERVICE_NOTIFICATION = 0x00200000
Global Const $MB_RIGHTJUSTIFIED = $MB_RIGHT
Global Const $IDTIMEOUT = -1
Global Const $IDOK = 1
Global Const $IDCANCEL = 2
Global Const $IDABORT = 3
Global Const $IDRETRY = 4
Global Const $IDIGNORE = 5
Global Const $IDYES = 6
Global Const $IDNO = 7
Global Const $IDCLOSE = 8
Global Const $IDHELP = 9
Global Const $IDTRYAGAIN = 10
Global Const $IDCONTINUE = 11
Global Const $STR_NOCASESENSE = 0
Global Const $STR_CASESENSE = 1
Global Const $STR_NOCASESENSEBASIC = 2
Global Const $STR_STRIPLEADING = 1
Global Const $STR_STRIPTRAILING = 2
Global Const $STR_STRIPSPACES = 4
Global Const $STR_STRIPALL = 8
Global Const $STR_CHRSPLIT = 0
Global Const $STR_ENTIRESPLIT = 1
Global Const $STR_NOCOUNT = 2
Global Const $STR_REGEXPMATCH = 0
Global Const $STR_REGEXPARRAYMATCH = 1
Global Const $STR_REGEXPARRAYFULLMATCH = 2
Global Const $STR_REGEXPARRAYGLOBALMATCH = 3
Global Const $STR_REGEXPARRAYGLOBALFULLMATCH = 4
Global Const $STR_ENDISSTART = 0
Global Const $STR_ENDNOTSTART = 1
Global Const $SB_ANSI = 1
Global Const $SB_UTF16LE = 2
Global Const $SB_UTF16BE = 3
Global Const $SB_UTF8 = 4
Global Const $SE_UTF16 = 0
Global Const $SE_ANSI = 1
Global Const $SE_UTF8 = 2
Global Const $STR_UTF16 = 0
Global Const $STR_UCS2 = 1
#Region Global Variables and Constants
Global Const $FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100
Global Const $FORMAT_MESSAGE_IGNORE_INSERTS = 0x00000200
Global Const $FORMAT_MESSAGE_FROM_STRING = 0x00000400
Global Const $FORMAT_MESSAGE_FROM_HMODULE = 0x00000800
Global Const $FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000
Global Const $FORMAT_MESSAGE_ARGUMENT_ARRAY = 0x00002000
#EndRegion Global Variables and Constants
Func _WinAPI_Beep($iFreq = 500, $iDuration = 1000)
Local $aResult = DllCall("kernel32.dll", "bool", "Beep", "dword", $iFreq, "dword", $iDuration)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_FormatMessage($iFlags, $pSource, $iMessageID, $iLanguageID, ByRef $pBuffer, $iSize, $vArguments)
Local $sBufferType = "struct*"
If IsString($pBuffer) Then $sBufferType = "wstr"
Local $aResult = DllCall("kernel32.dll", "dword", "FormatMessageW", "dword", $iFlags, "struct*", $pSource, "dword", $iMessageID,  "dword", $iLanguageID, $sBufferType, $pBuffer, "dword", $iSize, "ptr", $vArguments)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, 0)
If $sBufferType = "wstr" Then $pBuffer = $aResult[5]
Return $aResult[0]
EndFunc
Func _WinAPI_GetErrorMessage($iCode, $iLanguage = 0, Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $aRet = DllCall('kernel32.dll', 'dword', 'FormatMessageW', 'dword', 0x1000, 'ptr', 0, 'dword', $iCode,  'dword', $iLanguage, 'wstr', '', 'dword', 4096, 'ptr', 0)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, '')
Return SetError($_iCurrentError, $_iCurrentExtended, StringRegExpReplace($aRet[5], '[' & @LF & ',' & @CR & ']*\Z', ''))
EndFunc
Func _WinAPI_GetLastError(Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $aResult = DllCall("kernel32.dll", "dword", "GetLastError")
Return SetError($_iCurrentError, $_iCurrentExtended, $aResult[0])
EndFunc
Func _WinAPI_GetLastErrorMessage(Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $iLastError = _WinAPI_GetLastError()
Local $tBufferPtr = DllStructCreate("ptr")
Local $nCount = _WinAPI_FormatMessage(BitOR($FORMAT_MESSAGE_ALLOCATE_BUFFER, $FORMAT_MESSAGE_FROM_SYSTEM),  0, $iLastError, 0, $tBufferPtr, 0, 0)
If @error Then Return SetError(-@error, @extended, "")
Local $sText = ""
Local $pBuffer = DllStructGetData($tBufferPtr, 1)
If $pBuffer Then
If $nCount > 0 Then
Local $tBuffer = DllStructCreate("wchar[" & ($nCount + 1) & "]", $pBuffer)
$sText = DllStructGetData($tBuffer, 1)
If StringRight($sText, 2) = @CRLF Then $sText = StringTrimRight($sText, 2)
EndIf
DllCall("kernel32.dll", "handle", "LocalFree", "handle", $pBuffer)
EndIf
Return SetError($_iCurrentError, $_iCurrentExtended, $sText)
EndFunc
Func _WinAPI_MessageBeep($iType = 1)
Local $iSound
Switch $iType
Case 1
$iSound = 0
Case 2
$iSound = 16
Case 3
$iSound = 32
Case 4
$iSound = 48
Case 5
$iSound = 64
Case Else
$iSound = -1
EndSwitch
Local $aResult = DllCall("user32.dll", "bool", "MessageBeep", "uint", $iSound)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_MsgBox($iFlags, $sTitle, $sText)
BlockInput(0)
MsgBox($iFlags, $sTitle, $sText & "      ")
EndFunc
Func _WinAPI_SetLastError($iErrorCode, Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
DllCall("kernel32.dll", "none", "SetLastError", "dword", $iErrorCode)
Return SetError($_iCurrentError, $_iCurrentExtended, Null)
EndFunc
Func _WinAPI_ShowError($sText, $bExit = True)
BlockInput(0)
MsgBox($MB_SYSTEMMODAL, "Error", $sText & "      ")
If $bExit Then Exit
EndFunc
Func _WinAPI_ShowLastError($sText = '', $bAbort = False, $iLanguage = 0, Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $sError
Local $iLastError = _WinAPI_GetLastError()
While 1
$sError = _WinAPI_GetErrorMessage($iLastError, $iLanguage)
If @error And $iLanguage Then
$iLanguage = 0
Else
ExitLoop
EndIf
WEnd
If StringStripWS($sText, $STR_STRIPLEADING + $STR_STRIPTRAILING) Then
$sText &= @CRLF & @CRLF
Else
$sText = ''
EndIf
_WinAPI_MsgBox(BitOR(0x00040000, BitShift(0x00000010, -2 * (Not $iLastError))), $iLastError, $sText & $sError)
If $iLastError Then
_WinAPI_SetLastError($iLastError)
If $bAbort Then
Exit $iLastError
EndIf
EndIf
Return SetError($_iCurrentError, $_iCurrentExtended, 1)
EndFunc
Func _WinAPI_ShowMsg($sText)
_WinAPI_MsgBox($MB_SYSTEMMODAL, "Information", $sText)
EndFunc
Func __COMErrorFormating(ByRef $oCOMError, $sPrefix = @TAB)
Local Const $STR_STRIPTRAILING = 2
Local $sError = "COM Error encountered in " & @ScriptName & " (" & $oCOMError.Scriptline & ") :" & @CRLF &  $sPrefix & "Number        " & @TAB & "= 0x" & Hex($oCOMError.Number, 8) & " (" & $oCOMError.Number & ")" & @CRLF &  $sPrefix & "WinDescription" & @TAB & "= " & StringStripWS($oCOMError.WinDescription, $STR_STRIPTRAILING) & @CRLF &  $sPrefix & "Description   " & @TAB & "= " & StringStripWS($oCOMError.Description, $STR_STRIPTRAILING) & @CRLF &  $sPrefix & "Source        " & @TAB & "= " & $oCOMError.Source & @CRLF &  $sPrefix & "HelpFile      " & @TAB & "= " & $oCOMError.HelpFile & @CRLF &  $sPrefix & "HelpContext   " & @TAB & "= " & $oCOMError.HelpContext & @CRLF &  $sPrefix & "LastDllError  " & @TAB & "= " & $oCOMError.LastDllError & @CRLF &  $sPrefix & "Retcode       " & @TAB & "= 0x" & Hex($oCOMError.retcode)
Return $sError
EndFunc
Func _Security__AdjustTokenPrivileges($hToken, $bDisableAll, $tNewState, $iBufferLen, $tPrevState = 0, $pRequired = 0)
Local $aCall = DllCall("advapi32.dll", "bool", "AdjustTokenPrivileges", "handle", $hToken, "bool", $bDisableAll, "struct*", $tNewState, "dword", $iBufferLen, "struct*", $tPrevState, "struct*", $pRequired)
If @error Then Return SetError(@error, @extended, False)
Return Not ($aCall[0] = 0)
EndFunc
Func _Security__CreateProcessWithToken($hToken, $iLogonFlags, $sCommandLine, $iCreationFlags, $sCurDir, $tSTARTUPINFO, $tPROCESS_INFORMATION)
Local $aCall = DllCall("advapi32.dll", "bool", "CreateProcessWithTokenW", "handle", $hToken, "dword", $iLogonFlags, "ptr", 0, "wstr", $sCommandLine, "dword", $iCreationFlags, "struct*", 0, "wstr", $sCurDir, "struct*", $tSTARTUPINFO, "struct*", $tPROCESS_INFORMATION)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, False)
Return True
EndFunc
Func _Security__DuplicateTokenEx($hExistingToken, $iDesiredAccess, $iImpersonationLevel, $iTokenType)
Local $aCall = DllCall("advapi32.dll", "bool", "DuplicateTokenEx", "handle", $hExistingToken, "dword", $iDesiredAccess, "struct*", 0, "int", $iImpersonationLevel, "int", $iTokenType, "handle*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[6]
EndFunc
Func _Security__GetAccountSid($sAccount, $sSystem = "")
Local $aAcct = _Security__LookupAccountName($sAccount, $sSystem)
If @error Then Return SetError(@error, @extended, 0)
If IsArray($aAcct) Then Return _Security__StringSidToSid($aAcct[0])
Return ''
EndFunc
Func _Security__GetLengthSid($pSID)
If Not _Security__IsValidSid($pSID) Then Return SetError(@error + 10, @extended, 0)
Local $aCall = DllCall("advapi32.dll", "dword", "GetLengthSid", "struct*", $pSID)
If @error Then Return SetError(@error, @extended, 0)
Return $aCall[0]
EndFunc
Func _Security__GetTokenInformation($hToken, $iClass)
Local $aCall = DllCall("advapi32.dll", "bool", "GetTokenInformation", "handle", $hToken, "int", $iClass, "struct*", 0, "dword", 0, "dword*", 0)
If @error Or Not $aCall[5] Then Return SetError(@error + 10, @extended, 0)
Local $iLen = $aCall[5]
Local $tBuffer = DllStructCreate("byte[" & $iLen & "]")
$aCall = DllCall("advapi32.dll", "bool", "GetTokenInformation", "handle", $hToken, "int", $iClass, "struct*", $tBuffer, "dword", DllStructGetSize($tBuffer), "dword*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $tBuffer
EndFunc
Func _Security__ImpersonateSelf($iLevel = $SECURITYIMPERSONATION)
Local $aCall = DllCall("advapi32.dll", "bool", "ImpersonateSelf", "int", $iLevel)
If @error Then Return SetError(@error, @extended, False)
Return Not ($aCall[0] = 0)
EndFunc
Func _Security__IsValidSid($pSID)
Local $aCall = DllCall("advapi32.dll", "bool", "IsValidSid", "struct*", $pSID)
If @error Then Return SetError(@error, @extended, False)
Return Not ($aCall[0] = 0)
EndFunc
Func _Security__LookupAccountName($sAccount, $sSystem = "")
Local $tData = DllStructCreate("byte SID[256]")
Local $aCall = DllCall("advapi32.dll", "bool", "LookupAccountNameW", "wstr", $sSystem, "wstr", $sAccount, "struct*", $tData, "dword*", DllStructGetSize($tData), "wstr", "", "dword*", DllStructGetSize($tData), "int*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Local $aAcct[3]
$aAcct[0] = _Security__SidToStringSid(DllStructGetPtr($tData, "SID"))
$aAcct[1] = $aCall[5]
$aAcct[2] = $aCall[7]
Return $aAcct
EndFunc
Func _Security__LookupAccountSid($vSID, $sSystem = "")
Local $pSID, $aAcct[3]
If IsString($vSID) Then
$pSID = _Security__StringSidToSid($vSID)
Else
$pSID = $vSID
EndIf
If Not _Security__IsValidSid($pSID) Then Return SetError(@error + 10, @extended, 0)
Local $sTypeSystem = "ptr"
If $sSystem Then $sTypeSystem = "wstr"
Local $aCall = DllCall("advapi32.dll", "bool", "LookupAccountSidW", $sTypeSystem, $sSystem, "struct*", $pSID, "wstr", "", "dword*", 65536, "wstr", "", "dword*", 65536, "int*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Local $aAcct[3]
$aAcct[0] = $aCall[3]
$aAcct[1] = $aCall[5]
$aAcct[2] = $aCall[7]
Return $aAcct
EndFunc
Func _Security__LookupPrivilegeValue($sSystem, $sName)
Local $aCall = DllCall("advapi32.dll", "bool", "LookupPrivilegeValueW", "wstr", $sSystem, "wstr", $sName, "int64*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[3]
EndFunc
Func _Security__OpenProcessToken($hProcess, $iAccess)
Local $aCall = DllCall("advapi32.dll", "bool", "OpenProcessToken", "handle", $hProcess, "dword", $iAccess, "handle*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[3]
EndFunc
Func _Security__OpenThreadToken($iAccess, $hThread = 0, $bOpenAsSelf = False)
If $hThread = 0 Then
Local $aResult = DllCall("kernel32.dll", "handle", "GetCurrentThread")
If @error Then Return SetError(@error + 10, @extended, 0)
$hThread = $aResult[0]
EndIf
Local $aCall = DllCall("advapi32.dll", "bool", "OpenThreadToken", "handle", $hThread, "dword", $iAccess, "bool", $bOpenAsSelf, "handle*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[4]
EndFunc
Func _Security__OpenThreadTokenEx($iAccess, $hThread = 0, $bOpenAsSelf = False)
Local $hToken = _Security__OpenThreadToken($iAccess, $hThread, $bOpenAsSelf)
If $hToken = 0 Then
Local Const $ERROR_NO_TOKEN = 1008
If _WinAPI_GetLastError() <> $ERROR_NO_TOKEN Then Return SetError(20, _WinAPI_GetLastError(), 0)
If Not _Security__ImpersonateSelf() Then Return SetError(@error + 10, _WinAPI_GetLastError(), 0)
$hToken = _Security__OpenThreadToken($iAccess, $hThread, $bOpenAsSelf)
If $hToken = 0 Then Return SetError(@error, _WinAPI_GetLastError(), 0)
EndIf
Return $hToken
EndFunc
Func _Security__SetPrivilege($hToken, $sPrivilege, $bEnable)
Local $iLUID = _Security__LookupPrivilegeValue("", $sPrivilege)
If $iLUID = 0 Then Return SetError(@error + 10, @extended, False)
Local Const $tagTOKEN_PRIVILEGES = "dword Count;align 4;int64 LUID;dword Attributes"
Local $tCurrState = DllStructCreate($tagTOKEN_PRIVILEGES)
Local $iCurrState = DllStructGetSize($tCurrState)
Local $tPrevState = DllStructCreate($tagTOKEN_PRIVILEGES)
Local $iPrevState = DllStructGetSize($tPrevState)
Local $tRequired = DllStructCreate("int Data")
DllStructSetData($tCurrState, "Count", 1)
DllStructSetData($tCurrState, "LUID", $iLUID)
If Not _Security__AdjustTokenPrivileges($hToken, False, $tCurrState, $iCurrState, $tPrevState, $tRequired) Then Return SetError(2, @error, False)
DllStructSetData($tPrevState, "Count", 1)
DllStructSetData($tPrevState, "LUID", $iLUID)
Local $iAttributes = DllStructGetData($tPrevState, "Attributes")
If $bEnable Then
$iAttributes = BitOR($iAttributes, $SE_PRIVILEGE_ENABLED)
Else
$iAttributes = BitAND($iAttributes, BitNOT($SE_PRIVILEGE_ENABLED))
EndIf
DllStructSetData($tPrevState, "Attributes", $iAttributes)
If Not _Security__AdjustTokenPrivileges($hToken, False, $tPrevState, $iPrevState, $tCurrState, $tRequired) Then  Return SetError(3, @error, False)
Return True
EndFunc
Func _Security__SetTokenInformation($hToken, $iTokenInformation, $vTokenInformation, $iTokenInformationLength)
Local $aCall = DllCall("advapi32.dll", "bool", "SetTokenInformation", "handle", $hToken, "int", $iTokenInformation, "struct*", $vTokenInformation, "dword", $iTokenInformationLength)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, False)
Return True
EndFunc
Func _Security__SidToStringSid($pSID)
If Not _Security__IsValidSid($pSID) Then Return SetError(@error + 10, 0, "")
Local $aCall = DllCall("advapi32.dll", "bool", "ConvertSidToStringSidW", "struct*", $pSID, "ptr*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, "")
Local $pStringSid = $aCall[2]
Local $aLen = DllCall("kernel32.dll", "int", "lstrlenW", "struct*", $pStringSid)
Local $sSID = DllStructGetData(DllStructCreate("wchar Text[" & $aLen[0] + 1 & "]", $pStringSid), "Text")
DllCall("kernel32.dll", "handle", "LocalFree", "handle", $pStringSid)
Return $sSID
EndFunc
Func _Security__SidTypeStr($iType)
Switch $iType
Case $SIDTYPEUSER
Return "User"
Case $SIDTYPEGROUP
Return "Group"
Case $SIDTYPEDOMAIN
Return "Domain"
Case $SIDTYPEALIAS
Return "Alias"
Case $SIDTYPEWELLKNOWNGROUP
Return "Well Known Group"
Case $SIDTYPEDELETEDACCOUNT
Return "Deleted Account"
Case $SIDTYPEINVALID
Return "Invalid"
Case $SIDTYPEUNKNOWN
Return "Unknown Type"
Case $SIDTYPECOMPUTER
Return "Computer"
Case $SIDTYPELABEL
Return "A mandatory integrity label SID"
Case Else
Return "Unknown SID Type"
EndSwitch
EndFunc
Func _Security__StringSidToSid($sSID)
Local $aCall = DllCall("advapi32.dll", "bool", "ConvertStringSidToSidW", "wstr", $sSID, "ptr*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Local $pSID = $aCall[2]
Local $tBuffer = DllStructCreate("byte Data[" & _Security__GetLengthSid($pSID) & "]", $pSID)
Local $tSID = DllStructCreate("byte Data[" & DllStructGetSize($tBuffer) & "]")
DllStructSetData($tSID, "Data", DllStructGetData($tBuffer, "Data"))
DllCall("kernel32.dll", "handle", "LocalFree", "handle", $pSID)
Return $tSID
EndFunc
Global Const $tagPOINT = "struct;long X;long Y;endstruct"
Global Const $tagRECT = "struct;long Left;long Top;long Right;long Bottom;endstruct"
Global Const $tagSIZE = "struct;long X;long Y;endstruct"
Global Const $tagMARGINS = "int cxLeftWidth;int cxRightWidth;int cyTopHeight;int cyBottomHeight"
Global Const $tagFILETIME = "struct;dword Lo;dword Hi;endstruct"
Global Const $tagSYSTEMTIME = "struct;word Year;word Month;word Dow;word Day;word Hour;word Minute;word Second;word MSeconds;endstruct"
Global Const $tagTIME_ZONE_INFORMATION = "struct;long Bias;wchar StdName[32];word StdDate[8];long StdBias;wchar DayName[32];word DayDate[8];long DayBias;endstruct"
Global Const $tagNMHDR = "struct;hwnd hWndFrom;uint_ptr IDFrom;INT Code;endstruct"
Global Const $tagCOMBOBOXEXITEM = "uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;int SelectedImage;int OverlayImage;" &  "int Indent;lparam Param"
Global Const $tagNMCBEDRAGBEGIN = $tagNMHDR & ";int ItemID;wchar szText[260]"
Global Const $tagNMCBEENDEDIT = $tagNMHDR & ";bool fChanged;int NewSelection;wchar szText[260];int Why"
Global Const $tagNMCOMBOBOXEX = $tagNMHDR & ";uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;" &  "int SelectedImage;int OverlayImage;int Indent;lparam Param"
Global Const $tagDTPRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;" &  "word MinSecond;word MinMSecond;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;" &  "word MaxMinute;word MaxSecond;word MaxMSecond;bool MinValid;bool MaxValid"
Global Const $tagNMDATETIMECHANGE = $tagNMHDR & ";dword Flag;" & $tagSYSTEMTIME
Global Const $tagNMDATETIMEFORMAT = $tagNMHDR & ";ptr Format;" & $tagSYSTEMTIME & ";ptr pDisplay;wchar Display[64]"
Global Const $tagNMDATETIMEFORMATQUERY = $tagNMHDR & ";ptr Format;struct;long SizeX;long SizeY;endstruct"
Global Const $tagNMDATETIMEKEYDOWN = $tagNMHDR & ";int VirtKey;ptr Format;" & $tagSYSTEMTIME
Global Const $tagNMDATETIMESTRING = $tagNMHDR & ";ptr UserString;" & $tagSYSTEMTIME & ";dword Flags"
Global Const $tagEVENTLOGRECORD = "dword Length;dword Reserved;dword RecordNumber;dword TimeGenerated;dword TimeWritten;dword EventID;" &  "word EventType;word NumStrings;word EventCategory;word ReservedFlags;dword ClosingRecordNumber;dword StringOffset;" &  "dword UserSidLength;dword UserSidOffset;dword DataLength;dword DataOffset"
Global Const $tagGDIP_EFFECTPARAMS_Blur = "float Radius; bool ExpandEdge"
Global Const $tagGDIP_EFFECTPARAMS_BrightnessContrast = "int BrightnessLevel; int ContrastLevel"
Global Const $tagGDIP_EFFECTPARAMS_ColorBalance = "int CyanRed; int MagentaGreen; int YellowBlue"
Global Const $tagGDIP_EFFECTPARAMS_ColorCurve = "int Adjustment; int Channel; int AdjustValue"
Global Const $tagGDIP_EFFECTPARAMS_ColorLUT = "byte LutB[256]; byte LutG[256]; byte LutR[256]; byte LutA[256]"
Global Const $tagGDIP_EFFECTPARAMS_HueSaturationLightness = "int HueLevel; int SaturationLevel; int LightnessLevel"
Global Const $tagGDIP_EFFECTPARAMS_Levels = "int Highlight; int Midtone; int Shadow"
Global Const $tagGDIP_EFFECTPARAMS_RedEyeCorrection = "uint NumberOfAreas; ptr Areas"
Global Const $tagGDIP_EFFECTPARAMS_Sharpen = "float Radius; float Amount"
Global Const $tagGDIP_EFFECTPARAMS_Tint = "int Hue; int Amount"
Global Const $tagGDIPBITMAPDATA = "uint Width;uint Height;int Stride;int Format;ptr Scan0;uint_ptr Reserved"
Global Const $tagGDIPCOLORMATRIX = "float m[25]"
Global Const $tagGDIPENCODERPARAM = "struct;byte GUID[16];ulong NumberOfValues;ulong Type;ptr Values;endstruct"
Global Const $tagGDIPENCODERPARAMS = "uint Count;" & $tagGDIPENCODERPARAM
Global Const $tagGDIPRECTF = "struct;float X;float Y;float Width;float Height;endstruct"
Global Const $tagGDIPSTARTUPINPUT = "uint Version;ptr Callback;bool NoThread;bool NoCodecs"
Global Const $tagGDIPSTARTUPOUTPUT = "ptr HookProc;ptr UnhookProc"
Global Const $tagGDIPIMAGECODECINFO = "byte CLSID[16];byte FormatID[16];ptr CodecName;ptr DllName;ptr FormatDesc;ptr FileExt;" &  "ptr MimeType;dword Flags;dword Version;dword SigCount;dword SigSize;ptr SigPattern;ptr SigMask"
Global Const $tagGDIPPENCODERPARAMS = "uint Count;byte Params[1]"
Global Const $tagHDITEM = "uint Mask;int XY;ptr Text;handle hBMP;int TextMax;int Fmt;lparam Param;int Image;int Order;uint Type;ptr pFilter;uint State"
Global Const $tagNMHDDISPINFO = $tagNMHDR & ";int Item;uint Mask;ptr Text;int TextMax;int Image;lparam lParam"
Global Const $tagNMHDFILTERBTNCLICK = $tagNMHDR & ";int Item;" & $tagRECT
Global Const $tagNMHEADER = $tagNMHDR & ";int Item;int Button;ptr pItem"
Global Const $tagGETIPAddress = "byte Field4;byte Field3;byte Field2;byte Field1"
Global Const $tagNMIPADDRESS = $tagNMHDR & ";int Field;int Value"
Global Const $tagLVFINDINFO = "struct;uint Flags;ptr Text;lparam Param;" & $tagPOINT & ";uint Direction;endstruct"
Global Const $tagLVHITTESTINFO = $tagPOINT & ";uint Flags;int Item;int SubItem;int iGroup"
Global Const $tagLVITEM = "struct;uint Mask;int Item;int SubItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;lparam Param;" &  "int Indent;int GroupID;uint Columns;ptr pColumns;ptr piColFmt;int iGroup;endstruct"
Global Const $tagNMLISTVIEW = $tagNMHDR & ";int Item;int SubItem;uint NewState;uint OldState;uint Changed;" &  "struct;long ActionX;long ActionY;endstruct;lparam Param"
Global Const $tagNMLVCUSTOMDRAW = "struct;" & $tagNMHDR & ";dword dwDrawStage;handle hdc;" & $tagRECT &  ";dword_ptr dwItemSpec;uint uItemState;lparam lItemlParam;endstruct" &  ";dword clrText;dword clrTextBk;int iSubItem;dword dwItemType;dword clrFace;int iIconEffect;" &  "int iIconPhase;int iPartID;int iStateID;struct;long TextLeft;long TextTop;long TextRight;long TextBottom;endstruct;uint uAlign"
Global Const $tagNMLVDISPINFO = $tagNMHDR & ";" & $tagLVITEM
Global Const $tagNMLVFINDITEM = $tagNMHDR & ";int Start;" & $tagLVFINDINFO
Global Const $tagNMLVGETINFOTIP = $tagNMHDR & ";dword Flags;ptr Text;int TextMax;int Item;int SubItem;lparam lParam"
Global Const $tagNMITEMACTIVATE = $tagNMHDR & ";int Index;int SubItem;uint NewState;uint OldState;uint Changed;" &  $tagPOINT & ";lparam lParam;uint KeyFlags"
Global Const $tagNMLVKEYDOWN = "align 1;" & $tagNMHDR & ";word VKey;uint Flags"
Global Const $tagNMLVSCROLL = $tagNMHDR & ";int DX;int DY"
Global Const $tagMCHITTESTINFO = "uint Size;" & $tagPOINT & ";uint Hit;" & $tagSYSTEMTIME &  ";" & $tagRECT & ";int iOffset;int iRow;int iCol"
Global Const $tagMCMONTHRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" &  "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" &  "word MaxMSeconds;short Span"
Global Const $tagMCRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" &  "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" &  "word MaxMSeconds;short MinSet;short MaxSet"
Global Const $tagMCSELRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" &  "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" &  "word MaxMSeconds"
Global Const $tagNMDAYSTATE = $tagNMHDR & ";" & $tagSYSTEMTIME & ";int DayState;ptr pDayState"
Global Const $tagNMSELCHANGE = $tagNMHDR &  ";struct;word BegYear;word BegMonth;word BegDOW;word BegDay;word BegHour;word BegMinute;word BegSecond;word BegMSeconds;endstruct;" &  "struct;word EndYear;word EndMonth;word EndDOW;word EndDay;word EndHour;word EndMinute;word EndSecond;word EndMSeconds;endstruct"
Global Const $tagNMOBJECTNOTIFY = $tagNMHDR & ";int Item;ptr piid;ptr pObject;long Result;dword dwFlags"
Global Const $tagNMTCKEYDOWN = "align 1;" & $tagNMHDR & ";word VKey;uint Flags"
Global Const $tagTVITEM = "struct;uint Mask;handle hItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;int SelectedImage;" &  "int Children;lparam Param;endstruct"
Global Const $tagTVITEMEX = "struct;" & $tagTVITEM & ";int Integral;uint uStateEx;hwnd hwnd;int iExpandedImage;int iReserved;endstruct"
Global Const $tagNMTREEVIEW = $tagNMHDR & ";uint Action;" &  "struct;uint OldMask;handle OldhItem;uint OldState;uint OldStateMask;" &  "ptr OldText;int OldTextMax;int OldImage;int OldSelectedImage;int OldChildren;lparam OldParam;endstruct;" &  "struct;uint NewMask;handle NewhItem;uint NewState;uint NewStateMask;" &  "ptr NewText;int NewTextMax;int NewImage;int NewSelectedImage;int NewChildren;lparam NewParam;endstruct;" &  "struct;long PointX;long PointY;endstruct"
Global Const $tagNMTVCUSTOMDRAW = "struct;" & $tagNMHDR & ";dword DrawStage;handle HDC;" & $tagRECT &  ";dword_ptr ItemSpec;uint ItemState;lparam ItemParam;endstruct" &  ";dword ClrText;dword ClrTextBk;int Level"
Global Const $tagNMTVDISPINFO = $tagNMHDR & ";" & $tagTVITEM
Global Const $tagNMTVGETINFOTIP = $tagNMHDR & ";ptr Text;int TextMax;handle hItem;lparam lParam"
Global Const $tagNMTVITEMCHANGE = $tagNMHDR & ";uint Changed;handle hItem;uint StateNew;uint StateOld;lparam lParam;"
Global Const $tagTVHITTESTINFO = $tagPOINT & ";uint Flags;handle Item"
Global Const $tagNMTVKEYDOWN = "align 1;" & $tagNMHDR & ";word VKey;uint Flags"
Global Const $tagNMMOUSE = $tagNMHDR & ";dword_ptr ItemSpec;dword_ptr ItemData;" & $tagPOINT & ";lparam HitInfo"
Global Const $tagTOKEN_PRIVILEGES = "dword Count;align 4;int64 LUID;dword Attributes"
Global Const $tagIMAGEINFO = "handle hBitmap;handle hMask;int Unused1;int Unused2;" & $tagRECT
Global Const $tagMENUINFO = "dword Size;INT Mask;dword Style;uint YMax;handle hBack;dword ContextHelpID;ulong_ptr MenuData"
Global Const $tagMENUITEMINFO = "uint Size;uint Mask;uint Type;uint State;uint ID;handle SubMenu;handle BmpChecked;handle BmpUnchecked;" &  "ulong_ptr ItemData;ptr TypeData;uint CCH;handle BmpItem"
Global Const $tagREBARBANDINFO = "uint cbSize;uint fMask;uint fStyle;dword clrFore;dword clrBack;ptr lpText;uint cch;" &  "int iImage;hwnd hwndChild;uint cxMinChild;uint cyMinChild;uint cx;handle hbmBack;uint wID;uint cyChild;uint cyMaxChild;" &  "uint cyIntegral;uint cxIdeal;lparam lParam;uint cxHeader" & ((@OSVersion = "WIN_XP") ? "" : ";" & $tagRECT & ";uint uChevronState")
Global Const $tagNMREBARAUTOBREAK = $tagNMHDR & ";uint uBand;uint wID;lparam lParam;uint uMsg;uint fStyleCurrent;bool fAutoBreak"
Global Const $tagNMRBAUTOSIZE = $tagNMHDR & ";bool fChanged;" &  "struct;long TargetLeft;long TargetTop;long TargetRight;long TargetBottom;endstruct;" &  "struct;long ActualLeft;long ActualTop;long ActualRight;long ActualBottom;endstruct"
Global Const $tagNMREBAR = $tagNMHDR & ";dword dwMask;uint uBand;uint fStyle;uint wID;lparam lParam"
Global Const $tagNMREBARCHEVRON = $tagNMHDR & ";uint uBand;uint wID;lparam lParam;" & $tagRECT & ";lparam lParamNM"
Global Const $tagNMREBARCHILDSIZE = $tagNMHDR & ";uint uBand;uint wID;" &  "struct;long CLeft;long CTop;long CRight;long CBottom;endstruct;" &  "struct;long BLeft;long BTop;long BRight;long BBottom;endstruct"
Global Const $tagCOLORSCHEME = "dword Size;dword BtnHighlight;dword BtnShadow"
Global Const $tagNMTOOLBAR = $tagNMHDR & ";int iItem;" &  "struct;int iBitmap;int idCommand;byte fsState;byte fsStyle;dword_ptr dwData;int_ptr iString;endstruct" &  ";int cchText;ptr pszText;" & $tagRECT
Global Const $tagNMTBHOTITEM = $tagNMHDR & ";int idOld;int idNew;dword dwFlags"
Global Const $tagTBBUTTON = "int Bitmap;int Command;byte State;byte Style;dword_ptr Param;int_ptr String"
Global Const $tagTBBUTTONINFO = "uint Size;dword Mask;int Command;int Image;byte State;byte Style;word CX;dword_ptr Param;ptr Text;int TextMax"
Global Const $tagNETRESOURCE = "dword Scope;dword Type;dword DisplayType;dword Usage;ptr LocalName;ptr RemoteName;ptr Comment;ptr Provider"
Global Const $tagOVERLAPPED = "ulong_ptr Internal;ulong_ptr InternalHigh;struct;dword Offset;dword OffsetHigh;endstruct;handle hEvent"
Global Const $tagOPENFILENAME = "dword StructSize;hwnd hwndOwner;handle hInstance;ptr lpstrFilter;ptr lpstrCustomFilter;" &  "dword nMaxCustFilter;dword nFilterIndex;ptr lpstrFile;dword nMaxFile;ptr lpstrFileTitle;dword nMaxFileTitle;" &  "ptr lpstrInitialDir;ptr lpstrTitle;dword Flags;word nFileOffset;word nFileExtension;ptr lpstrDefExt;lparam lCustData;" &  "ptr lpfnHook;ptr lpTemplateName;ptr pvReserved;dword dwReserved;dword FlagsEx"
Global Const $tagBITMAPINFOHEADER = "struct;dword biSize;long biWidth;long biHeight;word biPlanes;word biBitCount;" &  "dword biCompression;dword biSizeImage;long biXPelsPerMeter;long biYPelsPerMeter;dword biClrUsed;dword biClrImportant;endstruct"
Global Const $tagBITMAPINFO = $tagBITMAPINFOHEADER & ";dword biRGBQuad[1]"
Global Const $tagBLENDFUNCTION = "byte Op;byte Flags;byte Alpha;byte Format"
Global Const $tagGUID = "struct;ulong Data1;ushort Data2;ushort Data3;byte Data4[8];endstruct"
Global Const $tagWINDOWPLACEMENT = "uint length;uint flags;uint showCmd;long ptMinPosition[2];long ptMaxPosition[2];long rcNormalPosition[4]"
Global Const $tagWINDOWPOS = "hwnd hWnd;hwnd InsertAfter;int X;int Y;int CX;int CY;uint Flags"
Global Const $tagSCROLLINFO = "uint cbSize;uint fMask;int nMin;int nMax;uint nPage;int nPos;int nTrackPos"
Global Const $tagSCROLLBARINFO = "dword cbSize;" & $tagRECT & ";int dxyLineButton;int xyThumbTop;" &  "int xyThumbBottom;int reserved;dword rgstate[6]"
Global Const $tagLOGFONT = "struct;long Height;long Width;long Escapement;long Orientation;long Weight;byte Italic;byte Underline;" &  "byte Strikeout;byte CharSet;byte OutPrecision;byte ClipPrecision;byte Quality;byte PitchAndFamily;wchar FaceName[32];endstruct"
Global Const $tagKBDLLHOOKSTRUCT = "dword vkCode;dword scanCode;dword flags;dword time;ulong_ptr dwExtraInfo"
Global Const $tagPROCESS_INFORMATION = "handle hProcess;handle hThread;dword ProcessID;dword ThreadID"
Global Const $tagSTARTUPINFO = "dword Size;ptr Reserved1;ptr Desktop;ptr Title;dword X;dword Y;dword XSize;dword YSize;dword XCountChars;" &  "dword YCountChars;dword FillAttribute;dword Flags;word ShowWindow;word Reserved2;ptr Reserved3;handle StdInput;" &  "handle StdOutput;handle StdError"
Global Const $tagSECURITY_ATTRIBUTES = "dword Length;ptr Descriptor;bool InheritHandle"
Global Const $tagWIN32_FIND_DATA = "dword dwFileAttributes;dword ftCreationTime[2];dword ftLastAccessTime[2];dword ftLastWriteTime[2];dword nFileSizeHigh;dword nFileSizeLow;dword dwReserved0;dword dwReserved1;wchar cFileName[260];wchar cAlternateFileName[14]"
Global Const $tagTEXTMETRIC = "long tmHeight;long tmAscent;long tmDescent;long tmInternalLeading;long tmExternalLeading;" &  "long tmAveCharWidth;long tmMaxCharWidth;long tmWeight;long tmOverhang;long tmDigitizedAspectX;long tmDigitizedAspectY;" &  "wchar tmFirstChar;wchar tmLastChar;wchar tmDefaultChar;wchar tmBreakChar;byte tmItalic;byte tmUnderlined;byte tmStruckOut;" &  "byte tmPitchAndFamily;byte tmCharSet"
Global Const $tagMEMMAP = "handle hProc;ulong_ptr Size;ptr Mem"
Func _MemFree(ByRef $tMemMap)
Local $pMemory = DllStructGetData($tMemMap, "Mem")
Local $hProcess = DllStructGetData($tMemMap, "hProc")
Local $bResult = _MemVirtualFreeEx($hProcess, $pMemory, 0, $MEM_RELEASE)
DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hProcess)
If @error Then Return SetError(@error, @extended, False)
Return $bResult
EndFunc
Func _MemGlobalAlloc($iBytes, $iFlags = 0)
Local $aResult = DllCall("kernel32.dll", "handle", "GlobalAlloc", "uint", $iFlags, "ulong_ptr", $iBytes)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemGlobalFree($hMemory)
Local $aResult = DllCall("kernel32.dll", "ptr", "GlobalFree", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemGlobalLock($hMemory)
Local $aResult = DllCall("kernel32.dll", "ptr", "GlobalLock", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemGlobalSize($hMemory)
Local $aResult = DllCall("kernel32.dll", "ulong_ptr", "GlobalSize", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemGlobalUnlock($hMemory)
Local $aResult = DllCall("kernel32.dll", "bool", "GlobalUnlock", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemInit($hWnd, $iSize, ByRef $tMemMap)
Local $aResult = DllCall("user32.dll", "dword", "GetWindowThreadProcessId", "hwnd", $hWnd, "dword*", 0)
If @error Then Return SetError(@error + 10, @extended, 0)
Local $iProcessID = $aResult[2]
If $iProcessID = 0 Then Return SetError(1, 0, 0)
Local $iAccess = BitOR($PROCESS_VM_OPERATION, $PROCESS_VM_READ, $PROCESS_VM_WRITE)
Local $hProcess = __Mem_OpenProcess($iAccess, False, $iProcessID, True)
Local $iAlloc = BitOR($MEM_RESERVE, $MEM_COMMIT)
Local $pMemory = _MemVirtualAllocEx($hProcess, 0, $iSize, $iAlloc, $PAGE_READWRITE)
If $pMemory = 0 Then Return SetError(2, 0, 0)
$tMemMap = DllStructCreate($tagMEMMAP)
DllStructSetData($tMemMap, "hProc", $hProcess)
DllStructSetData($tMemMap, "Size", $iSize)
DllStructSetData($tMemMap, "Mem", $pMemory)
Return $pMemory
EndFunc
Func _MemMoveMemory($pSource, $pDest, $iLength)
DllCall("kernel32.dll", "none", "RtlMoveMemory", "struct*", $pDest, "struct*", $pSource, "ulong_ptr", $iLength)
If @error Then Return SetError(@error, @extended)
EndFunc
Func _MemRead(ByRef $tMemMap, $pSrce, $pDest, $iSize)
Local $aResult = DllCall("kernel32.dll", "bool", "ReadProcessMemory", "handle", DllStructGetData($tMemMap, "hProc"),  "ptr", $pSrce, "struct*", $pDest, "ulong_ptr", $iSize, "ulong_ptr*", 0)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemWrite(ByRef $tMemMap, $pSrce, $pDest = 0, $iSize = 0, $sSrce = "struct*")
If $pDest = 0 Then $pDest = DllStructGetData($tMemMap, "Mem")
If $iSize = 0 Then $iSize = DllStructGetData($tMemMap, "Size")
Local $aResult = DllCall("kernel32.dll", "bool", "WriteProcessMemory", "handle", DllStructGetData($tMemMap, "hProc"),  "ptr", $pDest, $sSrce, $pSrce, "ulong_ptr", $iSize, "ulong_ptr*", 0)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemVirtualAlloc($pAddress, $iSize, $iAllocation, $iProtect)
Local $aResult = DllCall("kernel32.dll", "ptr", "VirtualAlloc", "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iAllocation, "dword", $iProtect)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemVirtualAllocEx($hProcess, $pAddress, $iSize, $iAllocation, $iProtect)
Local $aResult = DllCall("kernel32.dll", "ptr", "VirtualAllocEx", "handle", $hProcess, "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iAllocation, "dword", $iProtect)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemVirtualFree($pAddress, $iSize, $iFreeType)
Local $aResult = DllCall("kernel32.dll", "bool", "VirtualFree", "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iFreeType)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemVirtualFreeEx($hProcess, $pAddress, $iSize, $iFreeType)
Local $aResult = DllCall("kernel32.dll", "bool", "VirtualFreeEx", "handle", $hProcess, "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iFreeType)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func __Mem_OpenProcess($iAccess, $bInherit, $iPID, $bDebugPriv = False)
Local $aResult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iAccess, "bool", $bInherit, "dword", $iPID)
If @error Then Return SetError(@error, @extended, 0)
If $aResult[0] Then Return $aResult[0]
If Not $bDebugPriv Then Return SetError(100, 0, 0)
Local $hToken = _Security__OpenThreadTokenEx(BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
If @error Then Return SetError(@error + 10, @extended, 0)
_Security__SetPrivilege($hToken, "SeDebugPrivilege", True)
Local $iError = @error
Local $iExtended = @extended
Local $iRet = 0
If Not @error Then
$aResult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iAccess, "bool", $bInherit, "dword", $iPID)
$iError = @error
$iExtended = @extended
If $aResult[0] Then $iRet = $aResult[0]
_Security__SetPrivilege($hToken, "SeDebugPrivilege", False)
If @error Then
$iError = @error + 20
$iExtended = @extended
EndIf
Else
$iError = @error + 30
EndIf
DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hToken)
Return SetError($iError, $iExtended, $iRet)
EndFunc
Func _SendMessage($hWnd, $iMsg, $wParam = 0, $lParam = 0, $iReturn = 0, $wParamType = "wparam", $lParamType = "lparam", $sReturnType = "lresult")
Local $aResult = DllCall("user32.dll", $sReturnType, "SendMessageW", "hwnd", $hWnd, "uint", $iMsg, $wParamType, $wParam, $lParamType, $lParam)
If @error Then Return SetError(@error, @extended, "")
If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
Return $aResult
EndFunc
Func _SendMessageA($hWnd, $iMsg, $wParam = 0, $lParam = 0, $iReturn = 0, $wParamType = "wparam", $lParamType = "lparam", $sReturnType = "lresult")
Local $aResult = DllCall("user32.dll", $sReturnType, "SendMessageA", "hwnd", $hWnd, "uint", $iMsg, $wParamType, $wParam, $lParamType, $lParam)
If @error Then Return SetError(@error, @extended, "")
If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
Return $aResult
EndFunc
Global Const $SBARS_SIZEGRIP = 0x100
Global Const $SBT_TOOLTIPS = 0x800
Global Const $SBARS_TOOLTIPS = 0x800
Global Const $SBT_SUNKEN = 0x0
Global Const $SBT_NOBORDERS = 0x100
Global Const $SBT_POPOUT = 0x200
Global Const $SBT_RTLREADING = 0x400
Global Const $SBT_NOTABPARSING = 0x800
Global Const $SBT_OWNERDRAW = 0x1000
Global Const $__STATUSBARCONSTANT_WM_USER = 0X400
Global Const $SB_GETBORDERS = ($__STATUSBARCONSTANT_WM_USER + 7)
Global Const $SB_GETICON = ($__STATUSBARCONSTANT_WM_USER + 20)
Global Const $SB_GETPARTS = ($__STATUSBARCONSTANT_WM_USER + 6)
Global Const $SB_GETRECT = ($__STATUSBARCONSTANT_WM_USER + 10)
Global Const $SB_GETTEXTA = ($__STATUSBARCONSTANT_WM_USER + 2)
Global Const $SB_GETTEXTW = ($__STATUSBARCONSTANT_WM_USER + 13)
Global Const $SB_GETTEXT = $SB_GETTEXTA
Global Const $SB_GETTEXTLENGTHA = ($__STATUSBARCONSTANT_WM_USER + 3)
Global Const $SB_GETTEXTLENGTHW = ($__STATUSBARCONSTANT_WM_USER + 12)
Global Const $SB_GETTEXTLENGTH = $SB_GETTEXTLENGTHA
Global Const $SB_GETTIPTEXTA = ($__STATUSBARCONSTANT_WM_USER + 18)
Global Const $SB_GETTIPTEXTW = ($__STATUSBARCONSTANT_WM_USER + 19)
Global Const $SB_GETUNICODEFORMAT = 0x2000 + 6
Global Const $SB_ISSIMPLE = ($__STATUSBARCONSTANT_WM_USER + 14)
Global Const $SB_SETBKCOLOR = 0x2000 + 1
Global Const $SB_SETICON = ($__STATUSBARCONSTANT_WM_USER + 15)
Global Const $SB_SETMINHEIGHT = ($__STATUSBARCONSTANT_WM_USER + 8)
Global Const $SB_SETPARTS = ($__STATUSBARCONSTANT_WM_USER + 4)
Global Const $SB_SETTEXTA = ($__STATUSBARCONSTANT_WM_USER + 1)
Global Const $SB_SETTEXTW = ($__STATUSBARCONSTANT_WM_USER + 11)
Global Const $SB_SETTEXT = $SB_SETTEXTA
Global Const $SB_SETTIPTEXTA = ($__STATUSBARCONSTANT_WM_USER + 16)
Global Const $SB_SETTIPTEXTW = ($__STATUSBARCONSTANT_WM_USER + 17)
Global Const $SB_SETUNICODEFORMAT = 0x2000 + 5
Global Const $SB_SIMPLE = ($__STATUSBARCONSTANT_WM_USER + 9)
Global Const $SB_SIMPLEID = 0xff
Global Const $SBN_FIRST = -880
Global Const $SBN_SIMPLEMODECHANGE = $SBN_FIRST - 0
Global Const $OPT_COORDSRELATIVE = 0
Global Const $OPT_COORDSABSOLUTE = 1
Global Const $OPT_COORDSCLIENT = 2
Global Const $OPT_ERRORSILENT = 0
Global Const $OPT_ERRORFATAL = 1
Global Const $OPT_CAPSNOSTORE = 0
Global Const $OPT_CAPSSTORE = 1
Global Const $OPT_MATCHSTART = 1
Global Const $OPT_MATCHANY = 2
Global Const $OPT_MATCHEXACT = 3
Global Const $OPT_MATCHADVANCED = 4
Global Const $CCS_TOP = 0x01
Global Const $CCS_NOMOVEY = 0x02
Global Const $CCS_BOTTOM = 0x03
Global Const $CCS_NORESIZE = 0x04
Global Const $CCS_NOPARENTALIGN = 0x08
Global Const $CCS_NOHILITE = 0x10
Global Const $CCS_ADJUSTABLE = 0x20
Global Const $CCS_NODIVIDER = 0x40
Global Const $CCS_VERT = 0x0080
Global Const $CCS_LEFT = 0x0081
Global Const $CCS_NOMOVEX = 0x0082
Global Const $CCS_RIGHT = 0x0083
Global Const $DT_DRIVETYPE = 1
Global Const $DT_SSDSTATUS = 2
Global Const $DT_BUSTYPE = 3
Global Const $PROXY_IE = 0
Global Const $PROXY_NONE = 1
Global Const $PROXY_SPECIFIED = 2
Global Const $OBJID_WINDOW = 0x00000000
Global Const $OBJID_TITLEBAR = 0xFFFFFFFE
Global Const $OBJID_SIZEGRIP = 0xFFFFFFF9
Global Const $OBJID_CARET = 0xFFFFFFF8
Global Const $OBJID_CURSOR = 0xFFFFFFF7
Global Const $OBJID_ALERT = 0xFFFFFFF6
Global Const $OBJID_SOUND = 0xFFFFFFF5
Global Const $DLG_CENTERONTOP = 0
Global Const $DLG_NOTITLE = 1
Global Const $DLG_NOTONTOP = 2
Global Const $DLG_TEXTLEFT = 4
Global Const $DLG_TEXTRIGHT = 8
Global Const $DLG_MOVEABLE = 16
Global Const $DLG_TEXTVCENTER = 32
Global Const $IDC_UNKNOWN = 0
Global Const $IDC_APPSTARTING = 1
Global Const $IDC_ARROW = 2
Global Const $IDC_CROSS = 3
Global Const $IDC_HAND = 32649
Global Const $IDC_HELP = 4
Global Const $IDC_IBEAM = 5
Global Const $IDC_ICON = 6
Global Const $IDC_NO = 7
Global Const $IDC_SIZE = 8
Global Const $IDC_SIZEALL = 9
Global Const $IDC_SIZENESW = 10
Global Const $IDC_SIZENS = 11
Global Const $IDC_SIZENWSE = 12
Global Const $IDC_SIZEWE = 13
Global Const $IDC_UPARROW = 14
Global Const $IDC_WAIT = 15
Global Const $IDI_APPLICATION = 32512
Global Const $IDI_ASTERISK = 32516
Global Const $IDI_EXCLAMATION = 32515
Global Const $IDI_HAND = 32513
Global Const $IDI_QUESTION = 32514
Global Const $IDI_WINLOGO = 32517
Global Const $IDI_SHIELD = 32518
Global Const $IDI_ERROR = $IDI_HAND
Global Const $IDI_INFORMATION = $IDI_ASTERISK
Global Const $IDI_WARNING = $IDI_EXCLAMATION
Global Const $SD_LOGOFF = 0
Global Const $SD_SHUTDOWN = 1
Global Const $SD_REBOOT = 2
Global Const $SD_FORCE = 4
Global Const $SD_POWERDOWN = 8
Global Const $SD_FORCEHUNG = 16
Global Const $SD_STANDBY = 32
Global Const $SD_HIBERNATE = 64
Global Const $STDIN_CHILD = 1
Global Const $STDOUT_CHILD = 2
Global Const $STDERR_CHILD = 4
Global Const $STDERR_MERGED = 8
Global Const $STDIO_INHERIT_PARENT = 0x10
Global Const $RUN_CREATE_NEW_CONSOLE = 0x00010000
Global Const $UBOUND_DIMENSIONS = 0
Global Const $UBOUND_ROWS = 1
Global Const $UBOUND_COLUMNS = 2
Global Const $MOUSEEVENTF_ABSOLUTE = 0x8000
Global Const $MOUSEEVENTF_MOVE = 0x0001
Global Const $MOUSEEVENTF_LEFTDOWN = 0x0002
Global Const $MOUSEEVENTF_LEFTUP = 0x0004
Global Const $MOUSEEVENTF_RIGHTDOWN = 0x0008
Global Const $MOUSEEVENTF_RIGHTUP = 0x0010
Global Const $MOUSEEVENTF_MIDDLEDOWN = 0x0020
Global Const $MOUSEEVENTF_MIDDLEUP = 0x0040
Global Const $MOUSEEVENTF_WHEEL = 0x0800
Global Const $MOUSEEVENTF_XDOWN = 0x0080
Global Const $MOUSEEVENTF_XUP = 0x0100
Global Const $REG_NONE = 0
Global Const $REG_SZ = 1
Global Const $REG_EXPAND_SZ = 2
Global Const $REG_BINARY = 3
Global Const $REG_DWORD = 4
Global Const $REG_DWORD_LITTLE_ENDIAN = 4
Global Const $REG_DWORD_BIG_ENDIAN = 5
Global Const $REG_LINK = 6
Global Const $REG_MULTI_SZ = 7
Global Const $REG_RESOURCE_LIST = 8
Global Const $REG_FULL_RESOURCE_DESCRIPTOR = 9
Global Const $REG_RESOURCE_REQUIREMENTS_LIST = 10
Global Const $REG_QWORD = 11
Global Const $REG_QWORD_LITTLE_ENDIAN = 11
Global Const $HWND_BOTTOM = 1
Global Const $HWND_NOTOPMOST = -2
Global Const $HWND_TOP = 0
Global Const $HWND_TOPMOST = -1
Global Const $SWP_NOSIZE = 0x0001
Global Const $SWP_NOMOVE = 0x0002
Global Const $SWP_NOZORDER = 0x0004
Global Const $SWP_NOREDRAW = 0x0008
Global Const $SWP_NOACTIVATE = 0x0010
Global Const $SWP_FRAMECHANGED = 0x0020
Global Const $SWP_DRAWFRAME = 0x0020
Global Const $SWP_SHOWWINDOW = 0x0040
Global Const $SWP_HIDEWINDOW = 0x0080
Global Const $SWP_NOCOPYBITS = 0x0100
Global Const $SWP_NOOWNERZORDER = 0x0200
Global Const $SWP_NOREPOSITION = 0x0200
Global Const $SWP_NOSENDCHANGING = 0x0400
Global Const $SWP_DEFERERASE = 0x2000
Global Const $SWP_ASYNCWINDOWPOS = 0x4000
Global Const $KEYWORD_DEFAULT = 1
Global Const $KEYWORD_NULL = 2
Global Const $DECLARED_LOCAL = -1
Global Const $DECLARED_UNKNOWN = 0
Global Const $DECLARED_GLOBAL = 1
Global Const $ASSIGN_CREATE = 0
Global Const $ASSIGN_FORCELOCAL = 1
Global Const $ASSIGN_FORCEGLOBAL = 2
Global Const $ASSIGN_EXISTFAIL = 4
Global Const $BI_ENABLE = 0
Global Const $BI_DISABLE = 1
Global Const $BREAK_ENABLE = 1
Global Const $BREAK_DISABLE = 0
Global Const $CDTRAY_OPEN = "open"
Global Const $CDTRAY_CLOSED = "closed"
Global Const $SEND_DEFAULT = 0
Global Const $SEND_RAW = 1
Global Const $DIR_DEFAULT = 0
Global Const $DIR_EXTENDED= 1
Global Const $DIR_NORECURSE = 2
Global Const $DIR_REMOVE= 1
Global Const $DT_ALL = "ALL"
Global Const $DT_CDROM = "CDROM"
Global Const $DT_REMOVABLE = "REMOVABLE"
Global Const $DT_FIXED = "FIXED"
Global Const $DT_NETWORK = "NETWORK"
Global Const $DT_RAMDISK = "RAMDISK"
Global Const $DT_UNKNOWN = "UNKNOWN"
Global Const $DT_UNDEFINED = 1
Global Const $DT_FAT = "FAT"
Global Const $DT_FAT32 = "FAT32"
Global Const $DT_EXFAT = "exFAT"
Global Const $DT_NTFS = "NTFS"
Global Const $DT_NWFS = "NWFS"
Global Const $DT_CDFS = "CDFS"
Global Const $DT_UDF = "UDF"
Global Const $DMA_DEFAULT = 0
Global Const $DMA_PERSISTENT = 1
Global Const $DMA_AUTHENTICATION = 8
Global Const $DS_UNKNOWN = "UNKNOWN"
Global Const $DS_READY = "READY"
Global Const $DS_NOTREADY = "NOTREADY"
Global Const $DS_INVALID = "INVALID"
Global Const $MOUSE_CLICK_LEFT = "left"
Global Const $MOUSE_CLICK_RIGHT = "right"
Global Const $MOUSE_CLICK_MIDDLE = "middle"
Global Const $MOUSE_CLICK_MAIN = "main"
Global Const $MOUSE_CLICK_MENU = "menu"
Global Const $MOUSE_CLICK_PRIMARY = "primary"
Global Const $MOUSE_CLICK_SECONDARY = "secondary"
Global Const $MOUSE_WHEEL_UP = "up"
Global Const $MOUSE_WHEEL_DOWN = "down"
Global Const $NUMBER_AUTO = 0
Global Const $NUMBER_32BIT = 1
Global Const $NUMBER_64BIT = 2
Global Const $NUMBER_DOUBLE = 3
Global Const $OBJ_NAME = 1
Global Const $OBJ_STRING = 2
Global Const $OBJ_PROGID = 3
Global Const $OBJ_FILE = 4
Global Const $OBJ_MODULE = 5
Global Const $OBJ_CLSID = 6
Global Const $OBJ_IID = 7
Global Const $EXITCLOSE_NORMAL = 0
Global Const $EXITCLOSE_BYEXIT = 1
Global Const $EXITCLOSE_BYCLICK = 2
Global Const $EXITCLOSE_BYLOGOFF = 3
Global Const $EXITCLOSE_BYSHUTDOWN = 4
Global Const $PROCESS_STATS_MEMORY = 0
Global Const $PROCESS_STATS_IO = 1
Global Const $PROCESS_LOW = 0
Global Const $PROCESS_BELOWNORMAL = 1
Global Const $PROCESS_NORMAL = 2
Global Const $PROCESS_ABOVENORMAL = 3
Global Const $PROCESS_HIGH = 4
Global Const $PROCESS_REALTIME = 5
Global Const $RUN_LOGON_NOPROFILE = 0
Global Const $RUN_LOGON_PROFILE = 1
Global Const $RUN_LOGON_NETWORK = 2
Global Const $RUN_LOGON_INHERIT = 4
Global Const $SOUND_NOWAIT = 0
Global Const $SOUND_WAIT = 1
Global Const $SHEX_OPEN = "open"
Global Const $SHEX_EDIT = "edit"
Global Const $SHEX_PRINT = "print"
Global Const $SHEX_PROPERTIES = "properties"
Global Const $TCP_DATA_DEFAULT = 0
Global Const $TCP_DATA_BINARY = 1
Global Const $UDP_OPEN_DEFAULT = 0
Global Const $UDP_OPEN_BROADCAST = 1
Global Const $UDP_DATA_DEFAULT = 0
Global Const $UDP_DATA_BINARY = 1
Global Const $UDP_DATA_ARRAY = 2
Global Const $TIP_NOICON = 0
Global Const $TIP_INFOICON = 1
Global Const $TIP_WARNINGICON = 2
Global Const $TIP_ERRORICON = 3
Global Const $TIP_BALLOON = 1
Global Const $TIP_CENTER = 2
Global Const $TIP_FORCEVISIBLE = 4
Global Const $WINDOWS_NOONTOP = 0
Global Const $WINDOWS_ONTOP = 1
Global Const $WIN_STATE_EXISTS = 1
Global Const $WIN_STATE_VISIBLE  = 2
Global Const $WIN_STATE_ENABLED = 4
Global Const $WIN_STATE_ACTIVE = 8
Global Const $WIN_STATE_MINIMIZED = 16
Global Const $WIN_STATE_MAXIMIZED = 32
Global Const $_UDF_GlobalIDs_OFFSET = 2
Global Const $_UDF_GlobalID_MAX_WIN = 16
Global Const $_UDF_STARTID = 10000
Global Const $_UDF_GlobalID_MAX_IDS = 55535
Global Const $__UDFGUICONSTANT_WS_TABSTOP = 0x00010000
Global Const $__UDFGUICONSTANT_WS_VISIBLE = 0x10000000
Global Const $__UDFGUICONSTANT_WS_CHILD = 0x40000000
Global $__g_aUDF_GlobalIDs_Used[$_UDF_GlobalID_MAX_WIN][$_UDF_GlobalID_MAX_IDS + $_UDF_GlobalIDs_OFFSET + 1]
Func __UDF_GetNextGlobalID($hWnd)
Local $nCtrlID, $iUsedIndex = -1, $bAllUsed = True
If Not WinExists($hWnd) Then Return SetError(-1, -1, 0)
For $iIndex = 0 To $_UDF_GlobalID_MAX_WIN - 1
If $__g_aUDF_GlobalIDs_Used[$iIndex][0] <> 0 Then
If Not WinExists($__g_aUDF_GlobalIDs_Used[$iIndex][0]) Then
For $x = 0 To UBound($__g_aUDF_GlobalIDs_Used, $UBOUND_COLUMNS) - 1
$__g_aUDF_GlobalIDs_Used[$iIndex][$x] = 0
Next
$__g_aUDF_GlobalIDs_Used[$iIndex][1] = $_UDF_STARTID
$bAllUsed = False
EndIf
EndIf
Next
For $iIndex = 0 To $_UDF_GlobalID_MAX_WIN - 1
If $__g_aUDF_GlobalIDs_Used[$iIndex][0] = $hWnd Then
$iUsedIndex = $iIndex
ExitLoop
EndIf
Next
If $iUsedIndex = -1 Then
For $iIndex = 0 To $_UDF_GlobalID_MAX_WIN - 1
If $__g_aUDF_GlobalIDs_Used[$iIndex][0] = 0 Then
$__g_aUDF_GlobalIDs_Used[$iIndex][0] = $hWnd
$__g_aUDF_GlobalIDs_Used[$iIndex][1] = $_UDF_STARTID
$bAllUsed = False
$iUsedIndex = $iIndex
ExitLoop
EndIf
Next
EndIf
If $iUsedIndex = -1 And $bAllUsed Then Return SetError(16, 0, 0)
If $__g_aUDF_GlobalIDs_Used[$iUsedIndex][1] = $_UDF_STARTID + $_UDF_GlobalID_MAX_IDS Then
For $iIDIndex = $_UDF_GlobalIDs_OFFSET To UBound($__g_aUDF_GlobalIDs_Used, $UBOUND_COLUMNS) - 1
If $__g_aUDF_GlobalIDs_Used[$iUsedIndex][$iIDIndex] = 0 Then
$nCtrlID = ($iIDIndex - $_UDF_GlobalIDs_OFFSET) + 10000
$__g_aUDF_GlobalIDs_Used[$iUsedIndex][$iIDIndex] = $nCtrlID
Return $nCtrlID
EndIf
Next
Return SetError(-1, $_UDF_GlobalID_MAX_IDS, 0)
EndIf
$nCtrlID = $__g_aUDF_GlobalIDs_Used[$iUsedIndex][1]
$__g_aUDF_GlobalIDs_Used[$iUsedIndex][1] += 1
$__g_aUDF_GlobalIDs_Used[$iUsedIndex][($nCtrlID - 10000) + $_UDF_GlobalIDs_OFFSET] = $nCtrlID
Return $nCtrlID
EndFunc
Func __UDF_FreeGlobalID($hWnd, $iGlobalID)
If $iGlobalID - $_UDF_STARTID < 0 Or $iGlobalID - $_UDF_STARTID > $_UDF_GlobalID_MAX_IDS Then Return SetError(-1, 0, False)
For $iIndex = 0 To $_UDF_GlobalID_MAX_WIN - 1
If $__g_aUDF_GlobalIDs_Used[$iIndex][0] = $hWnd Then
For $x = $_UDF_GlobalIDs_OFFSET To UBound($__g_aUDF_GlobalIDs_Used, $UBOUND_COLUMNS) - 1
If $__g_aUDF_GlobalIDs_Used[$iIndex][$x] = $iGlobalID Then
$__g_aUDF_GlobalIDs_Used[$iIndex][$x] = 0
Return True
EndIf
Next
Return SetError(-3, 0, False)
EndIf
Next
Return SetError(-2, 0, False)
EndFunc
#Region Global Variables and Constants
Global $__g_vEnum, $__g_vExt = 0
Global $__g_iRGBMode = 1
Global Const $tagOSVERSIONINFO = 'struct;dword OSVersionInfoSize;dword MajorVersion;dword MinorVersion;dword BuildNumber;dword PlatformId;wchar CSDVersion[128];endstruct'
Global Const $IMAGE_BITMAP = 0
Global Const $IMAGE_ICON = 1
Global Const $IMAGE_CURSOR = 2
Global Const $IMAGE_ENHMETAFILE = 3
Global Const $LR_DEFAULTCOLOR = 0x0000
Global Const $LR_MONOCHROME = 0x0001
Global Const $LR_COLOR = 0x0002
Global Const $LR_COPYRETURNORG = 0x0004
Global Const $LR_COPYDELETEORG = 0x0008
Global Const $LR_LOADFROMFILE = 0x0010
Global Const $LR_LOADTRANSPARENT = 0x0020
Global Const $LR_DEFAULTSIZE = 0x0040
Global Const $LR_VGACOLOR = 0x0080
Global Const $LR_LOADMAP3DCOLORS = 0x1000
Global Const $LR_CREATEDIBSECTION = 0x2000
Global Const $LR_COPYFROMRESOURCE = 0x4000
Global Const $LR_SHARED = 0x8000
Global Const $__tagCURSORINFO = "dword Size;dword Flags;handle hCursor;" & "struct;long X;long Y;endstruct"
Global Const $__WINVER = __WINVER()
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
#Region Public Functions
Func _WinAPI_CreateFile($sFileName, $iCreation, $iAccess = 4, $iShare = 0, $iAttributes = 0, $tSecurity = 0)
Local $iDA = 0, $iSM = 0, $iCD = 0, $iFA = 0
If BitAND($iAccess, 1) <> 0 Then $iDA = BitOR($iDA, $GENERIC_EXECUTE)
If BitAND($iAccess, 2) <> 0 Then $iDA = BitOR($iDA, $GENERIC_READ)
If BitAND($iAccess, 4) <> 0 Then $iDA = BitOR($iDA, $GENERIC_WRITE)
If BitAND($iShare, 1) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_DELETE)
If BitAND($iShare, 2) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_READ)
If BitAND($iShare, 4) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_WRITE)
Switch $iCreation
Case 0
$iCD = $CREATE_NEW
Case 1
$iCD = $CREATE_ALWAYS
Case 2
$iCD = $OPEN_EXISTING
Case 3
$iCD = $OPEN_ALWAYS
Case 4
$iCD = $TRUNCATE_EXISTING
EndSwitch
If BitAND($iAttributes, 1) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_ARCHIVE)
If BitAND($iAttributes, 2) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_HIDDEN)
If BitAND($iAttributes, 4) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_READONLY)
If BitAND($iAttributes, 8) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_SYSTEM)
Local $aResult = DllCall("kernel32.dll", "handle", "CreateFileW", "wstr", $sFileName, "dword", $iDA, "dword", $iSM,  "struct*", $tSecurity, "dword", $iCD, "dword", $iFA, "ptr", 0)
If @error Or ($aResult[0] = Ptr(-1)) Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_FreeLibrary($hModule)
Local $aResult = DllCall("kernel32.dll", "bool", "FreeLibrary", "handle", $hModule)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_GetCursorInfo()
Local $tCursor = DllStructCreate($__tagCURSORINFO)
Local $iCursor = DllStructGetSize($tCursor)
DllStructSetData($tCursor, "Size", $iCursor)
Local $aRet = DllCall("user32.dll", "bool", "GetCursorInfo", "struct*", $tCursor)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, 0)
Local $aCursor[5]
$aCursor[0] = True
$aCursor[1] = DllStructGetData($tCursor, "Flags") <> 0
$aCursor[2] = DllStructGetData($tCursor, "hCursor")
$aCursor[3] = DllStructGetData($tCursor, "X")
$aCursor[4] = DllStructGetData($tCursor, "Y")
Return $aCursor
EndFunc
Func _WinAPI_GetDlgCtrlID($hWnd)
Local $aResult = DllCall("user32.dll", "int", "GetDlgCtrlID", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetModuleHandle($sModuleName)
Local $sModuleNameType = "wstr"
If $sModuleName = "" Then
$sModuleName = 0
$sModuleNameType = "ptr"
EndIf
Local $aResult = DllCall("kernel32.dll", "handle", "GetModuleHandleW", $sModuleNameType, $sModuleName)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetString($pString, $bUnicode = True)
Local $iLength = _WinAPI_StrLen($pString, $bUnicode)
If @error Or Not $iLength Then Return SetError(@error + 10, @extended, '')
Local $tString = DllStructCreate(($bUnicode ? 'wchar' : 'char') & '[' & ($iLength + 1) & ']', $pString)
If @error Then Return SetError(@error, @extended, '')
Return SetExtended($iLength, DllStructGetData($tString, 1))
EndFunc
Func _WinAPI_IsWow64Process($iPID = 0)
If Not $iPID Then $iPID = @AutoItPID
Local $hProcess = DllCall('kernel32.dll', 'handle', 'OpenProcess', 'dword', ($__WINVER < 0x0600 ? 0x00000400 : 0x00001000),  'bool', 0, 'dword', $iPID)
If @error Or Not $hProcess[0] Then Return SetError(@error + 20, @extended, False)
Local $aRet = DllCall('kernel32.dll', 'bool', 'IsWow64Process', 'handle', $hProcess[0], 'bool*', 0)
If __CheckErrorCloseHandle($aRet, $hProcess[0]) Then Return SetError(@error, @extended, False)
Return $aRet[2]
EndFunc
Func _WinAPI_LoadImage($hInstance, $sImage, $iType, $iXDesired, $iYDesired, $iLoad)
Local $aResult, $sImageType = "int"
If IsString($sImage) Then $sImageType = "wstr"
$aResult = DllCall("user32.dll", "handle", "LoadImageW", "handle", $hInstance, $sImageType, $sImage, "uint", $iType,  "int", $iXDesired, "int", $iYDesired, "uint", $iLoad)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_LoadLibrary($sFileName)
Local $aResult = DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $sFileName)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_PathIsDirectory($sFilePath)
Local $aRet = DllCall('shlwapi.dll', 'bool', 'PathIsDirectoryW', 'wstr', $sFilePath)
If @error Then Return SetError(@error, @extended, False)
Return $aRet[0]
EndFunc
Func _WinAPI_ReadFile($hFile, $pBuffer, $iToRead, ByRef $iRead, $tOverlapped = 0)
Local $aResult = DllCall("kernel32.dll", "bool", "ReadFile", "handle", $hFile, "struct*", $pBuffer, "dword", $iToRead,  "dword*", 0, "struct*", $tOverlapped)
If @error Then Return SetError(@error, @extended, False)
$iRead = $aResult[4]
Return $aResult[0]
EndFunc
Func _WinAPI_StrLen($pString, $bUnicode = True)
Local $W = ''
If $bUnicode Then $W = 'W'
Local $aRet = DllCall('kernel32.dll', 'int', 'lstrlen' & $W, 'struct*', $pString)
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_SwitchColor($iColor)
If $iColor = -1 Then Return $iColor
Return BitOR(BitAND($iColor, 0x00FF00), BitShift(BitAND($iColor, 0x0000FF), -16), BitShift(BitAND($iColor, 0xFF0000), 16))
EndFunc
Func _WinAPI_WriteFile($hFile, $pBuffer, $iToWrite, ByRef $iWritten, $tOverlapped = 0)
Local $aResult = DllCall("kernel32.dll", "bool", "WriteFile", "handle", $hFile, "struct*", $pBuffer, "dword", $iToWrite,  "dword*", 0, "struct*", $tOverlapped)
If @error Then Return SetError(@error, @extended, False)
$iWritten = $aResult[4]
Return $aResult[0]
EndFunc
#EndRegion Public Functions
#Region Internal Functions
Func __CheckErrorArrayBounds(Const ByRef $aData, ByRef $iStart, ByRef $iEnd, $nDim = 1, $iDim = $UBOUND_DIMENSIONS)
If Not IsArray($aData) Then Return SetError(1, 0, 1)
If UBound($aData, $iDim) <> $nDim Then Return SetError(2, 0, 1)
If $iStart < 0 Then $iStart = 0
Local $iUBound = UBound($aData) - 1
If $iEnd < 1 Or $iEnd > $iUBound Then $iEnd = $iUBound
If $iStart > $iEnd Then Return SetError(4, 0, 1)
Return 0
EndFunc
Func __CheckErrorCloseHandle($aRet, $hFile, $bLastError = False, $iCurErr = @error, $iCurExt = @extended)
If Not $iCurErr And Not $aRet[0] Then $iCurErr = 10
Local $aLastError = DllCall("kernel32.dll", "dword", "GetLastError")
DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hFile)
If $iCurErr Then DllCall("kernel32.dll", "none", "SetLastError", "dword", $aLastError[0])
If $bLastError Then $iCurExt = $aLastError[0]
Return SetError($iCurErr, $iCurExt, $iCurErr)
EndFunc
Func __DLL($sPath, $bPin = False)
Local $aRet = DllCall('kernel32.dll', 'bool', 'GetModuleHandleExW', 'dword', ($bPin ? 0x0001 : 0x0002), "wstr", $sPath, 'ptr*', 0)
If Not $aRet[3] Then
Local $aResult = DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $sPath)
If Not $aResult[0] Then Return 0
EndIf
Return 1
EndFunc
Func __EnumWindowsProc($hWnd, $bVisible)
Local $aResult
If $bVisible Then
$aResult = DllCall("user32.dll", "bool", "IsWindowVisible", "hwnd", $hWnd)
If Not $aResult[0] Then
Return 1
EndIf
EndIf
__Inc($__g_vEnum)
$__g_vEnum[$__g_vEnum[0][0]][0] = $hWnd
$aResult = DllCall("user32.dll", "int", "GetClassNameW", "hwnd", $hWnd, "wstr", "", "int", 4096)
$__g_vEnum[$__g_vEnum[0][0]][1] = $aResult[2]
Return 1
EndFunc
Func __FatalExit($iCode, $sText = '')
If $sText Then MsgBox($MB_SYSTEMMODAL, 'AutoIt', $sText)
DllCall('kernel32.dll', 'none', 'FatalExit', 'int', $iCode)
EndFunc
Func __Inc(ByRef $aData, $iIncrement = 100)
Select
Case UBound($aData, $UBOUND_COLUMNS)
If $iIncrement < 0 Then
ReDim $aData[$aData[0][0] + 1][UBound($aData, $UBOUND_COLUMNS)]
Else
$aData[0][0] += 1
If $aData[0][0] > UBound($aData) - 1 Then
ReDim $aData[$aData[0][0] + $iIncrement][UBound($aData, $UBOUND_COLUMNS)]
EndIf
EndIf
Case UBound($aData, $UBOUND_ROWS)
If $iIncrement < 0 Then
ReDim $aData[$aData[0] + 1]
Else
$aData[0] += 1
If $aData[0] > UBound($aData) - 1 Then
ReDim $aData[$aData[0] + $iIncrement]
EndIf
EndIf
Case Else
Return 0
EndSelect
Return 1
EndFunc
Func __RGB($iColor)
If $__g_iRGBMode Then
$iColor = _WinAPI_SwitchColor($iColor)
EndIf
Return $iColor
EndFunc
Func __WINVER()
Local $tOSVI = DllStructCreate($tagOSVERSIONINFO)
DllStructSetData($tOSVI, 1, DllStructGetSize($tOSVI))
Local $aRet = DllCall('kernel32.dll', 'bool', 'GetVersionExW', 'struct*', $tOSVI)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, 0)
Return BitOR(BitShift(DllStructGetData($tOSVI, 2), -8), DllStructGetData($tOSVI, 3))
EndFunc
#EndRegion Internal Functions
#Region Global Variables and Constants
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
#Region Public Functions
Func _WinAPI_CharToOem($sStr)
Local $aRet = DllCall('user32.dll', 'bool', 'CharToOemW', 'wstr', $sStr, 'wstr', '')
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return $aRet[2]
EndFunc
Func _WinAPI_ClientToScreen($hWnd, ByRef $tPoint)
Local $aRet = DllCall("user32.dll", "bool", "ClientToScreen", "hwnd", $hWnd, "struct*", $tPoint)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, 0)
Return $tPoint
EndFunc
Func _WinAPI_DWordToFloat($iValue)
Local $tDWord = DllStructCreate('dword')
Local $tFloat = DllStructCreate('float', DllStructGetPtr($tDWord))
DllStructSetData($tDWord, 1, $iValue)
Return DllStructGetData($tFloat, 1)
EndFunc
Func _WinAPI_DWordToInt($iValue)
Local $tData = DllStructCreate('int')
DllStructSetData($tData, 1, $iValue)
Return DllStructGetData($tData, 1)
EndFunc
Func _WinAPI_FloatToDWord($iValue)
Local $tFloat = DllStructCreate('float')
Local $tDWord = DllStructCreate('dword', DllStructGetPtr($tFloat))
DllStructSetData($tFloat, 1, $iValue)
Return DllStructGetData($tDWord, 1)
EndFunc
Func _WinAPI_FloatToInt($nFloat)
Local $tFloat = DllStructCreate("float")
Local $tInt = DllStructCreate("int", DllStructGetPtr($tFloat))
DllStructSetData($tFloat, 1, $nFloat)
Return DllStructGetData($tInt, 1)
EndFunc
Func _WinAPI_GetXYFromPoint(ByRef $tPoint, ByRef $iX, ByRef $iY)
$iX = DllStructGetData($tPoint, "X")
$iY = DllStructGetData($tPoint, "Y")
EndFunc
Func _WinAPI_GUIDFromString($sGUID)
Local $tGUID = DllStructCreate($tagGUID)
_WinAPI_GUIDFromStringEx($sGUID, $tGUID)
If @error Then Return SetError(@error + 10, @extended, 0)
Return $tGUID
EndFunc
Func _WinAPI_GUIDFromStringEx($sGUID, $tGUID)
Local $aResult = DllCall("ole32.dll", "long", "CLSIDFromString", "wstr", $sGUID, "struct*", $tGUID)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_HashData($pMemory, $iSize, $iLength = 32)
If ($iLength <= 0) Or ($iLength > 256) Then Return SetError(11, 0, 0)
Local $tData = DllStructCreate('byte[' & $iLength & ']')
Local $aRet = DllCall('shlwapi.dll', 'uint', 'HashData', 'struct*', $pMemory, 'dword', $iSize, 'struct*', $tData, 'dword', $iLength)
If @error Then Return SetError(@error, @extended, 0)
If $aRet[0] Then Return SetError(10, $aRet[0], 0)
Return DllStructGetData($tData, 1)
EndFunc
Func _WinAPI_HashString($sString, $bCaseSensitive = True, $iLength = 32)
Local $iLengthS = StringLen($sString)
If Not $iLengthS Or ($iLength > 256) Then Return SetError(12, 0, 0)
Local $tString = DllStructCreate('wchar[' & ($iLengthS + 1) & ']')
If Not $bCaseSensitive Then
$sString = StringLower($sString)
EndIf
DllStructSetData($tString, 1, $sString)
Local $sHash = _WinAPI_HashData($tString, 2 * $iLengthS, $iLength)
If @error Then Return SetError(@error, @extended, 0)
Return $sHash
EndFunc
Func _WinAPI_HiByte($iValue)
Return BitAND(BitShift($iValue, 8), 0xFF)
EndFunc
Func _WinAPI_HiDWord($iValue)
Local $tInt64 = DllStructCreate('int64')
Local $tQWord = DllStructCreate('dword;dword', DllStructGetPtr($tInt64))
DllStructSetData($tInt64, 1, $iValue)
Return DllStructGetData($tQWord, 2)
EndFunc
Func _WinAPI_HiWord($iLong)
Return BitShift($iLong, 16)
EndFunc
Func _WinAPI_IntToDWord($iValue)
Local $tData = DllStructCreate('dword')
DllStructSetData($tData, 1, $iValue)
Return DllStructGetData($tData, 1)
EndFunc
Func _WinAPI_IntToFloat($iInt)
Local $tInt = DllStructCreate("int")
Local $tFloat = DllStructCreate("float", DllStructGetPtr($tInt))
DllStructSetData($tInt, 1, $iInt)
Return DllStructGetData($tFloat, 1)
EndFunc
Func _WinAPI_LoByte($iValue)
Return BitAND($iValue, 0xFF)
EndFunc
Func _WinAPI_LoDWord($iValue)
Local $tInt64 = DllStructCreate('int64')
Local $tQWord = DllStructCreate('dword;dword', DllStructGetPtr($tInt64))
DllStructSetData($tInt64, 1, $iValue)
Return DllStructGetData($tQWord, 1)
EndFunc
Func _WinAPI_LoWord($iLong)
Return BitAND($iLong, 0xFFFF)
EndFunc
Func _WinAPI_LongMid($iValue, $iStart, $iCount)
Return BitAND(BitShift($iValue, $iStart), BitOR(BitShift(BitShift(0x7FFFFFFF, 32 - ($iCount + 1)), 1), BitShift(1, -($iCount - 1))))
EndFunc
Func _WinAPI_MAKELANGID($iLngIDPrimary, $iLngIDSub)
Return BitOR(BitShift($iLngIDSub, -10), $iLngIDPrimary)
EndFunc
Func _WinAPI_MAKELCID($iLngID, $iSortID)
Return BitOR(BitShift($iSortID, -16), $iLngID)
EndFunc
Func _WinAPI_MakeLong($iLo, $iHi)
Return BitOR(BitShift($iHi, -16), BitAND($iLo, 0xFFFF))
EndFunc
Func _WinAPI_MakeQWord($iLoDWORD, $iHiDWORD)
Local $tInt64 = DllStructCreate("uint64")
Local $tDwords = DllStructCreate("dword;dword", DllStructGetPtr($tInt64))
DllStructSetData($tDwords, 1, $iLoDWORD)
DllStructSetData($tDwords, 2, $iHiDWORD)
Return DllStructGetData($tInt64, 1)
EndFunc
Func _WinAPI_MakeWord($iLo, $iHi)
Local $tWord = DllStructCreate('ushort')
Local $tByte = DllStructCreate('byte;byte', DllStructGetPtr($tWord))
DllStructSetData($tByte, 1, $iHi)
DllStructSetData($tByte, 2, $iLo)
Return DllStructGetData($tWord, 1)
EndFunc
Func _WinAPI_MultiByteToWideChar($vText, $iCodePage = 0, $iFlags = 0, $bRetString = False)
Local $sTextType = "str"
If Not IsString($vText) Then $sTextType = "struct*"
Local $aResult = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $iCodePage, "dword", $iFlags,  $sTextType, $vText, "int", -1, "ptr", 0, "int", 0)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, 0)
Local $iOut = $aResult[0]
Local $tOut = DllStructCreate("wchar[" & $iOut & "]")
$aResult = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $iCodePage, "dword", $iFlags, $sTextType, $vText,  "int", -1, "struct*", $tOut, "int", $iOut)
If @error Or Not $aResult[0] Then Return SetError(@error + 20, @extended, 0)
If $bRetString Then Return DllStructGetData($tOut, 1)
Return $tOut
EndFunc
Func _WinAPI_MultiByteToWideCharEx($sText, $pText, $iCodePage = 0, $iFlags = 0)
Local $aResult = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $iCodePage, "dword", $iFlags, "STR", $sText,  "int", -1, "struct*", $pText, "int", (StringLen($sText) + 1) * 2)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_OemToChar($sStr)
Local $aRet = DllCall('user32.dll', 'bool', 'OemToChar', 'str', $sStr, 'str', '')
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return $aRet[2]
EndFunc
Func _WinAPI_PointFromRect(ByRef $tRECT, $bCenter = True)
Local $iX1 = DllStructGetData($tRECT, "Left")
Local $iY1 = DllStructGetData($tRECT, "Top")
Local $iX2 = DllStructGetData($tRECT, "Right")
Local $iY2 = DllStructGetData($tRECT, "Bottom")
If $bCenter Then
$iX1 = $iX1 + (($iX2 - $iX1) / 2)
$iY1 = $iY1 + (($iY2 - $iY1) / 2)
EndIf
Local $tPoint = DllStructCreate($tagPOINT)
DllStructSetData($tPoint, "X", $iX1)
DllStructSetData($tPoint, "Y", $iY1)
Return $tPoint
EndFunc
Func _WinAPI_PrimaryLangId($iLngID)
Return BitAND($iLngID, 0x3FF)
EndFunc
Func _WinAPI_ScreenToClient($hWnd, ByRef $tPoint)
Local $aResult = DllCall("user32.dll", "bool", "ScreenToClient", "hwnd", $hWnd, "struct*", $tPoint)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_ShortToWord($iValue)
Return BitAND($iValue, 0x0000FFFF)
EndFunc
Func _WinAPI_StrFormatByteSize($iSize)
Local $aRet = DllCall('shlwapi.dll', 'ptr', 'StrFormatByteSizeW', 'int64', $iSize, 'wstr', '', 'uint', 1024)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return $aRet[2]
EndFunc
Func _WinAPI_StrFormatByteSizeEx($iSize)
Local $aSymbol = DllCall('kernel32.dll', 'int', 'GetLocaleInfoW', 'dword', 0x0400, 'dword', 0x000F, 'wstr', '', 'int', 2048)
If @error Then Return SetError(@error + 10, @extended, '')
Local $sSize = _WinAPI_StrFormatByteSize(0)
If @error Then Return SetError(@error, @extended, '')
Return StringReplace($sSize, '0', StringRegExpReplace(Number($iSize), '(?<=\d)(?=(\d{3})+\z)', $aSymbol[3]))
EndFunc
Func _WinAPI_StrFormatKBSize($iSize)
Local $aRet = DllCall('shlwapi.dll', 'ptr', 'StrFormatKBSizeW', 'int64', $iSize, 'wstr', '', 'uint', 1024)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return $aRet[2]
EndFunc
Func _WinAPI_StrFromTimeInterval($iTime, $iDigits = 7)
Local $aRet = DllCall('shlwapi.dll', 'int', 'StrFromTimeIntervalW', 'wstr', '', 'uint', 1024, 'dword', $iTime,  'int', $iDigits)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return StringStripWS($aRet[1], $STR_STRIPLEADING + $STR_STRIPTRAILING)
EndFunc
Func _WinAPI_StringFromGUID($tGUID)
Local $aResult = DllCall("ole32.dll", "int", "StringFromGUID2", "struct*", $tGUID, "wstr", "", "int", 40)
If @error Or Not $aResult[0] Then Return SetError(@error, @extended, "")
Return SetExtended($aResult[0], $aResult[2])
EndFunc
Func _WinAPI_SubLangId($iLngID)
Return BitShift($iLngID, 10)
EndFunc
Func _WinAPI_SwapDWord($iValue)
Local $tStruct1 = DllStructCreate('dword;dword')
Local $tStruct2 = DllStructCreate('byte[4];byte[4]', DllStructGetPtr($tStruct1))
DllStructSetData($tStruct1, 1, $iValue)
For $i = 1 To 4
DllStructSetData($tStruct2, 2, DllStructGetData($tStruct2, 1, 5 - $i), $i)
Next
Return DllStructGetData($tStruct1, 2)
EndFunc
Func _WinAPI_SwapQWord($iValue)
Local $tStruct1 = DllStructCreate('int64;int64')
Local $tStruct2 = DllStructCreate('byte[8];byte[8]', DllStructGetPtr($tStruct1))
DllStructSetData($tStruct1, 1, $iValue)
For $i = 1 To 8
DllStructSetData($tStruct2, 2, DllStructGetData($tStruct2, 1, 9 - $i), $i)
Next
Return DllStructGetData($tStruct1, 2)
EndFunc
Func _WinAPI_SwapWord($iValue)
Local $tStruct1 = DllStructCreate('word;word')
Local $tStruct2 = DllStructCreate('byte[2];byte[2]', DllStructGetPtr($tStruct1))
DllStructSetData($tStruct1, 1, $iValue)
For $i = 1 To 2
DllStructSetData($tStruct2, 2, DllStructGetData($tStruct2, 1, 3 - $i), $i)
Next
Return DllStructGetData($tStruct1, 2)
EndFunc
Func _WinAPI_WideCharToMultiByte($vUnicode, $iCodePage = 0, $bRetNoStruct = True, $bRetBinary = False)
Local $sUnicodeType = "wstr"
If Not IsString($vUnicode) Then $sUnicodeType = "struct*"
Local $aResult = DllCall("kernel32.dll", "int", "WideCharToMultiByte", "uint", $iCodePage, "dword", 0, $sUnicodeType, $vUnicode, "int", -1,  "ptr", 0, "int", 0, "ptr", 0, "ptr", 0)
If @error Or Not $aResult[0] Then Return SetError(@error + 20, @extended, "")
Local $tMultiByte = DllStructCreate((($bRetBinary) ? ("byte") : ("char")) & "[" & $aResult[0] & "]")
$aResult = DllCall("kernel32.dll", "int", "WideCharToMultiByte", "uint", $iCodePage, "dword", 0, $sUnicodeType, $vUnicode,  "int", -1, "struct*", $tMultiByte, "int", $aResult[0], "ptr", 0, "ptr", 0)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, "")
If $bRetNoStruct Then Return DllStructGetData($tMultiByte, 1)
Return $tMultiByte
EndFunc
Func _WinAPI_WordToShort($iValue)
If BitAND($iValue, 0x00008000) Then
Return BitOR($iValue, 0xFFFF8000)
EndIf
Return BitAND($iValue, 0x00007FFF)
EndFunc
#EndRegion Public Functions
#Region Global Variables and Constants
Global $__g_aInProcess_WinAPI[64][2] = [[0, 0]]
Global $__g_aWinList_WinAPI[64][2] = [[0, 0]]
Global Const $GW_HWNDFIRST = 0
Global Const $GW_HWNDLAST = 1
Global Const $GW_HWNDNEXT = 2
Global Const $GW_HWNDPREV = 3
Global Const $GW_OWNER = 4
Global Const $GW_CHILD = 5
Global Const $GW_ENABLEDPOPUP = 6
Global Const $GWL_WNDPROC = 0xFFFFFFFC
Global Const $GWL_HINSTANCE = 0xFFFFFFFA
Global Const $GWL_HWNDPARENT = 0xFFFFFFF8
Global Const $GWL_ID = 0xFFFFFFF4
Global Const $GWL_STYLE = 0xFFFFFFF0
Global Const $GWL_EXSTYLE = 0xFFFFFFEC
Global Const $GWL_USERDATA = 0xFFFFFFEB
Global Const $__WINAPICONSTANT_WM_SETFONT = 0x0030
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
#Region Public Functions
Func _WinAPI_CreateWindowEx($iExStyle, $sClass, $sName, $iStyle, $iX, $iY, $iWidth, $iHeight, $hParent, $hMenu = 0, $hInstance = 0, $pParam = 0)
If $hInstance = 0 Then $hInstance = _WinAPI_GetModuleHandle("")
Local $aResult = DllCall("user32.dll", "hwnd", "CreateWindowExW", "dword", $iExStyle, "wstr", $sClass, "wstr", $sName,  "dword", $iStyle, "int", $iX, "int", $iY, "int", $iWidth, "int", $iHeight, "hwnd", $hParent, "handle", $hMenu,  "handle", $hInstance, "struct*", $pParam)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetClientRect($hWnd)
Local $tRECT = DllStructCreate($tagRECT)
Local $aRet = DllCall("user32.dll", "bool", "GetClientRect", "hwnd", $hWnd, "struct*", $tRECT)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, 0)
Return $tRECT
EndFunc
Func _WinAPI_GetDesktopWindow()
Local $aResult = DllCall("user32.dll", "hwnd", "GetDesktopWindow")
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_DestroyWindow($hWnd)
Local $aResult = DllCall("user32.dll", "bool", "DestroyWindow", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_EnableWindow($hWnd, $bEnable = True)
Local $aResult = DllCall("user32.dll", "bool", "EnableWindow", "hwnd", $hWnd, "bool", $bEnable)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_EnumWindows($bVisible = True, $hWnd = Default)
__WinAPI_EnumWindowsInit()
If $hWnd = Default Then $hWnd = _WinAPI_GetDesktopWindow()
__WinAPI_EnumWindowsChild($hWnd, $bVisible)
Return $__g_aWinList_WinAPI
EndFunc
Func _WinAPI_EnumWindowsPopup()
__WinAPI_EnumWindowsInit()
Local $hWnd = _WinAPI_GetWindow(_WinAPI_GetDesktopWindow(), $GW_CHILD)
Local $sClass
While $hWnd <> 0
If _WinAPI_IsWindowVisible($hWnd) Then
$sClass = _WinAPI_GetClassName($hWnd)
If $sClass = "#32768" Then
__WinAPI_EnumWindowsAdd($hWnd)
ElseIf $sClass = "ToolbarWindow32" Then
__WinAPI_EnumWindowsAdd($hWnd)
ElseIf $sClass = "ToolTips_Class32" Then
__WinAPI_EnumWindowsAdd($hWnd)
ElseIf $sClass = "BaseBar" Then
__WinAPI_EnumWindowsChild($hWnd)
EndIf
EndIf
$hWnd = _WinAPI_GetWindow($hWnd, $GW_HWNDNEXT)
WEnd
Return $__g_aWinList_WinAPI
EndFunc
Func _WinAPI_EnumWindowsTop()
__WinAPI_EnumWindowsInit()
Local $hWnd = _WinAPI_GetWindow(_WinAPI_GetDesktopWindow(), $GW_CHILD)
While $hWnd <> 0
If _WinAPI_IsWindowVisible($hWnd) Then __WinAPI_EnumWindowsAdd($hWnd)
$hWnd = _WinAPI_GetWindow($hWnd, $GW_HWNDNEXT)
WEnd
Return $__g_aWinList_WinAPI
EndFunc
Func _WinAPI_GetClassName($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $aResult = DllCall("user32.dll", "int", "GetClassNameW", "hwnd", $hWnd, "wstr", "", "int", 4096)
If @error Or Not $aResult[0] Then Return SetError(@error, @extended, '')
Return SetExtended($aResult[0], $aResult[2])
EndFunc
Func _WinAPI_GetFocus()
Local $aResult = DllCall("user32.dll", "hwnd", "GetFocus")
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetParent($hWnd)
Local $aResult = DllCall("user32.dll", "hwnd", "GetParent", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetSysColor($iIndex)
Local $aResult = DllCall("user32.dll", "INT", "GetSysColor", "int", $iIndex)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetSystemMetrics($iIndex)
Local $aResult = DllCall("user32.dll", "int", "GetSystemMetrics", "int", $iIndex)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetWindow($hWnd, $iCmd)
Local $aResult = DllCall("user32.dll", "hwnd", "GetWindow", "hwnd", $hWnd, "uint", $iCmd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetWindowHeight($hWnd)
Local $tRECT = _WinAPI_GetWindowRect($hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return DllStructGetData($tRECT, "Bottom") - DllStructGetData($tRECT, "Top")
EndFunc
Func _WinAPI_GetWindowLong($hWnd, $iIndex)
Local $sFuncName = "GetWindowLongW"
If @AutoItX64 Then $sFuncName = "GetWindowLongPtrW"
Local $aResult = DllCall("user32.dll", "long_ptr", $sFuncName, "hwnd", $hWnd, "int", $iIndex)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetWindowRect($hWnd)
Local $tRECT = DllStructCreate($tagRECT)
Local $aRet = DllCall("user32.dll", "bool", "GetWindowRect", "hwnd", $hWnd, "struct*", $tRECT)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, 0)
Return $tRECT
EndFunc
Func _WinAPI_GetWindowText($hWnd)
Local $aResult = DllCall("user32.dll", "int", "GetWindowTextW", "hwnd", $hWnd, "wstr", "", "int", 4096)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, "")
Return SetExtended($aResult[0], $aResult[2])
EndFunc
Func _WinAPI_GetWindowThreadProcessId($hWnd, ByRef $iPID)
Local $aResult = DllCall("user32.dll", "dword", "GetWindowThreadProcessId", "hwnd", $hWnd, "dword*", 0)
If @error Then Return SetError(@error, @extended, 0)
$iPID = $aResult[2]
Return $aResult[0]
EndFunc
Func _WinAPI_GetWindowWidth($hWnd)
Local $tRECT = _WinAPI_GetWindowRect($hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return DllStructGetData($tRECT, "Right") - DllStructGetData($tRECT, "Left")
EndFunc
Func _WinAPI_InProcess($hWnd, ByRef $hLastWnd)
If $hWnd = $hLastWnd Then Return True
For $iI = $__g_aInProcess_WinAPI[0][0] To 1 Step -1
If $hWnd = $__g_aInProcess_WinAPI[$iI][0] Then
If $__g_aInProcess_WinAPI[$iI][1] Then
$hLastWnd = $hWnd
Return True
Else
Return False
EndIf
EndIf
Next
Local $iPID
_WinAPI_GetWindowThreadProcessId($hWnd, $iPID)
Local $iCount = $__g_aInProcess_WinAPI[0][0] + 1
If $iCount >= 64 Then $iCount = 1
$__g_aInProcess_WinAPI[0][0] = $iCount
$__g_aInProcess_WinAPI[$iCount][0] = $hWnd
$__g_aInProcess_WinAPI[$iCount][1] = ($iPID = @AutoItPID)
Return $__g_aInProcess_WinAPI[$iCount][1]
EndFunc
Func _WinAPI_InvalidateRect($hWnd, $tRECT = 0, $bErase = True)
Local $aResult = DllCall("user32.dll", "bool", "InvalidateRect", "hwnd", $hWnd, "struct*", $tRECT, "bool", $bErase)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_IsClassName($hWnd, $sClassName)
Local $sSeparator = Opt("GUIDataSeparatorChar")
Local $aClassName = StringSplit($sClassName, $sSeparator)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $sClassCheck = _WinAPI_GetClassName($hWnd)
For $x = 1 To UBound($aClassName) - 1
If StringUpper(StringMid($sClassCheck, 1, StringLen($aClassName[$x]))) = StringUpper($aClassName[$x]) Then Return True
Next
Return False
EndFunc
Func _WinAPI_IsWindow($hWnd)
Local $aResult = DllCall("user32.dll", "bool", "IsWindow", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_IsWindowVisible($hWnd)
Local $aResult = DllCall("user32.dll", "bool", "IsWindowVisible", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_MoveWindow($hWnd, $iX, $iY, $iWidth, $iHeight, $bRepaint = True)
Local $aResult = DllCall("user32.dll", "bool", "MoveWindow", "hwnd", $hWnd, "int", $iX, "int", $iY, "int", $iWidth,  "int", $iHeight, "bool", $bRepaint)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_SetFocus($hWnd)
Local $aResult = DllCall("user32.dll", "hwnd", "SetFocus", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_SetFont($hWnd, $hFont, $bRedraw = True)
_SendMessage($hWnd, $__WINAPICONSTANT_WM_SETFONT, $hFont, $bRedraw, 0, "hwnd")
EndFunc
Func _WinAPI_SetParent($hWndChild, $hWndParent)
Local $aResult = DllCall("user32.dll", "hwnd", "SetParent", "hwnd", $hWndChild, "hwnd", $hWndParent)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_SetWindowPos($hWnd, $hAfter, $iX, $iY, $iCX, $iCY, $iFlags)
Local $aResult = DllCall("user32.dll", "bool", "SetWindowPos", "hwnd", $hWnd, "hwnd", $hAfter, "int", $iX, "int", $iY,  "int", $iCX, "int", $iCY, "uint", $iFlags)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_SetWindowText($hWnd, $sText)
Local $aResult = DllCall("user32.dll", "bool", "SetWindowTextW", "hwnd", $hWnd, "wstr", $sText)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_ShowWindow($hWnd, $iCmdShow = 5)
Local $aResult = DllCall("user32.dll", "bool", "ShowWindow", "hwnd", $hWnd, "int", $iCmdShow)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_UpdateWindow($hWnd)
Local $aResult = DllCall("user32.dll", "bool", "UpdateWindow", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
#EndRegion Public Functions
#Region Internal Functions
Func __WinAPI_EnumWindowsAdd($hWnd, $sClass = "")
If $sClass = "" Then $sClass = _WinAPI_GetClassName($hWnd)
$__g_aWinList_WinAPI[0][0] += 1
Local $iCount = $__g_aWinList_WinAPI[0][0]
If $iCount >= $__g_aWinList_WinAPI[0][1] Then
ReDim $__g_aWinList_WinAPI[$iCount + 64][2]
$__g_aWinList_WinAPI[0][1] += 64
EndIf
$__g_aWinList_WinAPI[$iCount][0] = $hWnd
$__g_aWinList_WinAPI[$iCount][1] = $sClass
EndFunc
Func __WinAPI_EnumWindowsChild($hWnd, $bVisible = True)
$hWnd = _WinAPI_GetWindow($hWnd, $GW_CHILD)
While $hWnd <> 0
If (Not $bVisible) Or _WinAPI_IsWindowVisible($hWnd) Then
__WinAPI_EnumWindowsAdd($hWnd)
__WinAPI_EnumWindowsChild($hWnd, $bVisible)
EndIf
$hWnd = _WinAPI_GetWindow($hWnd, $GW_HWNDNEXT)
WEnd
EndFunc
Func __WinAPI_EnumWindowsInit()
ReDim $__g_aWinList_WinAPI[64][2]
$__g_aWinList_WinAPI[0][0] = 0
$__g_aWinList_WinAPI[0][1] = 64
EndFunc
#EndRegion Internal Functions
Global $__g_hSBLastWnd
Global Const $__STATUSBARCONSTANT_ClassName = "msctls_statusbar32"
Global Const $__STATUSBARCONSTANT_WM_SIZE = 0x05
Global Const $__STATUSBARCONSTANT_CLR_DEFAULT = 0xFF000000
Global Const $tagBORDERS = "int BX;int BY;int RX"
Func _GUICtrlStatusBar_Create($hWnd, $vPartEdge = -1, $vPartText = "", $iStyles = -1, $iExStyles = 0x00000000)
If Not IsHWnd($hWnd) Then Return SetError(1, 0, 0)
Local $iStyle = BitOR($__UDFGUICONSTANT_WS_CHILD, $__UDFGUICONSTANT_WS_VISIBLE)
If $iStyles = -1 Then $iStyles = 0x00000000
If $iExStyles = -1 Then $iExStyles = 0x00000000
Local $aPartWidth[1], $aPartText[1]
If @NumParams > 1 Then
If IsArray($vPartEdge) Then
$aPartWidth = $vPartEdge
Else
$aPartWidth[0] = $vPartEdge
EndIf
If @NumParams = 2 Then
ReDim $aPartText[UBound($aPartWidth)]
Else
If IsArray($vPartText) Then
$aPartText = $vPartText
Else
$aPartText[0] = $vPartText
EndIf
If UBound($aPartWidth) <> UBound($aPartText) Then
Local $iLast
If UBound($aPartWidth) > UBound($aPartText) Then
$iLast = UBound($aPartText)
ReDim $aPartText[UBound($aPartWidth)]
Else
$iLast = UBound($aPartWidth)
ReDim $aPartWidth[UBound($aPartText)]
For $x = $iLast To UBound($aPartWidth) - 1
$aPartWidth[$x] = $aPartWidth[$x - 1] + 75
Next
$aPartWidth[UBound($aPartText) - 1] = -1
EndIf
EndIf
EndIf
If Not IsHWnd($hWnd) Then $hWnd = HWnd($hWnd)
If @NumParams > 3 Then $iStyle = BitOR($iStyle, $iStyles)
EndIf
Local $nCtrlID = __UDF_GetNextGlobalID($hWnd)
If @error Then Return SetError(@error, @extended, 0)
Local $hWndSBar = _WinAPI_CreateWindowEx($iExStyles, $__STATUSBARCONSTANT_ClassName, "", $iStyle, 0, 0, 0, 0, $hWnd, $nCtrlID)
If @error Then Return SetError(@error, @extended, 0)
If @NumParams > 1 Then
_GUICtrlStatusBar_SetParts($hWndSBar, UBound($aPartWidth), $aPartWidth)
For $x = 0 To UBound($aPartText) - 1
_GUICtrlStatusBar_SetText($hWndSBar, $aPartText[$x], $x)
Next
EndIf
Return $hWndSBar
EndFunc
Func _GUICtrlStatusBar_Destroy(ByRef $hWnd)
If Not _WinAPI_IsClassName($hWnd, $__STATUSBARCONSTANT_ClassName) Then Return SetError(2, 2, False)
Local $iDestroyed = 0
If IsHWnd($hWnd) Then
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
Local $nCtrlID = _WinAPI_GetDlgCtrlID($hWnd)
Local $hParent = _WinAPI_GetParent($hWnd)
$iDestroyed = _WinAPI_DestroyWindow($hWnd)
Local $iRet = __UDF_FreeGlobalID($hParent, $nCtrlID)
If Not $iRet Then
EndIf
Else
Return SetError(1, 1, False)
EndIf
EndIf
If $iDestroyed Then $hWnd = 0
Return $iDestroyed <> 0
EndFunc
Func _GUICtrlStatusBar_EmbedControl($hWnd, $iPart, $hControl, $iFit = 4)
Local $aRect = _GUICtrlStatusBar_GetRect($hWnd, $iPart)
Local $iBarX = $aRect[0]
Local $iBarY = $aRect[1]
Local $iBarW = $aRect[2] - $iBarX
Local $iBarH = $aRect[3] - $iBarY
Local $iConX = $iBarX
Local $iConY = $iBarY
Local $iConW = _WinAPI_GetWindowWidth($hControl)
Local $iConH = _WinAPI_GetWindowHeight($hControl)
If $iConW > $iBarW Then $iConW = $iBarW
If $iConH > $iBarH Then $iConH = $iBarH
Local $iPadX = ($iBarW - $iConW) / 2
Local $iPadY = ($iBarH - $iConH) / 2
If $iPadX < 0 Then $iPadX = 0
If $iPadY < 0 Then $iPadY = 0
If BitAND($iFit, 1) = 1 Then $iConX = $iBarX + $iPadX
If BitAND($iFit, 2) = 2 Then $iConY = $iBarY + $iPadY
If BitAND($iFit, 4) = 4 Then
$iPadX = _GUICtrlStatusBar_GetBordersRect($hWnd)
$iPadY = _GUICtrlStatusBar_GetBordersVert($hWnd)
$iConX = $iBarX
If _GUICtrlStatusBar_IsSimple($hWnd) Then $iConX += $iPadX
$iConY = $iBarY + $iPadY
$iConW = $iBarW - ($iPadX * 2)
$iConH = $iBarH - ($iPadY * 2)
EndIf
_WinAPI_SetParent($hControl, $hWnd)
_WinAPI_MoveWindow($hControl, $iConX, $iConY, $iConW, $iConH)
EndFunc
Func _GUICtrlStatusBar_GetBorders($hWnd)
Local $tBorders = DllStructCreate($tagBORDERS)
Local $iRet
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
$iRet = _SendMessage($hWnd, $SB_GETBORDERS, 0, $tBorders, 0, "wparam", "struct*")
Else
Local $iSize = DllStructGetSize($tBorders)
Local $tMemMap
Local $pMemory = _MemInit($hWnd, $iSize, $tMemMap)
$iRet = _SendMessage($hWnd, $SB_GETBORDERS, 0, $pMemory, 0, "wparam", "ptr")
_MemRead($tMemMap, $pMemory, $tBorders, $iSize)
_MemFree($tMemMap)
EndIf
Local $aBorders[3]
If $iRet = 0 Then Return SetError(-1, -1, $aBorders)
$aBorders[0] = DllStructGetData($tBorders, "BX")
$aBorders[1] = DllStructGetData($tBorders, "BY")
$aBorders[2] = DllStructGetData($tBorders, "RX")
Return $aBorders
EndFunc
Func _GUICtrlStatusBar_GetBordersHorz($hWnd)
Local $aBorders = _GUICtrlStatusBar_GetBorders($hWnd)
Return SetError(@error, @extended, $aBorders[0])
EndFunc
Func _GUICtrlStatusBar_GetBordersRect($hWnd)
Local $aBorders = _GUICtrlStatusBar_GetBorders($hWnd)
Return SetError(@error, @extended, $aBorders[2])
EndFunc
Func _GUICtrlStatusBar_GetBordersVert($hWnd)
Local $aBorders = _GUICtrlStatusBar_GetBorders($hWnd)
Return SetError(@error, @extended, $aBorders[1])
EndFunc
Func _GUICtrlStatusBar_GetCount($hWnd)
Return _SendMessage($hWnd, $SB_GETPARTS)
EndFunc
Func _GUICtrlStatusBar_GetHeight($hWnd)
Local $tRECT = _GUICtrlStatusBar_GetRectEx($hWnd, 0)
Return DllStructGetData($tRECT, "Bottom") - DllStructGetData($tRECT, "Top") - (_GUICtrlStatusBar_GetBordersVert($hWnd) * 2)
EndFunc
Func _GUICtrlStatusBar_GetIcon($hWnd, $iIndex = 0)
Return _SendMessage($hWnd, $SB_GETICON, $iIndex, 0, 0, "wparam", "lparam", "handle")
EndFunc
Func _GUICtrlStatusBar_GetParts($hWnd)
Local $iCount = _GUICtrlStatusBar_GetCount($hWnd)
Local $tParts = DllStructCreate("int[" & $iCount & "]")
Local $aParts[$iCount + 1]
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
$aParts[0] = _SendMessage($hWnd, $SB_GETPARTS, $iCount, $tParts, 0, "wparam", "struct*")
Else
Local $iParts = DllStructGetSize($tParts)
Local $tMemMap
Local $pMemory = _MemInit($hWnd, $iParts, $tMemMap)
$aParts[0] = _SendMessage($hWnd, $SB_GETPARTS, $iCount, $pMemory, 0, "wparam", "ptr")
_MemRead($tMemMap, $pMemory, $tParts, $iParts)
_MemFree($tMemMap)
EndIf
For $iI = 1 To $iCount
$aParts[$iI] = DllStructGetData($tParts, 1, $iI)
Next
Return $aParts
EndFunc
Func _GUICtrlStatusBar_GetRect($hWnd, $iPart)
Local $tRECT = _GUICtrlStatusBar_GetRectEx($hWnd, $iPart)
If @error Then Return SetError(@error, 0, 0)
Local $aRect[4]
$aRect[0] = DllStructGetData($tRECT, "Left")
$aRect[1] = DllStructGetData($tRECT, "Top")
$aRect[2] = DllStructGetData($tRECT, "Right")
$aRect[3] = DllStructGetData($tRECT, "Bottom")
Return $aRect
EndFunc
Func _GUICtrlStatusBar_GetRectEx($hWnd, $iPart)
Local $tRECT = DllStructCreate($tagRECT)
Local $iRet
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
$iRet = _SendMessage($hWnd, $SB_GETRECT, $iPart, $tRECT, 0, "wparam", "struct*")
Else
Local $iRect = DllStructGetSize($tRECT)
Local $tMemMap
Local $pMemory = _MemInit($hWnd, $iRect, $tMemMap)
$iRet = _SendMessage($hWnd, $SB_GETRECT, $iPart, $pMemory, 0, "wparam", "ptr")
_MemRead($tMemMap, $pMemory, $tRECT, $iRect)
_MemFree($tMemMap)
EndIf
Return SetError($iRet = 0, 0, $tRECT)
EndFunc
Func _GUICtrlStatusBar_GetText($hWnd, $iPart)
Local $bUnicode = _GUICtrlStatusBar_GetUnicodeFormat($hWnd)
Local $iBuffer = _GUICtrlStatusBar_GetTextLength($hWnd, $iPart) + 1
If $iBuffer = 1 Then Return SetError(1, 0, "")
Local $tBuffer
If $bUnicode Then
$tBuffer = DllStructCreate("wchar Text[" & $iBuffer & "]")
$iBuffer *= 2
Else
$tBuffer = DllStructCreate("char Text[" & $iBuffer & "]")
EndIf
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
_SendMessage($hWnd, $SB_GETTEXTW, $iPart, $tBuffer, 0, "wparam", "struct*")
Else
Local $tMemMap
Local $pMemory = _MemInit($hWnd, $iBuffer, $tMemMap)
If $bUnicode Then
_SendMessage($hWnd, $SB_GETTEXTW, $iPart, $pMemory, 0, "wparam", "ptr")
Else
_SendMessage($hWnd, $SB_GETTEXT, $iPart, $pMemory, 0, "wparam", "ptr")
EndIf
_MemRead($tMemMap, $pMemory, $tBuffer, $iBuffer)
_MemFree($tMemMap)
EndIf
Return DllStructGetData($tBuffer, "Text")
EndFunc
Func _GUICtrlStatusBar_GetTextFlags($hWnd, $iPart)
If _GUICtrlStatusBar_GetUnicodeFormat($hWnd) Then
Return _SendMessage($hWnd, $SB_GETTEXTLENGTHW, $iPart)
Else
Return _SendMessage($hWnd, $SB_GETTEXTLENGTH, $iPart)
EndIf
EndFunc
Func _GUICtrlStatusBar_GetTextLength($hWnd, $iPart)
Return _WinAPI_LoWord(_GUICtrlStatusBar_GetTextFlags($hWnd, $iPart))
EndFunc
Func _GUICtrlStatusBar_GetTextLengthEx($hWnd, $iPart)
Return _WinAPI_HiWord(_GUICtrlStatusBar_GetTextFlags($hWnd, $iPart))
EndFunc
Func _GUICtrlStatusBar_GetTipText($hWnd, $iPart)
Local $bUnicode = _GUICtrlStatusBar_GetUnicodeFormat($hWnd)
Local $tBuffer
If $bUnicode Then
$tBuffer = DllStructCreate("wchar Text[4096]")
Else
$tBuffer = DllStructCreate("char Text[4096]")
EndIf
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
_SendMessage($hWnd, $SB_GETTIPTEXTW, _WinAPI_MakeLong($iPart, 4096), $tBuffer, 0, "wparam", "struct*")
Else
Local $tMemMap
Local $pMemory = _MemInit($hWnd, 4096, $tMemMap)
If $bUnicode Then
_SendMessage($hWnd, $SB_GETTIPTEXTW, _WinAPI_MakeLong($iPart, 4096), $pMemory, 0, "wparam", "ptr")
Else
_SendMessage($hWnd, $SB_GETTIPTEXTA, _WinAPI_MakeLong($iPart, 4096), $pMemory, 0, "wparam", "ptr")
EndIf
_MemRead($tMemMap, $pMemory, $tBuffer, 4096)
_MemFree($tMemMap)
EndIf
Return DllStructGetData($tBuffer, "Text")
EndFunc
Func _GUICtrlStatusBar_GetUnicodeFormat($hWnd)
Return _SendMessage($hWnd, $SB_GETUNICODEFORMAT) <> 0
EndFunc
Func _GUICtrlStatusBar_GetWidth($hWnd, $iPart)
Local $tRECT = _GUICtrlStatusBar_GetRectEx($hWnd, $iPart)
Return DllStructGetData($tRECT, "Right") - DllStructGetData($tRECT, "Left") - (_GUICtrlStatusBar_GetBordersHorz($hWnd) * 2)
EndFunc
Func _GUICtrlStatusBar_IsSimple($hWnd)
Return _SendMessage($hWnd, $SB_ISSIMPLE) <> 0
EndFunc
Func _GUICtrlStatusBar_Resize($hWnd)
_SendMessage($hWnd, $__STATUSBARCONSTANT_WM_SIZE)
EndFunc
Func _GUICtrlStatusBar_SetBkColor($hWnd, $iColor)
$iColor = _SendMessage($hWnd, $SB_SETBKCOLOR, 0, $iColor)
EndFunc
Func _GUICtrlStatusBar_SetIcon($hWnd, $iPart, $hIcon = -1, $sIconFile = "")
If $hIcon = -1 Then Return _SendMessage($hWnd, $SB_SETICON, $iPart, $hIcon, 0, "wparam", "handle") <> 0
If StringLen($sIconFile) <= 0 Then Return _SendMessage($hWnd, $SB_SETICON, $iPart, $hIcon) <> 0
Local $tIcon = DllStructCreate("handle")
Local $vResult = DllCall("shell32.dll", "uint", "ExtractIconExW", "wstr", $sIconFile, "int", $hIcon, "ptr", 0, "struct*", $tIcon, "uint", 1)
If @error Then Return SetError(@error, @extended, False)
$vResult = $vResult[0]
If $vResult > 0 Then $vResult = _SendMessage($hWnd, $SB_SETICON, $iPart, DllStructGetData($tIcon, 1), 0, "wparam", "handle")
DllCall("user32.dll", "bool", "DestroyIcon", "handle", DllStructGetData($tIcon, 1))
Return $vResult
EndFunc
Func _GUICtrlStatusBar_SetMinHeight($hWnd, $iMinHeight)
_SendMessage($hWnd, $SB_SETMINHEIGHT, $iMinHeight)
_GUICtrlStatusBar_Resize($hWnd)
EndFunc
Func _GUICtrlStatusBar_SetParts($hWnd, $vPartEdge = -1, $vPartWidth = 25)
If IsArray($vPartEdge) And IsArray($vPartWidth) Then Return False
Local $tParts, $iParts
If IsArray($vPartEdge) Then
$vPartEdge[UBound($vPartEdge) - 1] = -1
$iParts = UBound($vPartEdge)
$tParts = DllStructCreate("int[" & $iParts & "]")
For $x = 0 To $iParts - 2
DllStructSetData($tParts, 1, $vPartEdge[$x], $x + 1)
Next
DllStructSetData($tParts, 1, -1, $iParts)
Else
If $vPartEdge < -1 Then Return False
If IsArray($vPartWidth) Then
$iParts = UBound($vPartWidth)
$tParts = DllStructCreate("int[" & $iParts & "]")
Local $iPartRightEdge = 0
For $x = 0 To $iParts - 2
$iPartRightEdge += $vPartWidth[$x]
If $vPartWidth[$x] <= 0 Then Return False
DllStructSetData($tParts, 1, $iPartRightEdge, $x + 1)
Next
DllStructSetData($tParts, 1, -1, $iParts)
ElseIf $vPartEdge > 1 Then
$iParts = $vPartEdge
$tParts = DllStructCreate("int[" & $iParts & "]")
For $x = 1 To $iParts - 1
DllStructSetData($tParts, 1, $vPartWidth * $x, $x)
Next
DllStructSetData($tParts, 1, -1, $iParts)
Else
$iParts = 1
$tParts = DllStructCreate("int")
DllStructSetData($tParts, 1, -1)
EndIf
EndIf
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
_SendMessage($hWnd, $SB_SETPARTS, $iParts, $tParts, 0, "wparam", "struct*")
Else
Local $iSize = DllStructGetSize($tParts)
Local $tMemMap
Local $pMemory = _MemInit($hWnd, $iSize, $tMemMap)
_MemWrite($tMemMap, $tParts)
_SendMessage($hWnd, $SB_SETPARTS, $iParts, $pMemory, 0, "wparam", "ptr")
_MemFree($tMemMap)
EndIf
_GUICtrlStatusBar_Resize($hWnd)
Return True
EndFunc
Func _GUICtrlStatusBar_SetSimple($hWnd, $bSimple = True)
_SendMessage($hWnd, $SB_SIMPLE, $bSimple)
EndFunc
Func _GUICtrlStatusBar_SetText($hWnd, $sText = "", $iPart = 0, $iUFlag = 0)
Local $bUnicode = _GUICtrlStatusBar_GetUnicodeFormat($hWnd)
Local $iBuffer = StringLen($sText) + 1
Local $tText
If $bUnicode Then
$tText = DllStructCreate("wchar Text[" & $iBuffer & "]")
$iBuffer *= 2
Else
$tText = DllStructCreate("char Text[" & $iBuffer & "]")
EndIf
DllStructSetData($tText, "Text", $sText)
If _GUICtrlStatusBar_IsSimple($hWnd) Then $iPart = $SB_SIMPLEID
Local $iRet
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
$iRet = _SendMessage($hWnd, $SB_SETTEXTW, BitOR($iPart, $iUFlag), $tText, 0, "wparam", "struct*")
Else
Local $tMemMap
Local $pMemory = _MemInit($hWnd, $iBuffer, $tMemMap)
_MemWrite($tMemMap, $tText)
If $bUnicode Then
$iRet = _SendMessage($hWnd, $SB_SETTEXTW, BitOR($iPart, $iUFlag), $pMemory, 0, "wparam", "ptr")
Else
$iRet = _SendMessage($hWnd, $SB_SETTEXT, BitOR($iPart, $iUFlag), $pMemory, 0, "wparam", "ptr")
EndIf
_MemFree($tMemMap)
EndIf
Return $iRet <> 0
EndFunc
Func _GUICtrlStatusBar_SetTipText($hWnd, $iPart, $sText)
Local $bUnicode = _GUICtrlStatusBar_GetUnicodeFormat($hWnd)
Local $iBuffer = StringLen($sText) + 1
Local $tText
If $bUnicode Then
$tText = DllStructCreate("wchar TipText[" & $iBuffer & "]")
$iBuffer *= 2
Else
$tText = DllStructCreate("char TipText[" & $iBuffer & "]")
EndIf
DllStructSetData($tText, "TipText", $sText)
If _WinAPI_InProcess($hWnd, $__g_hSBLastWnd) Then
_SendMessage($hWnd, $SB_SETTIPTEXTW, $iPart, $tText, 0, "wparam", "struct*")
Else
Local $tMemMap
Local $pMemory = _MemInit($hWnd, $iBuffer, $tMemMap)
_MemWrite($tMemMap, $tText, $pMemory, $iBuffer)
If $bUnicode Then
_SendMessage($hWnd, $SB_SETTIPTEXTW, $iPart, $pMemory, 0, "wparam", "ptr")
Else
_SendMessage($hWnd, $SB_SETTIPTEXTA, $iPart, $pMemory, 0, "wparam", "ptr")
EndIf
_MemFree($tMemMap)
EndIf
EndFunc
Func _GUICtrlStatusBar_SetUnicodeFormat($hWnd, $bUnicode = True)
Return _SendMessage($hWnd, $SB_SETUNICODEFORMAT, $bUnicode)
EndFunc
Func _GUICtrlStatusBar_ShowHide($hWnd, $iState)
If $iState <> @SW_HIDE And $iState <> @SW_SHOW Then Return SetError(1, 1, False)
Return _WinAPI_ShowWindow($hWnd, $iState)
EndFunc
Global Const $TTF_IDISHWND = 0x00000001
Global Const $TTF_CENTERTIP = 0x00000002
Global Const $TTF_RTLREADING = 0x00000004
Global Const $TTF_SUBCLASS = 0x00000010
Global Const $TTF_TRACK = 0x00000020
Global Const $TTF_ABSOLUTE = 0x00000080
Global Const $TTF_TRANSPARENT = 0x00000100
Global Const $TTF_PARSELINKS = 0x00001000
Global Const $TTF_DI_SETITEM = 0x00008000
Global Const $__TOOLTIPCONSTANTS_WM_USER = 0X400
Global Const $TTM_ACTIVATE = $__TOOLTIPCONSTANTS_WM_USER + 1
Global Const $TTM_SETDELAYTIME = $__TOOLTIPCONSTANTS_WM_USER + 3
Global Const $TTM_ADDTOOL = $__TOOLTIPCONSTANTS_WM_USER + 4
Global Const $TTM_DELTOOL = $__TOOLTIPCONSTANTS_WM_USER + 5
Global Const $TTM_NEWTOOLRECT = $__TOOLTIPCONSTANTS_WM_USER + 6
Global Const $TTM_GETTOOLINFO = $__TOOLTIPCONSTANTS_WM_USER + 8
Global Const $TTM_SETTOOLINFO = $__TOOLTIPCONSTANTS_WM_USER + 9
Global Const $TTM_HITTEST = $__TOOLTIPCONSTANTS_WM_USER + 10
Global Const $TTM_GETTEXT = $__TOOLTIPCONSTANTS_WM_USER + 11
Global Const $TTM_UPDATETIPTEXT = $__TOOLTIPCONSTANTS_WM_USER + 12
Global Const $TTM_GETTOOLCOUNT = $__TOOLTIPCONSTANTS_WM_USER + 13
Global Const $TTM_ENUMTOOLS = $__TOOLTIPCONSTANTS_WM_USER + 14
Global Const $TTM_GETCURRENTTOOL = $__TOOLTIPCONSTANTS_WM_USER + 15
Global Const $TTM_WINDOWFROMPOINT = $__TOOLTIPCONSTANTS_WM_USER + 16
Global Const $TTM_TRACKACTIVATE = $__TOOLTIPCONSTANTS_WM_USER + 17
Global Const $TTM_TRACKPOSITION = $__TOOLTIPCONSTANTS_WM_USER + 18
Global Const $TTM_SETTIPBKCOLOR = $__TOOLTIPCONSTANTS_WM_USER + 19
Global Const $TTM_SETTIPTEXTCOLOR = $__TOOLTIPCONSTANTS_WM_USER + 20
Global Const $TTM_GETDELAYTIME = $__TOOLTIPCONSTANTS_WM_USER + 21
Global Const $TTM_GETTIPBKCOLOR = $__TOOLTIPCONSTANTS_WM_USER + 22
Global Const $TTM_GETTIPTEXTCOLOR = $__TOOLTIPCONSTANTS_WM_USER + 23
Global Const $TTM_SETMAXTIPWIDTH = $__TOOLTIPCONSTANTS_WM_USER + 24
Global Const $TTM_GETMAXTIPWIDTH = $__TOOLTIPCONSTANTS_WM_USER + 25
Global Const $TTM_SETMARGIN = $__TOOLTIPCONSTANTS_WM_USER + 26
Global Const $TTM_GETMARGIN = $__TOOLTIPCONSTANTS_WM_USER + 27
Global Const $TTM_POP = $__TOOLTIPCONSTANTS_WM_USER + 28
Global Const $TTM_UPDATE = $__TOOLTIPCONSTANTS_WM_USER + 29
Global Const $TTM_GETBUBBLESIZE = $__TOOLTIPCONSTANTS_WM_USER + 30
Global Const $TTM_ADJUSTRECT = $__TOOLTIPCONSTANTS_WM_USER + 31
Global Const $TTM_SETTITLE = $__TOOLTIPCONSTANTS_WM_USER + 32
Global Const $TTM_SETTITLEW = $__TOOLTIPCONSTANTS_WM_USER + 33
Global Const $TTM_POPUP = $__TOOLTIPCONSTANTS_WM_USER + 34
Global Const $TTM_GETTITLE = $__TOOLTIPCONSTANTS_WM_USER + 35
Global Const $TTM_ADDTOOLW = $__TOOLTIPCONSTANTS_WM_USER + 50
Global Const $TTM_DELTOOLW = $__TOOLTIPCONSTANTS_WM_USER + 51
Global Const $TTM_NEWTOOLRECTW = $__TOOLTIPCONSTANTS_WM_USER + 52
Global Const $TTM_GETTOOLINFOW = $__TOOLTIPCONSTANTS_WM_USER + 53
Global Const $TTM_SETTOOLINFOW = $__TOOLTIPCONSTANTS_WM_USER + 54
Global Const $TTM_HITTESTW = $__TOOLTIPCONSTANTS_WM_USER + 55
Global Const $TTM_GETTEXTW = $__TOOLTIPCONSTANTS_WM_USER + 56
Global Const $TTM_UPDATETIPTEXTW = $__TOOLTIPCONSTANTS_WM_USER + 57
Global Const $TTM_ENUMTOOLSW = $__TOOLTIPCONSTANTS_WM_USER + 58
Global Const $TTM_GETCURRENTTOOLW = $__TOOLTIPCONSTANTS_WM_USER + 59
Global Const $TTM_SETWINDOWTHEME = 0x2000 + 11
Global Const $TTN_FIRST = -520
Global Const $TTN_GETDISPINFO = $TTN_FIRST - 0
Global Const $TTN_SHOW = $TTN_FIRST - 1
Global Const $TTN_POP = $TTN_FIRST - 2
Global Const $TTN_LINKCLICK = $TTN_FIRST - 3
Global Const $TTN_GETDISPINFOW = $TTN_FIRST - 10
Global Const $TTS_ALWAYSTIP = 0x00000001
Global Const $TTS_NOPREFIX = 0x00000002
Global Const $TTS_NOANIMATE = 0x00000010
Global Const $TTS_NOFADE = 0x00000020
Global Const $TTS_BALLOON = 0x00000040
Global Const $TTS_CLOSE = 0x00000080
Global Const $TTS_USEVISUALSTYLE = 0x00000100
Global Const $TTDT_AUTOMATIC = 0
Global Const $TTDT_RESHOW = 1
Global Const $TTDT_AUTOPOP = 2
Global Const $TTDT_INITIAL = 3
Global Enum $TTI_NONE, $TTI_INFO, $TTI_WARNING, $TTI_ERROR, $TTI_INFO_LARGE, $TTI_WARNING_LARGE, $TTI_ERROR_LARGE
#Region Global Variables and Constants
Global Const $DUPLICATE_CLOSE_SOURCE = 0x00000001
Global Const $DUPLICATE_SAME_ACCESS = 0x00000002
Global Const $OBJ_BITMAP = 7
Global Const $OBJ_BRUSH = 2
Global Const $OBJ_COLORSPACE = 14
Global Const $OBJ_DC = 3
Global Const $OBJ_ENHMETADC = 12
Global Const $OBJ_ENHMETAFILE = 13
Global Const $OBJ_EXTPEN = 11
Global Const $OBJ_FONT = 6
Global Const $OBJ_MEMDC = 10
Global Const $OBJ_METADC = 4
Global Const $OBJ_METAFILE = 9
Global Const $OBJ_PAL = 5
Global Const $OBJ_PEN = 1
Global Const $OBJ_REGION = 8
Global Const $NULL_BRUSH = 5
Global Const $NULL_PEN = 8
Global Const $BLACK_BRUSH = 4
Global Const $DKGRAY_BRUSH = 3
Global Const $DC_BRUSH = 18
Global Const $GRAY_BRUSH = 2
Global Const $HOLLOW_BRUSH = $NULL_BRUSH
Global Const $LTGRAY_BRUSH = 1
Global Const $WHITE_BRUSH = 0
Global Const $BLACK_PEN = 7
Global Const $DC_PEN = 19
Global Const $WHITE_PEN = 6
Global Const $ANSI_FIXED_FONT = 11
Global Const $ANSI_VAR_FONT = 12
Global Const $DEVICE_DEFAULT_FONT = 14
Global Const $DEFAULT_GUI_FONT = 17
Global Const $OEM_FIXED_FONT = 10
Global Const $SYSTEM_FONT = 13
Global Const $SYSTEM_FIXED_FONT = 16
Global Const $DEFAULT_PALETTE = 15
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
#Region Public Functions
Func _WinAPI_CloseHandle($hObject)
Local $aResult = DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hObject)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_DeleteObject($hObject)
Local $aResult = DllCall("gdi32.dll", "bool", "DeleteObject", "handle", $hObject)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_DuplicateHandle($hSourceProcessHandle, $hSourceHandle, $hTargetProcessHandle, $iDesiredAccess, $iInheritHandle, $iOptions)
Local $aResult = DllCall("kernel32.dll", "bool", "DuplicateHandle",  "handle", $hSourceProcessHandle,  "handle", $hSourceHandle,  "handle", $hTargetProcessHandle,  "handle*", 0,  "dword", $iDesiredAccess,  "bool", $iInheritHandle,  "dword", $iOptions)
If @error Or Not $aResult[0] Then Return SetError(@error, @extended, 0)
Return $aResult[4]
EndFunc
Func _WinAPI_GetCurrentObject($hDC, $iType)
Local $aRet = DllCall('gdi32.dll', 'handle', 'GetCurrentObject', 'handle', $hDC, 'uint', $iType)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetCurrentProcess()
Local $aResult = DllCall("kernel32.dll", "handle", "GetCurrentProcess")
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetObject($hObject, $iSize, $pObject)
Local $aResult = DllCall("gdi32.dll", "int", "GetObjectW", "handle", $hObject, "int", $iSize, "struct*", $pObject)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetObjectInfoByHandle($hObject)
Local $tagPUBLIC_OBJECT_BASIC_INFORMATION = 'ulong Attributes;ulong GrantedAcess;ulong HandleCount;ulong PointerCount;ulong Reserved[10]'
Local $tPOBI = DllStructCreate($tagPUBLIC_OBJECT_BASIC_INFORMATION)
Local $aRet = DllCall('ntdll.dll', 'long', 'ZwQueryObject', 'handle', $hObject, 'uint', 0, 'struct*', $tPOBI,  'ulong', DllStructGetSize($tPOBI), 'ptr', 0)
If @error Then Return SetError(@error, @extended, 0)
If $aRet[0] Then Return SetError(10, $aRet[0], 0)
Local $aResult[4]
For $i = 0 To 3
$aResult[$i] = DllStructGetData($tPOBI, $i + 1)
Next
Return $aResult
EndFunc
Func _WinAPI_GetObjectNameByHandle($hObject)
Local $tagUNICODE_STRING = 'struct;ushort Length;ushort MaximumLength;ptr Buffer;endstruct'
Local $tagPUBLIC_OBJECT_TYPE_INFORMATION = 'struct;' & $tagUNICODE_STRING & ';ulong Reserved[22];endstruct'
Local $tPOTI = DllStructCreate($tagPUBLIC_OBJECT_TYPE_INFORMATION & ';byte[32]')
Local $aRet = DllCall('ntdll.dll', 'long', 'ZwQueryObject', 'handle', $hObject, 'uint', 2, 'struct*', $tPOTI,  'ulong', DllStructGetSize($tPOTI), 'ulong*', 0)
If @error Then Return SetError(@error, @extended, '')
If $aRet[0] Then Return SetError(10, $aRet[0], '')
Local $pData = DllStructGetData($tPOTI, 3)
If Not $pData Then Return SetError(11, 0, '')
Return _WinAPI_GetString($pData)
EndFunc
Func _WinAPI_GetObjectType($hObject)
Local $aRet = DllCall('gdi32.dll', 'dword', 'GetObjectType', 'handle', $hObject)
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetStdHandle($iStdHandle)
If $iStdHandle < 0 Or $iStdHandle > 2 Then Return SetError(2, 0, -1)
Local Const $aHandle[3] = [-10, -11, -12]
Local $aResult = DllCall("kernel32.dll", "handle", "GetStdHandle", "dword", $aHandle[$iStdHandle])
If @error Then Return SetError(@error, @extended, -1)
Return $aResult[0]
EndFunc
Func _WinAPI_GetStockObject($iObject)
Local $aResult = DllCall("gdi32.dll", "handle", "GetStockObject", "int", $iObject)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_SelectObject($hDC, $hGDIObj)
Local $aResult = DllCall("gdi32.dll", "handle", "SelectObject", "handle", $hDC, "handle", $hGDIObj)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_SetHandleInformation($hObject, $iMask, $iFlags)
Local $aResult = DllCall("kernel32.dll", "bool", "SetHandleInformation", "handle", $hObject, "dword", $iMask, "dword", $iFlags)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
#EndRegion Public Functions
Global $__g_hEditLastWnd
Global Const $__EDITCONSTANT_ClassName = "Edit"
Global Const $__EDITCONSTANT_GUI_CHECKED = 1
Global Const $__EDITCONSTANT_GUI_HIDE = 32
Global Const $__EDITCONSTANT_GUI_EVENT_CLOSE = -3
Global Const $__EDITCONSTANT_GUI_ENABLE = 64
Global Const $__EDITCONSTANT_GUI_DISABLE = 128
Global Const $__EDITCONSTANT_SS_CENTER = 1
Global Const $__EDITCONSTANT_WM_SETREDRAW = 0x000B
Global Const $__EDITCONSTANT_WS_CAPTION = 0x00C00000
Global Const $__EDITCONSTANT_WS_POPUP = 0x80000000
Global Const $__EDITCONSTANT_WS_SYSMENU = 0x00080000
Global Const $__EDITCONSTANT_WS_MINIMIZEBOX = 0x00020000
Global Const $__EDITCONSTANT_DEFAULT_GUI_FONT = 17
Global Const $__EDITCONSTANT_WM_SETFONT = 0x0030
Global Const $__EDITCONSTANT_WM_GETTEXTLENGTH = 0x000E
Global Const $__EDITCONSTANT_WM_GETTEXT = 0x000D
Global Const $__EDITCONSTANT_WM_SETTEXT = 0x000C
Global Const $__EDITCONSTANT_SB_LINEUP = 0
Global Const $__EDITCONSTANT_SB_LINEDOWN = 1
Global Const $__EDITCONSTANT_SB_PAGEDOWN = 3
Global Const $__EDITCONSTANT_SB_PAGEUP = 2
Global Const $__EDITCONSTANT_SB_SCROLLCARET = 4
Global Const $__tagEDITBALLOONTIP = "dword Size;ptr Title;ptr Text;int Icon"
Func _GUICtrlEdit_AppendText($hWnd, $sText)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $iLength = _GUICtrlEdit_GetTextLen($hWnd)
_GUICtrlEdit_SetSel($hWnd, $iLength, $iLength)
_SendMessage($hWnd, $EM_REPLACESEL, True, $sText, 0, "wparam", "wstr")
EndFunc
Func _GUICtrlEdit_BeginUpdate($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $__EDITCONSTANT_WM_SETREDRAW, False) = 0
EndFunc
Func _GUICtrlEdit_CanUndo($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_CANUNDO) <> 0
EndFunc
Func _GUICtrlEdit_CharFromPos($hWnd, $iX, $iY)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $aReturn[2]
Local $iRet = _SendMessage($hWnd, $EM_CHARFROMPOS, 0, _WinAPI_MakeLong($iX, $iY))
$aReturn[0] = _WinAPI_LoWord($iRet)
$aReturn[1] = _WinAPI_HiWord($iRet)
Return $aReturn
EndFunc
Func _GUICtrlEdit_Create($hWnd, $sText, $iX, $iY, $iWidth = 150, $iHeight = 150, $iStyle = 0x003010C4, $iExStyle = 0x00000200)
If Not IsHWnd($hWnd) Then Return SetError(1, 0, 0)
If Not IsString($sText) Then Return SetError(2, 0, 0)
If $iWidth = -1 Then $iWidth = 150
If $iHeight = -1 Then $iHeight = 150
If $iStyle = -1 Then $iStyle = 0x003010C4
If $iExStyle = -1 Then $iExStyle = 0x00000200
If BitAND($iStyle, $ES_READONLY) = $ES_READONLY Then
$iStyle = BitOR($__UDFGUICONSTANT_WS_CHILD, $__UDFGUICONSTANT_WS_VISIBLE, $iStyle)
Else
$iStyle = BitOR($__UDFGUICONSTANT_WS_CHILD, $__UDFGUICONSTANT_WS_VISIBLE, $__UDFGUICONSTANT_WS_TABSTOP, $iStyle)
EndIf
Local $nCtrlID = __UDF_GetNextGlobalID($hWnd)
If @error Then Return SetError(@error, @extended, 0)
Local $hEdit = _WinAPI_CreateWindowEx($iExStyle, $__EDITCONSTANT_ClassName, "", $iStyle, $iX, $iY, $iWidth, $iHeight, $hWnd, $nCtrlID)
_SendMessage($hEdit, $__EDITCONSTANT_WM_SETFONT, _WinAPI_GetStockObject($__EDITCONSTANT_DEFAULT_GUI_FONT), True)
_GUICtrlEdit_SetText($hEdit, $sText)
_GUICtrlEdit_SetLimitText($hEdit, 0)
Return $hEdit
EndFunc
Func _GUICtrlEdit_Destroy(ByRef $hWnd)
If Not _WinAPI_IsClassName($hWnd, $__EDITCONSTANT_ClassName) Then Return SetError(2, 2, False)
Local $iDestroyed = 0
If IsHWnd($hWnd) Then
If _WinAPI_InProcess($hWnd, $__g_hEditLastWnd) Then
Local $nCtrlID = _WinAPI_GetDlgCtrlID($hWnd)
Local $hParent = _WinAPI_GetParent($hWnd)
$iDestroyed = _WinAPI_DestroyWindow($hWnd)
Local $iRet = __UDF_FreeGlobalID($hParent, $nCtrlID)
If Not $iRet Then
EndIf
Else
Return SetError(1, 1, False)
EndIf
Else
$iDestroyed = GUICtrlDelete($hWnd)
EndIf
If $iDestroyed Then $hWnd = 0
Return $iDestroyed <> 0
EndFunc
Func _GUICtrlEdit_EmptyUndoBuffer($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_EMPTYUNDOBUFFER)
EndFunc
Func _GUICtrlEdit_EndUpdate($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $__EDITCONSTANT_WM_SETREDRAW, True) = 0
EndFunc
Func _GUICtrlEdit_FmtLines($hWnd, $bSoftBreak = False)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_FMTLINES, $bSoftBreak)
EndFunc
Func _GUICtrlEdit_Find($hWnd, $bReplace = False)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $iPos = 0, $iCase, $iOccurance = 0, $iReplacements = 0
Local $aPartsRightEdge[3] = [125, 225, -1]
Local $iOldMode = Opt("GUIOnEventMode", 0)
Local $aSel = _GUICtrlEdit_GetSel($hWnd)
Local $sText = _GUICtrlEdit_GetText($hWnd)
Local $hGuiSearch = GUICreate("Find", 349, 177, -1, -1, BitOR($__UDFGUICONSTANT_WS_CHILD, $__EDITCONSTANT_WS_MINIMIZEBOX, $__EDITCONSTANT_WS_CAPTION, $__EDITCONSTANT_WS_POPUP, $__EDITCONSTANT_WS_SYSMENU))
Local $idStatusBar1 = _GUICtrlStatusBar_Create($hGuiSearch, $aPartsRightEdge)
_GUICtrlStatusBar_SetText($idStatusBar1, "Find: ")
GUISetIcon(@SystemDir & "\shell32.dll", 22, $hGuiSearch)
GUICtrlCreateLabel("Find what:", 9, 10, 53, 16, $__EDITCONSTANT_SS_CENTER)
Local $idInputSearch = GUICtrlCreateInput("", 80, 8, 257, 21)
Local $idLblReplace = GUICtrlCreateLabel("Replace with:", 9, 42, 69, 17, $__EDITCONSTANT_SS_CENTER)
Local $idInputReplace = GUICtrlCreateInput("", 80, 40, 257, 21)
Local $idChkWholeOnly = GUICtrlCreateCheckbox("Match whole word only", 9, 72, 145, 17)
Local $idChkMatchCase = GUICtrlCreateCheckbox("Match case", 9, 96, 145, 17)
Local $idBtnFindNext = GUICtrlCreateButton("Find Next", 168, 72, 161, 21, 0)
Local $idBtnReplace = GUICtrlCreateButton("Replace", 168, 96, 161, 21, 0)
Local $idBtnClose = GUICtrlCreateButton("Close", 104, 130, 161, 21, 0)
If (IsArray($aSel) And $aSel <> $EC_ERR) Then
GUICtrlSetData($idInputSearch, StringMid($sText, $aSel[0] + 1, $aSel[1] - $aSel[0]))
If $aSel[0] <> $aSel[1] Then
$iPos = $aSel[0]
If BitAND(GUICtrlRead($idChkMatchCase), $__EDITCONSTANT_GUI_CHECKED) = $__EDITCONSTANT_GUI_CHECKED Then $iCase = 1
$iOccurance = 1
Local $iTPose
While 1
$iTPose = StringInStr($sText, GUICtrlRead($idInputSearch), $iCase, $iOccurance)
If Not $iTPose Then
$iOccurance = 0
ExitLoop
ElseIf $iTPose = $iPos + 1 Then
ExitLoop
EndIf
$iOccurance += 1
WEnd
EndIf
_GUICtrlStatusBar_SetText($idStatusBar1, "Find: " & GUICtrlRead($idInputSearch))
EndIf
If $bReplace = False Then
GUICtrlSetState($idLblReplace, $__EDITCONSTANT_GUI_HIDE)
GUICtrlSetState($idInputReplace, $__EDITCONSTANT_GUI_HIDE)
GUICtrlSetState($idBtnReplace, $__EDITCONSTANT_GUI_HIDE)
Else
_GUICtrlStatusBar_SetText($idStatusBar1, "Replacements: " & $iReplacements, 1)
_GUICtrlStatusBar_SetText($idStatusBar1, "With: ", 2)
EndIf
GUISetState(@SW_SHOW)
Local $iMsgFind
While 1
$iMsgFind = GUIGetMsg()
Select
Case $iMsgFind = $__EDITCONSTANT_GUI_EVENT_CLOSE Or $iMsgFind = $idBtnClose
ExitLoop
Case $iMsgFind = $idBtnFindNext
GUICtrlSetState($idBtnFindNext, $__EDITCONSTANT_GUI_DISABLE)
GUICtrlSetCursor($idBtnFindNext, 15)
Sleep(100)
_GUICtrlStatusBar_SetText($idStatusBar1, "Find: " & GUICtrlRead($idInputSearch))
If $bReplace = True Then
_GUICtrlStatusBar_SetText($idStatusBar1, "Find: " & GUICtrlRead($idInputSearch))
_GUICtrlStatusBar_SetText($idStatusBar1, "With: " & GUICtrlRead($idInputReplace), 2)
EndIf
__GUICtrlEdit_FindText($hWnd, $idInputSearch, $idChkMatchCase, $idChkWholeOnly, $iPos, $iOccurance, $iReplacements)
Sleep(100)
GUICtrlSetState($idBtnFindNext, $__EDITCONSTANT_GUI_ENABLE)
GUICtrlSetCursor($idBtnFindNext, 2)
Case $iMsgFind = $idBtnReplace
GUICtrlSetState($idBtnReplace, $__EDITCONSTANT_GUI_DISABLE)
GUICtrlSetCursor($idBtnReplace, 15)
Sleep(100)
_GUICtrlStatusBar_SetText($idStatusBar1, "Find: " & GUICtrlRead($idInputSearch))
_GUICtrlStatusBar_SetText($idStatusBar1, "With: " & GUICtrlRead($idInputReplace), 2)
If $iPos Then
_GUICtrlEdit_ReplaceSel($hWnd, GUICtrlRead($idInputReplace))
$iReplacements += 1
$iOccurance -= 1
_GUICtrlStatusBar_SetText($idStatusBar1, "Replacements: " & $iReplacements, 1)
EndIf
__GUICtrlEdit_FindText($hWnd, $idInputSearch, $idChkMatchCase, $idChkWholeOnly, $iPos, $iOccurance, $iReplacements)
Sleep(100)
GUICtrlSetState($idBtnReplace, $__EDITCONSTANT_GUI_ENABLE)
GUICtrlSetCursor($idBtnReplace, 2)
EndSelect
WEnd
GUIDelete($hGuiSearch)
Opt("GUIOnEventMode", $iOldMode)
EndFunc
Func _GUICtrlEdit_GetCueBanner($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $tText = DllStructCreate("wchar[4096]")
If _SendMessage($hWnd, $EM_GETCUEBANNER, $tText, 4096, 0, "struct*") <> 1 Then Return SetError(-1, 0, "")
Return _WinAPI_WideCharToMultiByte($tText)
EndFunc
Func __GUICtrlEdit_FindText($hWnd, $idInputSearch, $idChkMatchCase, $idChkWholeOnly, ByRef $iPos, ByRef $iOccurance, ByRef $iReplacements)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $iCase = 0, $iWhole = 0
Local $bExact = False
Local $sFind = GUICtrlRead($idInputSearch)
Local $sText = _GUICtrlEdit_GetText($hWnd)
If BitAND(GUICtrlRead($idChkMatchCase), $__EDITCONSTANT_GUI_CHECKED) = $__EDITCONSTANT_GUI_CHECKED Then $iCase = 1
If BitAND(GUICtrlRead($idChkWholeOnly), $__EDITCONSTANT_GUI_CHECKED) = $__EDITCONSTANT_GUI_CHECKED Then $iWhole = 1
If $sFind <> "" Then
$iOccurance += 1
$iPos = StringInStr($sText, $sFind, $iCase, $iOccurance)
If $iWhole And $iPos Then
Local $s_Compare2 = StringMid($sText, $iPos + StringLen($sFind), 1)
If $iPos = 1 Then
If ($iPos + StringLen($sFind)) - 1 = StringLen($sText) Or  ($s_Compare2 = " " Or $s_Compare2 = @LF Or $s_Compare2 = @CR Or  $s_Compare2 = @CRLF Or $s_Compare2 = @TAB) Then $bExact = True
Else
Local $s_Compare1 = StringMid($sText, $iPos - 1, 1)
If ($iPos + StringLen($sFind)) - 1 = StringLen($sText) Then
If ($s_Compare1 = " " Or $s_Compare1 = @LF Or $s_Compare1 = @CR Or  $s_Compare1 = @CRLF Or $s_Compare1 = @TAB) Then $bExact = True
Else
If ($s_Compare1 = " " Or $s_Compare1 = @LF Or $s_Compare1 = @CR Or  $s_Compare1 = @CRLF Or $s_Compare1 = @TAB) And  ($s_Compare2 = " " Or $s_Compare2 = @LF Or $s_Compare2 = @CR Or  $s_Compare2 = @CRLF Or $s_Compare2 = @TAB) Then $bExact = True
EndIf
EndIf
If $bExact = False Then
__GUICtrlEdit_FindText($hWnd, $idInputSearch, $idChkMatchCase, $idChkWholeOnly, $iPos, $iOccurance, $iReplacements)
Else
_GUICtrlEdit_SetSel($hWnd, $iPos - 1, ($iPos + StringLen($sFind)) - 1)
_GUICtrlEdit_Scroll($hWnd, $__EDITCONSTANT_SB_SCROLLCARET)
EndIf
ElseIf $iWhole And Not $iPos Then
$iOccurance = 0
MsgBox($MB_SYSTEMMODAL, "Find", "Reached End of document, Can not find the string '" & $sFind & "'")
ElseIf Not $iWhole Then
If Not $iPos Then
$iOccurance = 1
_GUICtrlEdit_SetSel($hWnd, -1, 0)
_GUICtrlEdit_Scroll($hWnd, $__EDITCONSTANT_SB_SCROLLCARET)
$iPos = StringInStr($sText, $sFind, $iCase, $iOccurance)
If Not $iPos Then
$iOccurance = 0
MsgBox($MB_SYSTEMMODAL, "Find", "Reached End of document, Can not find the string  '" & $sFind & "'")
Else
_GUICtrlEdit_SetSel($hWnd, $iPos - 1, ($iPos + StringLen($sFind)) - 1)
_GUICtrlEdit_Scroll($hWnd, $__EDITCONSTANT_SB_SCROLLCARET)
EndIf
Else
_GUICtrlEdit_SetSel($hWnd, $iPos - 1, ($iPos + StringLen($sFind)) - 1)
_GUICtrlEdit_Scroll($hWnd, $__EDITCONSTANT_SB_SCROLLCARET)
EndIf
EndIf
EndIf
EndFunc
Func _GUICtrlEdit_GetFirstVisibleLine($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETFIRSTVISIBLELINE)
EndFunc
Func _GUICtrlEdit_GetHandle($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return Ptr(_SendMessage($hWnd, $EM_GETHANDLE))
EndFunc
Func _GUICtrlEdit_GetIMEStatus($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETIMESTATUS, $EMSIS_COMPOSITIONSTRING)
EndFunc
Func _GUICtrlEdit_GetLimitText($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETLIMITTEXT)
EndFunc
Func _GUICtrlEdit_GetLine($hWnd, $iLine)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $iLength = _GUICtrlEdit_LineLength($hWnd, $iLine)
If $iLength = 0 Then Return ""
Local $tBuffer = DllStructCreate("short Len;wchar Text[" & $iLength & "]")
DllStructSetData($tBuffer, "Len", $iLength + 1)
Local $iRet = _SendMessage($hWnd, $EM_GETLINE, $iLine, $tBuffer, 0, "wparam", "struct*")
If $iRet = 0 Then Return SetError($EC_ERR, $EC_ERR, "")
Local $tText = DllStructCreate("wchar Text[" & $iLength & "]", DllStructGetPtr($tBuffer))
Return DllStructGetData($tText, "Text")
EndFunc
Func _GUICtrlEdit_GetLineCount($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETLINECOUNT)
EndFunc
Func _GUICtrlEdit_GetMargins($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $aMargins[2]
Local $iMargins = _SendMessage($hWnd, $EM_GETMARGINS)
$aMargins[0] = _WinAPI_LoWord($iMargins)
$aMargins[1] = _WinAPI_HiWord($iMargins)
Return $aMargins
EndFunc
Func _GUICtrlEdit_GetModify($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETMODIFY) <> 0
EndFunc
Func _GUICtrlEdit_GetPasswordChar($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETPASSWORDCHAR)
EndFunc
Func _GUICtrlEdit_GetRECT($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $aRect[4]
Local $tRECT = _GUICtrlEdit_GetRECTEx($hWnd)
$aRect[0] = DllStructGetData($tRECT, "Left")
$aRect[1] = DllStructGetData($tRECT, "Top")
$aRect[2] = DllStructGetData($tRECT, "Right")
$aRect[3] = DllStructGetData($tRECT, "Bottom")
Return $aRect
EndFunc
Func _GUICtrlEdit_GetRECTEx($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $tRECT = DllStructCreate($tagRECT)
_SendMessage($hWnd, $EM_GETRECT, 0, $tRECT, 0, "wparam", "struct*")
Return $tRECT
EndFunc
Func _GUICtrlEdit_GetSel($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $aSel[2]
Local $tStart = DllStructCreate("uint Start")
Local $tEnd = DllStructCreate("uint End")
_SendMessage($hWnd, $EM_GETSEL, $tStart, $tEnd, 0, "struct*", "struct*")
$aSel[0] = DllStructGetData($tStart, "Start")
$aSel[1] = DllStructGetData($tEnd, "End")
Return $aSel
EndFunc
Func _GUICtrlEdit_GetText($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $iTextLen = _GUICtrlEdit_GetTextLen($hWnd) + 1
Local $tText = DllStructCreate("wchar Text[" & $iTextLen & "]")
_SendMessage($hWnd, $__EDITCONSTANT_WM_GETTEXT, $iTextLen, $tText, 0, "wparam", "struct*")
Return DllStructGetData($tText, "Text")
EndFunc
Func _GUICtrlEdit_GetTextLen($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $__EDITCONSTANT_WM_GETTEXTLENGTH)
EndFunc
Func _GUICtrlEdit_GetThumb($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETTHUMB)
EndFunc
Func _GUICtrlEdit_GetWordBreakProc($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_GETWORDBREAKPROC)
EndFunc
Func _GUICtrlEdit_HideBalloonTip($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_HIDEBALLOONTIP) <> 0
EndFunc
Func _GUICtrlEdit_InsertText($hWnd, $sText, $iIndex = -1)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
If $iIndex = -1 Then
_GUICtrlEdit_AppendText($hWnd, $sText)
Else
_GUICtrlEdit_SetSel($hWnd, $iIndex, $iIndex)
_SendMessage($hWnd, $EM_REPLACESEL, True, $sText, 0, "wparam", "wstr")
EndIf
EndFunc
Func _GUICtrlEdit_LineFromChar($hWnd, $iIndex = -1)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_LINEFROMCHAR, $iIndex)
EndFunc
Func _GUICtrlEdit_LineIndex($hWnd, $iIndex = -1)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_LINEINDEX, $iIndex)
EndFunc
Func _GUICtrlEdit_LineLength($hWnd, $iIndex = -1)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $iCharIndex = _GUICtrlEdit_LineIndex($hWnd, $iIndex)
Return _SendMessage($hWnd, $EM_LINELENGTH, $iCharIndex)
EndFunc
Func _GUICtrlEdit_LineScroll($hWnd, $iHoriz, $iVert)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_LINESCROLL, $iHoriz, $iVert) <> 0
EndFunc
Func _GUICtrlEdit_PosFromChar($hWnd, $iIndex)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $aCoord[2]
Local $iRet = _SendMessage($hWnd, $EM_POSFROMCHAR, $iIndex)
$aCoord[0] = _WinAPI_LoWord($iRet)
$aCoord[1] = _WinAPI_HiWord($iRet)
Return $aCoord
EndFunc
Func _GUICtrlEdit_ReplaceSel($hWnd, $sText, $bUndo = True)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_REPLACESEL, $bUndo, $sText, 0, "wparam", "wstr")
EndFunc
Func _GUICtrlEdit_Scroll($hWnd, $iDirection)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
If BitAND($iDirection, $__EDITCONSTANT_SB_LINEDOWN) <> $__EDITCONSTANT_SB_LINEDOWN And  BitAND($iDirection, $__EDITCONSTANT_SB_LINEUP) <> $__EDITCONSTANT_SB_LINEUP And  BitAND($iDirection, $__EDITCONSTANT_SB_PAGEDOWN) <> $__EDITCONSTANT_SB_PAGEDOWN And  BitAND($iDirection, $__EDITCONSTANT_SB_PAGEUP) <> $__EDITCONSTANT_SB_PAGEUP And  BitAND($iDirection, $__EDITCONSTANT_SB_SCROLLCARET) <> $__EDITCONSTANT_SB_SCROLLCARET Then Return 0
If $iDirection == $__EDITCONSTANT_SB_SCROLLCARET Then
Return _SendMessage($hWnd, $EM_SCROLLCARET)
Else
Return _SendMessage($hWnd, $EM_SCROLL, $iDirection)
EndIf
EndFunc
Func _GUICtrlEdit_SetCueBanner($hWnd, $sText, $bOnFocus = False)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $tText = _WinAPI_MultiByteToWideChar($sText)
Return _SendMessage($hWnd, $EM_SETCUEBANNER, $bOnFocus, $tText, 0, "wparam", "struct*") = 1
EndFunc
Func _GUICtrlEdit_SetHandle($hWnd, $hMemory)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETHANDLE, $hMemory, 0, 0, "handle")
EndFunc
Func _GUICtrlEdit_SetIMEStatus($hWnd, $iComposition)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_SETIMESTATUS, $EMSIS_COMPOSITIONSTRING, $iComposition)
EndFunc
Func _GUICtrlEdit_SetLimitText($hWnd, $iLimit)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETLIMITTEXT, $iLimit)
EndFunc
Func _GUICtrlEdit_SetMargins($hWnd, $iMargin = 0x1, $iLeft = 0xFFFF, $iRight = 0xFFFF)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETMARGINS, $iMargin, _WinAPI_MakeLong($iLeft, $iRight))
EndFunc
Func _GUICtrlEdit_SetModify($hWnd, $bModified)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETMODIFY, $bModified)
EndFunc
Func _GUICtrlEdit_SetPasswordChar($hWnd, $sDisplayChar = "0")
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
$sDisplayChar = StringLeft($sDisplayChar, 1)
If Asc($sDisplayChar) = 48 Then
_SendMessage($hWnd, $EM_SETPASSWORDCHAR)
Else
_SendMessage($hWnd, $EM_SETPASSWORDCHAR, Asc($sDisplayChar))
EndIf
EndFunc
Func _GUICtrlEdit_SetReadOnly($hWnd, $bReadOnly)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_SETREADONLY, $bReadOnly) <> 0
EndFunc
Func _GUICtrlEdit_SetRECT($hWnd, $aRect)
Local $tRECT = DllStructCreate($tagRECT)
DllStructSetData($tRECT, "Left", $aRect[0])
DllStructSetData($tRECT, "Top", $aRect[1])
DllStructSetData($tRECT, "Right", $aRect[2])
DllStructSetData($tRECT, "Bottom", $aRect[3])
_GUICtrlEdit_SetRECTEx($hWnd, $tRECT)
EndFunc
Func _GUICtrlEdit_SetRECTEx($hWnd, $tRECT)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETRECT, 0, $tRECT, 0, "wparam", "struct*")
EndFunc
Func _GUICtrlEdit_SetRECTNP($hWnd, $aRect)
Local $tRECT = DllStructCreate($tagRECT)
DllStructSetData($tRECT, "Left", $aRect[0])
DllStructSetData($tRECT, "Top", $aRect[1])
DllStructSetData($tRECT, "Right", $aRect[2])
DllStructSetData($tRECT, "Bottom", $aRect[3])
_GUICtrlEdit_SetRectNPEx($hWnd, $tRECT)
EndFunc
Func _GUICtrlEdit_SetRectNPEx($hWnd, $tRECT)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETRECTNP, 0, $tRECT, 0, "wparam", "struct*")
EndFunc
Func _GUICtrlEdit_SetSel($hWnd, $iStart, $iEnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETSEL, $iStart, $iEnd)
EndFunc
Func _GUICtrlEdit_SetTabStops($hWnd, $aTabStops)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
If Not IsArray($aTabStops) Then Return SetError(-1, -1, False)
Local $sTabStops = ""
Local $iNumTabStops = UBound($aTabStops)
For $x = 0 To $iNumTabStops - 1
$sTabStops &= "int;"
Next
$sTabStops = StringTrimRight($sTabStops, 1)
Local $tTabStops = DllStructCreate($sTabStops)
For $x = 0 To $iNumTabStops - 1
DllStructSetData($tTabStops, $x + 1, $aTabStops[$x])
Next
Local $iRet = _SendMessage($hWnd, $EM_SETTABSTOPS, $iNumTabStops, $tTabStops, 0, "wparam", "struct*") <> 0
_WinAPI_InvalidateRect($hWnd)
Return $iRet
EndFunc
Func _GUICtrlEdit_SetText($hWnd, $sText)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $__EDITCONSTANT_WM_SETTEXT, 0, $sText, 0, "wparam", "wstr")
EndFunc
Func _GUICtrlEdit_SetWordBreakProc($hWnd, $iAddressFunc)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETWORDBREAKPROC, 0, $iAddressFunc)
EndFunc
Func _GUICtrlEdit_ShowBalloonTip($hWnd, $sTitle, $sText, $iIcon)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $tTitle = _WinAPI_MultiByteToWideChar($sTitle)
Local $tText = _WinAPI_MultiByteToWideChar($sText)
Local $tTT = DllStructCreate($__tagEDITBALLOONTIP)
DllStructSetData($tTT, "Size", DllStructGetSize($tTT))
DllStructSetData($tTT, "Title", DllStructGetPtr($tTitle))
DllStructSetData($tTT, "Text", DllStructGetPtr($tText))
DllStructSetData($tTT, "Icon", $iIcon)
Return _SendMessage($hWnd, $EM_SHOWBALLOONTIP, 0, $tTT, 0, "wparam", "struct*") <> 0
EndFunc
Func _GUICtrlEdit_Undo($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $EM_UNDO) <> 0
EndFunc
Global Const $SS_LEFT = 0x0
Global Const $SS_CENTER = 0x1
Global Const $SS_RIGHT = 0x2
Global Const $SS_ICON = 0x3
Global Const $SS_BLACKRECT = 0x4
Global Const $SS_GRAYRECT = 0x5
Global Const $SS_WHITERECT = 0x6
Global Const $SS_BLACKFRAME = 0x7
Global Const $SS_GRAYFRAME = 0x8
Global Const $SS_WHITEFRAME = 0x9
Global Const $SS_SIMPLE = 0xB
Global Const $SS_LEFTNOWORDWRAP = 0xC
Global Const $SS_BITMAP = 0xE
Global Const $SS_ENHMETAFILE = 0xF
Global Const $SS_ETCHEDHORZ = 0x10
Global Const $SS_ETCHEDVERT = 0x11
Global Const $SS_ETCHEDFRAME = 0x12
Global Const $SS_REALSIZECONTROL = 0x40
Global Const $SS_NOPREFIX = 0x0080
Global Const $SS_NOTIFY = 0x0100
Global Const $SS_CENTERIMAGE = 0x0200
Global Const $SS_RIGHTJUST = 0x0400
Global Const $SS_SUNKEN = 0x1000
Global Const $GUI_SS_DEFAULT_LABEL = 0
Global Const $GUI_SS_DEFAULT_GRAPHIC = 0
Global Const $GUI_SS_DEFAULT_ICON = $SS_NOTIFY
Global Const $GUI_SS_DEFAULT_PIC = $SS_NOTIFY
Global Const $STM_SETICON = 0x0170
Global Const $STM_GETICON = 0x0171
Global Const $STM_SETIMAGE = 0x0172
Global Const $STM_GETIMAGE = 0x0173
Global Const $TRAY_ITEM_EXIT = 3
Global Const $TRAY_ITEM_PAUSE = 4
Global Const $TRAY_ITEM_FIRST = 7
Global Const $TRAY_CHECKED = 1
Global Const $TRAY_UNCHECKED = 4
Global Const $TRAY_ENABLE = 64
Global Const $TRAY_DISABLE = 128
Global Const $TRAY_FOCUS = 256
Global Const $TRAY_DEFAULT = 512
Global Const $TRAY_EVENT_NONE = 0
Global Const $TRAY_EVENT_SHOWICON = -3
Global Const $TRAY_EVENT_HIDEICON = -4
Global Const $TRAY_EVENT_FLASHICON = -5
Global Const $TRAY_EVENT_NOFLASHICON = -6
Global Const $TRAY_EVENT_PRIMARYDOWN = -7
Global Const $TRAY_EVENT_PRIMARYUP = -8
Global Const $TRAY_EVENT_SECONDARYDOWN = -9
Global Const $TRAY_EVENT_SECONDARYUP = -10
Global Const $TRAY_EVENT_MOUSEOVER = -11
Global Const $TRAY_EVENT_MOUSEOUT = -12
Global Const $TRAY_EVENT_PRIMARYDOUBLE = -13
Global Const $TRAY_EVENT_SECONDARYDOUBLE = -14
Global Const $TIP_ICONNONE = 0
Global Const $TIP_ICONASTERISK = 1
Global Const $TIP_ICONEXCLAMATION = 2
Global Const $TIP_ICONHAND = 3
Global Const $TIP_NOSOUND = 16
Global Const $TRAY_ITEM_NORMAL = 0
Global Const $TRAY_ITEM_RADIO = 1
Global Const $TRAY_CLICK_SHOW = 0
Global Const $TRAY_CLICK_PRIMARYDOWN = 1
Global Const $TRAY_CLICK_PRIMARYUP = 2
Global Const $TRAY_DBLCLICK_PRIMARY= 4
Global Const $TRAY_CLICK_SECONDARYDOWN = 8
Global Const $TRAY_CLICK_SECONDARYUP = 16
Global Const $TRAY_DBLCLICK_SECONDARY= 32
Global Const $TRAY_CLICK_HOVERING= 64
Global Const $TRAY_ICONSTATE_SHOW = 1
Global Const $TRAY_ICONSTATE_HIDE = 2
Global Const $TRAY_ICONSTATE_FLASH = 4
Global Const $TRAY_ICONSTATE_STOPFLASH = 8
Global Const $TRAY_ICONSTATE_RESET = 16
Global Const $WC_ANIMATE = 'SysAnimate32'
Global Const $WC_BUTTON = 'Button'
Global Const $WC_COMBOBOX = 'ComboBox'
Global Const $WC_COMBOBOXEX = 'ComboBoxEx32'
Global Const $WC_DATETIMEPICK = 'SysDateTimePick32'
Global Const $WC_EDIT = 'Edit'
Global Const $WC_HEADER = 'SysHeader32'
Global Const $WC_HOTKEY = 'msctls_hotkey32'
Global Const $WC_IPADDRESS = 'SysIPAddress32'
Global Const $WC_LINK = 'SysLink'
Global Const $WC_LISTBOX = 'ListBox'
Global Const $WC_LISTVIEW = 'SysListView32'
Global Const $WC_MONTHCAL = 'SysMonthCal32'
Global Const $WC_NATIVEFONTCTL = 'NativeFontCtl'
Global Const $WC_PAGESCROLLER = 'SysPager'
Global Const $WC_PROGRESS = 'msctls_progress32'
Global Const $WC_REBAR = 'ReBarWindow32'
Global Const $WC_SCROLLBAR = 'ScrollBar'
Global Const $WC_STATIC = 'Static'
Global Const $WC_STATUSBAR = 'msctls_statusbar32'
Global Const $WC_TABCONTROL = 'SysTabControl32'
Global Const $WC_TOOLBAR = 'ToolbarWindow32'
Global Const $WC_TOOLTIPS = 'tooltips_class32'
Global Const $WC_TRACKBAR = 'msctls_trackbar32'
Global Const $WC_TREEVIEW = 'SysTreeView32'
Global Const $WC_UPDOWN = 'msctls_updown32'
Global Const $WS_OVERLAPPED = 0
Global Const $WS_TILED = $WS_OVERLAPPED
Global Const $WS_MAXIMIZEBOX = 0x00010000
Global Const $WS_MINIMIZEBOX = 0x00020000
Global Const $WS_TABSTOP = 0x00010000
Global Const $WS_GROUP = 0x00020000
Global Const $WS_SIZEBOX = 0x00040000
Global Const $WS_THICKFRAME = $WS_SIZEBOX
Global Const $WS_SYSMENU = 0x00080000
Global Const $WS_HSCROLL = 0x00100000
Global Const $WS_VSCROLL = 0x00200000
Global Const $WS_DLGFRAME = 0x00400000
Global Const $WS_BORDER = 0x00800000
Global Const $WS_CAPTION = 0x00C00000
Global Const $WS_OVERLAPPEDWINDOW = BitOR($WS_CAPTION, $WS_MAXIMIZEBOX, $WS_MINIMIZEBOX, $WS_OVERLAPPED, $WS_SYSMENU, $WS_THICKFRAME)
Global Const $WS_TILEDWINDOW = $WS_OVERLAPPEDWINDOW
Global Const $WS_MAXIMIZE = 0x01000000
Global Const $WS_CLIPCHILDREN = 0x02000000
Global Const $WS_CLIPSIBLINGS = 0x04000000
Global Const $WS_DISABLED = 0x08000000
Global Const $WS_VISIBLE = 0x10000000
Global Const $WS_MINIMIZE = 0x20000000
Global Const $WS_ICONIC = $WS_MINIMIZE
Global Const $WS_CHILD = 0x40000000
Global Const $WS_CHILDWINDOW = $WS_CHILD
Global Const $WS_POPUP = 0x80000000
Global Const $WS_POPUPWINDOW = 0x80880000
Global Const $DS_3DLOOK = 0x0004
Global Const $DS_ABSALIGN = 0x0001
Global Const $DS_CENTER = 0x0800
Global Const $DS_CENTERMOUSE = 0x1000
Global Const $DS_CONTEXTHELP = 0x2000
Global Const $DS_CONTROL = 0x0400
Global Const $DS_FIXEDSYS = 0x0008
Global Const $DS_LOCALEDIT = 0x0020
Global Const $DS_MODALFRAME = 0x0080
Global Const $DS_NOFAILCREATE = 0x0010
Global Const $DS_NOIDLEMSG = 0x0100
Global Const $DS_SETFONT = 0x0040
Global Const $DS_SETFOREGROUND = 0x0200
Global Const $DS_SHELLFONT = BitOR($DS_FIXEDSYS, $DS_SETFONT)
Global Const $DS_SYSMODAL = 0x0002
Global Const $WS_EX_ACCEPTFILES = 0x00000010
Global Const $WS_EX_APPWINDOW = 0x00040000
Global Const $WS_EX_COMPOSITED = 0x02000000
Global Const $WS_EX_CONTROLPARENT = 0x10000
Global Const $WS_EX_CLIENTEDGE = 0x00000200
Global Const $WS_EX_CONTEXTHELP = 0x00000400
Global Const $WS_EX_DLGMODALFRAME = 0x00000001
Global Const $WS_EX_LAYERED = 0x00080000
Global Const $WS_EX_LAYOUTRTL = 0x400000
Global Const $WS_EX_LEFT = 0x00000000
Global Const $WS_EX_LEFTSCROLLBAR = 0x00004000
Global Const $WS_EX_LTRREADING = 0x00000000
Global Const $WS_EX_MDICHILD = 0x00000040
Global Const $WS_EX_NOACTIVATE = 0x08000000
Global Const $WS_EX_NOINHERITLAYOUT = 0x00100000
Global Const $WS_EX_NOPARENTNOTIFY = 0x00000004
Global Const $WS_EX_RIGHT = 0x00001000
Global Const $WS_EX_RIGHTSCROLLBAR = 0x00000000
Global Const $WS_EX_RTLREADING = 0x2000
Global Const $WS_EX_STATICEDGE = 0x00020000
Global Const $WS_EX_TOOLWINDOW = 0x00000080
Global Const $WS_EX_TOPMOST = 0x00000008
Global Const $WS_EX_TRANSPARENT = 0x00000020
Global Const $WS_EX_WINDOWEDGE = 0x00000100
Global Const $WS_EX_OVERLAPPEDWINDOW = BitOR($WS_EX_CLIENTEDGE, $WS_EX_WINDOWEDGE)
Global Const $WS_EX_PALETTEWINDOW = BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST, $WS_EX_WINDOWEDGE)
Global Const $WM_NULL = 0x0000
Global Const $WM_CREATE = 0x0001
Global Const $WM_DESTROY = 0x0002
Global Const $WM_MOVE = 0x0003
Global Const $WM_SIZEWAIT = 0x0004
Global Const $WM_SIZE = 0x0005
Global Const $WM_ACTIVATE = 0x0006
Global Const $WM_SETFOCUS = 0x0007
Global Const $WM_KILLFOCUS = 0x0008
Global Const $WM_SETVISIBLE = 0x0009
Global Const $WM_ENABLE = 0x000A
Global Const $WM_SETREDRAW = 0x000B
Global Const $WM_SETTEXT = 0x000C
Global Const $WM_GETTEXT = 0x000D
Global Const $WM_GETTEXTLENGTH = 0x000E
Global Const $WM_PAINT = 0x000F
Global Const $WM_CLOSE = 0x0010
Global Const $WM_QUERYENDSESSION = 0x0011
Global Const $WM_QUIT = 0x0012
Global Const $WM_ERASEBKGND = 0x0014
Global Const $WM_QUERYOPEN = 0x0013
Global Const $WM_SYSCOLORCHANGE = 0x0015
Global Const $WM_ENDSESSION = 0x0016
Global Const $WM_SYSTEMERROR = 0x0017
Global Const $WM_SHOWWINDOW = 0x0018
Global Const $WM_CTLCOLOR = 0x0019
Global Const $WM_SETTINGCHANGE = 0x001A
Global Const $WM_WININICHANGE = 0x001A
Global Const $WM_DEVMODECHANGE = 0x001B
Global Const $WM_ACTIVATEAPP = 0x001C
Global Const $WM_FONTCHANGE = 0x001D
Global Const $WM_TIMECHANGE = 0x001E
Global Const $WM_CANCELMODE = 0x001F
Global Const $WM_SETCURSOR = 0x0020
Global Const $WM_MOUSEACTIVATE = 0x0021
Global Const $WM_CHILDACTIVATE = 0x0022
Global Const $WM_QUEUESYNC = 0x0023
Global Const $WM_GETMINMAXINFO = 0x0024
Global Const $WM_LOGOFF = 0x0025
Global Const $WM_PAINTICON = 0x0026
Global Const $WM_ICONERASEBKGND = 0x0027
Global Const $WM_NEXTDLGCTL = 0x0028
Global Const $WM_ALTTABACTIVE = 0x0029
Global Const $WM_SPOOLERSTATUS = 0x002A
Global Const $WM_DRAWITEM = 0x002B
Global Const $WM_MEASUREITEM = 0x002C
Global Const $WM_DELETEITEM = 0x002D
Global Const $WM_VKEYTOITEM = 0x002E
Global Const $WM_CHARTOITEM = 0x002F
Global Const $WM_SETFONT = 0x0030
Global Const $WM_GETFONT = 0x0031
Global Const $WM_SETHOTKEY = 0x0032
Global Const $WM_GETHOTKEY = 0x0033
Global Const $WM_FILESYSCHANGE = 0x0034
Global Const $WM_ISACTIVEICON = 0x0035
Global Const $WM_QUERYPARKICON = 0x0036
Global Const $WM_QUERYDRAGICON = 0x0037
Global Const $WM_WINHELP = 0x0038
Global Const $WM_COMPAREITEM = 0x0039
Global Const $WM_FULLSCREEN = 0x003A
Global Const $WM_CLIENTSHUTDOWN = 0x003B
Global Const $WM_DDEMLEVENT = 0x003C
Global Const $WM_GETOBJECT = 0x003D
Global Const $WM_CALCSCROLL = 0x003F
Global Const $WM_TESTING = 0x0040
Global Const $WM_COMPACTING = 0x0041
Global Const $WM_OTHERWINDOWCREATED = 0x0042
Global Const $WM_OTHERWINDOWDESTROYED = 0x0043
Global Const $WM_COMMNOTIFY = 0x0044
Global Const $WM_MEDIASTATUSCHANGE = 0x0045
Global Const $WM_WINDOWPOSCHANGING = 0x0046
Global Const $WM_WINDOWPOSCHANGED = 0x0047
Global Const $WM_POWER = 0x0048
Global Const $WM_COPYGLOBALDATA = 0x0049
Global Const $WM_COPYDATA = 0x004A
Global Const $WM_CANCELJOURNAL = 0x004B
Global Const $WM_LOGONNOTIFY = 0x004C
Global Const $WM_KEYF1 = 0x004D
Global Const $WM_NOTIFY = 0x004E
Global Const $WM_ACCESS_WINDOW = 0x004F
Global Const $WM_INPUTLANGCHANGEREQUEST = 0x0050
Global Const $WM_INPUTLANGCHANGE = 0x0051
Global Const $WM_TCARD = 0x0052
Global Const $WM_HELP = 0x0053
Global Const $WM_USERCHANGED = 0x0054
Global Const $WM_NOTIFYFORMAT = 0x0055
Global Const $WM_QM_ACTIVATE = 0x0060
Global Const $WM_HOOK_DO_CALLBACK = 0x0061
Global Const $WM_SYSCOPYDATA = 0x0062
Global Const $WM_FINALDESTROY = 0x0070
Global Const $WM_MEASUREITEM_CLIENTDATA = 0x0071
Global Const $WM_CONTEXTMENU = 0x007B
Global Const $WM_STYLECHANGING = 0x007C
Global Const $WM_STYLECHANGED = 0x007D
Global Const $WM_DISPLAYCHANGE = 0x007E
Global Const $WM_GETICON = 0x007F
Global Const $WM_SETICON = 0x0080
Global Const $WM_NCCREATE = 0x0081
Global Const $WM_NCDESTROY = 0x0082
Global Const $WM_NCCALCSIZE = 0x0083
Global Const $WM_NCHITTEST = 0x0084
Global Const $WM_NCPAINT = 0x0085
Global Const $WM_NCACTIVATE = 0x0086
Global Const $WM_GETDLGCODE = 0x0087
Global Const $WM_SYNCPAINT = 0x0088
Global Const $WM_SYNCTASK = 0x0089
Global Const $WM_KLUDGEMINRECT = 0x008B
Global Const $WM_LPKDRAWSWITCHWND = 0x008C
Global Const $WM_UAHDESTROYWINDOW = 0x0090
Global Const $WM_UAHDRAWMENU = 0x0091
Global Const $WM_UAHDRAWMENUITEM = 0x0092
Global Const $WM_UAHINITMENU = 0x0093
Global Const $WM_UAHMEASUREMENUITEM = 0x0094
Global Const $WM_UAHNCPAINTMENUPOPUP = 0x0095
Global Const $WM_NCMOUSEMOVE = 0x00A0
Global Const $WM_NCLBUTTONDOWN = 0x00A1
Global Const $WM_NCLBUTTONUP = 0x00A2
Global Const $WM_NCLBUTTONDBLCLK = 0x00A3
Global Const $WM_NCRBUTTONDOWN = 0x00A4
Global Const $WM_NCRBUTTONUP = 0x00A5
Global Const $WM_NCRBUTTONDBLCLK = 0x00A6
Global Const $WM_NCMBUTTONDOWN = 0x00A7
Global Const $WM_NCMBUTTONUP = 0x00A8
Global Const $WM_NCMBUTTONDBLCLK = 0x00A9
Global Const $WM_NCXBUTTONDOWN = 0x00AB
Global Const $WM_NCXBUTTONUP = 0x00AC
Global Const $WM_NCXBUTTONDBLCLK = 0x00AD
Global Const $WM_NCUAHDRAWCAPTION = 0x00AE
Global Const $WM_NCUAHDRAWFRAME = 0x00AF
Global Const $WM_INPUT_DEVICE_CHANGE = 0x00FE
Global Const $WM_INPUT = 0x00FF
Global Const $WM_KEYDOWN = 0x0100
Global Const $WM_KEYFIRST = 0x0100
Global Const $WM_KEYUP = 0x0101
Global Const $WM_CHAR = 0x0102
Global Const $WM_DEADCHAR = 0x0103
Global Const $WM_SYSKEYDOWN = 0x0104
Global Const $WM_SYSKEYUP = 0x0105
Global Const $WM_SYSCHAR = 0x0106
Global Const $WM_SYSDEADCHAR = 0x0107
Global Const $WM_YOMICHAR = 0x0108
Global Const $WM_KEYLAST = 0x0109
Global Const $WM_UNICHAR = 0x0109
Global Const $WM_CONVERTREQUEST = 0x010A
Global Const $WM_CONVERTRESULT = 0x010B
Global Const $WM_IM_INFO = 0x010C
Global Const $WM_IME_STARTCOMPOSITION = 0x010D
Global Const $WM_IME_ENDCOMPOSITION = 0x010E
Global Const $WM_IME_COMPOSITION = 0x010F
Global Const $WM_IME_KEYLAST = 0x010F
Global Const $WM_INITDIALOG = 0x0110
Global Const $WM_COMMAND = 0x0111
Global Const $WM_SYSCOMMAND = 0x0112
Global Const $WM_TIMER = 0x0113
Global Const $WM_HSCROLL = 0x0114
Global Const $WM_VSCROLL = 0x0115
Global Const $WM_INITMENU = 0x0116
Global Const $WM_INITMENUPOPUP = 0x0117
Global Const $WM_SYSTIMER = 0x0118
Global Const $WM_GESTURE = 0x0119
Global Const $WM_GESTURENOTIFY = 0x011A
Global Const $WM_GESTUREINPUT = 0x011B
Global Const $WM_GESTURENOTIFIED = 0x011C
Global Const $WM_MENUSELECT = 0x011F
Global Const $WM_MENUCHAR = 0x0120
Global Const $WM_ENTERIDLE = 0x0121
Global Const $WM_MENURBUTTONUP = 0x0122
Global Const $WM_MENUDRAG = 0x0123
Global Const $WM_MENUGETOBJECT = 0x0124
Global Const $WM_UNINITMENUPOPUP = 0x0125
Global Const $WM_MENUCOMMAND = 0x0126
Global Const $WM_CHANGEUISTATE = 0x0127
Global Const $WM_UPDATEUISTATE = 0x0128
Global Const $WM_QUERYUISTATE = 0x0129
Global Const $WM_LBTRACKPOINT = 0x0131
Global Const $WM_CTLCOLORMSGBOX = 0x0132
Global Const $WM_CTLCOLOREDIT = 0x0133
Global Const $WM_CTLCOLORLISTBOX = 0x0134
Global Const $WM_CTLCOLORBTN = 0x0135
Global Const $WM_CTLCOLORDLG = 0x0136
Global Const $WM_CTLCOLORSCROLLBAR = 0x0137
Global Const $WM_CTLCOLORSTATIC = 0x0138
Global Const $MN_GETHMENU = 0x01E1
Global Const $WM_PARENTNOTIFY = 0x0210
Global Const $WM_ENTERMENULOOP = 0x0211
Global Const $WM_EXITMENULOOP = 0x0212
Global Const $WM_NEXTMENU = 0x0213
Global Const $WM_SIZING = 0x0214
Global Const $WM_CAPTURECHANGED = 0x0215
Global Const $WM_MOVING = 0x0216
Global Const $WM_POWERBROADCAST = 0x0218
Global Const $WM_DEVICECHANGE = 0x0219
Global Const $WM_MDICREATE = 0x0220
Global Const $WM_MDIDESTROY = 0x0221
Global Const $WM_MDIACTIVATE = 0x0222
Global Const $WM_MDIRESTORE = 0x0223
Global Const $WM_MDINEXT = 0x0224
Global Const $WM_MDIMAXIMIZE = 0x0225
Global Const $WM_MDITILE = 0x0226
Global Const $WM_MDICASCADE = 0x0227
Global Const $WM_MDIICONARRANGE = 0x0228
Global Const $WM_MDIGETACTIVE = 0x0229
Global Const $WM_DROPOBJECT = 0x022A
Global Const $WM_QUERYDROPOBJECT = 0x022B
Global Const $WM_BEGINDRAG = 0x022C
Global Const $WM_DRAGLOOP = 0x022D
Global Const $WM_DRAGSELECT = 0x022E
Global Const $WM_DRAGMOVE = 0x022F
Global Const $WM_MDISETMENU = 0x0230
Global Const $WM_ENTERSIZEMOVE = 0x0231
Global Const $WM_EXITSIZEMOVE = 0x0232
Global Const $WM_DROPFILES = 0x0233
Global Const $WM_MDIREFRESHMENU = 0x0234
Global Const $WM_TOUCH = 0x0240
Global Const $WM_IME_SETCONTEXT = 0x0281
Global Const $WM_IME_NOTIFY = 0x0282
Global Const $WM_IME_CONTROL = 0x0283
Global Const $WM_IME_COMPOSITIONFULL = 0x0284
Global Const $WM_IME_SELECT = 0x0285
Global Const $WM_IME_CHAR = 0x0286
Global Const $WM_IME_SYSTEM = 0x0287
Global Const $WM_IME_REQUEST = 0x0288
Global Const $WM_IME_KEYDOWN = 0x0290
Global Const $WM_IME_KEYUP = 0x0291
Global Const $WM_NCMOUSEHOVER = 0x02A0
Global Const $WM_MOUSEHOVER = 0x02A1
Global Const $WM_NCMOUSELEAVE = 0x02A2
Global Const $WM_MOUSELEAVE = 0x02A3
Global Const $WM_WTSSESSION_CHANGE = 0x02B1
Global Const $WM_TABLET_FIRST = 0x02C0
Global Const $WM_TABLET_LAST = 0x02DF
Global Const $WM_CUT = 0x0300
Global Const $WM_COPY = 0x0301
Global Const $WM_PASTE = 0x0302
Global Const $WM_CLEAR = 0x0303
Global Const $WM_UNDO = 0x0304
Global Const $WM_PALETTEISCHANGING = 0x0310
Global Const $WM_HOTKEY = 0x0312
Global Const $WM_PALETTECHANGED = 0x0311
Global Const $WM_SYSMENU = 0x0313
Global Const $WM_HOOKMSG = 0x0314
Global Const $WM_EXITPROCESS = 0x0315
Global Const $WM_WAKETHREAD = 0x0316
Global Const $WM_PRINT = 0x0317
Global Const $WM_PRINTCLIENT = 0x0318
Global Const $WM_APPCOMMAND = 0x0319
Global Const $WM_QUERYNEWPALETTE = 0x030F
Global Const $WM_THEMECHANGED = 0x031A
Global Const $WM_UAHINIT = 0x031B
Global Const $WM_DESKTOPNOTIFY = 0x031C
Global Const $WM_CLIPBOARDUPDATE = 0x031D
Global Const $WM_DWMCOMPOSITIONCHANGED = 0x031E
Global Const $WM_DWMNCRENDERINGCHANGED = 0x031F
Global Const $WM_DWMCOLORIZATIONCOLORCHANGED = 0x0320
Global Const $WM_DWMWINDOWMAXIMIZEDCHANGE = 0x0321
Global Const $WM_DWMEXILEFRAME = 0x0322
Global Const $WM_DWMSENDICONICTHUMBNAIL = 0x0323
Global Const $WM_MAGNIFICATION_STARTED = 0x0324
Global Const $WM_MAGNIFICATION_ENDED = 0x0325
Global Const $WM_DWMSENDICONICLIVEPREVIEWBITMAP = 0x0326
Global Const $WM_DWMTHUMBNAILSIZECHANGED = 0x0327
Global Const $WM_MAGNIFICATION_OUTPUT = 0x0328
Global Const $WM_MEASURECONTROL = 0x0330
Global Const $WM_GETACTIONTEXT = 0x0331
Global Const $WM_FORWARDKEYDOWN = 0x0333
Global Const $WM_FORWARDKEYUP = 0x0334
Global Const $WM_GETTITLEBARINFOEX = 0x033F
Global Const $WM_NOTIFYWOW = 0x0340
Global Const $WM_HANDHELDFIRST = 0x0358
Global Const $WM_HANDHELDLAST = 0x035F
Global Const $WM_AFXFIRST = 0x0360
Global Const $WM_AFXLAST = 0x037F
Global Const $WM_PENWINFIRST = 0x0380
Global Const $WM_PENWINLAST = 0x038F
Global Const $WM_DDE_INITIATE = 0x03E0
Global Const $WM_DDE_TERMINATE = 0x03E1
Global Const $WM_DDE_ADVISE = 0x03E2
Global Const $WM_DDE_UNADVISE = 0x03E3
Global Const $WM_DDE_ACK = 0x03E4
Global Const $WM_DDE_DATA = 0x03E5
Global Const $WM_DDE_REQUEST = 0x03E6
Global Const $WM_DDE_POKE = 0x03E7
Global Const $WM_DDE_EXECUTE = 0x03E8
Global Const $WM_DBNOTIFICATION = 0x03FD
Global Const $WM_NETCONNECT = 0x03FE
Global Const $WM_HIBERNATE = 0x03FF
Global Const $WM_USER = 0x0400
Global Const $WM_APP = 0x8000
Global Const $NM_FIRST = 0
Global Const $NM_OUTOFMEMORY = $NM_FIRST - 1
Global Const $NM_CLICK = $NM_FIRST - 2
Global Const $NM_DBLCLK = $NM_FIRST - 3
Global Const $NM_RETURN = $NM_FIRST - 4
Global Const $NM_RCLICK = $NM_FIRST - 5
Global Const $NM_RDBLCLK = $NM_FIRST - 6
Global Const $NM_SETFOCUS = $NM_FIRST - 7
Global Const $NM_KILLFOCUS = $NM_FIRST - 8
Global Const $NM_CUSTOMDRAW = $NM_FIRST - 12
Global Const $NM_HOVER = $NM_FIRST - 13
Global Const $NM_NCHITTEST = $NM_FIRST - 14
Global Const $NM_KEYDOWN = $NM_FIRST - 15
Global Const $NM_RELEASEDCAPTURE = $NM_FIRST - 16
Global Const $NM_SETCURSOR = $NM_FIRST - 17
Global Const $NM_CHAR = $NM_FIRST - 18
Global Const $NM_TOOLTIPSCREATED = $NM_FIRST - 19
Global Const $NM_LDOWN = $NM_FIRST - 20
Global Const $NM_RDOWN = $NM_FIRST - 21
Global Const $NM_THEMECHANGED = $NM_FIRST - 22
Global Const $WM_MOUSEFIRST = 0x0200
Global Const $WM_MOUSEMOVE = 0x0200
Global Const $WM_LBUTTONDOWN = 0x0201
Global Const $WM_LBUTTONUP = 0x0202
Global Const $WM_LBUTTONDBLCLK = 0x0203
Global Const $WM_RBUTTONDOWN = 0x0204
Global Const $WM_RBUTTONUP = 0x0205
Global Const $WM_RBUTTONDBLCLK = 0x0206
Global Const $WM_MBUTTONDOWN = 0x0207
Global Const $WM_MBUTTONUP = 0x0208
Global Const $WM_MBUTTONDBLCLK = 0x0209
Global Const $WM_MOUSEWHEEL = 0x020A
Global Const $WM_XBUTTONDOWN = 0x020B
Global Const $WM_XBUTTONUP = 0x020C
Global Const $WM_XBUTTONDBLCLK = 0x020D
Global Const $WM_MOUSEHWHEEL = 0x020E
Global Const $PS_SOLID = 0
Global Const $PS_DASH = 1
Global Const $PS_DOT = 2
Global Const $PS_DASHDOT = 3
Global Const $PS_DASHDOTDOT = 4
Global Const $PS_NULL = 5
Global Const $PS_INSIDEFRAME = 6
Global Const $PS_USERSTYLE = 7
Global Const $PS_ALTERNATE = 8
Global Const $PS_ENDCAP_ROUND = 0x00000000
Global Const $PS_ENDCAP_SQUARE = 0x00000100
Global Const $PS_ENDCAP_FLAT = 0x00000200
Global Const $PS_JOIN_BEVEL = 0x00001000
Global Const $PS_JOIN_MITER = 0x00002000
Global Const $PS_JOIN_ROUND = 0x00000000
Global Const $PS_GEOMETRIC = 0x00010000
Global Const $PS_COSMETIC = 0x00000000
Global Const $LWA_ALPHA = 0x2
Global Const $LWA_COLORKEY = 0x1
Global Const $RGN_AND = 1
Global Const $RGN_OR = 2
Global Const $RGN_XOR = 3
Global Const $RGN_DIFF = 4
Global Const $RGN_COPY = 5
Global Const $ERRORREGION = 0
Global Const $NULLREGION = 1
Global Const $SIMPLEREGION = 2
Global Const $COMPLEXREGION = 3
Global Const $TRANSPARENT = 1
Global Const $OPAQUE = 2
Global Const $CCM_FIRST = 0x2000
Global Const $CCM_GETUNICODEFORMAT = ($CCM_FIRST + 6)
Global Const $CCM_SETUNICODEFORMAT = ($CCM_FIRST + 5)
Global Const $CCM_SETBKCOLOR = $CCM_FIRST + 1
Global Const $CCM_SETCOLORSCHEME = $CCM_FIRST + 2
Global Const $CCM_GETCOLORSCHEME = $CCM_FIRST + 3
Global Const $CCM_GETDROPTARGET = $CCM_FIRST + 4
Global Const $CCM_SETWINDOWTHEME = $CCM_FIRST + 11
Global Const $GA_PARENT = 1
Global Const $GA_ROOT = 2
Global Const $GA_ROOTOWNER = 3
Global Const $SM_CXSCREEN = 0
Global Const $SM_CYSCREEN = 1
Global Const $SM_CXVSCROLL = 2
Global Const $SM_CYHSCROLL = 3
Global Const $SM_CYCAPTION = 4
Global Const $SM_CXBORDER = 5
Global Const $SM_CYBORDER = 6
Global Const $SM_CXFIXEDFRAME = 7
Global Const $SM_CXDLGFRAME = $SM_CXFIXEDFRAME
Global Const $SM_CYFIXEDFRAME = 8
Global Const $SM_CYDLGFRAME = $SM_CYFIXEDFRAME
Global Const $SM_CYVTHUMB = 9
Global Const $SM_CXHTHUMB = 10
Global Const $SM_CXICON = 11
Global Const $SM_CYICON = 12
Global Const $SM_CXCURSOR = 13
Global Const $SM_CYCURSOR = 14
Global Const $SM_CYMENU = 15
Global Const $SM_CXFULLSCREEN = 16
Global Const $SM_CYFULLSCREEN = 17
Global Const $SM_CYKANJIWINDOW = 18
Global Const $SM_MOUSEPRESENT = 19
Global Const $SM_CYVSCROLL = 20
Global Const $SM_CXHSCROLL = 21
Global Const $SM_DEBUG = 22
Global Const $SM_SWAPBUTTON = 23
Global Const $SM_RESERVED1 = 24
Global Const $SM_RESERVED2 = 25
Global Const $SM_RESERVED3 = 26
Global Const $SM_RESERVED4 = 27
Global Const $SM_CXMIN = 28
Global Const $SM_CYMIN = 29
Global Const $SM_CXSIZE = 30
Global Const $SM_CYSIZE = 31
Global Const $SM_CXSIZEFRAME = 32
Global Const $SM_CXFRAME = $SM_CXSIZEFRAME
Global Const $SM_CYSIZEFRAME = 33
Global Const $SM_CYFRAME = $SM_CYSIZEFRAME
Global Const $SM_CXMINTRACK = 34
Global Const $SM_CYMINTRACK = 35
Global Const $SM_CXDOUBLECLK = 36
Global Const $SM_CYDOUBLECLK = 37
Global Const $SM_CXICONSPACING = 38
Global Const $SM_CYICONSPACING = 39
Global Const $SM_MENUDROPALIGNMENT = 40
Global Const $SM_PENWINDOWS = 41
Global Const $SM_DBCSENABLED = 42
Global Const $SM_CMOUSEBUTTONS = 43
Global Const $SM_SECURE = 44
Global Const $SM_CXEDGE = 45
Global Const $SM_CYEDGE = 46
Global Const $SM_CXMINSPACING = 47
Global Const $SM_CYMINSPACING = 48
Global Const $SM_CXSMICON = 49
Global Const $SM_CYSMICON = 50
Global Const $SM_CYSMCAPTION = 51
Global Const $SM_CXSMSIZE = 52
Global Const $SM_CYSMSIZE = 53
Global Const $SM_CXMENUSIZE = 54
Global Const $SM_CYMENUSIZE = 55
Global Const $SM_ARRANGE = 56
Global Const $SM_CXMINIMIZED = 57
Global Const $SM_CYMINIMIZED = 58
Global Const $SM_CXMAXTRACK = 59
Global Const $SM_CYMAXTRACK = 60
Global Const $SM_CXMAXIMIZED = 61
Global Const $SM_CYMAXIMIZED = 62
Global Const $SM_NETWORK = 63
Global Const $SM_CLEANBOOT = 67
Global Const $SM_CXDRAG = 68
Global Const $SM_CYDRAG = 69
Global Const $SM_SHOWSOUNDS = 70
Global Const $SM_CXMENUCHECK = 71
Global Const $SM_CYMENUCHECK = 72
Global Const $SM_SLOWMACHINE = 73
Global Const $SM_MIDEASTENABLED = 74
Global Const $SM_MOUSEWHEELPRESENT = 75
Global Const $SM_XVIRTUALSCREEN = 76
Global Const $SM_YVIRTUALSCREEN = 77
Global Const $SM_CXVIRTUALSCREEN = 78
Global Const $SM_CYVIRTUALSCREEN = 79
Global Const $SM_CMONITORS = 80
Global Const $SM_SAMEDISPLAYFORMAT = 81
Global Const $SM_IMMENABLED = 82
Global Const $SM_CXFOCUSBORDER = 83
Global Const $SM_CYFOCUSBORDER = 84
Global Const $SM_TABLETPC = 86
Global Const $SM_MEDIACENTER = 87
Global Const $SM_STARTER = 88
Global Const $SM_SERVERR2 = 89
Global Const $SM_CMETRICS = 90
Global Const $SM_REMOTESESSION = 0x1000
Global Const $SM_SHUTTINGDOWN = 0x2000
Global Const $SM_REMOTECONTROL = 0x2001
Global Const $SM_CARETBLINKINGENABLED = 0x2002
Global Const $BLACKNESS = 0x00000042
Global Const $CAPTUREBLT = 0X40000000
Global Const $DSTINVERT = 0x00550009
Global Const $MERGECOPY = 0x00C000CA
Global Const $MERGEPAINT = 0x00BB0226
Global Const $NOMIRRORBITMAP = 0X80000000
Global Const $NOTSRCCOPY = 0x00330008
Global Const $NOTSRCERASE = 0x001100A6
Global Const $PATCOPY = 0x00F00021
Global Const $PATINVERT = 0x005A0049
Global Const $PATPAINT = 0x00FB0A09
Global Const $SRCAND = 0x008800C6
Global Const $SRCCOPY = 0x00CC0020
Global Const $SRCERASE = 0x00440328
Global Const $SRCINVERT = 0x00660046
Global Const $SRCPAINT = 0x00EE0086
Global Const $WHITENESS = 0x00FF0062
Global Const $DT_BOTTOM = 0x8
Global Const $DT_CALCRECT = 0x400
Global Const $DT_CENTER = 0x1
Global Const $DT_EDITCONTROL = 0x2000
Global Const $DT_END_ELLIPSIS = 0x8000
Global Const $DT_EXPANDTABS = 0x40
Global Const $DT_EXTERNALLEADING = 0x200
Global Const $DT_HIDEPREFIX = 0x100000
Global Const $DT_INTERNAL = 0x1000
Global Const $DT_LEFT = 0x0
Global Const $DT_MODIFYSTRING = 0x10000
Global Const $DT_NOCLIP = 0x100
Global Const $DT_NOFULLWIDTHCHARBREAK = 0x80000
Global Const $DT_NOPREFIX = 0x800
Global Const $DT_PATH_ELLIPSIS = 0x4000
Global Const $DT_PREFIXONLY = 0x200000
Global Const $DT_RIGHT = 0x2
Global Const $DT_RTLREADING = 0x20000
Global Const $DT_SINGLELINE = 0x20
Global Const $DT_TABSTOP = 0x80
Global Const $DT_TOP = 0x0
Global Const $DT_VCENTER = 0x4
Global Const $DT_WORDBREAK = 0x10
Global Const $DT_WORD_ELLIPSIS = 0x40000
Global Const $RDW_ERASE = 0x0004
Global Const $RDW_FRAME = 0x0400
Global Const $RDW_INTERNALPAINT = 0x0002
Global Const $RDW_INVALIDATE = 0x0001
Global Const $RDW_NOERASE = 0x0020
Global Const $RDW_NOFRAME = 0x0800
Global Const $RDW_NOINTERNALPAINT = 0x0010
Global Const $RDW_VALIDATE = 0x0008
Global Const $RDW_ERASENOW = 0x0200
Global Const $RDW_UPDATENOW = 0x0100
Global Const $RDW_ALLCHILDREN = 0x0080
Global Const $RDW_NOCHILDREN = 0x0040
Global Const $WM_RENDERFORMAT = 0x0305
Global Const $WM_RENDERALLFORMATS = 0x0306
Global Const $WM_DESTROYCLIPBOARD = 0x0307
Global Const $WM_DRAWCLIPBOARD = 0x0308
Global Const $WM_PAINTCLIPBOARD = 0x0309
Global Const $WM_VSCROLLCLIPBOARD = 0x030A
Global Const $WM_SIZECLIPBOARD = 0x030B
Global Const $WM_ASKCBFORMATNAME = 0x030C
Global Const $WM_CHANGECBCHAIN = 0x030D
Global Const $WM_HSCROLLCLIPBOARD = 0x030E
Global Const $HTERROR = -2
Global Const $HTTRANSPARENT = -1
Global Const $HTNOWHERE = 0
Global Const $HTCLIENT = 1
Global Const $HTCAPTION = 2
Global Const $HTSYSMENU = 3
Global Const $HTGROWBOX = 4
Global Const $HTSIZE = $HTGROWBOX
Global Const $HTMENU = 5
Global Const $HTHSCROLL = 6
Global Const $HTVSCROLL = 7
Global Const $HTMINBUTTON = 8
Global Const $HTMAXBUTTON = 9
Global Const $HTLEFT = 10
Global Const $HTRIGHT = 11
Global Const $HTTOP = 12
Global Const $HTTOPLEFT = 13
Global Const $HTTOPRIGHT = 14
Global Const $HTBOTTOM = 15
Global Const $HTBOTTOMLEFT = 16
Global Const $HTBOTTOMRIGHT = 17
Global Const $HTBORDER = 18
Global Const $HTREDUCE = $HTMINBUTTON
Global Const $HTZOOM = $HTMAXBUTTON
Global Const $HTSIZEFIRST = $HTLEFT
Global Const $HTSIZELAST = $HTBOTTOMRIGHT
Global Const $HTOBJECT = 19
Global Const $HTCLOSE = 20
Global Const $HTHELP = 21
Global Const $COLOR_SCROLLBAR = 0
Global Const $COLOR_BACKGROUND = 1
Global Const $COLOR_ACTIVECAPTION = 2
Global Const $COLOR_INACTIVECAPTION = 3
Global Const $COLOR_MENU = 4
Global Const $COLOR_WINDOW = 5
Global Const $COLOR_WINDOWFRAME = 6
Global Const $COLOR_MENUTEXT = 7
Global Const $COLOR_WINDOWTEXT = 8
Global Const $COLOR_CAPTIONTEXT = 9
Global Const $COLOR_ACTIVEBORDER = 10
Global Const $COLOR_INACTIVEBORDER = 11
Global Const $COLOR_APPWORKSPACE = 12
Global Const $COLOR_HIGHLIGHT = 13
Global Const $COLOR_HIGHLIGHTTEXT = 14
Global Const $COLOR_BTNFACE = 15
Global Const $COLOR_BTNSHADOW = 16
Global Const $COLOR_GRAYTEXT = 17
Global Const $COLOR_BTNTEXT = 18
Global Const $COLOR_INACTIVECAPTIONTEXT = 19
Global Const $COLOR_BTNHIGHLIGHT = 20
Global Const $COLOR_3DDKSHADOW = 21
Global Const $COLOR_3DLIGHT = 22
Global Const $COLOR_INFOTEXT = 23
Global Const $COLOR_INFOBK = 24
Global Const $COLOR_HOTLIGHT = 26
Global Const $COLOR_GRADIENTACTIVECAPTION = 27
Global Const $COLOR_GRADIENTINACTIVECAPTION = 28
Global Const $COLOR_MENUHILIGHT = 29
Global Const $COLOR_MENUBAR = 30
Global Const $COLOR_DESKTOP = 1
Global Const $COLOR_3DFACE = 15
Global Const $COLOR_3DSHADOW = 16
Global Const $COLOR_3DHIGHLIGHT = 20
Global Const $COLOR_3DHILIGHT = 20
Global Const $COLOR_BTNHILIGHT = 20
Global Const $HINST_COMMCTRL = -1
Global Const $IDB_STD_SMALL_COLOR = 0
Global Const $IDB_STD_LARGE_COLOR = 1
Global Const $IDB_VIEW_SMALL_COLOR = 4
Global Const $IDB_VIEW_LARGE_COLOR = 5
Global Const $IDB_HIST_SMALL_COLOR = 8
Global Const $IDB_HIST_LARGE_COLOR = 9
Global Const $STARTF_FORCEOFFFEEDBACK = 0x80
Global Const $STARTF_FORCEONFEEDBACK = 0x40
Global Const $STARTF_PREVENTPINNING = 0x00002000
Global Const $STARTF_RUNFULLSCREEN = 0x20
Global Const $STARTF_TITLEISAPPID = 0x00001000
Global Const $STARTF_TITLEISLINKNAME = 0x00000800
Global Const $STARTF_USECOUNTCHARS = 0x8
Global Const $STARTF_USEFILLATTRIBUTE = 0x10
Global Const $STARTF_USEHOTKEY = 0x200
Global Const $STARTF_USEPOSITION = 0x4
Global Const $STARTF_USESHOWWINDOW = 0x1
Global Const $STARTF_USESIZE = 0x2
Global Const $STARTF_USESTDHANDLES = 0x100
Global Const $CDDS_PREPAINT = 0x00000001
Global Const $CDDS_POSTPAINT = 0x00000002
Global Const $CDDS_PREERASE = 0x00000003
Global Const $CDDS_POSTERASE = 0x00000004
Global Const $CDDS_ITEM = 0x00010000
Global Const $CDDS_ITEMPREPAINT = 0x00010001
Global Const $CDDS_ITEMPOSTPAINT = 0x00010002
Global Const $CDDS_ITEMPREERASE = 0x00010003
Global Const $CDDS_ITEMPOSTERASE = 0x00010004
Global Const $CDDS_SUBITEM = 0x00020000
Global Const $CDIS_SELECTED = 0x0001
Global Const $CDIS_GRAYED = 0x0002
Global Const $CDIS_DISABLED = 0x0004
Global Const $CDIS_CHECKED = 0x0008
Global Const $CDIS_FOCUS = 0x0010
Global Const $CDIS_DEFAULT = 0x0020
Global Const $CDIS_HOT = 0x0040
Global Const $CDIS_MARKED = 0x0080
Global Const $CDIS_INDETERMINATE = 0x0100
Global Const $CDIS_SHOWKEYBOARDCUES = 0x0200
Global Const $CDIS_NEARHOT = 0x0400
Global Const $CDIS_OTHERSIDEHOT = 0x0800
Global Const $CDIS_DROPHILITED = 0x1000
Global Const $CDRF_DODEFAULT = 0x00000000
Global Const $CDRF_NEWFONT = 0x00000002
Global Const $CDRF_SKIPDEFAULT = 0x00000004
Global Const $CDRF_NOTIFYPOSTPAINT = 0x00000010
Global Const $CDRF_NOTIFYITEMDRAW = 0x00000020
Global Const $CDRF_NOTIFYSUBITEMDRAW = 0x00000020
Global Const $CDRF_NOTIFYPOSTERASE = 0x00000040
Global Const $CDRF_DOERASE = 0x00000008
Global Const $CDRF_SKIPPOSTPAINT = 0x00000100
Global Const $GUI_SS_DEFAULT_GUI = BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU)
#EndRegion
Main()
End()
#Region -- STARTUP
Func StartupCoreGlobals()
Global $sAppOrg         = 'briankyncl.com'
Global $sAppName        = 'About This Computer'
Global $sAppDisplayName = 'About This Computer Configurator'
Global $sAppShortName   = 'ATC'
Global $sAppDocsHost    = 'GitHub'
Global $sAppDocsFormat  = 'website'
Global $sAppDocsURL     = 'https://github.com/briankyncl/aboutthiscomputer'
Local  $aFileVersion = StringSplit(FileGetVersion(@AutoItExe), '.')
Global $sAppBuild    = $aFileVersion[4]
Global $sAppVersion  = $aFileVersion[1] & '.' & $aFileVersion[2] & '.' & $aFileVersion[3]
Global $sAppRelease  = '2020-xx-xx'
Global $sAppInstallPath       = @ProgramFilesDir & '\' & $sAppOrg & '\' & $sAppName
Global $sAppSourcePath        = @ScriptDir
Global $sAppTempPath          = @TempDir & '\' & $sAppOrg & '\' & $sAppName
Global $sAppStartMenuPath     = @ProgramsCommonDir & '\' & $sAppName
Global $sAppRegistryPath      = 'HKEY_LOCAL_MACHINE\Software\' & $sAppOrg & '\' & $sAppName
Global $sAppLogo              = $sAppTempPath & '\ATC-BeOS_Customize_wrench.ico'
Global $sAppParentLogo        = $sAppTempPath & '\ATC-BeOS_Customize_info.ico'
DirCreate($sAppTempPath)
FileInstall('Images\BeOS_Customize_wrench.ico', $sAppLogo, $FC_OVERWRITE)
FileInstall('Images\BeOS_Customize_info.ico', $sAppParentLogo, $FC_OVERWRITE)
EndFunc
Func StartupExeMode()
Global $sMainAppExeMode = ''
If $CmdLine[00] > 0 Then
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
$sMainAppExeMode = 'gui'
EndIf
EndFunc
Func StartupGlobals()
Global $GUI_CHECKENABLE = $GUI_CHECKED + $GUI_ENABLE
Global $GUI_UNCHECKENABLE = $GUI_UNCHECKED + $GUI_ENABLE
Global $GUI_CHECKDISABLE = $GUI_CHECKED + $GUI_DISABLE
Global $GUI_UNCHECKDISABLE = $GUI_UNCHECKED + $GUI_DISABLE
Global $hGUIMain
EndFunc
#EndRegion
#Region -- MAIN
Func Main()
StartupCoreGlobals()
StartupExeMode()
StartupGlobals()
_ATC_Customization($sAppRegistryPath, 'Declare')
_ATC_Customization($sAppRegistryPath, 'Read')
Switch $sMainAppExeMode
Case 'import'
Case 'export'
Case Else
EndSwitch
GUIDefine()
GUIBuild()
GUILoad('Default')
GUIState('Ready')
GUIWait()
End()
EndFunc
#EndRegion
#Region -- BUILD INTERFACE
Func GUIDefine()
Global $iGUIMainWidthDefault = 840
Global $iGUIMainHeightDefault = 455
Global $iGUIMainMenuBarHeight = 20
Global $iGUIMainStatusBarHeight = 23
Global $iGUIMainTabAllButtonHeight = 29
Global $iGUIMainTabAllButtonHeightLarge = 40
Global $iGUIMainColumnLeft00 = 0
Global $iGUIMainColumnLeft01 = $iGUIMainColumnLeft00 + 10
Global $iGUIMainColumnLeft02 = $iGUIMainColumnLeft00 + 10
Global $iGUIMainColumnLeft00Width = 148
Global $iGUIMainColumnLeft01Width = 128
Global $iGUIMainColumnLeft02Width = $iGUIMainColumnLeft00Width - 15
Global $iGUIMainRowLeft00 = 0
Global $iGUIMainRowLeft00Height = $iGUIMainHeightDefault
Global $iGUIMainRowLeft01 = $iGUIMainRowLeft00 + 20
Global $iGUIMainRowLeft01Height = 128
Global $iGUIMainRowLeft02 = $iGUIMainHeightDefault - 10 - $iGUIMainTabAllButtonHeightLarge
Global $iGUIMainRowLeft02Height = $iGUIMainTabAllButtonHeightLarge
Global $iGUIMainRowLeft03 = $iGUIMainRowLeft02 - 10 - $iGUIMainTabAllButtonHeight
Global $iGUIMainRowLeft03Height = $iGUIMainTabAllButtonHeight
Global $iGUIMainColumnRight00 = $iGUIMainColumnLeft00Width
Global $iGUIMainColumnRight01 = $iGUIMainColumnLeft00Width + 5
Global $iGUIMainColumnRight00Width = $iGUIMainWidthDefault - $iGUIMainColumnLeft00Width
Global $iGUIMainColumnRight01Width = $iGUIMainColumnRight00Width - 15
Global $iGUIMainRowRight00 = 0
Global $iGUIMainRowRight01 = $iGUIMainRowRight00 + 10
Global $iGUIMainRowRight00Height = $iGUIMainHeightDefault
Global $iGUIMainRowRight01Height = $iGUIMainRowRight00Height - 20
Global $iGUIMainTabAllChromeTop = 25
Global $iGUIMainTabAllChromeBottom = 1
Global $iGUIMainTabAllChromeLeft = 1
Global $iGUIMainTabAllChromeRight = 1
Global $iGUIMainTabAllWidthDefault = $iGUIMainColumnRight01Width - $iGUIMainTabAllChromeLeft - $iGUIMainTabAllChromeRight
Global $iGUIMainTabAllHeightDefault = $iGUIMainRowRight01Height - $iGUIMainTabAllChromeTop - $iGUIMainTabAllChromeBottom
Global $iGUIMainTabAllCheckboxesWidth = 125
Global $iGUIMainTabAllChromeCheckboxHeight = 17
Global $iGUIMainTabAllChromeCheckboxSpacer = 3
Global $iGUIMainTabAllChromeCheckboxSpacerExterior = 5
Global $iGUIMainTabAllChromeCheckboxSpacerFinal = 7
Global $iGUIMainTabAllChromeCheckboxOffset = 2
Global $iGUIMainTabAllChromeInputHeight = 21
Global $iGUIMainTabAllChromeInputSpacer = 9
Global $iGUIMainTabAllChromeInputSpacerSmall = 4
Global $iGUIMainTabAllPaddingVertical = 15
Global $iGUIMainTabAllPaddingTop = 10
Global $iGUIMainTabAllChromeGroupTop = 23
Global $iGUIMainTabAllChromeGroupBottom = 12
Global $iGUIMainTabAllRow00 = $iGUIMainRowRight01 + $iGUIMainTabAllChromeTop
Global $iGUIMainTabAllRow01 = $iGUIMainTabAllRow00 + 10
Global $iGUIMainTabAllColumnLeft00 = $iGUIMainColumnRight01 + $iGUIMainTabAllChromeLeft
Global $iGUIMainTabAllColumnLeft01 = $iGUIMainTabAllColumnLeft00 + 10
Global $iGUIMainTabAllColumnLeft02 = $iGUIMainTabAllColumnLeft01 + 10
Global $iGUIMainTabAllColumnLeft03 = $iGUIMainTabAllColumnLeft02 + $iGUIMainTabAllCheckboxesWidth
Global $iGUIMainTabAllColumnLeft00Width = $iGUIMainTabAllWidthDefault / 2
Global $iGUIMainTabAllColumnLeft01Width = $iGUIMainTabAllColumnLeft00Width - 15
Global $iGUIMainTabAllColumnLeft02Width = $iGUIMainTabAllCheckboxesWidth
Global $iGUIMainTabAllColumnLeft03Width = $iGUIMainTabAllColumnLeft01Width - $iGUIMainTabAllColumnLeft02Width - 10
Global $iGUIMainTabAllColumnRight00 = $iGUIMainTabAllColumnLeft00 + $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabAllColumnRight01 = $iGUIMainTabAllColumnRight00 + 5
Global $iGUIMainTabAllColumnRight02 = $iGUIMainTabAllColumnRight01 + 10
Global $iGUIMainTabAllColumnRight03 = $iGUIMainTabAllColumnRight02 + $iGUIMainTabAllCheckboxesWidth
Global $iGUIMainTabAllColumnRight00Width = $iGUIMainTabAllWidthDefault / 2
Global $iGUIMainTabAllColumnRight01Width = $iGUIMainTabAllColumnRight00Width - 17
Global $iGUIMainTabAllColumnRight02Width = $iGUIMainTabAllCheckboxesWidth
Global $iGUIMainTabAllColumnRight03Width = $iGUIMainTabAllColumnLeft01Width - $iGUIMainTabAllColumnRight02Width - 12
Global $iGUIMainTabMainGeneralColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabMainGeneralColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabMainGeneralColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabMainGeneralColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabMainGeneralColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabMainGeneralColumn02Width = $iGUIMainTabMainGeneralColumn01Width - 12
Global $iGUIMainTabMainGeneralRow00       = $iGUIMainTabAllRow00
Global $iGUIMainTabMainGeneralRow00Height = 0
Global $iGUIMainTabMainGeneralRow01       = $iGUIMainTabMainGeneralRow00
Global $iGUIMainTabMainGeneralRow01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabMainGeneralRow02       = $iGUIMainTabMainGeneralRow01 + $iGUIMainTabMainGeneralRow01Height
Global $iGUIMainTabMainGeneralRow02Height = 0
Global $iGUIMainTabMainGeneralRow03       = $iGUIMainTabMainGeneralRow02
Global $iGUIMainTabMainGeneralRow03Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabMainGeneralRow04       = $iGUIMainTabMainGeneralRow03 + $iGUIMainTabMainGeneralRow03Height
Global $iGUIMainTabMainGeneralRow04Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabMainGeneralRow05       = $iGUIMainTabMainGeneralRow04 + $iGUIMainTabMainGeneralRow04Height
Global $iGUIMainTabMainGeneralRow05Height = $iGUIMainTabAllChromeCheckboxSpacer
Global $iGUIMainTabMainGeneralRow06       = $iGUIMainTabMainGeneralRow05 + $iGUIMainTabMainGeneralRow05Height
Global $iGUIMainTabMainGeneralRow06Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabMainGeneralRow07       = $iGUIMainTabMainGeneralRow06 + $iGUIMainTabMainGeneralRow06Height
Global $iGUIMainTabMainGeneralRow07Height = $iGUIMainTabAllChromeCheckboxSpacerFinal
$iGUIMainTabMainGeneralRow02Height = $iGUIMainTabMainGeneralRow03Height + $iGUIMainTabMainGeneralRow04Height + $iGUIMainTabMainGeneralRow05Height + $iGUIMainTabMainGeneralRow06Height + $iGUIMainTabMainGeneralRow07Height
$iGUIMainTabMainGeneralRow00Height = $iGUIMainTabMainGeneralRow02Height + $iGUIMainTabMainGeneralRow01Height
Local $iGUIMainTabTrayIconRadioWidth = 20
Local $iGUIMainTabTrayIconImageWidth = 24
Local $iGUIMainTabTrayIconSpacerSmall = 0
Local $iGUIMainTabTrayIconSpacerLarge = 15
Global $iGUIMainTabMainTrayIconColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabMainTrayIconColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabMainTrayIconColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabMainTrayIconColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabMainTrayIconColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabMainTrayIconColumn02Width = $iGUIMainTabTrayIconRadioWidth
Global $iGUIMainTabMainTrayIconColumn03      = $iGUIMainTabMainTrayIconColumn02 + $iGUIMainTabMainTrayIconColumn02Width
Global $iGUIMainTabMainTrayIconColumn03Width = $iGUIMainTabTrayIconSpacerSmall
Global $iGUIMainTabMainTrayIconColumn04      = $iGUIMainTabMainTrayIconColumn03 + $iGUIMainTabMainTrayIconColumn03Width
Global $iGUIMainTabMainTrayIconColumn04Width = $iGUIMainTabTrayIconImageWidth
Global $iGUIMainTabMainTrayIconColumn05      = $iGUIMainTabMainTrayIconColumn04 + $iGUIMainTabMainTrayIconColumn04Width
Global $iGUIMainTabMainTrayIconColumn05Width = $iGUIMainTabTrayIconSpacerLarge
Global $iGUIMainTabMainTrayIconColumn06      = $iGUIMainTabMainTrayIconColumn05 + $iGUIMainTabMainTrayIconColumn05Width
Global $iGUIMainTabMainTrayIconColumn06Width = $iGUIMainTabTrayIconRadioWidth
Global $iGUIMainTabMainTrayIconColumn07      = $iGUIMainTabMainTrayIconColumn06 + $iGUIMainTabMainTrayIconColumn06Width
Global $iGUIMainTabMainTrayIconColumn07Width = $iGUIMainTabTrayIconSpacerSmall
Global $iGUIMainTabMainTrayIconColumn08      = $iGUIMainTabMainTrayIconColumn07 + $iGUIMainTabMainTrayIconColumn07Width
Global $iGUIMainTabMainTrayIconColumn08Width = $iGUIMainTabTrayIconImageWidth
Global $iGUIMainTabMainTrayIconColumn09      = $iGUIMainTabMainTrayIconColumn08 + $iGUIMainTabMainTrayIconColumn08Width
Global $iGUIMainTabMainTrayIconColumn09Width = $iGUIMainTabTrayIconSpacerLarge
Global $iGUIMainTabMainTrayIconColumn10      = $iGUIMainTabMainTrayIconColumn09 + $iGUIMainTabMainTrayIconColumn09Width
Global $iGUIMainTabMainTrayIconColumn10Width = $iGUIMainTabTrayIconRadioWidth
Global $iGUIMainTabMainTrayIconColumn11      = $iGUIMainTabMainTrayIconColumn10 + $iGUIMainTabMainTrayIconColumn10Width
Global $iGUIMainTabMainTrayIconColumn11Width = $iGUIMainTabTrayIconSpacerSmall
Global $iGUIMainTabMainTrayIconColumn12      = $iGUIMainTabMainTrayIconColumn11 + $iGUIMainTabMainTrayIconColumn11Width
Global $iGUIMainTabMainTrayIconColumn12Width = $iGUIMainTabTrayIconImageWidth
Global $iGUIMainTabMainTrayIconColumn13      = $iGUIMainTabMainTrayIconColumn12 + $iGUIMainTabMainTrayIconColumn12Width
Global $iGUIMainTabMainTrayIconColumn13Width = $iGUIMainTabTrayIconSpacerLarge
Global $iGUIMainTabMainTrayIconColumn14      = $iGUIMainTabMainTrayIconColumn13 + $iGUIMainTabMainTrayIconColumn13Width
Global $iGUIMainTabMainTrayIconColumn14Width = $iGUIMainTabTrayIconRadioWidth
Global $iGUIMainTabMainTrayIconColumn15      = $iGUIMainTabMainTrayIconColumn14 + $iGUIMainTabMainTrayIconColumn14Width
Global $iGUIMainTabMainTrayIconColumn15Width = $iGUIMainTabTrayIconSpacerSmall
Global $iGUIMainTabMainTrayIconColumn16      = $iGUIMainTabMainTrayIconColumn15 + $iGUIMainTabMainTrayIconColumn15Width
Global $iGUIMainTabMainTrayIconColumn16Width = $iGUIMainTabTrayIconImageWidth
Global $iGUIMainTabMainTrayIconColumn17      = $iGUIMainTabMainTrayIconColumn16 + $iGUIMainTabMainTrayIconColumn16Width
Global $iGUIMainTabMainTrayIconColumn17Width = $iGUIMainTabTrayIconSpacerLarge
Global $iGUIMainTabMainTrayIconColumn18      = $iGUIMainTabMainTrayIconColumn17 + $iGUIMainTabMainTrayIconColumn17Width
Global $iGUIMainTabMainTrayIconColumn18Width = $iGUIMainTabTrayIconRadioWidth
Global $iGUIMainTabMainTrayIconColumn19      = $iGUIMainTabMainTrayIconColumn18 + $iGUIMainTabMainTrayIconColumn18Width
Global $iGUIMainTabMainTrayIconColumn19Width = $iGUIMainTabTrayIconSpacerSmall
Global $iGUIMainTabMainTrayIconColumn20      = $iGUIMainTabMainTrayIconColumn19 + $iGUIMainTabMainTrayIconColumn19Width
Global $iGUIMainTabMainTrayIconColumn20Width = $iGUIMainTabTrayIconImageWidth
Global $iGUIMainTabMainTrayIconColumn21      = $iGUIMainTabMainTrayIconColumn20 + $iGUIMainTabMainTrayIconColumn20Width
Global $iGUIMainTabMainTrayIconColumn21Width = $iGUIMainTabTrayIconSpacerLarge
Global $iGUIMainTabMainTrayIconRow00       = $iGUIMainTabMainGeneralRow00 + $iGUIMainTabMainGeneralRow00Height
Global $iGUIMainTabMainTrayIconRow00Height = 0
Global $iGUIMainTabMainTrayIconRow01       = $iGUIMainTabMainTrayIconRow00
Global $iGUIMainTabMainTrayIconRow01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabMainTrayIconRow02       = $iGUIMainTabMainTrayIconRow01 + $iGUIMainTabMainTrayIconRow01Height
Global $iGUIMainTabMainTrayIconRow02Height = 0
Global $iGUIMainTabMainTrayIconRow03       = $iGUIMainTabMainTrayIconRow02
Global $iGUIMainTabMainTrayIconRow03Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabMainTrayIconRow04       = $iGUIMainTabMainTrayIconRow03 + $iGUIMainTabMainTrayIconRow03Height
Global $iGUIMainTabMainTrayIconRow04Height = $iGUIMainTabTrayIconImageWidth
Global $iGUIMainTabMainTrayIconRow05       = $iGUIMainTabMainTrayIconRow04 + $iGUIMainTabMainTrayIconRow04Height
Global $iGUIMainTabMainTrayIconRow05Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabMainTrayIconRow02Height = $iGUIMainTabMainTrayIconRow03Height + $iGUIMainTabMainTrayIconRow04Height + $iGUIMainTabMainTrayIconRow05Height
$iGUIMainTabMainTrayIconRow00Height = $iGUIMainTabMainTrayIconRow02Height + $iGUIMainTabMainTrayIconRow01Height
Global $iGUIMainTabMainAssetTagColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabMainAssetTagColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabMainAssetTagColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabMainAssetTagColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabMainAssetTagColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabMainAssetTagColumn02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabMainAssetTagColumn03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabMainAssetTagColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabMainAssetTagRow00       = $iGUIMainTabMainTrayIconRow00 + $iGUIMainTabMainTrayIconRow00Height
Global $iGUIMainTabMainAssetTagRow00Height = 0
Global $iGUIMainTabMainAssetTagRow01       = $iGUIMainTabMainAssetTagRow00
Global $iGUIMainTabMainAssetTagRow01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabMainAssetTagRow02       = $iGUIMainTabMainAssetTagRow01 + $iGUIMainTabMainAssetTagRow01Height
Global $iGUIMainTabMainAssetTagRow02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabMainAssetTagRow03       = $iGUIMainTabMainAssetTagRow02 + $iGUIMainTabMainAssetTagRow02Height
Global $iGUIMainTabMainAssetTagRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabMainAssetTagRow04       = $iGUIMainTabMainAssetTagRow03 + $iGUIMainTabMainAssetTagRow03Height
Global $iGUIMainTabMainAssetTagRow04Height = 0
Global $iGUIMainTabMainAssetTagRow05       = $iGUIMainTabMainAssetTagRow04
Global $iGUIMainTabMainAssetTagRow05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabMainAssetTagRow06       = $iGUIMainTabMainAssetTagRow05 + $iGUIMainTabMainAssetTagRow05Height
Global $iGUIMainTabMainAssetTagRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainAssetTagRow07       = $iGUIMainTabMainAssetTagRow06 + $iGUIMainTabMainAssetTagRow06Height
Global $iGUIMainTabMainAssetTagRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabMainAssetTagRow08       = $iGUIMainTabMainAssetTagRow07 + $iGUIMainTabMainAssetTagRow07Height
Global $iGUIMainTabMainAssetTagRow08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainAssetTagRow09       = $iGUIMainTabMainAssetTagRow08 + $iGUIMainTabMainAssetTagRow08Height
Global $iGUIMainTabMainAssetTagRow09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabMainAssetTagRow04Height = $iGUIMainTabMainAssetTagRow05Height + $iGUIMainTabMainAssetTagRow06Height + $iGUIMainTabMainAssetTagRow07Height + $iGUIMainTabMainAssetTagRow08Height + $iGUIMainTabMainAssetTagRow09Height
$iGUIMainTabMainAssetTagRow00Height = $iGUIMainTabMainAssetTagRow04Height + $iGUIMainTabMainAssetTagRow01Height + $iGUIMainTabMainAssetTagRow02Height + $iGUIMainTabMainAssetTagRow03Height
Global $iGUIMainTabMainCustomDetailsColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabMainCustomDetailsColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabMainCustomDetailsColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabMainCustomDetailsColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabMainCustomDetailsColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabMainCustomDetailsColumn02Width = 296
Global $iGUIMainTabMainCustomDetailsColumn02Offset = (($iGUIMainTabMainCustomDetailsColumn01Width - 22) - $iGUIMainTabMainCustomDetailsColumn02Width) / 2
Global $iGUIMainTabMainCustomDetailsRow00       = $iGUIMainTabMainAssetTagRow00 + $iGUIMainTabMainAssetTagRow00Height
Global $iGUIMainTabMainCustomDetailsRow00Height = 0
Global $iGUIMainTabMainCustomDetailsRow01       = $iGUIMainTabMainCustomDetailsRow00
Global $iGUIMainTabMainCustomDetailsRow01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabMainCustomDetailsRow02       = $iGUIMainTabMainCustomDetailsRow01 + $iGUIMainTabMainCustomDetailsRow01Height
Global $iGUIMainTabMainCustomDetailsRow02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabMainCustomDetailsRow03       = $iGUIMainTabMainCustomDetailsRow02 + $iGUIMainTabMainCustomDetailsRow02Height
Global $iGUIMainTabMainCustomDetailsRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabMainCustomDetailsRow04       = $iGUIMainTabMainCustomDetailsRow03 + $iGUIMainTabMainCustomDetailsRow03Height
Global $iGUIMainTabMainCustomDetailsRow04Height = 0
Global $iGUIMainTabMainCustomDetailsRow05       = $iGUIMainTabMainCustomDetailsRow04
Global $iGUIMainTabMainCustomDetailsRow05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabMainCustomDetailsRow06       = $iGUIMainTabMainCustomDetailsRow05 + $iGUIMainTabMainCustomDetailsRow05Height
Global $iGUIMainTabMainCustomDetailsRow06Height = 58
Global $iGUIMainTabMainCustomDetailsRow07       = $iGUIMainTabMainCustomDetailsRow06 + $iGUIMainTabMainCustomDetailsRow06Height
Global $iGUIMainTabMainCustomDetailsRow07Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabMainCustomDetailsRow04Height = $iGUIMainTabMainCustomDetailsRow05Height + $iGUIMainTabMainCustomDetailsRow06Height + $iGUIMainTabMainCustomDetailsRow07Height
$iGUIMainTabMainCustomDetailsRow00Height = $iGUIMainTabMainCustomDetailsRow04Height + $iGUIMainTabMainCustomDetailsRow01Height + $iGUIMainTabMainCustomDetailsRow02Height + $iGUIMainTabMainCustomDetailsRow03Height
Global $iGUIMainTabMainHelpdeskColumn00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabMainHelpdeskColumn00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabMainHelpdeskColumn01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabMainHelpdeskColumn01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabMainHelpdeskColumn02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabMainHelpdeskColumn02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabMainHelpdeskColumn03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabMainHelpdeskColumn03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabMainHelpdeskRow00       = $iGUIMainTabAllRow00
Global $iGUIMainTabMainHelpdeskRow00Height = 0
Global $iGUIMainTabMainHelpdeskRow01       = $iGUIMainTabMainHelpdeskRow00
Global $iGUIMainTabMainHelpdeskRow01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabMainHelpdeskRow02       = $iGUIMainTabMainHelpdeskRow01 + $iGUIMainTabMainHelpdeskRow01Height
Global $iGUIMainTabMainHelpdeskRow02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabMainHelpdeskRow03       = $iGUIMainTabMainHelpdeskRow02 + $iGUIMainTabMainHelpdeskRow02Height
Global $iGUIMainTabMainHelpdeskRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabMainHelpdeskRow04       = $iGUIMainTabMainHelpdeskRow03 + $iGUIMainTabMainHelpdeskRow03Height
Global $iGUIMainTabMainHelpdeskRow04Height = 0
Global $iGUIMainTabMainHelpdeskRow05       = $iGUIMainTabMainHelpdeskRow04
Global $iGUIMainTabMainHelpdeskRow05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabMainHelpdeskRow06       = $iGUIMainTabMainHelpdeskRow05 + $iGUIMainTabMainHelpdeskRow05Height
Global $iGUIMainTabMainHelpdeskRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow07       = $iGUIMainTabMainHelpdeskRow06 + $iGUIMainTabMainHelpdeskRow06Height
Global $iGUIMainTabMainHelpdeskRow07Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabMainHelpdeskRow08       = $iGUIMainTabMainHelpdeskRow07 + $iGUIMainTabMainHelpdeskRow07Height
Global $iGUIMainTabMainHelpdeskRow08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow09       = $iGUIMainTabMainHelpdeskRow08 + $iGUIMainTabMainHelpdeskRow08Height
Global $iGUIMainTabMainHelpdeskRow09Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabMainHelpdeskRow10       = $iGUIMainTabMainHelpdeskRow09 + $iGUIMainTabMainHelpdeskRow09Height
Global $iGUIMainTabMainHelpdeskRow10Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow11       = $iGUIMainTabMainHelpdeskRow10 + $iGUIMainTabMainHelpdeskRow10Height
Global $iGUIMainTabMainHelpdeskRow11Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabMainHelpdeskRow12       = $iGUIMainTabMainHelpdeskRow11 + $iGUIMainTabMainHelpdeskRow11Height
Global $iGUIMainTabMainHelpdeskRow12Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow13       = $iGUIMainTabMainHelpdeskRow12 + $iGUIMainTabMainHelpdeskRow12Height
Global $iGUIMainTabMainHelpdeskRow13Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabMainHelpdeskRow14       = $iGUIMainTabMainHelpdeskRow13 + $iGUIMainTabMainHelpdeskRow13Height
Global $iGUIMainTabMainHelpdeskRow14Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow15       = $iGUIMainTabMainHelpdeskRow14 + $iGUIMainTabMainHelpdeskRow14Height
Global $iGUIMainTabMainHelpdeskRow15Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabMainHelpdeskRow16       = $iGUIMainTabMainHelpdeskRow15 + $iGUIMainTabMainHelpdeskRow15Height
Global $iGUIMainTabMainHelpdeskRow16Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow17       = $iGUIMainTabMainHelpdeskRow16 + $iGUIMainTabMainHelpdeskRow16Height
Global $iGUIMainTabMainHelpdeskRow17Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabMainHelpdeskRow18       = $iGUIMainTabMainHelpdeskRow17 + $iGUIMainTabMainHelpdeskRow17Height
Global $iGUIMainTabMainHelpdeskRow18Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow19       = $iGUIMainTabMainHelpdeskRow18 + $iGUIMainTabMainHelpdeskRow18Height
Global $iGUIMainTabMainHelpdeskRow19Height = $iGUIMainTabAllChromeInputSpacer + $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabMainHelpdeskRow20       = $iGUIMainTabMainHelpdeskRow19 + $iGUIMainTabMainHelpdeskRow19Height
Global $iGUIMainTabMainHelpdeskRow20Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow21       = $iGUIMainTabMainHelpdeskRow20 + $iGUIMainTabMainHelpdeskRow20Height
Global $iGUIMainTabMainHelpdeskRow21Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabMainHelpdeskRow22       = $iGUIMainTabMainHelpdeskRow21 + $iGUIMainTabMainHelpdeskRow21Height
Global $iGUIMainTabMainHelpdeskRow22Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabMainHelpdeskRow23       = $iGUIMainTabMainHelpdeskRow22 + $iGUIMainTabMainHelpdeskRow22Height
Global $iGUIMainTabMainHelpdeskRow23Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabMainHelpdeskRow04Height = $iGUIMainTabMainHelpdeskRow05Height + $iGUIMainTabMainHelpdeskRow06Height + $iGUIMainTabMainHelpdeskRow07Height + $iGUIMainTabMainHelpdeskRow08Height + $iGUIMainTabMainHelpdeskRow09Height + $iGUIMainTabMainHelpdeskRow10Height + $iGUIMainTabMainHelpdeskRow11Height + $iGUIMainTabMainHelpdeskRow12Height + $iGUIMainTabMainHelpdeskRow13Height + $iGUIMainTabMainHelpdeskRow14Height + $iGUIMainTabMainHelpdeskRow15Height + $iGUIMainTabMainHelpdeskRow16Height + $iGUIMainTabMainHelpdeskRow17Height + $iGUIMainTabMainHelpdeskRow18Height + $iGUIMainTabMainHelpdeskRow19Height + $iGUIMainTabMainHelpdeskRow20Height + $iGUIMainTabMainHelpdeskRow21Height + $iGUIMainTabMainHelpdeskRow22Height + $iGUIMainTabMainHelpdeskRow23Height
$iGUIMainTabMainHelpdeskRow00Height = $iGUIMainTabMainHelpdeskRow04Height + $iGUIMainTabMainHelpdeskRow01Height + $iGUIMainTabMainHelpdeskRow02Height + $iGUIMainTabMainHelpdeskRow03Height
Global $iGUIMainTabToolsGeneralColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabToolsGeneralColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabToolsGeneralColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabToolsGeneralColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabToolsGeneralColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabToolsGeneralColumn02Width = ($iGUIMainTabToolsGeneralColumn01Width / 2) - 6
Global $iGUIMainTabToolsGeneralColumn03      = $iGUIMainTabToolsGeneralColumn02 + $iGUIMainTabToolsGeneralColumn02Width
Global $iGUIMainTabToolsGeneralColumn03Width = $iGUIMainTabToolsGeneralColumn02Width
Global $iGUIMainTabToolsGeneralRow00       = $iGUIMainTabAllRow00
Global $iGUIMainTabToolsGeneralRow00Height = 0
Global $iGUIMainTabToolsGeneralRow01       = $iGUIMainTabToolsGeneralRow00
Global $iGUIMainTabToolsGeneralRow01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabToolsGeneralRow02       = $iGUIMainTabToolsGeneralRow01 + $iGUIMainTabToolsGeneralRow01Height
Global $iGUIMainTabToolsGeneralRow02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsGeneralRow03       = $iGUIMainTabToolsGeneralRow02 + $iGUIMainTabToolsGeneralRow02Height
Global $iGUIMainTabToolsGeneralRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabToolsGeneralRow04       = $iGUIMainTabToolsGeneralRow03 + $iGUIMainTabToolsGeneralRow03Height
Global $iGUIMainTabToolsGeneralRow04Height = 0
Global $iGUIMainTabToolsGeneralRow05       = $iGUIMainTabToolsGeneralRow04
Global $iGUIMainTabToolsGeneralRow05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabToolsGeneralRow06       = $iGUIMainTabToolsGeneralRow05 + $iGUIMainTabToolsGeneralRow05Height
Global $iGUIMainTabToolsGeneralRow06Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsGeneralRow07       = $iGUIMainTabToolsGeneralRow06 + $iGUIMainTabToolsGeneralRow06Height
Global $iGUIMainTabToolsGeneralRow07Height = $iGUIMainTabAllChromeCheckboxSpacer
Global $iGUIMainTabToolsGeneralRow08       = $iGUIMainTabToolsGeneralRow07 + $iGUIMainTabToolsGeneralRow07Height
Global $iGUIMainTabToolsGeneralRow08Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsGeneralRow09       = $iGUIMainTabToolsGeneralRow08 + $iGUIMainTabToolsGeneralRow08Height
Global $iGUIMainTabToolsGeneralRow09Height = $iGUIMainTabAllChromeCheckboxSpacer
Global $iGUIMainTabToolsGeneralRow10       = $iGUIMainTabToolsGeneralRow09 + $iGUIMainTabToolsGeneralRow09Height
Global $iGUIMainTabToolsGeneralRow10Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsGeneralRow11       = $iGUIMainTabToolsGeneralRow10 + $iGUIMainTabToolsGeneralRow10Height
Global $iGUIMainTabToolsGeneralRow11Height = $iGUIMainTabAllChromeCheckboxSpacer
Global $iGUIMainTabToolsGeneralRow12       = $iGUIMainTabToolsGeneralRow11 + $iGUIMainTabToolsGeneralRow11Height
Global $iGUIMainTabToolsGeneralRow12Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsGeneralRow13       = $iGUIMainTabToolsGeneralRow12 + $iGUIMainTabToolsGeneralRow12Height
Global $iGUIMainTabToolsGeneralRow13Height = $iGUIMainTabAllChromeCheckboxSpacer
Global $iGUIMainTabToolsGeneralRow14       = $iGUIMainTabToolsGeneralRow13 + $iGUIMainTabToolsGeneralRow13Height
Global $iGUIMainTabToolsGeneralRow14Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsGeneralRow15       = $iGUIMainTabToolsGeneralRow14 + $iGUIMainTabToolsGeneralRow14Height
Global $iGUIMainTabToolsGeneralRow15Height = $iGUIMainTabAllChromeCheckboxSpacer
Global $iGUIMainTabToolsGeneralRow16       = $iGUIMainTabToolsGeneralRow15 + $iGUIMainTabToolsGeneralRow15Height
Global $iGUIMainTabToolsGeneralRow16Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsGeneralRow17       = $iGUIMainTabToolsGeneralRow16 + $iGUIMainTabToolsGeneralRow16Height
Global $iGUIMainTabToolsGeneralRow17Height = $iGUIMainTabAllChromeCheckboxSpacerFinal
$iGUIMainTabToolsGeneralRow04Height = $iGUIMainTabToolsGeneralRow05Height + $iGUIMainTabToolsGeneralRow06Height + $iGUIMainTabToolsGeneralRow07Height + $iGUIMainTabToolsGeneralRow08Height + $iGUIMainTabToolsGeneralRow09Height + $iGUIMainTabToolsGeneralRow10Height + $iGUIMainTabToolsGeneralRow11Height + $iGUIMainTabToolsGeneralRow12Height + $iGUIMainTabToolsGeneralRow13Height + $iGUIMainTabToolsGeneralRow14Height + $iGUIMainTabToolsGeneralRow15Height + $iGUIMainTabToolsGeneralRow16Height + $iGUIMainTabToolsGeneralRow17Height
$iGUIMainTabToolsGeneralRow00Height = $iGUIMainTabToolsGeneralRow04Height + $iGUIMainTabToolsGeneralRow01Height + $iGUIMainTabToolsGeneralRow02Height + $iGUIMainTabToolsGeneralRow03Height
Global $iGUIMainTabToolsLoginScriptColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabToolsLoginScriptColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabToolsLoginScriptColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabToolsLoginScriptColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabToolsLoginScriptColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabToolsLoginScriptColumn02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabToolsLoginScriptColumn03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabToolsLoginScriptColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabToolsLoginScriptRow00       = $iGUIMainTabToolsGeneralRow00 + $iGUIMainTabToolsGeneralRow00Height
Global $iGUIMainTabToolsLoginScriptRow00Height = 0
Global $iGUIMainTabToolsLoginScriptRow01       = $iGUIMainTabToolsLoginScriptRow00
Global $iGUIMainTabToolsLoginScriptRow01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabToolsLoginScriptRow02       = $iGUIMainTabToolsLoginScriptRow01 + $iGUIMainTabToolsLoginScriptRow01Height
Global $iGUIMainTabToolsLoginScriptRow02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsLoginScriptRow03       = $iGUIMainTabToolsLoginScriptRow02 + $iGUIMainTabToolsLoginScriptRow02Height
Global $iGUIMainTabToolsLoginScriptRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabToolsLoginScriptRow04       = $iGUIMainTabToolsLoginScriptRow03 + $iGUIMainTabToolsLoginScriptRow03Height
Global $iGUIMainTabToolsLoginScriptRow04Height = 0
Global $iGUIMainTabToolsLoginScriptRow05       = $iGUIMainTabToolsLoginScriptRow04
Global $iGUIMainTabToolsLoginScriptRow05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabToolsLoginScriptRow06       = $iGUIMainTabToolsLoginScriptRow05 + $iGUIMainTabToolsLoginScriptRow05Height
Global $iGUIMainTabToolsLoginScriptRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabToolsLoginScriptRow07       = $iGUIMainTabToolsLoginScriptRow06 + $iGUIMainTabToolsLoginScriptRow06Height
Global $iGUIMainTabToolsLoginScriptRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabToolsLoginScriptRow08       = $iGUIMainTabToolsLoginScriptRow07 + $iGUIMainTabToolsLoginScriptRow07Height
Global $iGUIMainTabToolsLoginScriptRow08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabToolsLoginScriptRow09       = $iGUIMainTabToolsLoginScriptRow08 + $iGUIMainTabToolsLoginScriptRow08Height
Global $iGUIMainTabToolsLoginScriptRow09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabToolsLoginScriptRow04Height = $iGUIMainTabToolsLoginScriptRow05Height + $iGUIMainTabToolsLoginScriptRow06Height + $iGUIMainTabToolsLoginScriptRow07Height + $iGUIMainTabToolsLoginScriptRow08Height + $iGUIMainTabToolsLoginScriptRow09Height
$iGUIMainTabToolsLoginScriptRow00Height = $iGUIMainTabToolsLoginScriptRow04Height + $iGUIMainTabToolsLoginScriptRow01Height + $iGUIMainTabToolsLoginScriptRow02Height + $iGUIMainTabToolsLoginScriptRow03Height
Global $iGUIMainTabToolsHomeDriveColumn00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabToolsHomeDriveColumn00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabToolsHomeDriveColumn01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabToolsHomeDriveColumn01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabToolsHomeDriveColumn02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabToolsHomeDriveColumn02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabToolsHomeDriveColumn03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabToolsHomeDriveColumn03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabToolsHomeDriveRow00       = $iGUIMainTabAllRow00
Global $iGUIMainTabToolsHomeDriveRow00Height = 0
Global $iGUIMainTabToolsHomeDriveRow01       = $iGUIMainTabToolsHomeDriveRow00
Global $iGUIMainTabToolsHomeDriveRow01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabToolsHomeDriveRow02       = $iGUIMainTabToolsHomeDriveRow01 + $iGUIMainTabToolsHomeDriveRow01Height
Global $iGUIMainTabToolsHomeDriveRow02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabToolsHomeDriveRow03       = $iGUIMainTabToolsHomeDriveRow02 + $iGUIMainTabToolsHomeDriveRow02Height
Global $iGUIMainTabToolsHomeDriveRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabToolsHomeDriveRow04       = $iGUIMainTabToolsHomeDriveRow03 + $iGUIMainTabToolsHomeDriveRow03Height
Global $iGUIMainTabToolsHomeDriveRow04Height = 0
Global $iGUIMainTabToolsHomeDriveRow05       = $iGUIMainTabToolsHomeDriveRow04
Global $iGUIMainTabToolsHomeDriveRow05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabToolsHomeDriveRow06       = $iGUIMainTabToolsHomeDriveRow05 + $iGUIMainTabToolsHomeDriveRow05Height
Global $iGUIMainTabToolsHomeDriveRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabToolsHomeDriveRow07       = $iGUIMainTabToolsHomeDriveRow06 + $iGUIMainTabToolsHomeDriveRow06Height
Global $iGUIMainTabToolsHomeDriveRow07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabToolsHomeDriveRow08       = $iGUIMainTabToolsHomeDriveRow07 + $iGUIMainTabToolsHomeDriveRow07Height
Global $iGUIMainTabToolsHomeDriveRow08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabToolsHomeDriveRow09       = $iGUIMainTabToolsHomeDriveRow08 + $iGUIMainTabToolsHomeDriveRow08Height
Global $iGUIMainTabToolsHomeDriveRow09Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabToolsHomeDriveRow10       = $iGUIMainTabToolsHomeDriveRow09 + $iGUIMainTabToolsHomeDriveRow09Height
Global $iGUIMainTabToolsHomeDriveRow10Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabToolsHomeDriveRow11       = $iGUIMainTabToolsHomeDriveRow10 + $iGUIMainTabToolsHomeDriveRow10Height
Global $iGUIMainTabToolsHomeDriveRow11Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabToolsHomeDriveRow12       = $iGUIMainTabToolsHomeDriveRow11 + $iGUIMainTabToolsHomeDriveRow11Height
Global $iGUIMainTabToolsHomeDriveRow12Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabToolsHomeDriveRow13       = $iGUIMainTabToolsHomeDriveRow12 + $iGUIMainTabToolsHomeDriveRow12Height
Global $iGUIMainTabToolsHomeDriveRow13Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabToolsHomeDriveRow14       = $iGUIMainTabToolsHomeDriveRow13 + $iGUIMainTabToolsHomeDriveRow13Height
Global $iGUIMainTabToolsHomeDriveRow14Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabToolsHomeDriveRow15       = $iGUIMainTabToolsHomeDriveRow14 + $iGUIMainTabToolsHomeDriveRow14Height
Global $iGUIMainTabToolsHomeDriveRow15Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabToolsHomeDriveRow04Height = $iGUIMainTabToolsHomeDriveRow05Height + $iGUIMainTabToolsHomeDriveRow06Height + $iGUIMainTabToolsHomeDriveRow07Height + $iGUIMainTabToolsHomeDriveRow08Height + $iGUIMainTabToolsHomeDriveRow09Height + $iGUIMainTabToolsHomeDriveRow10Height + $iGUIMainTabToolsHomeDriveRow11Height + $iGUIMainTabToolsHomeDriveRow12Height + $iGUIMainTabToolsHomeDriveRow13Height + $iGUIMainTabToolsHomeDriveRow14Height + $iGUIMainTabToolsHomeDriveRow15Height
$iGUIMainTabToolsHomeDriveRow00Height = $iGUIMainTabToolsHomeDriveRow04Height + $iGUIMainTabToolsHomeDriveRow01Height + $iGUIMainTabToolsHomeDriveRow02Height + $iGUIMainTabToolsHomeDriveRow03Height
Global $iGUIMainTabCustomToolsCommand1Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabCustomToolsCommand1Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabCustomToolsCommand1Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabCustomToolsCommand1Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabCustomToolsCommand1Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabCustomToolsCommand1Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabCustomToolsCommand1Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabCustomToolsCommand1Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabCustomToolsCommand1Row00       = $iGUIMainTabAllRow00
Global $iGUIMainTabCustomToolsCommand1Row00Height = 0
Global $iGUIMainTabCustomToolsCommand1Row01       = $iGUIMainTabCustomToolsCommand1Row00
Global $iGUIMainTabCustomToolsCommand1Row01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabCustomToolsCommand1Row02       = $iGUIMainTabCustomToolsCommand1Row01 + $iGUIMainTabCustomToolsCommand1Row01Height
Global $iGUIMainTabCustomToolsCommand1Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabCustomToolsCommand1Row03       = $iGUIMainTabCustomToolsCommand1Row02 + $iGUIMainTabCustomToolsCommand1Row02Height
Global $iGUIMainTabCustomToolsCommand1Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabCustomToolsCommand1Row04       = $iGUIMainTabCustomToolsCommand1Row03 + $iGUIMainTabCustomToolsCommand1Row03Height
Global $iGUIMainTabCustomToolsCommand1Row04Height = 0
Global $iGUIMainTabCustomToolsCommand1Row05       = $iGUIMainTabCustomToolsCommand1Row04
Global $iGUIMainTabCustomToolsCommand1Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabCustomToolsCommand1Row06       = $iGUIMainTabCustomToolsCommand1Row05 + $iGUIMainTabCustomToolsCommand1Row05Height
Global $iGUIMainTabCustomToolsCommand1Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand1Row07       = $iGUIMainTabCustomToolsCommand1Row06 + $iGUIMainTabCustomToolsCommand1Row06Height
Global $iGUIMainTabCustomToolsCommand1Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabCustomToolsCommand1Row08       = $iGUIMainTabCustomToolsCommand1Row07 + $iGUIMainTabCustomToolsCommand1Row07Height
Global $iGUIMainTabCustomToolsCommand1Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand1Row09       = $iGUIMainTabCustomToolsCommand1Row08 + $iGUIMainTabCustomToolsCommand1Row08Height
Global $iGUIMainTabCustomToolsCommand1Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabCustomToolsCommand1Row04Height = $iGUIMainTabCustomToolsCommand1Row05Height + $iGUIMainTabCustomToolsCommand1Row06Height + $iGUIMainTabCustomToolsCommand1Row07Height + $iGUIMainTabCustomToolsCommand1Row08Height + $iGUIMainTabCustomToolsCommand1Row09Height
$iGUIMainTabCustomToolsCommand1Row00Height = $iGUIMainTabCustomToolsCommand1Row04Height + $iGUIMainTabCustomToolsCommand1Row01Height + $iGUIMainTabCustomToolsCommand1Row02Height + $iGUIMainTabCustomToolsCommand1Row03Height
Global $iGUIMainTabCustomToolsCommand2Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabCustomToolsCommand2Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabCustomToolsCommand2Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabCustomToolsCommand2Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabCustomToolsCommand2Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabCustomToolsCommand2Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabCustomToolsCommand2Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabCustomToolsCommand2Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabCustomToolsCommand2Row00       = $iGUIMainTabCustomToolsCommand1Row00 + $iGUIMainTabCustomToolsCommand1Row00Height
Global $iGUIMainTabCustomToolsCommand2Row00Height = 0
Global $iGUIMainTabCustomToolsCommand2Row01       = $iGUIMainTabCustomToolsCommand2Row00
Global $iGUIMainTabCustomToolsCommand2Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabCustomToolsCommand2Row02       = $iGUIMainTabCustomToolsCommand2Row01 + $iGUIMainTabCustomToolsCommand2Row01Height
Global $iGUIMainTabCustomToolsCommand2Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabCustomToolsCommand2Row03       = $iGUIMainTabCustomToolsCommand2Row02 + $iGUIMainTabCustomToolsCommand2Row02Height
Global $iGUIMainTabCustomToolsCommand2Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabCustomToolsCommand2Row04       = $iGUIMainTabCustomToolsCommand2Row03 + $iGUIMainTabCustomToolsCommand2Row03Height
Global $iGUIMainTabCustomToolsCommand2Row04Height = 0
Global $iGUIMainTabCustomToolsCommand2Row05       = $iGUIMainTabCustomToolsCommand2Row04
Global $iGUIMainTabCustomToolsCommand2Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabCustomToolsCommand2Row06       = $iGUIMainTabCustomToolsCommand2Row05 + $iGUIMainTabCustomToolsCommand2Row05Height
Global $iGUIMainTabCustomToolsCommand2Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand2Row07       = $iGUIMainTabCustomToolsCommand2Row06 + $iGUIMainTabCustomToolsCommand2Row06Height
Global $iGUIMainTabCustomToolsCommand2Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabCustomToolsCommand2Row08       = $iGUIMainTabCustomToolsCommand2Row07 + $iGUIMainTabCustomToolsCommand2Row07Height
Global $iGUIMainTabCustomToolsCommand2Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand2Row09       = $iGUIMainTabCustomToolsCommand2Row08 + $iGUIMainTabCustomToolsCommand2Row08Height
Global $iGUIMainTabCustomToolsCommand2Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabCustomToolsCommand2Row04Height = $iGUIMainTabCustomToolsCommand2Row05Height + $iGUIMainTabCustomToolsCommand2Row06Height + $iGUIMainTabCustomToolsCommand2Row07Height + $iGUIMainTabCustomToolsCommand2Row08Height + $iGUIMainTabCustomToolsCommand2Row09Height
$iGUIMainTabCustomToolsCommand2Row00Height = $iGUIMainTabCustomToolsCommand2Row04Height + $iGUIMainTabCustomToolsCommand2Row01Height + $iGUIMainTabCustomToolsCommand2Row02Height + $iGUIMainTabCustomToolsCommand2Row03Height
Global $iGUIMainTabCustomToolsCommand3Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabCustomToolsCommand3Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabCustomToolsCommand3Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabCustomToolsCommand3Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabCustomToolsCommand3Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabCustomToolsCommand3Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabCustomToolsCommand3Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabCustomToolsCommand3Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabCustomToolsCommand3Row00       = $iGUIMainTabCustomToolsCommand2Row00 + $iGUIMainTabCustomToolsCommand2Row00Height
Global $iGUIMainTabCustomToolsCommand3Row00Height = 0
Global $iGUIMainTabCustomToolsCommand3Row01       = $iGUIMainTabCustomToolsCommand3Row00
Global $iGUIMainTabCustomToolsCommand3Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabCustomToolsCommand3Row02       = $iGUIMainTabCustomToolsCommand3Row01 + $iGUIMainTabCustomToolsCommand3Row01Height
Global $iGUIMainTabCustomToolsCommand3Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabCustomToolsCommand3Row03       = $iGUIMainTabCustomToolsCommand3Row02 + $iGUIMainTabCustomToolsCommand3Row02Height
Global $iGUIMainTabCustomToolsCommand3Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabCustomToolsCommand3Row04       = $iGUIMainTabCustomToolsCommand3Row03 + $iGUIMainTabCustomToolsCommand3Row03Height
Global $iGUIMainTabCustomToolsCommand3Row04Height = 0
Global $iGUIMainTabCustomToolsCommand3Row05       = $iGUIMainTabCustomToolsCommand3Row04
Global $iGUIMainTabCustomToolsCommand3Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabCustomToolsCommand3Row06       = $iGUIMainTabCustomToolsCommand3Row05 + $iGUIMainTabCustomToolsCommand3Row05Height
Global $iGUIMainTabCustomToolsCommand3Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand3Row07       = $iGUIMainTabCustomToolsCommand3Row06 + $iGUIMainTabCustomToolsCommand3Row06Height
Global $iGUIMainTabCustomToolsCommand3Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabCustomToolsCommand3Row08       = $iGUIMainTabCustomToolsCommand3Row07 + $iGUIMainTabCustomToolsCommand3Row07Height
Global $iGUIMainTabCustomToolsCommand3Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand3Row09       = $iGUIMainTabCustomToolsCommand3Row08 + $iGUIMainTabCustomToolsCommand3Row08Height
Global $iGUIMainTabCustomToolsCommand3Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabCustomToolsCommand3Row04Height = $iGUIMainTabCustomToolsCommand3Row05Height + $iGUIMainTabCustomToolsCommand3Row06Height + $iGUIMainTabCustomToolsCommand3Row07Height + $iGUIMainTabCustomToolsCommand3Row08Height + $iGUIMainTabCustomToolsCommand3Row09Height
$iGUIMainTabCustomToolsCommand3Row00Height = $iGUIMainTabCustomToolsCommand3Row04Height + $iGUIMainTabCustomToolsCommand3Row01Height + $iGUIMainTabCustomToolsCommand3Row02Height + $iGUIMainTabCustomToolsCommand3Row03Height
Global $iGUIMainTabCustomToolsCommand4Column00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabCustomToolsCommand4Column00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabCustomToolsCommand4Column01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabCustomToolsCommand4Column01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabCustomToolsCommand4Column02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabCustomToolsCommand4Column02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabCustomToolsCommand4Column03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabCustomToolsCommand4Column03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabCustomToolsCommand4Row00       = $iGUIMainTabAllRow00
Global $iGUIMainTabCustomToolsCommand4Row00Height = 0
Global $iGUIMainTabCustomToolsCommand4Row01       = $iGUIMainTabCustomToolsCommand4Row00
Global $iGUIMainTabCustomToolsCommand4Row01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabCustomToolsCommand4Row02       = $iGUIMainTabCustomToolsCommand4Row01 + $iGUIMainTabCustomToolsCommand4Row01Height
Global $iGUIMainTabCustomToolsCommand4Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabCustomToolsCommand4Row03       = $iGUIMainTabCustomToolsCommand4Row02 + $iGUIMainTabCustomToolsCommand4Row02Height
Global $iGUIMainTabCustomToolsCommand4Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabCustomToolsCommand4Row04       = $iGUIMainTabCustomToolsCommand4Row03 + $iGUIMainTabCustomToolsCommand4Row03Height
Global $iGUIMainTabCustomToolsCommand4Row04Height = 0
Global $iGUIMainTabCustomToolsCommand4Row05       = $iGUIMainTabCustomToolsCommand4Row04
Global $iGUIMainTabCustomToolsCommand4Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabCustomToolsCommand4Row06       = $iGUIMainTabCustomToolsCommand4Row05 + $iGUIMainTabCustomToolsCommand4Row05Height
Global $iGUIMainTabCustomToolsCommand4Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand4Row07       = $iGUIMainTabCustomToolsCommand4Row06 + $iGUIMainTabCustomToolsCommand4Row06Height
Global $iGUIMainTabCustomToolsCommand4Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabCustomToolsCommand4Row08       = $iGUIMainTabCustomToolsCommand4Row07 + $iGUIMainTabCustomToolsCommand4Row07Height
Global $iGUIMainTabCustomToolsCommand4Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand4Row09       = $iGUIMainTabCustomToolsCommand4Row08 + $iGUIMainTabCustomToolsCommand4Row08Height
Global $iGUIMainTabCustomToolsCommand4Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabCustomToolsCommand4Row04Height = $iGUIMainTabCustomToolsCommand4Row05Height + $iGUIMainTabCustomToolsCommand4Row06Height + $iGUIMainTabCustomToolsCommand4Row07Height + $iGUIMainTabCustomToolsCommand4Row08Height + $iGUIMainTabCustomToolsCommand4Row09Height
$iGUIMainTabCustomToolsCommand4Row00Height = $iGUIMainTabCustomToolsCommand4Row04Height + $iGUIMainTabCustomToolsCommand4Row01Height + $iGUIMainTabCustomToolsCommand4Row02Height + $iGUIMainTabCustomToolsCommand4Row03Height
Global $iGUIMainTabCustomToolsCommand5Column00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabCustomToolsCommand5Column00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabCustomToolsCommand5Column01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabCustomToolsCommand5Column01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabCustomToolsCommand5Column02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabCustomToolsCommand5Column02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabCustomToolsCommand5Column03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabCustomToolsCommand5Column03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabCustomToolsCommand5Row00       = $iGUIMainTabCustomToolsCommand4Row00 + $iGUIMainTabCustomToolsCommand4Row00Height
Global $iGUIMainTabCustomToolsCommand5Row00Height = 0
Global $iGUIMainTabCustomToolsCommand5Row01       = $iGUIMainTabCustomToolsCommand5Row00
Global $iGUIMainTabCustomToolsCommand5Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabCustomToolsCommand5Row02       = $iGUIMainTabCustomToolsCommand5Row01 + $iGUIMainTabCustomToolsCommand5Row01Height
Global $iGUIMainTabCustomToolsCommand5Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabCustomToolsCommand5Row03       = $iGUIMainTabCustomToolsCommand5Row02 + $iGUIMainTabCustomToolsCommand5Row02Height
Global $iGUIMainTabCustomToolsCommand5Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabCustomToolsCommand5Row04       = $iGUIMainTabCustomToolsCommand5Row03 + $iGUIMainTabCustomToolsCommand5Row03Height
Global $iGUIMainTabCustomToolsCommand5Row04Height = 0
Global $iGUIMainTabCustomToolsCommand5Row05       = $iGUIMainTabCustomToolsCommand5Row04
Global $iGUIMainTabCustomToolsCommand5Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabCustomToolsCommand5Row06       = $iGUIMainTabCustomToolsCommand5Row05 + $iGUIMainTabCustomToolsCommand5Row05Height
Global $iGUIMainTabCustomToolsCommand5Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand5Row07       = $iGUIMainTabCustomToolsCommand5Row06 + $iGUIMainTabCustomToolsCommand5Row06Height
Global $iGUIMainTabCustomToolsCommand5Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabCustomToolsCommand5Row08       = $iGUIMainTabCustomToolsCommand5Row07 + $iGUIMainTabCustomToolsCommand5Row07Height
Global $iGUIMainTabCustomToolsCommand5Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabCustomToolsCommand5Row09       = $iGUIMainTabCustomToolsCommand5Row08 + $iGUIMainTabCustomToolsCommand5Row08Height
Global $iGUIMainTabCustomToolsCommand5Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabCustomToolsCommand5Row04Height = $iGUIMainTabCustomToolsCommand5Row05Height + $iGUIMainTabCustomToolsCommand5Row06Height + $iGUIMainTabCustomToolsCommand5Row07Height + $iGUIMainTabCustomToolsCommand5Row08Height + $iGUIMainTabCustomToolsCommand5Row09Height
$iGUIMainTabCustomToolsCommand5Row00Height = $iGUIMainTabCustomToolsCommand5Row04Height + $iGUIMainTabCustomToolsCommand5Row01Height + $iGUIMainTabCustomToolsCommand5Row02Height + $iGUIMainTabCustomToolsCommand5Row03Height
Global $iGUIMainTabHelpLink1Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabHelpLink1Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabHelpLink1Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabHelpLink1Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabHelpLink1Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabHelpLink1Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabHelpLink1Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabHelpLink1Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabHelpLink1Row00       = $iGUIMainTabAllRow00
Global $iGUIMainTabHelpLink1Row00Height = 0
Global $iGUIMainTabHelpLink1Row01       = $iGUIMainTabHelpLink1Row00
Global $iGUIMainTabHelpLink1Row01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabHelpLink1Row02       = $iGUIMainTabHelpLink1Row01 + $iGUIMainTabHelpLink1Row01Height
Global $iGUIMainTabHelpLink1Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabHelpLink1Row03       = $iGUIMainTabHelpLink1Row02 + $iGUIMainTabHelpLink1Row02Height
Global $iGUIMainTabHelpLink1Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabHelpLink1Row04       = $iGUIMainTabHelpLink1Row03 + $iGUIMainTabHelpLink1Row03Height
Global $iGUIMainTabHelpLink1Row04Height = 0
Global $iGUIMainTabHelpLink1Row05       = $iGUIMainTabHelpLink1Row04
Global $iGUIMainTabHelpLink1Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabHelpLink1Row06       = $iGUIMainTabHelpLink1Row05 + $iGUIMainTabHelpLink1Row05Height
Global $iGUIMainTabHelpLink1Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink1Row07       = $iGUIMainTabHelpLink1Row06 + $iGUIMainTabHelpLink1Row06Height
Global $iGUIMainTabHelpLink1Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabHelpLink1Row08       = $iGUIMainTabHelpLink1Row07 + $iGUIMainTabHelpLink1Row07Height
Global $iGUIMainTabHelpLink1Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink1Row09       = $iGUIMainTabHelpLink1Row08 + $iGUIMainTabHelpLink1Row08Height
Global $iGUIMainTabHelpLink1Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabHelpLink1Row04Height = $iGUIMainTabHelpLink1Row05Height + $iGUIMainTabHelpLink1Row06Height + $iGUIMainTabHelpLink1Row07Height + $iGUIMainTabHelpLink1Row08Height + $iGUIMainTabHelpLink1Row09Height
$iGUIMainTabHelpLink1Row00Height = $iGUIMainTabHelpLink1Row04Height + $iGUIMainTabHelpLink1Row01Height + $iGUIMainTabHelpLink1Row02Height + $iGUIMainTabHelpLink1Row03Height
Global $iGUIMainTabHelpLink2Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabHelpLink2Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabHelpLink2Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabHelpLink2Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabHelpLink2Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabHelpLink2Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabHelpLink2Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabHelpLink2Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabHelpLink2Row00       = $iGUIMainTabHelpLink1Row00 + $iGUIMainTabHelpLink1Row00Height
Global $iGUIMainTabHelpLink2Row00Height = 0
Global $iGUIMainTabHelpLink2Row01       = $iGUIMainTabHelpLink2Row00
Global $iGUIMainTabHelpLink2Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabHelpLink2Row02       = $iGUIMainTabHelpLink2Row01 + $iGUIMainTabHelpLink2Row01Height
Global $iGUIMainTabHelpLink2Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabHelpLink2Row03       = $iGUIMainTabHelpLink2Row02 + $iGUIMainTabHelpLink2Row02Height
Global $iGUIMainTabHelpLink2Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabHelpLink2Row04       = $iGUIMainTabHelpLink2Row03 + $iGUIMainTabHelpLink2Row03Height
Global $iGUIMainTabHelpLink2Row04Height = 0
Global $iGUIMainTabHelpLink2Row05       = $iGUIMainTabHelpLink2Row04
Global $iGUIMainTabHelpLink2Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabHelpLink2Row06       = $iGUIMainTabHelpLink2Row05 + $iGUIMainTabHelpLink2Row05Height
Global $iGUIMainTabHelpLink2Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink2Row07       = $iGUIMainTabHelpLink2Row06 + $iGUIMainTabHelpLink2Row06Height
Global $iGUIMainTabHelpLink2Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabHelpLink2Row08       = $iGUIMainTabHelpLink2Row07 + $iGUIMainTabHelpLink2Row07Height
Global $iGUIMainTabHelpLink2Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink2Row09       = $iGUIMainTabHelpLink2Row08 + $iGUIMainTabHelpLink2Row08Height
Global $iGUIMainTabHelpLink2Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabHelpLink2Row04Height = $iGUIMainTabHelpLink2Row05Height + $iGUIMainTabHelpLink2Row06Height + $iGUIMainTabHelpLink2Row07Height + $iGUIMainTabHelpLink2Row08Height + $iGUIMainTabHelpLink2Row09Height
$iGUIMainTabHelpLink2Row00Height = $iGUIMainTabHelpLink2Row04Height + $iGUIMainTabHelpLink2Row01Height + $iGUIMainTabHelpLink2Row02Height + $iGUIMainTabHelpLink2Row03Height
Global $iGUIMainTabHelpLink3Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabHelpLink3Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabHelpLink3Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabHelpLink3Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabHelpLink3Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabHelpLink3Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabHelpLink3Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabHelpLink3Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabHelpLink3Row00       = $iGUIMainTabHelpLink2Row00 + $iGUIMainTabHelpLink2Row00Height
Global $iGUIMainTabHelpLink3Row00Height = 0
Global $iGUIMainTabHelpLink3Row01       = $iGUIMainTabHelpLink3Row00
Global $iGUIMainTabHelpLink3Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabHelpLink3Row02       = $iGUIMainTabHelpLink3Row01 + $iGUIMainTabHelpLink3Row01Height
Global $iGUIMainTabHelpLink3Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabHelpLink3Row03       = $iGUIMainTabHelpLink3Row02 + $iGUIMainTabHelpLink3Row02Height
Global $iGUIMainTabHelpLink3Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabHelpLink3Row04       = $iGUIMainTabHelpLink3Row03 + $iGUIMainTabHelpLink3Row03Height
Global $iGUIMainTabHelpLink3Row04Height = 0
Global $iGUIMainTabHelpLink3Row05       = $iGUIMainTabHelpLink3Row04
Global $iGUIMainTabHelpLink3Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabHelpLink3Row06       = $iGUIMainTabHelpLink3Row05 + $iGUIMainTabHelpLink3Row05Height
Global $iGUIMainTabHelpLink3Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink3Row07       = $iGUIMainTabHelpLink3Row06 + $iGUIMainTabHelpLink3Row06Height
Global $iGUIMainTabHelpLink3Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabHelpLink3Row08       = $iGUIMainTabHelpLink3Row07 + $iGUIMainTabHelpLink3Row07Height
Global $iGUIMainTabHelpLink3Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink3Row09       = $iGUIMainTabHelpLink3Row08 + $iGUIMainTabHelpLink3Row08Height
Global $iGUIMainTabHelpLink3Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabHelpLink3Row04Height = $iGUIMainTabHelpLink3Row05Height + $iGUIMainTabHelpLink3Row06Height + $iGUIMainTabHelpLink3Row07Height + $iGUIMainTabHelpLink3Row08Height + $iGUIMainTabHelpLink3Row09Height
$iGUIMainTabHelpLink3Row00Height = $iGUIMainTabHelpLink3Row04Height + $iGUIMainTabHelpLink3Row01Height + $iGUIMainTabHelpLink3Row02Height + $iGUIMainTabHelpLink3Row03Height
Global $iGUIMainTabHelpLink4Column00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabHelpLink4Column00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabHelpLink4Column01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabHelpLink4Column01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabHelpLink4Column02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabHelpLink4Column02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabHelpLink4Column03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabHelpLink4Column03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabHelpLink4Row00       = $iGUIMainTabAllRow00
Global $iGUIMainTabHelpLink4Row00Height = 0
Global $iGUIMainTabHelpLink4Row01       = $iGUIMainTabHelpLink4Row00
Global $iGUIMainTabHelpLink4Row01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabHelpLink4Row02       = $iGUIMainTabHelpLink4Row01 + $iGUIMainTabHelpLink4Row01Height
Global $iGUIMainTabHelpLink4Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabHelpLink4Row03       = $iGUIMainTabHelpLink4Row02 + $iGUIMainTabHelpLink4Row02Height
Global $iGUIMainTabHelpLink4Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabHelpLink4Row04       = $iGUIMainTabHelpLink4Row03 + $iGUIMainTabHelpLink4Row03Height
Global $iGUIMainTabHelpLink4Row04Height = 0
Global $iGUIMainTabHelpLink4Row05       = $iGUIMainTabHelpLink4Row04
Global $iGUIMainTabHelpLink4Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabHelpLink4Row06       = $iGUIMainTabHelpLink4Row05 + $iGUIMainTabHelpLink4Row05Height
Global $iGUIMainTabHelpLink4Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink4Row07       = $iGUIMainTabHelpLink4Row06 + $iGUIMainTabHelpLink4Row06Height
Global $iGUIMainTabHelpLink4Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabHelpLink4Row08       = $iGUIMainTabHelpLink4Row07 + $iGUIMainTabHelpLink4Row07Height
Global $iGUIMainTabHelpLink4Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink4Row09       = $iGUIMainTabHelpLink4Row08 + $iGUIMainTabHelpLink4Row08Height
Global $iGUIMainTabHelpLink4Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabHelpLink4Row04Height = $iGUIMainTabHelpLink4Row05Height + $iGUIMainTabHelpLink4Row06Height + $iGUIMainTabHelpLink4Row07Height + $iGUIMainTabHelpLink4Row08Height + $iGUIMainTabHelpLink4Row09Height
$iGUIMainTabHelpLink4Row00Height = $iGUIMainTabHelpLink4Row04Height + $iGUIMainTabHelpLink4Row01Height + $iGUIMainTabHelpLink4Row02Height + $iGUIMainTabHelpLink4Row03Height
Global $iGUIMainTabHelpLink5Column00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabHelpLink5Column00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabHelpLink5Column01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabHelpLink5Column01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabHelpLink5Column02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabHelpLink5Column02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabHelpLink5Column03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabHelpLink5Column03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabHelpLink5Row00       = $iGUIMainTabHelpLink4Row00 + $iGUIMainTabHelpLink4Row00Height
Global $iGUIMainTabHelpLink5Row00Height = 0
Global $iGUIMainTabHelpLink5Row01       = $iGUIMainTabHelpLink5Row00
Global $iGUIMainTabHelpLink5Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabHelpLink5Row02       = $iGUIMainTabHelpLink5Row01 + $iGUIMainTabHelpLink5Row01Height
Global $iGUIMainTabHelpLink5Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabHelpLink5Row03       = $iGUIMainTabHelpLink5Row02 + $iGUIMainTabHelpLink5Row02Height
Global $iGUIMainTabHelpLink5Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabHelpLink5Row04       = $iGUIMainTabHelpLink5Row03 + $iGUIMainTabHelpLink5Row03Height
Global $iGUIMainTabHelpLink5Row04Height = 0
Global $iGUIMainTabHelpLink5Row05       = $iGUIMainTabHelpLink5Row04
Global $iGUIMainTabHelpLink5Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabHelpLink5Row06       = $iGUIMainTabHelpLink5Row05 + $iGUIMainTabHelpLink5Row05Height
Global $iGUIMainTabHelpLink5Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink5Row07       = $iGUIMainTabHelpLink5Row06 + $iGUIMainTabHelpLink5Row06Height
Global $iGUIMainTabHelpLink5Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabHelpLink5Row08       = $iGUIMainTabHelpLink5Row07 + $iGUIMainTabHelpLink5Row07Height
Global $iGUIMainTabHelpLink5Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabHelpLink5Row09       = $iGUIMainTabHelpLink5Row08 + $iGUIMainTabHelpLink5Row08Height
Global $iGUIMainTabHelpLink5Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabHelpLink5Row04Height = $iGUIMainTabHelpLink5Row05Height + $iGUIMainTabHelpLink5Row06Height + $iGUIMainTabHelpLink5Row07Height + $iGUIMainTabHelpLink5Row08Height + $iGUIMainTabHelpLink5Row09Height
$iGUIMainTabHelpLink5Row00Height = $iGUIMainTabHelpLink5Row04Height + $iGUIMainTabHelpLink5Row01Height + $iGUIMainTabHelpLink5Row02Height + $iGUIMainTabHelpLink5Row03Height
Global $iGUIMainTabServicesService1Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabServicesService1Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabServicesService1Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabServicesService1Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabServicesService1Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabServicesService1Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabServicesService1Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabServicesService1Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabServicesService1Row00       = $iGUIMainTabAllRow00
Global $iGUIMainTabServicesService1Row00Height = 0
Global $iGUIMainTabServicesService1Row01       = $iGUIMainTabServicesService1Row00
Global $iGUIMainTabServicesService1Row01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabServicesService1Row02       = $iGUIMainTabServicesService1Row01 + $iGUIMainTabServicesService1Row01Height
Global $iGUIMainTabServicesService1Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabServicesService1Row03       = $iGUIMainTabServicesService1Row02 + $iGUIMainTabServicesService1Row02Height
Global $iGUIMainTabServicesService1Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabServicesService1Row04       = $iGUIMainTabServicesService1Row03 + $iGUIMainTabServicesService1Row03Height
Global $iGUIMainTabServicesService1Row04Height = 0
Global $iGUIMainTabServicesService1Row05       = $iGUIMainTabServicesService1Row04
Global $iGUIMainTabServicesService1Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabServicesService1Row06       = $iGUIMainTabServicesService1Row05 + $iGUIMainTabServicesService1Row05Height
Global $iGUIMainTabServicesService1Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService1Row07       = $iGUIMainTabServicesService1Row06 + $iGUIMainTabServicesService1Row06Height
Global $iGUIMainTabServicesService1Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabServicesService1Row08       = $iGUIMainTabServicesService1Row07 + $iGUIMainTabServicesService1Row07Height
Global $iGUIMainTabServicesService1Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService1Row09       = $iGUIMainTabServicesService1Row08 + $iGUIMainTabServicesService1Row08Height
Global $iGUIMainTabServicesService1Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabServicesService1Row04Height = $iGUIMainTabServicesService1Row05Height + $iGUIMainTabServicesService1Row06Height + $iGUIMainTabServicesService1Row07Height + $iGUIMainTabServicesService1Row08Height + $iGUIMainTabServicesService1Row09Height
$iGUIMainTabServicesService1Row00Height = $iGUIMainTabServicesService1Row04Height + $iGUIMainTabServicesService1Row01Height + $iGUIMainTabServicesService1Row02Height + $iGUIMainTabServicesService1Row03Height
Global $iGUIMainTabServicesService2Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabServicesService2Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabServicesService2Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabServicesService2Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabServicesService2Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabServicesService2Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabServicesService2Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabServicesService2Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabServicesService2Row00       = $iGUIMainTabServicesService1Row00 + $iGUIMainTabServicesService1Row00Height
Global $iGUIMainTabServicesService2Row00Height = 0
Global $iGUIMainTabServicesService2Row01       = $iGUIMainTabServicesService2Row00
Global $iGUIMainTabServicesService2Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabServicesService2Row02       = $iGUIMainTabServicesService2Row01 + $iGUIMainTabServicesService2Row01Height
Global $iGUIMainTabServicesService2Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabServicesService2Row03       = $iGUIMainTabServicesService2Row02 + $iGUIMainTabServicesService2Row02Height
Global $iGUIMainTabServicesService2Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabServicesService2Row04       = $iGUIMainTabServicesService2Row03 + $iGUIMainTabServicesService2Row03Height
Global $iGUIMainTabServicesService2Row04Height = 0
Global $iGUIMainTabServicesService2Row05       = $iGUIMainTabServicesService2Row04
Global $iGUIMainTabServicesService2Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabServicesService2Row06       = $iGUIMainTabServicesService2Row05 + $iGUIMainTabServicesService2Row05Height
Global $iGUIMainTabServicesService2Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService2Row07       = $iGUIMainTabServicesService2Row06 + $iGUIMainTabServicesService2Row06Height
Global $iGUIMainTabServicesService2Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabServicesService2Row08       = $iGUIMainTabServicesService2Row07 + $iGUIMainTabServicesService2Row07Height
Global $iGUIMainTabServicesService2Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService2Row09       = $iGUIMainTabServicesService2Row08 + $iGUIMainTabServicesService2Row08Height
Global $iGUIMainTabServicesService2Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabServicesService2Row04Height = $iGUIMainTabServicesService2Row05Height + $iGUIMainTabServicesService2Row06Height + $iGUIMainTabServicesService2Row07Height + $iGUIMainTabServicesService2Row08Height + $iGUIMainTabServicesService2Row09Height
$iGUIMainTabServicesService2Row00Height = $iGUIMainTabServicesService2Row04Height + $iGUIMainTabServicesService2Row01Height + $iGUIMainTabServicesService2Row02Height + $iGUIMainTabServicesService2Row03Height
Global $iGUIMainTabServicesService3Column00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabServicesService3Column00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabServicesService3Column01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabServicesService3Column01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabServicesService3Column02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabServicesService3Column02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabServicesService3Column03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabServicesService3Column03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabServicesService3Row00       = $iGUIMainTabServicesService2Row00 + $iGUIMainTabServicesService2Row00Height
Global $iGUIMainTabServicesService3Row00Height = 0
Global $iGUIMainTabServicesService3Row01       = $iGUIMainTabServicesService3Row00
Global $iGUIMainTabServicesService3Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabServicesService3Row02       = $iGUIMainTabServicesService3Row01 + $iGUIMainTabServicesService3Row01Height
Global $iGUIMainTabServicesService3Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabServicesService3Row03       = $iGUIMainTabServicesService3Row02 + $iGUIMainTabServicesService3Row02Height
Global $iGUIMainTabServicesService3Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabServicesService3Row04       = $iGUIMainTabServicesService3Row03 + $iGUIMainTabServicesService3Row03Height
Global $iGUIMainTabServicesService3Row04Height = 0
Global $iGUIMainTabServicesService3Row05       = $iGUIMainTabServicesService3Row04
Global $iGUIMainTabServicesService3Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabServicesService3Row06       = $iGUIMainTabServicesService3Row05 + $iGUIMainTabServicesService3Row05Height
Global $iGUIMainTabServicesService3Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService3Row07       = $iGUIMainTabServicesService3Row06 + $iGUIMainTabServicesService3Row06Height
Global $iGUIMainTabServicesService3Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabServicesService3Row08       = $iGUIMainTabServicesService3Row07 + $iGUIMainTabServicesService3Row07Height
Global $iGUIMainTabServicesService3Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService3Row09       = $iGUIMainTabServicesService3Row08 + $iGUIMainTabServicesService3Row08Height
Global $iGUIMainTabServicesService3Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabServicesService3Row04Height = $iGUIMainTabServicesService3Row05Height + $iGUIMainTabServicesService3Row06Height + $iGUIMainTabServicesService3Row07Height + $iGUIMainTabServicesService3Row08Height + $iGUIMainTabServicesService3Row09Height
$iGUIMainTabServicesService3Row00Height = $iGUIMainTabServicesService3Row04Height + $iGUIMainTabServicesService3Row01Height + $iGUIMainTabServicesService3Row02Height + $iGUIMainTabServicesService3Row03Height
Global $iGUIMainTabServicesService4Column00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabServicesService4Column00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabServicesService4Column01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabServicesService4Column01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabServicesService4Column02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabServicesService4Column02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabServicesService4Column03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabServicesService4Column03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabServicesService4Row00       = $iGUIMainTabAllRow00
Global $iGUIMainTabServicesService4Row00Height = 0
Global $iGUIMainTabServicesService4Row01       = $iGUIMainTabServicesService4Row00
Global $iGUIMainTabServicesService4Row01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabServicesService4Row02       = $iGUIMainTabServicesService4Row01 + $iGUIMainTabServicesService4Row01Height
Global $iGUIMainTabServicesService4Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabServicesService4Row03       = $iGUIMainTabServicesService4Row02 + $iGUIMainTabServicesService4Row02Height
Global $iGUIMainTabServicesService4Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabServicesService4Row04       = $iGUIMainTabServicesService4Row03 + $iGUIMainTabServicesService4Row03Height
Global $iGUIMainTabServicesService4Row04Height = 0
Global $iGUIMainTabServicesService4Row05       = $iGUIMainTabServicesService4Row04
Global $iGUIMainTabServicesService4Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabServicesService4Row06       = $iGUIMainTabServicesService4Row05 + $iGUIMainTabServicesService4Row05Height
Global $iGUIMainTabServicesService4Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService4Row07       = $iGUIMainTabServicesService4Row06 + $iGUIMainTabServicesService4Row06Height
Global $iGUIMainTabServicesService4Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabServicesService4Row08       = $iGUIMainTabServicesService4Row07 + $iGUIMainTabServicesService4Row07Height
Global $iGUIMainTabServicesService4Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService4Row09       = $iGUIMainTabServicesService4Row08 + $iGUIMainTabServicesService4Row08Height
Global $iGUIMainTabServicesService4Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabServicesService4Row04Height = $iGUIMainTabServicesService4Row05Height + $iGUIMainTabServicesService4Row06Height + $iGUIMainTabServicesService4Row07Height + $iGUIMainTabServicesService4Row08Height + $iGUIMainTabServicesService4Row09Height
$iGUIMainTabServicesService4Row00Height = $iGUIMainTabServicesService4Row04Height + $iGUIMainTabServicesService4Row01Height + $iGUIMainTabServicesService4Row02Height + $iGUIMainTabServicesService4Row03Height
Global $iGUIMainTabServicesService5Column00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabServicesService5Column00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabServicesService5Column01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabServicesService5Column01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabServicesService5Column02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabServicesService5Column02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabServicesService5Column03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabServicesService5Column03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabServicesService5Row00       = $iGUIMainTabServicesService4Row00 + $iGUIMainTabServicesService4Row00Height
Global $iGUIMainTabServicesService5Row00Height = 0
Global $iGUIMainTabServicesService5Row01       = $iGUIMainTabServicesService5Row00
Global $iGUIMainTabServicesService5Row01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabServicesService5Row02       = $iGUIMainTabServicesService5Row01 + $iGUIMainTabServicesService5Row01Height
Global $iGUIMainTabServicesService5Row02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabServicesService5Row03       = $iGUIMainTabServicesService5Row02 + $iGUIMainTabServicesService5Row02Height
Global $iGUIMainTabServicesService5Row03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabServicesService5Row04       = $iGUIMainTabServicesService5Row03 + $iGUIMainTabServicesService5Row03Height
Global $iGUIMainTabServicesService5Row04Height = 0
Global $iGUIMainTabServicesService5Row05       = $iGUIMainTabServicesService5Row04
Global $iGUIMainTabServicesService5Row05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabServicesService5Row06       = $iGUIMainTabServicesService5Row05 + $iGUIMainTabServicesService5Row05Height
Global $iGUIMainTabServicesService5Row06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService5Row07       = $iGUIMainTabServicesService5Row06 + $iGUIMainTabServicesService5Row06Height
Global $iGUIMainTabServicesService5Row07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabServicesService5Row08       = $iGUIMainTabServicesService5Row07 + $iGUIMainTabServicesService5Row07Height
Global $iGUIMainTabServicesService5Row08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabServicesService5Row09       = $iGUIMainTabServicesService5Row08 + $iGUIMainTabServicesService5Row08Height
Global $iGUIMainTabServicesService5Row09Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabServicesService5Row04Height = $iGUIMainTabServicesService5Row05Height + $iGUIMainTabServicesService5Row06Height + $iGUIMainTabServicesService5Row07Height + $iGUIMainTabServicesService5Row08Height + $iGUIMainTabServicesService5Row09Height
$iGUIMainTabServicesService5Row00Height = $iGUIMainTabServicesService5Row04Height + $iGUIMainTabServicesService5Row01Height + $iGUIMainTabServicesService5Row02Height + $iGUIMainTabServicesService5Row03Height
Global $iGUIMainTabContactGeneralColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabContactGeneralColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabContactGeneralColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabContactGeneralColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabContactGeneralColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabContactGeneralColumn02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabContactGeneralColumn03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabContactGeneralColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabContactGeneralRow00       = $iGUIMainTabAllRow00
Global $iGUIMainTabContactGeneralRow00Height = 0
Global $iGUIMainTabContactGeneralRow01       = $iGUIMainTabContactGeneralRow00
Global $iGUIMainTabContactGeneralRow01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabContactGeneralRow02       = $iGUIMainTabContactGeneralRow01 + $iGUIMainTabContactGeneralRow01Height
Global $iGUIMainTabContactGeneralRow02Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabContactGeneralRow03       = $iGUIMainTabContactGeneralRow02 + $iGUIMainTabContactGeneralRow02Height
Global $iGUIMainTabContactGeneralRow03Height = $iGUIMainTabAllChromeCheckboxSpacerExterior
Global $iGUIMainTabContactGeneralRow04       = $iGUIMainTabContactGeneralRow03 + $iGUIMainTabContactGeneralRow03Height
Global $iGUIMainTabContactGeneralRow04Height = 0
Global $iGUIMainTabContactGeneralRow05       = $iGUIMainTabContactGeneralRow04
Global $iGUIMainTabContactGeneralRow05Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabContactGeneralRow06       = $iGUIMainTabContactGeneralRow05 + $iGUIMainTabContactGeneralRow05Height
Global $iGUIMainTabContactGeneralRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactGeneralRow07       = $iGUIMainTabContactGeneralRow06 + $iGUIMainTabContactGeneralRow06Height
Global $iGUIMainTabContactGeneralRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabContactGeneralRow08       = $iGUIMainTabContactGeneralRow07 + $iGUIMainTabContactGeneralRow07Height
Global $iGUIMainTabContactGeneralRow08Height = $iGUIMainTabAllChromeCheckboxHeight
Global $iGUIMainTabContactGeneralRow09       = $iGUIMainTabContactGeneralRow08 + $iGUIMainTabContactGeneralRow08Height
Global $iGUIMainTabContactGeneralRow09Height = $iGUIMainTabAllChromeCheckboxSpacerFinal + $iGUIMainTabAllChromeCheckboxOffset
$iGUIMainTabContactGeneralRow04Height = $iGUIMainTabContactGeneralRow05Height + $iGUIMainTabContactGeneralRow06Height + $iGUIMainTabContactGeneralRow07Height + $iGUIMainTabContactGeneralRow08Height + $iGUIMainTabContactGeneralRow09Height
$iGUIMainTabContactGeneralRow00Height = $iGUIMainTabContactGeneralRow04Height + $iGUIMainTabContactGeneralRow01Height + $iGUIMainTabContactGeneralRow02Height + $iGUIMainTabContactGeneralRow03Height
Global $iGUIMainTabContactRecipientColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabContactRecipientColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabContactRecipientColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabContactRecipientColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabContactRecipientColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabContactRecipientColumn02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabContactRecipientColumn03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabContactRecipientColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabContactRecipientRow00       = $iGUIMainTabContactGeneralRow00 + $iGUIMainTabContactGeneralRow00Height
Global $iGUIMainTabContactRecipientRow00Height = 0
Global $iGUIMainTabContactRecipientRow01       = $iGUIMainTabContactRecipientRow00
Global $iGUIMainTabContactRecipientRow01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabContactRecipientRow02       = $iGUIMainTabContactRecipientRow01 + $iGUIMainTabContactRecipientRow01Height
Global $iGUIMainTabContactRecipientRow02Height = 0
Global $iGUIMainTabContactRecipientRow03       = $iGUIMainTabContactRecipientRow02
Global $iGUIMainTabContactRecipientRow03Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabContactRecipientRow04       = $iGUIMainTabContactRecipientRow03 + $iGUIMainTabContactRecipientRow03Height
Global $iGUIMainTabContactRecipientRow04Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactRecipientRow05       = $iGUIMainTabContactRecipientRow04 + $iGUIMainTabContactRecipientRow04Height
Global $iGUIMainTabContactRecipientRow05Height = $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabContactRecipientRow06       = $iGUIMainTabContactRecipientRow05 + $iGUIMainTabContactRecipientRow05Height
Global $iGUIMainTabContactRecipientRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactRecipientRow07       = $iGUIMainTabContactRecipientRow06 + $iGUIMainTabContactRecipientRow06Height
Global $iGUIMainTabContactRecipientRow07Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabContactRecipientRow02Height = $iGUIMainTabContactRecipientRow03Height + $iGUIMainTabContactRecipientRow04Height + $iGUIMainTabContactRecipientRow05Height + $iGUIMainTabContactRecipientRow06Height + $iGUIMainTabContactRecipientRow07Height
$iGUIMainTabContactRecipientRow00Height = $iGUIMainTabContactRecipientRow02Height + $iGUIMainTabContactRecipientRow01Height
Global $iGUIMainTabContactSenderColumn00      = $iGUIMainTabAllColumnLeft00
Global $iGUIMainTabContactSenderColumn00Width = $iGUIMainTabAllColumnLeft00Width
Global $iGUIMainTabContactSenderColumn01      = $iGUIMainTabAllColumnLeft01
Global $iGUIMainTabContactSenderColumn01Width = $iGUIMainTabAllColumnLeft01Width
Global $iGUIMainTabContactSenderColumn02      = $iGUIMainTabAllColumnLeft02
Global $iGUIMainTabContactSenderColumn02Width = $iGUIMainTabAllColumnLeft02Width
Global $iGUIMainTabContactSenderColumn03      = $iGUIMainTabAllColumnLeft03
Global $iGUIMainTabContactSenderColumn03Width = $iGUIMainTabAllColumnLeft03Width - 12
Global $iGUIMainTabContactSenderRow00       = $iGUIMainTabContactRecipientRow00 + $iGUIMainTabContactRecipientRow00Height
Global $iGUIMainTabContactSenderRow00Height = 0
Global $iGUIMainTabContactSenderRow01       = $iGUIMainTabContactSenderRow00
Global $iGUIMainTabContactSenderRow01Height = $iGUIMainTabAllPaddingVertical
Global $iGUIMainTabContactSenderRow02       = $iGUIMainTabContactSenderRow01 + $iGUIMainTabContactSenderRow01Height
Global $iGUIMainTabContactSenderRow02Height = 0
Global $iGUIMainTabContactSenderRow03       = $iGUIMainTabContactSenderRow02
Global $iGUIMainTabContactSenderRow03Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabContactSenderRow04       = $iGUIMainTabContactSenderRow03 + $iGUIMainTabContactSenderRow03Height
Global $iGUIMainTabContactSenderRow04Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSenderRow05       = $iGUIMainTabContactSenderRow04 + $iGUIMainTabContactSenderRow04Height
Global $iGUIMainTabContactSenderRow05Height = $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabContactSenderRow06       = $iGUIMainTabContactSenderRow05 + $iGUIMainTabContactSenderRow05Height
Global $iGUIMainTabContactSenderRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSenderRow07       = $iGUIMainTabContactSenderRow06 + $iGUIMainTabContactSenderRow06Height
Global $iGUIMainTabContactSenderRow07Height = $iGUIMainTabAllChromeInputSpacerSmall
Global $iGUIMainTabContactSenderRow08       = $iGUIMainTabContactSenderRow07 + $iGUIMainTabContactSenderRow07Height
Global $iGUIMainTabContactSEnderRow08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSenderRow09       = $iGUIMainTabContactSenderRow08 + $iGUIMainTabContactSenderRow08Height
Global $iGUIMainTabContactSenderRow09Height = $iGUIMainTabAllChromeCheckboxSpacerFinal
$iGUIMainTabContactSenderRow02Height = $iGUIMainTabContactSenderRow03Height + $iGUIMainTabContactSenderRow04Height + $iGUIMainTabContactSenderRow05Height + $iGUIMainTabContactSenderRow06Height + $iGUIMainTabContactSenderRow07Height + $iGUIMainTabContactSenderRow08Height + $iGUIMainTabContactSenderRow09Height
$iGUIMainTabContactSenderRow00Height = $iGUIMainTabContactSenderRow02Height + $iGUIMainTabContactSenderRow01Height
Global $iGUIMainTabContactSMTPColumn00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabContactSMTPColumn00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabContactSMTPColumn01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabContactSMTPColumn01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabContactSMTPColumn02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabContactSMTPColumn02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabContactSMTPColumn03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabContactSMTPColumn03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabContactSMTPRow00       = $iGUIMainTabAllRow00
Global $iGUIMainTabContactSMTPRow00Height = 0
Global $iGUIMainTabContactSMTPRow01       = $iGUIMainTabContactSMTPRow00
Global $iGUIMainTabContactSMTPRow01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabContactSMTPRow02       = $iGUIMainTabContactSMTPRow01 + $iGUIMainTabContactSMTPRow01Height
Global $iGUIMainTabContactSMTPRow02Height = 0
Global $iGUIMainTabContactSMTPRow03       = $iGUIMainTabContactSMTPRow02
Global $iGUIMainTabContactSMTPRow03Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabContactSMTPRow04       = $iGUIMainTabContactSMTPRow03 + $iGUIMainTabContactSMTPRow03Height
Global $iGUIMainTabContactSMTPRow04Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSMTPRow05       = $iGUIMainTabContactSMTPRow04 + $iGUIMainTabContactSMTPRow04Height
Global $iGUIMainTabContactSMTPRow05Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabContactSMTPRow06       = $iGUIMainTabContactSMTPRow05 + $iGUIMainTabContactSMTPRow05Height
Global $iGUIMainTabContactSMTPRow06Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSMTPRow07       = $iGUIMainTabContactSMTPRow06 + $iGUIMainTabContactSMTPRow06Height
Global $iGUIMainTabContactSMTPRow07Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabContactSMTPRow08       = $iGUIMainTabContactSMTPRow07 + $iGUIMainTabContactSMTPRow07Height
Global $iGUIMainTabContactSMTPRow08Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSMTPRow09       = $iGUIMainTabContactSMTPRow08 + $iGUIMainTabContactSMTPRow08Height
Global $iGUIMainTabContactSMTPRow09Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabContactSMTPRow10       = $iGUIMainTabContactSMTPRow09 + $iGUIMainTabContactSMTPRow09Height
Global $iGUIMainTabContactSMTPRow10Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSMTPRow11       = $iGUIMainTabContactSMTPRow10 + $iGUIMainTabContactSMTPRow10Height
Global $iGUIMainTabContactSMTPRow11Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabContactSMTPRow12       = $iGUIMainTabContactSMTPRow11 + $iGUIMainTabContactSMTPRow11Height
Global $iGUIMainTabContactSMTPRow12Height = $iGUIMainTabAllChromeInputHeight
Global $iGUIMainTabContactSMTPRow13       = $iGUIMainTabContactSMTPRow12 + $iGUIMainTabContactSMTPRow12Height
Global $iGUIMainTabContactSMTPRow13Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabContactSMTPRow02Height = $iGUIMainTabContactSMTPRow03Height + $iGUIMainTabContactSMTPRow04Height + $iGUIMainTabContactSMTPRow05Height + $iGUIMainTabContactSMTPRow06Height + $iGUIMainTabContactSMTPRow07Height + $iGUIMainTabContactSMTPRow08Height + $iGUIMainTabContactSMTPRow09Height + $iGUIMainTabContactSMTPRow10Height + $iGUIMainTabContactSMTPRow11Height + $iGUIMainTabContactSMTPRow12Height + $iGUIMainTabContactSMTPRow13Height
$iGUIMainTabContactSMTPRow00Height = $iGUIMainTabContactSMTPRow02Height + $iGUIMainTabContactSMTPRow01Height
Global $iGUIMainTabContactTestColumn00      = $iGUIMainTabAllColumnRight00
Global $iGUIMainTabContactTestColumn00Width = $iGUIMainTabAllColumnRight00Width
Global $iGUIMainTabContactTestColumn01      = $iGUIMainTabAllColumnRight01
Global $iGUIMainTabContactTestColumn01Width = $iGUIMainTabAllColumnRight01Width
Global $iGUIMainTabContactTestColumn02      = $iGUIMainTabAllColumnRight02
Global $iGUIMainTabContactTestColumn02Width = $iGUIMainTabAllColumnRight02Width
Global $iGUIMainTabContactTestColumn03      = $iGUIMainTabAllColumnRight03
Global $iGUIMainTabContactTestColumn03Width = $iGUIMainTabAllColumnRight03Width - 12
Global $iGUIMainTabContactTestRow00       = $iGUIMainTabContactSMTPRow00 + $iGUIMainTabContactSMTPRow00Height
Global $iGUIMainTabContactTestRow00Height = 0
Global $iGUIMainTabContactTestRow01       = $iGUIMainTabContactTestRow00
Global $iGUIMainTabContactTestRow01Height = $iGUIMainTabAllPaddingTop
Global $iGUIMainTabContactTestRow02       = $iGUIMainTabContactTestRow01 + $iGUIMainTabContactTestRow01Height
Global $iGUIMainTabContactTestRow02Height = 0
Global $iGUIMainTabContactTestRow03       = $iGUIMainTabContactTestRow02
Global $iGUIMainTabContactTestRow03Height = $iGUIMainTabAllChromeGroupTop
Global $iGUIMainTabContactTestRow04       = $iGUIMainTabContactTestRow03 + $iGUIMainTabContactTestRow03Height
Global $iGUIMainTabContactTestRow04Height = $iGUIMainTabAllChromeInputHeight * 3
Global $iGUIMainTabContactTestRow05       = $iGUIMainTabContactTestRow04 + $iGUIMainTabContactTestRow04Height
Global $iGUIMainTabContactTestRow05Height = $iGUIMainTabAllChromeInputSpacer
Global $iGUIMainTabContactTestRow06       = $iGUIMainTabContactTestRow05 + $iGUIMainTabContactTestRow05Height
Global $iGUIMainTabContactTestRow06Height = $iGUIMainTabAllButtonHeight
Global $iGUIMainTabContactTestRow07       = $iGUIMainTabContactTestRow06 + $iGUIMainTabContactTestRow06Height
Global $iGUIMainTabContactTestRow07Height = $iGUIMainTabAllChromeGroupBottom
$iGUIMainTabContactTestRow02Height = $iGUIMainTabContactTestRow03Height + $iGUIMainTabContactTestRow04Height + $iGUIMainTabContactTestRow05Height + $iGUIMainTabContactTestRow06Height + $iGUIMainTabContactTestRow07Height
$iGUIMainTabContactTestRow00Height = $iGUIMainTabContactTestRow02Height + $iGUIMainTabContactTestRow01Height
EndFunc
Func GUIBuild()
Global $hGUIMain = GUICreate('About This Computer Configurator', $iGUIMainWidthDefault, $iGUIMainHeightDefault + $iGUIMainMenuBarHeight + $iGUIMainStatusBarHeight, -1, -1)
Global $idMenuMainFile = GUICtrlCreateMenu('&File')
Global $idMenuItemMainFileImportEdit = GUICtrlCreateMenuItem('Import configuration and edit...', $idMenuMainFile, -1)
Global $idMenuItemMainFileImportSave = GUICtrlCreateMenuItem('Import configuration and save...', $idMenuMainFile, -1)
Global $idMenuItemMainFileExportUnsaved = GUICtrlCreateMenuItem('Export unsaved configuration...', $idMenuMainFile, -1)
Global $idMenuItemMainFileExportSaved = GUICtrlCreateMenuItem('Export existing configuration...', $idMenuMainFile, -1)
GUICtrlCreateMenuItem('', $idMenuMainFile, -1)
Global $idMenuItemMainFileClose = GUICtrlCreateMenuItem('Exit', $idMenuMainFile, -1)
Global $idMenuMainEdit = GUICtrlCreateMenu('&Edit')
Global $idMenuItemMainEditCut = GUICtrlCreateMenuItem('Cut', $idMenuMainEdit, -1)
Global $idMenuItemMainEditCopy = GUICtrlCreateMenuItem('Copy', $idMenuMainEdit, -1)
Global $idMenuItemMainEditPaste = GUICtrlCreateMenuItem('Paste', $idMenuMainEdit, -1)
Global $idMenuMainHelp = GUICtrlCreateMenu('&Help')
Global $idMenuItemMainHelpDocumentation = GUICtrlCreateMenuItem('Documentation (' & $sAppDocsHost & ')', $idMenuMainHelp, -1)
GUICtrlCreateMenuItem('', $idMenuMainHelp, -1)
Global $idMenuItemMainHelpAbout = GUICtrlCreateMenuItem('About', $idMenuMainHelp, -1)
$hStatusBarMain = _GUICtrlStatusBar_Create($hGUIMain, '', '', $SBARS_SIZEGRIP)
_GUICtrlStatusBar_SetText($hStatusBarMain, '')
$idGraphicMainLogo = GUICtrlCreateIcon($sAppLogo, -1, $iGUIMainColumnLeft02 + 12, $iGUIMainRowLeft01, $iGUIMainColumnLeft01Width, $iGUIMainRowLeft01Height, -1, $GUI_WS_EX_PARENTDRAG)
Global $idButtonMainLeftApply = GUICtrlCreateButton('Apply', $iGUIMainColumnLeft01, $iGUIMainRowLeft03, $iGUIMainColumnLeft02Width, $iGUIMainRowLeft03Height)
Global $idButtonMainLeftCancel = GUICtrlCreateButton('Cancel', $iGUIMainColumnLeft01, $iGUIMainRowLeft02, $iGUIMainColumnLeft02Width, $iGUIMainRowLeft02Height)
Global $idTabMain = GUICtrlCreateTab($iGUIMainColumnRight01, $iGUIMainRowRight01, $iGUIMainColumnRight01Width, $iGUIMainRowRight01Height)
GUICtrlCreateTabItem('Main')
Global $idGroupMain_General = GUICtrlCreateGroup('General', $iGUIMainTabMainGeneralColumn01, $iGUIMainTabMainGeneralRow02, $iGUIMainTabMainGeneralColumn01Width, $iGUIMainTabMainGeneralRow02Height)
Global $idCheckboxMainGeneral_StartAtLogin = GUICtrlCreateCheckbox('Start About This Computer at user login', $iGUIMainTabMainGeneralColumn02, $iGUIMainTabMainGeneralRow04, $iGUIMainTabMainGeneralColumn02Width, $iGUIMainTabMainGeneralRow04Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxMainGeneral_DisableExit = GUICtrlCreateCheckbox('Disable exiting About This Computer', $iGUIMainTabMainGeneralColumn02, $iGUIMainTabMainGeneralRow06, $iGUIMainTabMainGeneralColumn02Width, $iGUIMainTabMainGeneralRow06Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupMain_TrayIcon = GUICtrlCreateGroup('Tray Icon', $iGUIMainTabMainTrayIconColumn01, $iGUIMainTabMainTrayIconRow02, $iGUIMainTabMainTrayIconColumn01Width, $iGUIMainTabMainTrayIconRow02Height)
Global $idRadioMainTrayIcon_First = GUICtrlCreateRadio('', $iGUIMainTabMainTrayIconColumn02, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn02Width, $iGUIMainTabMainTrayIconRow04Height, BitOR($BS_MULTILINE, $BS_TOP))
GUICtrlCreateIcon('shell32.dll', 44, $iGUIMainTabMainTrayIconColumn04, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn04Width, $iGUIMainTabMainTrayIconRow04Height)
Global $idRadioMainTrayIcon_Second = GUICtrlCreateRadio('', $iGUIMainTabMainTrayIconColumn06, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn06Width, $iGUIMainTabMainTrayIconRow04Height, BitOR($BS_MULTILINE, $BS_TOP))
GUICtrlCreateIcon($sAppParentLogo, -1, $iGUIMainTabMainTrayIconColumn08, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn08Width, $iGUIMainTabMainTrayIconRow04Height)
Global $idRadioMainTrayIcon_Third = GUICtrlCreateRadio('', $iGUIMainTabMainTrayIconColumn10, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn10Width, $iGUIMainTabMainTrayIconRow04Height, BitOR($BS_MULTILINE, $BS_TOP))
GUICtrlCreateIcon('shell32.dll', 16783, $iGUIMainTabMainTrayIconColumn12, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn12Width, $iGUIMainTabMainTrayIconRow04Height)
Global $idRadioMainTrayIcon_Fourth = GUICtrlCreateRadio('', $iGUIMainTabMainTrayIconColumn14, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn14Width, $iGUIMainTabMainTrayIconRow04Height, BitOR($BS_MULTILINE, $BS_TOP))
GUICtrlCreateIcon('shell32.dll', 24, $iGUIMainTabMainTrayIconColumn16, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn16Width, $iGUIMainTabMainTrayIconRow04Height)
Global $idRadioMainTrayIcon_Fifth = GUICtrlCreateRadio('', $iGUIMainTabMainTrayIconColumn18, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn18Width, $iGUIMainTabMainTrayIconRow04Height, BitOR($BS_MULTILINE, $BS_TOP))
GUICtrlCreateIcon('shell32.dll', 1001, $iGUIMainTabMainTrayIconColumn20, $iGUIMainTabMainTrayIconRow04, $iGUIMainTabMainTrayIconColumn20Width, $iGUIMainTabMainTrayIconRow04Height)
Global $idCheckboxMainAssetTag_ShowAssetTag = GUICtrlCreateCheckbox('Show asset tag in Hardware section', $iGUIMainTabMainAssetTagColumn01, $iGUIMainTabMainAssetTagRow02, $iGUIMainTabMainAssetTagColumn01Width, $iGUIMainTabMainAssetTagRow02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupMain_AssetTag = GUICtrlCreateGroup('Asset Tag', $iGUIMainTabMainAssetTagColumn01, $iGUIMainTabMainAssetTagRow04, $iGUIMainTabMainAssetTagColumn01Width, $iGUIMainTabMainAssetTagRow04Height)
Global $idRadioMainAssetTag_ReadFromBIOS = GUICtrlCreateRadio('Read asset tag from BIOS', $iGUIMainTabMainAssetTagColumn02, $iGUIMainTabMainAssetTagRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainAssetTagColumn02Width + $iGUIMainTabMainAssetTagColumn03Width, $iGUIMainTabMainAssetTagRow06Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idRadioMainAssetTag_Custom = GUICtrlCreateRadio('Custom:', $iGUIMainTabMainAssetTagColumn02, $iGUIMainTabMainAssetTagRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainAssetTagColumn02Width, $iGUIMainTabMainAssetTagRow08Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputMainAssetTag_Custom = GUICtrlCreateInput('', $iGUIMainTabMainAssetTagColumn03, $iGUIMainTabMainAssetTagRow08, $iGUIMainTabMainAssetTagColumn03Width, $iGUIMainTabMainAssetTagRow08Height)
_GUICtrlEdit_SetCueBanner($idInputMainAssetTag_Custom, '100123', True)
Global $idCheckboxMainCustomDetails_ShowCustomDetails = GUICtrlCreateCheckbox('Show custom details section', $iGUIMainTabMainCustomDetailsColumn01, $iGUIMainTabMainCustomDetailsRow02, $iGUIMainTabMainCustomDetailsColumn01Width, $iGUIMainTabMainCustomDetailsRow02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupMain_CustomDetails = GUICtrlCreateGroup('Custom Details', $iGUIMainTabMainCustomDetailsColumn01, $iGUIMainTabMainCustomDetailsRow04, $iGUIMainTabMainCustomDetailsColumn01Width, $iGUIMainTabMainCustomDetailsRow04Height)
Local $sCustomDetailsTestText = 'Line 1' & @CRLF & 'Line 2' & @CRLF & 'Line 3' & @CRLF & 'Line 4' & @CRLF & 'Line 5' & @CRLF & @CRLF & 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
Global $idEditMainCustomDetails_FreeText = GUICtrlCreateEdit($sCustomDetailsTestText, $iGUIMainTabMainCustomDetailsColumn02 + $iGUIMainTabMainCustomDetailsColumn02Offset, $iGUIMainTabMainCustomDetailsRow06, 296, $iGUIMainTabMainCustomDetailsRow06Height, BitOR($ES_MULTILINE, $ES_WANTRETURN, $WS_VSCROLL, $ES_AUTOVSCROLL))
Global $idCheckboxMainHelpdesk_ShowHelpdesk = GUICtrlCreateCheckbox('Show Helpdesk section', $iGUIMainTabMainHelpdeskColumn01, $iGUIMainTabMainHelpdeskRow02, $iGUIMainTabMainHelpdeskColumn01Width, $iGUIMainTabMainHelpdeskRow02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupMain_Helpdesk = GUICtrlCreateGroup('Helpdesk', $iGUIMainTabMainHelpdeskColumn01, $iGUIMainTabMainHelpdeskRow04, $iGUIMainTabMainHelpdeskColumn01Width, $iGUIMainTabMainHelpdeskRow04Height)
GUICtrlCreateLabel('Section Header:', $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputMainHelpdesk_Title = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow06, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow06Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_Title, $sOrgName & ' IT Helpdesk', True)
Global $idCheckboxMainHelpdesk_ShowEmail = GUICtrlCreateCheckbox('Show email', $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow08Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputMainHelpdesk_EmailTitle = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow08, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow08Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_EmailTitle, 'Email', True)
Global $idInputMainHelpdesk_EmailAddress = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow10, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow10Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_EmailAddress, 'helpdesk@' & $sOrgDomain, True)
Global $idCheckboxMainHelpdesk_ShowPhone = GUICtrlCreateCheckbox('Show phone', $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow12 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow12Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputMainHelpdesk_PhoneTitle = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow12, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow12Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_PhoneTitle, 'Phone', True)
Global $idInputMainHelpdesk_PhoneNumber = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow14, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow14Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_PhoneNumber, '1-888-555-5555', True)
Global $idCheckboxMainHelpdesk_ShowWebsite = GUICtrlCreateCheckbox('Show website', $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow16 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow16Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputMainHelpdesk_WebsiteTitle = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow16, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow16Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_WebsiteTitle, 'Website', True)
Global $idInputMainHelpdesk_WebsiteAddress = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow18, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow18Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_WebsiteAddress, 'https://helpdesk.' & $sOrgDomain & '/', True)
Global $idCheckboxMainHelpdesk_ShowAlternate = GUICtrlCreateCheckbox('Show alternate contact information', $iGUIMainTabMainHelpdeskColumn02, $iGUIMainTabMainHelpdeskRow20 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabMainHelpdeskColumn02Width, $iGUIMainTabMainHelpdeskRow20Height - $iGUIMainTabAllChromeCheckboxOffset + $iGUIMainTabMainHelpdeskRow21Height + $iGUIMainTabMainHelpdeskRow22Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputMainHelpdesk_AlternateTitle = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow20, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow20Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_AlternateTitle, 'Reset a Password', True)
Global $idInputMainHelpdesk_AlternateAddress = GUICtrlCreateInput('', $iGUIMainTabMainHelpdeskColumn03, $iGUIMainTabMainHelpdeskRow22, $iGUIMainTabMainHelpdeskColumn03Width, $iGUIMainTabMainHelpdeskRow22Height)
_GUICtrlEdit_SetCueBanner($idInputMainHelpdesk_AlternateAddress, '1-800-555-1234', True)
GUICtrlCreateTabItem('Tools Menu')
Global $idCheckboxTools_EnableToolsMenu = GUICtrlCreateCheckbox('Enable Tools menu', $iGUIMainTabToolsGeneralColumn01, $iGUIMainTabToolsGeneralRow02, $iGUIMainTabToolsGeneralColumn01Width, $iGUIMainTabToolsGeneralRow02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupTools_General = GUICtrlCreateGroup('General', $iGUIMainTabToolsGeneralColumn01, $iGUIMainTabToolsGeneralRow04, $iGUIMainTabToolsGeneralColumn01Width, $iGUIMainTabToolsGeneralRow04Height)
Global $idCheckboxToolsGeneral_CredentialManager = GUICtrlCreateCheckbox('Credential Manager', $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow06, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow06Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_DeviceManager = GUICtrlCreateCheckbox('Device Manager', $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow08, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow08Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_DevicesAndPrinters = GUICtrlCreateCheckbox('Devices and Printers', $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow10, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow10Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_InternetOptions = GUICtrlCreateCheckbox('Internet Options', $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow12, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow12Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_MailAccounts = GUICtrlCreateCheckbox('Mail Accounts', $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow14, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow14Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_NetworkConnections = GUICtrlCreateCheckbox('Network Connections', $iGUIMainTabToolsGeneralColumn02, $iGUIMainTabToolsGeneralRow16, $iGUIMainTabToolsGeneralColumn02Width, $iGUIMainTabToolsGeneralRow16Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_PrintManagement = GUICtrlCreateCheckbox('Print Management', $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow06, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow06Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_ProgramsAndFeatures = GUICtrlCreateCheckbox('Programs and Features', $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow08, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow08Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_SearchDirectory = GUICtrlCreateCheckbox('Search Directory', $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow10, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow10Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_Services = GUICtrlCreateCheckbox('Services', $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow12, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow12Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_SystemProperties = GUICtrlCreateCheckbox('System Properties', $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow14, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow14Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsGeneral_WindowsUpdate = GUICtrlCreateCheckbox('Windows Update', $iGUIMainTabToolsGeneralColumn03, $iGUIMainTabToolsGeneralRow16, $iGUIMainTabToolsGeneralColumn03Width, $iGUIMainTabToolsGeneralRow16Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idCheckboxToolsLoginScript_ShowLoginScript = GUICtrlCreateCheckbox('Show login script in Tools menu', $iGUIMainTabToolsLoginScriptColumn01, $iGUIMainTabToolsLoginScriptRow02, $iGUIMainTabToolsLoginScriptColumn01Width, $iGUIMainTabToolsLoginScriptRow02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupTools_LoginScript = GUICtrlCreateGroup('Login Script', $iGUIMainTabToolsLoginScriptColumn01, $iGUIMainTabToolsLoginScriptRow04, $iGUIMainTabToolsLoginScriptColumn01Width, $iGUIMainTabToolsLoginScriptRow04Height)
Global $idRadioToolsLoginScript_ReadFromActiveDirectory = GUICtrlCreateRadio("Read user's login script from Active Directory", $iGUIMainTabToolsLoginScriptColumn02, $iGUIMainTabToolsLoginScriptRow06, $iGUIMainTabToolsLoginScriptColumn02Width + $iGUIMainTabToolsLoginScriptColumn03Width, $iGUIMainTabToolsLoginScriptRow06Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idRadioToolsLoginScript_Custom = GUICtrlCreateRadio('Path to script:', $iGUIMainTabToolsLoginScriptColumn02, $iGUIMainTabToolsLoginScriptRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsLoginScriptColumn02Width, $iGUIMainTabToolsLoginScriptRow08Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputToolsLoginScript_Custom = GUICtrlCreateInput('', $iGUIMainTabToolsLoginScriptColumn03, $iGUIMainTabToolsLoginScriptRow08, $iGUIMainTabToolsLoginScriptColumn03Width, $iGUIMainTabToolsLoginScriptRow08Height)
_GUICtrlEdit_SetCueBanner($idInputToolsLoginScript_Custom, '\\' & $sOrgFQDomain & '\NETLOGON\login.vbs', True)
Global $idCheckboxToolsHomeDrive_ShowHomeDrive = GUICtrlCreateCheckbox('Show home drive in Tools menu', $iGUIMainTabToolsHomeDriveColumn01, $iGUIMainTabToolsHomeDriveRow02, $iGUIMainTabToolsHomeDriveColumn01Width, $iGUIMainTabToolsHomeDriveRow02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupTools_HomeDrive = GUICtrlCreateGroup('Home Drive', $iGUIMainTabToolsHomeDriveColumn01, $iGUIMainTabToolsHomeDriveRow04, $iGUIMainTabToolsHomeDriveColumn01Width, $iGUIMainTabToolsHomeDriveRow04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsHomeDriveColumn02Width, $iGUIMainTabToolsHomeDriveRow06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputToolsHomeDrive_Title = GUICtrlCreateInput('', $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow06, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow06Height)
_GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_Title, 'Map Home (Z:) Drive', True)
Global $idRadioToolsHomeDrive_ReadFromActiveDirectory = GUICtrlCreateRadio("Read user's home drive from Active Directory", $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsHomeDriveColumn02Width + $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow08Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idRadioToolsHomeDrive_MapDrive = GUICtrlCreateRadio('Map drive', $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow10 + $iGUIMainTabAllChromeCheckboxOffset, 68, $iGUIMainTabToolsHomeDriveRow10Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idComboToolsHomeDrive_MapDriveLetter = GUICtrlCreateCombo('W:', $iGUIMainTabToolsHomeDriveColumn02 + 68, $iGUIMainTabToolsHomeDriveRow10, 40, $iGUIMainTabToolsHomeDriveRow10Height)
GUICtrlCreateLabel('to', $iGUIMainTabToolsHomeDriveColumn02 + 68 + 40 + 5, $iGUIMainTabToolsHomeDriveRow10 + $iGUIMainTabAllChromeCheckboxOffset, 15, $iGUIMainTabToolsHomeDriveRow10Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputToolsHomeDrive_MapDrivePath = GUICtrlCreateInput('', $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow10, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow10Height)
_GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_MapDrivePath, '\\fileserver\home\%USERNAME%', True)
Global $idRadioToolsHomeDrive_Custom = GUICtrlCreateRadio('Create and open Network Places shortcut to:', $iGUIMainTabToolsHomeDriveColumn02, $iGUIMainTabToolsHomeDriveRow12 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabToolsHomeDriveColumn02Width, $iGUIMainTabToolsHomeDriveRow12Height + $iGUIMainTabToolsHomeDriveRow14Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputToolsHomeDrive_CustomName = GUICtrlCreateInput('', $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow12, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow12Height)
_GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_CustomName, "%USERNAME%'s Home Folder", True)
Global $idInputToolsHomeDrive_CustomPath = GUICtrlCreateInput('', $iGUIMainTabToolsHomeDriveColumn03, $iGUIMainTabToolsHomeDriveRow14, $iGUIMainTabToolsHomeDriveColumn03Width, $iGUIMainTabToolsHomeDriveRow14Height)
_GUICtrlEdit_SetCueBanner($idInputToolsHomeDrive_CustomPath, '\\fileserver\home\%USERNAME%', True)
GUICtrlCreateTabItem('Custom Tools')
Global $idCheckboxCustomToolsCommand1_Enable = GUICtrlCreateCheckbox('Show custom tool 1 in Tools menu', $iGUIMainTabCustomToolsCommand1Column01, $iGUIMainTabCustomToolsCommand1Row02, $iGUIMainTabCustomToolsCommand1Column01Width, $iGUIMainTabCustomToolsCommand1Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupCustomTools_Command1 = GUICtrlCreateGroup('Custom Tool 1', $iGUIMainTabCustomToolsCommand1Column01, $iGUIMainTabCustomToolsCommand1Row04, $iGUIMainTabCustomToolsCommand1Column01Width, $iGUIMainTabCustomToolsCommand1Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabCustomToolsCommand1Column02, $iGUIMainTabCustomToolsCommand1Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand1Column02Width, $iGUIMainTabCustomToolsCommand1Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand1_DisplayName = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand1Column03, $iGUIMainTabCustomToolsCommand1Row06, $iGUIMainTabCustomToolsCommand1Column03Width, $iGUIMainTabCustomToolsCommand1Row06Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand1_DisplayName, 'App Catalog', True)
GUICtrlCreateLabel('Command:', $iGUIMainTabCustomToolsCommand1Column02, $iGUIMainTabCustomToolsCommand1Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand1Column02Width, $iGUIMainTabCustomToolsCommand1Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand1_Command = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand1Column03, $iGUIMainTabCustomToolsCommand1Row08, $iGUIMainTabCustomToolsCommand1Column03Width, $iGUIMainTabCustomToolsCommand1Row08Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand1_Command, '"iexplore.exe" https://sccmserver/CMApplicationCatalog', True)
Global $idCheckboxCustomToolsCommand2_Enable = GUICtrlCreateCheckbox('Show custom tool 2 in Tools menu', $iGUIMainTabCustomToolsCommand2Column01, $iGUIMainTabCustomToolsCommand2Row02, $iGUIMainTabCustomToolsCommand2Column01Width, $iGUIMainTabCustomToolsCommand2Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupCustomTools_Command2 = GUICtrlCreateGroup('Custom Tool 2', $iGUIMainTabCustomToolsCommand2Column01, $iGUIMainTabCustomToolsCommand2Row04, $iGUIMainTabCustomToolsCommand2Column01Width, $iGUIMainTabCustomToolsCommand2Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabCustomToolsCommand2Column02, $iGUIMainTabCustomToolsCommand2Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand2Column02Width, $iGUIMainTabCustomToolsCommand2Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand2_DisplayName = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand2Column03, $iGUIMainTabCustomToolsCommand2Row06, $iGUIMainTabCustomToolsCommand2Column03Width, $iGUIMainTabCustomToolsCommand2Row06Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand2_DisplayName, 'Close All Network Shares', True)
GUICtrlCreateLabel('Command:', $iGUIMainTabCustomToolsCommand2Column02, $iGUIMainTabCustomToolsCommand2Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand2Column02Width, $iGUIMainTabCustomToolsCommand2Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand2_Command = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand2Column03, $iGUIMainTabCustomToolsCommand2Row08, $iGUIMainTabCustomToolsCommand2Column03Width, $iGUIMainTabCustomToolsCommand2Row08Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand2_Command, 'net use /delete *', True)
Global $idCheckboxCustomToolsCommand3_Enable = GUICtrlCreateCheckbox('Show custom tool 3 in Tools menu', $iGUIMainTabCustomToolsCommand3Column01, $iGUIMainTabCustomToolsCommand3Row02, $iGUIMainTabCustomToolsCommand3Column01Width, $iGUIMainTabCustomToolsCommand3Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupCustomTools_Command3 = GUICtrlCreateGroup('Custom Tool 3', $iGUIMainTabCustomToolsCommand3Column01, $iGUIMainTabCustomToolsCommand3Row04, $iGUIMainTabCustomToolsCommand3Column01Width, $iGUIMainTabCustomToolsCommand3Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabCustomToolsCommand3Column02, $iGUIMainTabCustomToolsCommand3Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand3Column02Width, $iGUIMainTabCustomToolsCommand3Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand3_DisplayName = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand3Column03, $iGUIMainTabCustomToolsCommand3Row06, $iGUIMainTabCustomToolsCommand3Column03Width, $iGUIMainTabCustomToolsCommand3Row06Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand3_DisplayName, '', True)
GUICtrlCreateLabel('Command:', $iGUIMainTabCustomToolsCommand3Column02, $iGUIMainTabCustomToolsCommand3Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand3Column02Width, $iGUIMainTabCustomToolsCommand3Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand3_Command = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand3Column03, $iGUIMainTabCustomToolsCommand3Row08, $iGUIMainTabCustomToolsCommand3Column03Width, $iGUIMainTabCustomToolsCommand3Row08Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand3_Command, '', True)
Global $idCheckboxCustomToolsCommand4_Enable = GUICtrlCreateCheckbox('Show custom tool 4 in Tools menu', $iGUIMainTabCustomToolsCommand4Column01, $iGUIMainTabCustomToolsCommand4Row02, $iGUIMainTabCustomToolsCommand4Column01Width, $iGUIMainTabCustomToolsCommand4Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupCustomTools_Command4 = GUICtrlCreateGroup('Custom Tool 4', $iGUIMainTabCustomToolsCommand4Column01, $iGUIMainTabCustomToolsCommand4Row04, $iGUIMainTabCustomToolsCommand4Column01Width, $iGUIMainTabCustomToolsCommand4Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabCustomToolsCommand4Column02, $iGUIMainTabCustomToolsCommand4Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand4Column02Width, $iGUIMainTabCustomToolsCommand4Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand4_DisplayName = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand4Column03, $iGUIMainTabCustomToolsCommand4Row06, $iGUIMainTabCustomToolsCommand4Column03Width, $iGUIMainTabCustomToolsCommand4Row06Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand4_DisplayName, '', True)
GUICtrlCreateLabel('Command:', $iGUIMainTabCustomToolsCommand4Column02, $iGUIMainTabCustomToolsCommand4Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand4Column02Width, $iGUIMainTabCustomToolsCommand4Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand4_Command = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand4Column03, $iGUIMainTabCustomToolsCommand4Row08, $iGUIMainTabCustomToolsCommand4Column03Width, $iGUIMainTabCustomToolsCommand4Row08Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand4_Command, '', True)
Global $idCheckboxCustomToolsCommand5_Enable = GUICtrlCreateCheckbox('Show custom tool 5 in Tools menu', $iGUIMainTabCustomToolsCommand5Column01, $iGUIMainTabCustomToolsCommand5Row02, $iGUIMainTabCustomToolsCommand5Column01Width, $iGUIMainTabCustomToolsCommand5Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupCustomTools_Command5 = GUICtrlCreateGroup('Custom Tool 5', $iGUIMainTabCustomToolsCommand5Column01, $iGUIMainTabCustomToolsCommand5Row04, $iGUIMainTabCustomToolsCommand5Column01Width, $iGUIMainTabCustomToolsCommand5Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabCustomToolsCommand5Column02, $iGUIMainTabCustomToolsCommand5Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand5Column02Width, $iGUIMainTabCustomToolsCommand5Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand5_DisplayName = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand5Column03, $iGUIMainTabCustomToolsCommand5Row06, $iGUIMainTabCustomToolsCommand5Column03Width, $iGUIMainTabCustomToolsCommand5Row06Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand5_DisplayName, '', True)
GUICtrlCreateLabel('Command:', $iGUIMainTabCustomToolsCommand5Column02, $iGUIMainTabCustomToolsCommand5Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabCustomToolsCommand5Column02Width, $iGUIMainTabCustomToolsCommand5Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputCustomToolsCommand5_Command = GUICtrlCreateInput('', $iGUIMainTabCustomToolsCommand5Column03, $iGUIMainTabCustomToolsCommand5Row08, $iGUIMainTabCustomToolsCommand5Column03Width, $iGUIMainTabCustomToolsCommand5Row08Height)
_GUICtrlEdit_SetCueBanner($idInputCustomToolsCommand5_Command, '', True)
GUICtrlCreateTabItem('Help Menu')
Global $idCheckboxHelpLink1_Enable = GUICtrlCreateCheckbox('Show link 1 in Help menu', $iGUIMainTabHelpLink1Column01, $iGUIMainTabHelpLink1Row02, $iGUIMainTabHelpLink1Column01Width, $iGUIMainTabHelpLink1Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupHelp_Link1 = GUICtrlCreateGroup('Link 1', $iGUIMainTabHelpLink1Column01, $iGUIMainTabHelpLink1Row04, $iGUIMainTabHelpLink1Column01Width, $iGUIMainTabHelpLink1Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabHelpLink1Column02, $iGUIMainTabHelpLink1Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink1Column02Width, $iGUIMainTabHelpLink1Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink1_DisplayName = GUICtrlCreateInput('', $iGUIMainTabHelpLink1Column03, $iGUIMainTabHelpLink1Row06, $iGUIMainTabHelpLink1Column03Width, $iGUIMainTabHelpLink1Row06Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink1_DisplayName, 'LogMeIn Rescue', True)
GUICtrlCreateLabel('URL:', $iGUIMainTabHelpLink1Column02, $iGUIMainTabHelpLink1Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink1Column02Width, $iGUIMainTabHelpLink1Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink1_Command = GUICtrlCreateInput('', $iGUIMainTabHelpLink1Column03, $iGUIMainTabHelpLink1Row08, $iGUIMainTabHelpLink1Column03Width, $iGUIMainTabHelpLink1Row08Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink1_Command, 'https://logmein123.com/', True)
Global $idCheckboxHelpLink2_Enable = GUICtrlCreateCheckbox('Show link 2 in Help menu', $iGUIMainTabHelpLink2Column01, $iGUIMainTabHelpLink2Row02, $iGUIMainTabHelpLink2Column01Width, $iGUIMainTabHelpLink2Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupHelp_Link2 = GUICtrlCreateGroup('Link 2', $iGUIMainTabHelpLink2Column01, $iGUIMainTabHelpLink2Row04, $iGUIMainTabHelpLink2Column01Width, $iGUIMainTabHelpLink2Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabHelpLink2Column02, $iGUIMainTabHelpLink2Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink2Column02Width, $iGUIMainTabHelpLink2Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink2_DisplayName = GUICtrlCreateInput('', $iGUIMainTabHelpLink2Column03, $iGUIMainTabHelpLink2Row06, $iGUIMainTabHelpLink2Column03Width, $iGUIMainTabHelpLink2Row06Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink2_DisplayName, $sOrgName & ' Intranet', True)
GUICtrlCreateLabel('URL:', $iGUIMainTabHelpLink2Column02, $iGUIMainTabHelpLink2Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink2Column02Width, $iGUIMainTabHelpLink2Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink2_Command = GUICtrlCreateInput('', $iGUIMainTabHelpLink2Column03, $iGUIMainTabHelpLink2Row08, $iGUIMainTabHelpLink2Column03Width, $iGUIMainTabHelpLink2Row08Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink2_Command, 'https://intranet.' & $sOrgDomain & '/', True)
Global $idCheckboxHelpLink3_Enable = GUICtrlCreateCheckbox('Show link 3 in Help menu', $iGUIMainTabHelpLink3Column01, $iGUIMainTabHelpLink3Row02, $iGUIMainTabHelpLink3Column01Width, $iGUIMainTabHelpLink3Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupHelp_Link3 = GUICtrlCreateGroup('Link 3', $iGUIMainTabHelpLink3Column01, $iGUIMainTabHelpLink3Row04, $iGUIMainTabHelpLink3Column01Width, $iGUIMainTabHelpLink3Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabHelpLink3Column02, $iGUIMainTabHelpLink3Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink3Column02Width, $iGUIMainTabHelpLink3Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink3_DisplayName = GUICtrlCreateInput('', $iGUIMainTabHelpLink3Column03, $iGUIMainTabHelpLink3Row06, $iGUIMainTabHelpLink3Column03Width, $iGUIMainTabHelpLink3Row06Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink3_DisplayName, $sOrgName & ' IT Helpdesk', True)
GUICtrlCreateLabel('URL:', $iGUIMainTabHelpLink3Column02, $iGUIMainTabHelpLink3Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink3Column02Width, $iGUIMainTabHelpLink3Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink3_Command = GUICtrlCreateInput('', $iGUIMainTabHelpLink3Column03, $iGUIMainTabHelpLink3Row08, $iGUIMainTabHelpLink3Column03Width, $iGUIMainTabHelpLink3Row08Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink3_Command, 'https://helpdesk.' & $sOrgDomain & '/', True)
Global $idCheckboxHelpLink4_Enable = GUICtrlCreateCheckbox('Show link 4 in Help menu', $iGUIMainTabHelpLink4Column01, $iGUIMainTabHelpLink4Row02, $iGUIMainTabHelpLink4Column01Width, $iGUIMainTabHelpLink4Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupHelp_Link4 = GUICtrlCreateGroup('Link 4', $iGUIMainTabHelpLink4Column01, $iGUIMainTabHelpLink4Row04, $iGUIMainTabHelpLink4Column01Width, $iGUIMainTabHelpLink4Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabHelpLink4Column02, $iGUIMainTabHelpLink4Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink4Column02Width, $iGUIMainTabHelpLink4Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink4_DisplayName = GUICtrlCreateInput('', $iGUIMainTabHelpLink4Column03, $iGUIMainTabHelpLink4Row06, $iGUIMainTabHelpLink4Column03Width, $iGUIMainTabHelpLink4Row06Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink4_DisplayName, 'Password Self-Service', True)
GUICtrlCreateLabel('URL:', $iGUIMainTabHelpLink4Column02, $iGUIMainTabHelpLink4Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink4Column02Width, $iGUIMainTabHelpLink4Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink4_Command = GUICtrlCreateInput('', $iGUIMainTabHelpLink4Column03, $iGUIMainTabHelpLink4Row08, $iGUIMainTabHelpLink4Column03Width, $iGUIMainTabHelpLink4Row08Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink4_Command, 'https://passwords.' & $sOrgDomain & '/', True)
Global $idCheckboxHelpLink5_Enable = GUICtrlCreateCheckbox('Show link 5 in Help menu', $iGUIMainTabHelpLink5Column01, $iGUIMainTabHelpLink5Row02, $iGUIMainTabHelpLink5Column01Width, $iGUIMainTabHelpLink5Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupHelp_Link5 = GUICtrlCreateGroup('Link 5', $iGUIMainTabHelpLink5Column01, $iGUIMainTabHelpLink5Row04, $iGUIMainTabHelpLink5Column01Width, $iGUIMainTabHelpLink5Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabHelpLink5Column02, $iGUIMainTabHelpLink5Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink5Column02Width, $iGUIMainTabHelpLink5Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink5_DisplayName = GUICtrlCreateInput('', $iGUIMainTabHelpLink5Column03, $iGUIMainTabHelpLink5Row06, $iGUIMainTabHelpLink5Column03Width, $iGUIMainTabHelpLink5Row06Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink5_DisplayName, '', True)
GUICtrlCreateLabel('URL:', $iGUIMainTabHelpLink5Column02, $iGUIMainTabHelpLink5Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabHelpLink5Column02Width, $iGUIMainTabHelpLink5Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputHelpLink5_Command = GUICtrlCreateInput('', $iGUIMainTabHelpLink5Column03, $iGUIMainTabHelpLink5Row08, $iGUIMainTabHelpLink5Column03Width, $iGUIMainTabHelpLink5Row08Height)
_GUICtrlEdit_SetCueBanner($idInputHelpLink5_Command, '', True)
GUICtrlCreateTabItem('Services')
Global $idCheckboxServicesService1_Enable = GUICtrlCreateCheckbox('Show service 1 status in summary text', $iGUIMainTabServicesService1Column01, $iGUIMainTabServicesService1Row02, $iGUIMainTabServicesService1Column01Width, $iGUIMainTabServicesService1Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupServices_Service1 = GUICtrlCreateGroup('Service 1', $iGUIMainTabServicesService1Column01, $iGUIMainTabServicesService1Row04, $iGUIMainTabServicesService1Column01Width, $iGUIMainTabServicesService1Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabServicesService1Column02, $iGUIMainTabServicesService1Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService1Column02Width, $iGUIMainTabServicesService1Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService1_DisplayName = GUICtrlCreateInput('', $iGUIMainTabServicesService1Column03, $iGUIMainTabServicesService1Row06, $iGUIMainTabServicesService1Column03Width, $iGUIMainTabServicesService1Row06Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService1_DisplayName, 'Windows Update', True)
GUICtrlCreateLabel('Service Name:', $iGUIMainTabServicesService1Column02, $iGUIMainTabServicesService1Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService1Column02Width, $iGUIMainTabServicesService1Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService1_Name = GUICtrlCreateInput('', $iGUIMainTabServicesService1Column03, $iGUIMainTabServicesService1Row08, $iGUIMainTabServicesService1Column03Width, $iGUIMainTabServicesService1Row08Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService1_Name, 'wuauserv', True)
Global $idCheckboxServicesService2_Enable = GUICtrlCreateCheckbox('Show service 2 status in summary text', $iGUIMainTabServicesService2Column01, $iGUIMainTabServicesService2Row02, $iGUIMainTabServicesService2Column01Width, $iGUIMainTabServicesService2Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupServices_Service2 = GUICtrlCreateGroup('Service 2', $iGUIMainTabServicesService2Column01, $iGUIMainTabServicesService2Row04, $iGUIMainTabServicesService2Column01Width, $iGUIMainTabServicesService2Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabServicesService2Column02, $iGUIMainTabServicesService2Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService2Column02Width, $iGUIMainTabServicesService2Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService2_DisplayName = GUICtrlCreateInput('', $iGUIMainTabServicesService2Column03, $iGUIMainTabServicesService2Row06, $iGUIMainTabServicesService2Column03Width, $iGUIMainTabServicesService2Row06Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService2_DisplayName, 'SCCM Client (SMS Agent Host)', True)
GUICtrlCreateLabel('Service Name:', $iGUIMainTabServicesService2Column02, $iGUIMainTabServicesService2Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService2Column02Width, $iGUIMainTabServicesService2Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService2_Name = GUICtrlCreateInput('', $iGUIMainTabServicesService2Column03, $iGUIMainTabServicesService2Row08, $iGUIMainTabServicesService2Column03Width, $iGUIMainTabServicesService2Row08Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService2_Name, 'CcmExec', True)
Global $idCheckboxServicesService3_Enable = GUICtrlCreateCheckbox('Show service 3 status in summary text', $iGUIMainTabServicesService3Column01, $iGUIMainTabServicesService3Row02, $iGUIMainTabServicesService3Column01Width, $iGUIMainTabServicesService3Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupServices_Service3 = GUICtrlCreateGroup('Service 3', $iGUIMainTabServicesService3Column01, $iGUIMainTabServicesService3Row04, $iGUIMainTabServicesService3Column01Width, $iGUIMainTabServicesService3Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabServicesService3Column02, $iGUIMainTabServicesService3Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService3Column02Width, $iGUIMainTabServicesService3Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService3_DisplayName = GUICtrlCreateInput('', $iGUIMainTabServicesService3Column03, $iGUIMainTabServicesService3Row06, $iGUIMainTabServicesService3Column03Width, $iGUIMainTabServicesService3Row06Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService3_DisplayName, 'CrowdStrike Windows Sensor', True)
GUICtrlCreateLabel('Service Name:', $iGUIMainTabServicesService3Column02, $iGUIMainTabServicesService3Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService3Column02Width, $iGUIMainTabServicesService3Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService3_Name = GUICtrlCreateInput('', $iGUIMainTabServicesService3Column03, $iGUIMainTabServicesService3Row08, $iGUIMainTabServicesService3Column03Width, $iGUIMainTabServicesService3Row08Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService3_Name, 'CSFalconService', True)
Global $idCheckboxServicesService4_Enable = GUICtrlCreateCheckbox('Show service 4 status in summary text', $iGUIMainTabServicesService4Column01, $iGUIMainTabServicesService4Row02, $iGUIMainTabServicesService4Column01Width, $iGUIMainTabServicesService4Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupServices_Service4 = GUICtrlCreateGroup('Service 4', $iGUIMainTabServicesService4Column01, $iGUIMainTabServicesService4Row04, $iGUIMainTabServicesService4Column01Width, $iGUIMainTabServicesService4Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabServicesService4Column02, $iGUIMainTabServicesService4Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService4Column02Width, $iGUIMainTabServicesService4Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService4_DisplayName = GUICtrlCreateInput('', $iGUIMainTabServicesService4Column03, $iGUIMainTabServicesService4Row06, $iGUIMainTabServicesService4Column03Width, $iGUIMainTabServicesService4Row06Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService4_DisplayName, 'BeyondTrust PowerBroker', True)
GUICtrlCreateLabel('Service Name:', $iGUIMainTabServicesService4Column02, $iGUIMainTabServicesService4Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService4Column02Width, $iGUIMainTabServicesService4Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService4_Name = GUICtrlCreateInput('', $iGUIMainTabServicesService4Column03, $iGUIMainTabServicesService4Row08, $iGUIMainTabServicesService4Column03Width, $iGUIMainTabServicesService4Row08Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService4_Name, 'BTService', True)
Global $idCheckboxServicesService5_Enable = GUICtrlCreateCheckbox('Show service 5 status in summary text', $iGUIMainTabServicesService5Column01, $iGUIMainTabServicesService5Row02, $iGUIMainTabServicesService5Column01Width, $iGUIMainTabServicesService5Row02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupServices_Service5 = GUICtrlCreateGroup('Service 5', $iGUIMainTabServicesService5Column01, $iGUIMainTabServicesService5Row04, $iGUIMainTabServicesService5Column01Width, $iGUIMainTabServicesService5Row04Height)
GUICtrlCreateLabel('Display Name:', $iGUIMainTabServicesService5Column02, $iGUIMainTabServicesService5Row06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService5Column02Width, $iGUIMainTabServicesService5Row06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService5_DisplayName = GUICtrlCreateInput('', $iGUIMainTabServicesService5Column03, $iGUIMainTabServicesService5Row06, $iGUIMainTabServicesService5Column03Width, $iGUIMainTabServicesService5Row06Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService5_DisplayName, 'Splunk Universal Forwarder', True)
GUICtrlCreateLabel('Service Name:', $iGUIMainTabServicesService5Column02, $iGUIMainTabServicesService5Row08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabServicesService5Column02Width, $iGUIMainTabServicesService5Row08Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputServicesService5_Name = GUICtrlCreateInput('', $iGUIMainTabServicesService5Column03, $iGUIMainTabServicesService5Row08, $iGUIMainTabServicesService5Column03Width, $iGUIMainTabServicesService5Row08Height)
_GUICtrlEdit_SetCueBanner($idInputServicesService5_Name, 'SplunkForwarder', True)
GUICtrlCreateTabItem('Helpdesk Contact Form')
Global $idCheckboxContact_EnableContactForm = GUICtrlCreateCheckbox('Enable helpdesk contact form', $iGUIMainTabContactGeneralColumn01, $iGUIMainTabContactGeneralRow02, $iGUIMainTabContactGeneralColumn01Width, $iGUIMainTabContactGeneralRow02Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupContact_General = GUICtrlCreateGroup('General', $iGUIMainTabContactGeneralColumn01, $iGUIMainTabContactGeneralRow04, $iGUIMainTabContactGeneralColumn01Width, $iGUIMainTabContactGeneralRow04Height)
GUICtrlCreateLabel('Button text:', $iGUIMainTabContactGeneralColumn02, $iGUIMainTabContactGeneralRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactGeneralColumn02Width, $iGUIMainTabContactGeneralRow06Height - $iGUIMainTabAllChromeCheckboxOffset)
Global $idInputContactGeneral_ButtonText = GUICtrlCreateInput('', $iGUIMainTabContactGeneralColumn03, $iGUIMainTabContactGeneralRow06, $iGUIMainTabContactGeneralColumn03Width, $iGUIMainTabContactGeneralRow06Height)
_GUICtrlEdit_SetCueBanner($idInputContactGeneral_ButtonText, 'Create an IT Helpdesk Request', True)
Global $idCheckboxContactGeneral_ShowEmployeeIDField = GUICtrlCreateCheckbox('Show Employee ID field in contact form', $iGUIMainTabContactGeneralColumn02, $iGUIMainTabContactGeneralRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactGeneralColumn02Width + $iGUIMainTabContactGeneralColumn03Width, $iGUIMainTabContactGeneralRow08Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupContact_Recipient = GUICtrlCreateGroup('Recipient', $iGUIMainTabContactRecipientColumn01, $iGUIMainTabContactRecipientRow02, $iGUIMainTabContactRecipientColumn01Width, $iGUIMainTabContactRecipientRow02Height)
Global $idRadioContactRecipient_UseHelpdeskEmail = GUICtrlCreateRadio('Read helpdesk email from About This Computer', $iGUIMainTabContactRecipientColumn02, $iGUIMainTabContactRecipientRow04, $iGUIMainTabContactRecipientColumn02Width + $iGUIMainTabContactRecipientColumn03Width, $iGUIMainTabContactRecipientRow04Height, BitOR($BS_MULTILINE, $BS_TOP))
Global $idRadioContactRecipient_Custom = GUICtrlCreateRadio('Custom:', $iGUIMainTabContactRecipientColumn02, $iGUIMainTabContactRecipientRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactRecipientColumn02Width, $iGUIMainTabContactRecipientRow06Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputContactRecipient_Custom = GUICtrlCreateInput('', $iGUIMainTabContactRecipientColumn03, $iGUIMainTabContactRecipientRow06, $iGUIMainTabContactRecipientColumn03Width, $iGUIMainTabContactRecipientRow06Height)
_GUICtrlEdit_SetCueBanner($idInputContactRecipient_Custom, 'helpdesk@' & $sOrgDomain, True)
Global $idGroupContact_Sender = GUICtrlCreateGroup('Sender', $iGUIMainTabContactSenderColumn01, $iGUIMainTabContactSenderRow02, $iGUIMainTabContactSenderColumn01Width, $iGUIMainTabContactSenderRow02Height)
Global $idRadioContactSender_ReadFromAD = GUICtrlCreateRadio("Read user's email address from Active Directory", $iGUIMainTabContactSenderColumn02, $iGUIMainTabContactSenderRow04 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSenderColumn02Width + $iGUIMainTabContactSenderColumn03Width, $iGUIMainTabContactSenderRow04Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idRadioContactSender_Custom = GUICtrlCreateRadio('Current username @', $iGUIMainTabContactSenderColumn02, $iGUIMainTabContactSenderRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSenderColumn02Width, $iGUIMainTabContactSenderRow06Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputContactSender_Custom = GUICtrlCreateInput('', $iGUIMainTabContactSenderColumn03, $iGUIMainTabContactSenderRow06, $iGUIMainTabContactSenderColumn03Width, $iGUIMainTabContactSenderRow06Height)
_GUICtrlEdit_SetCueBanner($idInputContactSender_Custom, $sOrgDomain, True)
Global $idRadioContactSender_EnableEmailField = GUICtrlCreateRadio('Enable Email field in contact form', $iGUIMainTabContactSenderColumn02, $iGUIMainTabContactSenderRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSenderColumn02Width + $iGUIMainTabContactSenderColumn03Width, $iGUIMainTabContactSEnderRow08Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idGroupContact_SMTP = GUICtrlCreateGroup('SMTP Server Settings', $iGUIMainTabContactSMTPColumn01, $iGUIMainTabContactSMTPRow02, $iGUIMainTabContactSMTPColumn01Width, $iGUIMainTabContactSMTPRow02Height)
GUICtrlCreateLabel('Server:', $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow04 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow04Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputContactSMTP_Server = GUICtrlCreateInput('', $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow04, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow04Height)
_GUICtrlEdit_SetCueBanner($idInputContactSMTP_Server, 'smtp.' & $sOrgDomain, True)
GUICtrlCreateLabel('Port:', $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow06Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputContactSMTP_Port = GUICtrlCreateInput('', $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow06, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow06Height)
_GUICtrlEdit_SetCueBanner($idInputContactSMTP_Port, '25, 465, 587', True)
Global $idCheckboxContactSMTP_EnableSSL = GUICtrlCreateCheckbox('Enable secure connection (SSL/TLS)', $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow08 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width + $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow08Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
GUICtrlCreateLabel('Username:', $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow10 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow10Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputContactSMTP_Username = GUICtrlCreateInput('', $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow10, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow10Height)
_GUICtrlEdit_SetCueBanner($idInputContactSMTP_Username, '', True)
GUICtrlCreateLabel('Password:', $iGUIMainTabContactSMTPColumn02, $iGUIMainTabContactSMTPRow12 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactSMTPColumn02Width, $iGUIMainTabContactSMTPRow12Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputContactSMTP_Password = GUICtrlCreateInput('', $iGUIMainTabContactSMTPColumn03, $iGUIMainTabContactSMTPRow12, $iGUIMainTabContactSMTPColumn03Width, $iGUIMainTabContactSMTPRow12Height)
_GUICtrlEdit_SetCueBanner($idInputContactSMTP_Password, '', True)
Global $idGroupContact_Test = GUICtrlCreateGroup('Test Settings', $iGUIMainTabContactTestColumn01, $iGUIMainTabContactTestRow02, $iGUIMainTabContactTestColumn01Width, $iGUIMainTabContactTestRow02Height)
GUICtrlCreateLabel('Result:', $iGUIMainTabContactTestColumn02, $iGUIMainTabContactTestRow04 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactTestColumn02Width, $iGUIMainTabContactTestRow04Height - $iGUIMainTabAllChromeCheckboxOffset, BitOR($BS_MULTILINE, $BS_TOP))
Global $idInputContactTest_Result = GUICtrlCreateEdit('', $iGUIMainTabContactTestColumn03, $iGUIMainTabContactTestRow04, $iGUIMainTabContactTestColumn03Width, $iGUIMainTabContactTestRow04Height, BitOR($ES_MULTILINE, $ES_WANTRETURN, $WS_VSCROLL, $ES_AUTOVSCROLL, $ES_READONLY))
Global $idGroupContact_SendTestEmail = GUICtrlCreateButton('Send Test Email', $iGUIMainTabContactTestColumn03, $iGUIMainTabContactTestRow06 + $iGUIMainTabAllChromeCheckboxOffset, $iGUIMainTabContactTestColumn03Width, $iGUIMainTabContactTestRow06Height - $iGUIMainTabAllChromeCheckboxOffset)
GUICtrlCreateTabItem('')
Global $aMenusMain[3]
$aMenusMain[0] = $idMenuMainFile
$aMenusMain[1] = $idMenuMainEdit
$aMenusMain[2] = $idMenuMainHelp
Global $aButtonsMain[3]
$aButtonsMain[0] = $idButtonMainLeftApply
$aButtonsMain[1] = $idButtonMainLeftCancel
$aButtonsMain[2] = $idGroupContact_SendTestEmail
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
Global $aEditsMain[2]
$aEditsMain[0] = $idEditMainCustomDetails_FreeText
$aEditsMain[1] = $idInputContactTest_Result
Global $aCombosMain[1]
$aCombosMain[0] = $idComboToolsHomeDrive_MapDriveLetter
Global $aStatusBarsMain[1]
$aStatusBarsMain[0] = $hStatusBarMain
GUISetState(@SW_SHOW)
EndFunc
#EndRegion
#Region -- GUI OPERATIONS
Func GUILoad($sGUILoadSource = 'Default', $sGUITabName = 'All')
Switch $sGUILoadSource
Case 'Default'
_ATC_Customization('','Declare')
Case 'Registry'
_ATC_Customization('','Read')
EndSwitch
GUITabLoad($sGUITabName)
EndFunc
Func GUITabLoad($sGUITabName = 'All')
Switch $sGUITabName
Case 'General', 'All'
ToggleGUIControl($idCheckboxMainGeneral_StartAtLogin, $bMainGeneral_StartAtLogin)
ToggleGUIControl($idCheckboxMainGeneral_DisableExit, $bMainGeneral_DisableExit)
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
ToggleGUIControl($idCheckboxMainAssetTag_ShowAssetTag, $bMainAssetTag_ShowAssetTag)
ToggleGUIControl($idRadioMainAssetTag_ReadFromBIOS, $bMainAssetTag_ReadFromBIOS)
ToggleGUIControl($idRadioMainAssetTag_Custom, $bMainAssetTag_Custom)
GUICtrlSetData($idInputMainAssetTag_Custom, $sMainAssetTag_Custom)
Case 'ToolsMenu', 'All'
Case 'CustomTools', 'All'
Case 'HelpMenu', 'All'
Case 'Services', 'All'
Case 'ContactForm', 'All'
EndSwitch
EndFunc
Func GUIState($sGUIDesiredState = 'Ready', $sGUITabName = 'All')
GUITabState($sGUITabName, $sGUIDesiredState)
EndFunc
Func GUITabState($sGUITabName = 'All', $sGUITabDesiredState = 'Ready')
Switch $sGUITabDesiredState
Case 'Ready'
Switch $sGUITabName
Case 'General', 'All'
ToggleGUIControl($idCheckboxMainGeneral_StartAtLogin, $GUI_ENABLE)
ToggleGUIControl($idCheckboxMainGeneral_DisableExit, $GUI_ENABLE)
ToggleGUIControl($idRadioMainTrayIcon_First, $GUI_ENABLE)
ToggleGUIControl($idRadioMainTrayIcon_Second, $GUI_ENABLE)
ToggleGUIControl($idRadioMainTrayIcon_Third, $GUI_ENABLE)
ToggleGUIControl($idRadioMainTrayIcon_Fourth, $GUI_ENABLE)
ToggleGUIControl($idRadioMainTrayIcon_Fifth, $GUI_ENABLE)
ToggleGUIControl($idCheckboxMainAssetTag_ShowAssetTag, $GUI_ENABLE)
If GUICtrlRead($idCheckboxMainAssetTag_ShowAssetTag) = $GUI_CHECKED Then
ToggleGUIControl($idRadioMainAssetTag_ReadFromBIOS, $GUI_ENABLE)
ToggleGUIControl($idRadioMainAssetTag_Custom, $GUI_ENABLE)
If GUICtrlRead($idRadioMainAssetTag_Custom) = $GUI_CHECKED Then
ToggleGUIControl($idInputMainAssetTag_Custom, $GUI_ENABLE)
Else
ToggleGUIControl($idInputMainAssetTag_Custom, $GUI_DISABLE)
EndIf
Else
ToggleGUIControl($idRadioMainAssetTag_ReadFromBIOS, $GUI_DISABLE)
ToggleGUIControl($idRadioMainAssetTag_Custom, $GUI_DISABLE)
ToggleGUIControl($idInputMainAssetTag_Custom, $GUI_DISABLE)
EndIf
Case 'ToolsMenu', 'All'
Case 'CustomTools', 'All'
Case 'HelpMenu', 'All'
Case 'Services', 'All'
Case 'ContactForm', 'All'
EndSwitch
EndSwitch
EndFunc
Func GUIWait()
Local $idMsg
While 1
$idMsg = GUIGetMsg()
If $idMsg = $GUI_EVENT_CLOSE Then ExitLoop
WEnd
EndFunc
Func MainGUIClose()
EndFunc
Func GUIRefresh()
EndFunc
#EndRegion
#Region -- GUI STATES
Func GUIMainSetDefaults()
GUIMainSetMenuDefaults()
GUIMainSetButtonDefaults()
EndFunc
Func GUIMainSetBusyDefaults()
GUIMainSetMenus($GUI_DISABLE)
GUIMainSetButtons($GUI_DISABLE)
EndFunc
Func GUIMainSetMenuDefaults()
GUIMainSetMenus($GUI_ENABLE)
EndFunc
Func GUIMainSetButtonDefaults()
GUIMainSetButtons($GUI_ENABLE)
EndFunc
Func GUIMainSetMenus($Option)
For $i = 0 To UBound($aMenusMain) - 1
ToggleGUIControl($aMenusMain[$i], $Option)
Next
EndFunc
Func GUIMainSetButtons($Option)
For $i = 0 To UBound($aButtonsMain) - 1
ToggleGUIControl($aButtonsMain[$i], $Option)
Next
EndFunc
#EndRegion
#Region -- LAUNCH EXTERNAL APPS
Func LaunchAbout()
$sWindowTitle = 'About'
$idParentGUI = $hGUIMain
$sGraphic = $sAppLogo
$sTitle = 'About This Computer'
$sSubtitle = 'A workstation information utility.'
$sVersion = 'Version ' & $sAppVersion
$sCredits = 'Created by Brian Kyncl (brian@briankyncl.com)' & @CRLF & 'BeOS icons by StudioTwentyEight' & @CRLF & '(http://www.studiotwentyeight.net)'
$iGUIAboutWidthDefault = 256
$iColumnAboutHeader00 = 00
$iColumnAboutHeader01 = ($iGUIAboutWidthDefault - 128) / 2
$iColumnAboutHeader00Width = $iGUIAboutWidthDefault
$iColumnAboutHeader01Width = 128
$iRowAboutHeader00  = 00
$iRowAboutHeader01  = 20
$iRowAboutHeader00Height  = 168
$iRowAboutHeader01Height  = 128
$iColumnAboutTitle00  = 00
$iColumnAboutTitle01  = 10
$iColumnAboutTitle00Wdith = $iGUIAboutWidthDefault
$iColumnAboutTitle01Width = $iColumnAboutTitle00Wdith - 20
$iRowAboutTitle00 = $iColumnAboutHeader00 + $iRowAboutHeader00Height
$iRowAboutTitle01 = $iRowAboutTitle00
$iRowAboutTitle00Height = 22
$iRowAboutTitle01Height = 22
$iColumnAboutSubtitle00  = 00
$iColumnAboutSubtitle01  = 10
$iColumnAboutSubtitle00Wdith = $iGUIAboutWidthDefault
$iColumnAboutSubtitle01Width = $iColumnAboutSubtitle00Wdith - 20
$iRowAboutSubtitle00 = $iRowAboutTitle00 + $iRowAboutTitle00Height
$iRowAboutSubtitle01 = $iRowAboutSubtitle00
$iRowAboutSubtitle00Height = 15
$iRowAboutSubtitle01Height = 15
$iColumnAboutVersion00  = 00
$iColumnAboutVersion01  = 10
$iColumnAboutVersion00Wdith = $iGUIAboutWidthDefault
$iColumnAboutVersion01Width = $iColumnAboutSubtitle00Wdith - 20
$iRowAboutVersion00 = $iRowAboutSubtitle00 + $iRowAboutSubtitle00Height
$iRowAboutVersion01 = $iRowAboutVersion00 + 25
$iRowAboutVersion00Height = 30
$iRowAboutVersion01Height = 25
$iColumnAboutCredits00  = 00
$iColumnAboutCredits01  = 10
$iColumnAboutCredits00Wdith = $iGUIAboutWidthDefault
$iColumnAboutCredits01Width = $iColumnAboutSubtitle00Wdith - 20
$iRowAboutCredits00 = $iRowAboutVersion00 + $iRowAboutVersion00Height
$iRowAboutCredits01 = $iRowAboutCredits00 + 25
$iRowAboutCredits00Height = 70
$iRowAboutCredits01Height = 45
$iGUIAboutHeightDefault = $iRowAboutCredits00 + $iRowAboutCredits00Height + 10
Global $idGUIAbout = GUICreate($sWindowTitle, $iGUIAboutWidthDefault, $iGUIAboutHeightDefault, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), '', $idParentGUI)
GUICtrlCreateIcon($sGraphic, -1, $iColumnAboutHeader01 + 12, $iRowAboutHeader01, $iColumnAboutHeader01Width, $iRowAboutHeader01Height, -1)
GUICtrlCreateLabel($sTitle, $iColumnAboutTitle01, $iRowAboutTitle01, $iColumnAboutTitle01Width, $iRowAboutTitle01Height, $SS_CENTER)
GUICtrlSetFont(-1, 14, $FW_BOLD)
GUICtrlCreateLabel($sSubtitle, $iColumnAboutSubtitle01, $iRowAboutSubtitle01, $iColumnAboutSubtitle01Width, $iRowAboutSubtitle01Height, $SS_CENTER)
GUICtrlSetFont(-1, 10)
GUICtrlCreateLabel($sVersion, $iColumnAboutVersion01, $iRowAboutVersion01, $iColumnAboutVersion01Width, $iRowAboutVersion01Height, $SS_CENTER)
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
Run(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
EndFunc
Func StandardRunWaitCmd($cmd)
RunWait(@ComSpec & " /c " & $cmd, @SystemDir, @SW_HIDE)
EndFunc
Func _IsValidEmail($email)
If StringRegExp($email, "^([a-zA-Z0-9_\-])([a-zA-Z0-9_\-\.]*)@(\[((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}|((([a-zA-Z0-9\-]+)\.)+))([a-zA-Z]{2,}|(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\])$") Then
Return True
Else
Return False
EndIf
EndFunc
#EndRegion
#Region -- END
Func End()
GUIDelete($hGUIMain)
SoftExit()
EndFunc
Func SoftExit()
HardExit()
EndFunc
Func HardExit()
Exit
EndFunc
Exit
#EndRegion
