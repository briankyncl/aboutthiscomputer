#define ApplicationName 'About This Computer'
#define ApplicationVersion GetFileVersion('.\Compiled\AboutThisComputer.exe')

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A7C827B2-8BE9-4893-8DE8-073B73746D85}
AppName={#ApplicationName}
AppVersion={#ApplicationVersion}
AppPublisher=briankyncl.com
AppPublisherURL=briankyncl.com
AppSupportURL=briankyncl.com
AppUpdatesURL=briankyncl.com
ArchitecturesInstallIn64BitMode=x64
DefaultDirName={pf}\com.briankyncl\About This Computer
DefaultGroupName=About This Computer
DisableProgramGroupPage=yes
DisableWelcomePage=no
UninstallDisplayIcon={app}\AboutThisComputer.exe
UninstallDisplayName=About This Computer
OutputDir=.\Releases
OutputBaseFilename=SetupAboutThisComputer_{#ApplicationVersion}
SetupIconFile=.\Images\BeOS_info.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
; Name: "startupshortcut"; Description: "Run at user login"; GroupDescription: "{cm:AdditionalIcons}"
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
;Source: ".\Compiled\AboutThisComputerInstallHelper.exe"; DestDir: "{app}"; Flags: ignoreversion; AfterInstall: InstallHelper('BeforeInstall')
;Source: ".\Compiled\AboutThisComputerInstallHelper_x64.exe"; DestDir: "{app}"; Flags: ignoreversion; AfterInstall: InstallHelper('BeforeInstall')
;Source: ".\Compiled\Support\*"; DestDir: "{app}\Support"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\Compiled\Support\*"; DestDir: "{app}\Support"; Flags: ignoreversion recursesubdirs createallsubdirs; AfterInstall: InstallHelper('BeforeInstall')
Source: ".\Compiled\AboutThisComputer.exe"; DestDir: "{app}"; Flags: ignoreversion;
Source: ".\Compiled\AboutThisComputer_x64.exe"; DestDir: "{app}"; Flags: ignoreversion; AfterInstall: InstallHelper('AfterInstall')

[Icons]
Name: "{group}\About This Computer"; Filename: "{app}\AboutThisComputer.exe"; Parameters: "-mode Window"
; Name: "{commonstartup}\About This Computer"; Filename: "{app}\AboutThisComputer.exe"; Parameters: "-mode Tray"; Tasks: startupshortcut
Name: "{commondesktop}\About This Computer"; Filename: "{app}\AboutThisComputer.exe"; Parameters: "-mode Window"; Tasks: desktopicon

[Run]
Filename: "{app}\AboutThisComputer.exe"; Parameters: "-mode Tray"; Description: "{cm:LaunchProgram,About This Computer}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "taskkill"; Parameters: "/im ""AboutThisComputer.exe"" /f"; Flags: runhidden
Filename: "{app}\Support\AboutThisComputerInstallHelper.exe"; Parameters: "-mode BeforeInstall"; Flags: runhidden

[Code]
procedure InstallHelper(Option: String);
var
  ResultCode: Integer;
begin
    Exec(ExpandConstant('{app}\Support\AboutThisComputerInstallHelper.exe'), '-mode ' + Option, '', SW_HIDE,
     ewWaitUntilTerminated, ResultCode);
end;