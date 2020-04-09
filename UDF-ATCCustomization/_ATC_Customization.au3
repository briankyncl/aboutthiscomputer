#include-once

; #FUNCTION# ====================================================================================================================
; Name ..........: _ATC_Customization
; Description ...: Declares, reads, and/or sets defaults for all About This Computer customization items.
; Syntax ........: _ATC_Customization([$__sAppRegistryPath = ...], [$iOption = 0])
; Parameters ....: $__sAppRegistryPath - [optional] Path to registry key with values to be modified.
;                  $iOption            - [optional] Specify which options to perform. Default is 'Default'.
;                    'Default' = Perform default options ('Declare' and 'Read').
;                    'Declare' = Declare globals only.
;                    'Read'    = Read configuration only.
;                    'Stage'   = Create registry entries only. Requires elevation.
; Return values .: Success - Returns 0
;                  Failure - Returns 1 & sets @error to non-zero
; Author ........: briankyncl.com
; Modified ......: 2020-02-17
; Remarks .......: None
; Example .......: No
; ===============================================================================================================================

Func _ATC_Customization($__sAppRegistryPath = 'HKEY_LOCAL_MACHINE\Software\com.briankyncl\About This Computer', $iOption = 'Default')
  ;;READ AND/OR WRITE ABOUT THIS COMPUTER CUSTOMIZATION

  ;;Declare global variables
  If $iOption = 'Default' Or $iOption = 'Declare' Then
    ;;Organization
    Global $sOrgName                  = 'Contoso'
    Global $sOrgDomain                = 'contoso.com'
    Global $sOrgFQDomain              = 'corp.' & $sOrgDomain

    ;;Intranet
    Global $sIntranetName             = $sOrgName & ' Intranet'
    Global $sIntranetURL              = 'https://intranet.' & $sOrgDomain & '/'

    ;;Helpdesk
    Global $sHelpdeskName             = $sOrgName & ' IT Helpdesk'
    Global $sHelpdeskPhone            = '1-800-555-5555'
    Global $sHelpdeskRegionalPhone    = $sHelpdeskPhone
    Global $sHelpdeskCorporatePhone   = $sHelpdeskPhone
    Global $sHelpdeskEmail            = 'helpdesk@' & $sOrgDomain
    Global $sHelpdeskURL              = 'helpdesk.' & $sOrgDomain
    Global $sHelpdeskRemoteSupportURL = 'remotesupport.' & $sOrgDomain
    Global $sHelpdeskRequestName      = 'Create an IT' & @CRLF & 'Helpdesk Request'

    ;;SCCM
    Global $sSCCMAppCatalogURL        = 'https://sccmserver.' & $sOrgFQDomain & '/CMApplicationCatalog'

    ;;Home Folder
    Global $sHomeFolderName           = 'Home Drive'  ;;'I: Drive', or 'Home Folder', etc.

    ;;Login Script
    Global $sLoginScriptPath          = '\\' & $sOrgFQDomain & '\NETLOGON'
  EndIf

  ;;Read customization
  If $iOption = 'Default' Or $iOption = 'Read' Then
    ;;Organization
    If RegRead($__sAppRegistryPath, 'sOrgName')                  Then $sOrgName = RegRead($__sAppRegistryPath, 'sOrgName')
    If RegRead($__sAppRegistryPath, 'sOrgDomain')                Then $sOrgDomain = RegRead($__sAppRegistryPath, 'sOrgDomain')
    If RegRead($__sAppRegistryPath, 'sOrgFQDomain')              Then $sOrgFQDomain = RegRead($__sAppRegistryPath, 'sOrgFQDomain')

    ;;Intranet
    If RegRead($__sAppRegistryPath, 'sIntranetName')             Then $sIntranetName = RegRead($__sAppRegistryPath, 'sIntranetName')
    If RegRead($__sAppRegistryPath, 'sIntranetURL')              Then $sIntranetURL = RegRead($__sAppRegistryPath, 'sIntranetURL')

    ;;Helpdesk
    If RegRead($__sAppRegistryPath, 'sHelpdeskName')             Then $sHelpdeskName = RegRead($__sAppRegistryPath, 'sHelpdeskName')
    If RegRead($__sAppRegistryPath, 'sHelpdeskPhone')            Then $sHelpdeskPhone = RegRead($__sAppRegistryPath, 'sHelpdeskPhone')
    If RegRead($__sAppRegistryPath, 'sHelpdeskRegionalPhone')    Then $sHelpdeskRegionalPhone = RegRead($__sAppRegistryPath, 'sHelpdeskRegionalPhone')
    If RegRead($__sAppRegistryPath, 'sHelpdeskCorporatePhone')   Then $sHelpdeskCorporatePhone = RegRead($__sAppRegistryPath, 'sHelpdeskCorporatePhone')
    If RegRead($__sAppRegistryPath, 'sHelpdeskEmail')            Then $sHelpdeskEmail = RegRead($__sAppRegistryPath, 'sHelpdeskEmail')
    If RegRead($__sAppRegistryPath, 'sHelpdeskURL')              Then $sHelpdeskURL = RegRead($__sAppRegistryPath, 'sHelpdeskURL')
    If RegRead($__sAppRegistryPath, 'sHelpdeskRemoteSupportURL') Then $sHelpdeskRemoteSupportURL = RegRead($__sAppRegistryPath, 'sHelpdeskRemoteSupportURL')
    If RegRead($__sAppRegistryPath, 'sHelpdeskRequestName')      Then $sHelpdeskRequestName = RegRead($__sAppRegistryPath, 'sHelpdeskRequestName')

    ;;SCCM
    If RegRead($__sAppRegistryPath, 'sSCCMAppCatalogURL')        Then $sSCCMAppCatalogURL = RegRead($__sAppRegistryPath, 'sSCCMAppCatalogURL')

    ;;Home Folder
    If RegRead($__sAppRegistryPath, 'sHomeFolderName')           Then $sHomeFolderName = RegRead($__sAppRegistryPath, 'sHomeFolderName')

    ;;Login Script
    If RegRead($__sAppRegistryPath, 'sLoginScriptPath')          Then $sLoginScriptPath = RegRead($__sAppRegistryPath, 'sLoginScriptPath')

    ;;Free-Text
    Global $sFreeTextDetails = ''
    If RegRead($__sAppRegistryPath, 'sFreeTextDetails')          Then $sFreeTextDetails = RegRead($__sAppRegistryPath, 'sFreeTextDetails')
  EndIf

  ;;Stage Windows Registry entries
  If $iOption = 'Stage' Then
    Local $aRegistryCustomization[17]
      $aRegistryCustomization[00] = 'sOrgName'
      $aRegistryCustomization[01] = 'sOrgDomain'
      $aRegistryCustomization[02] = 'sOrgFQDomain'
      $aRegistryCustomization[03] = 'sIntranetName'
      $aRegistryCustomization[04] = 'sIntranetURL'
      $aRegistryCustomization[05] = 'sHelpdeskName'
      $aRegistryCustomization[06] = 'sHelpdeskPhone'
      $aRegistryCustomization[07] = 'sHelpdeskRegionalPhone'
      $aRegistryCustomization[08] = 'sHelpdeskCorporatePhone'
      $aRegistryCustomization[09] = 'sHelpdeskEmail'
      $aRegistryCustomization[10] = 'sHelpdeskURL'
      $aRegistryCustomization[11] = 'sHelpdeskRemoteSupportURL'
      $aRegistryCustomization[12] = 'sHelpdeskRequestName'
      $aRegistryCustomization[13] = 'sSCCMAppCatalogURL'
      $aRegistryCustomization[14] = 'sHomeFolderName'
      $aRegistryCustomization[15] = 'sLoginScriptPath'
      $aRegistryCustomization[16] = 'sFreeTextDetails'
    For $i = 0 to UBound($aRegistryCustomization) - 1
      RegRead($__sAppRegistryPath, $aRegistryCustomization[$i])
      If @error <> 0 Then
        RegWrite($__sAppRegistryPath, $aRegistryCustomization[$i], 'REG_SZ', '')
      EndIf
    Next
  EndIf
EndFunc