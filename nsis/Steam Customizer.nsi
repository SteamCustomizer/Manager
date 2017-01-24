############################################################################################
#      NSIS Installation Script created by NSIS Quick Setup Script Generator v1.09.18
#               Entirely Edited with NullSoft Scriptable Installation System                
#              by Vlasis K. Barkas aka Red Wine red_wine@freemail.gr Sep 2006               
############################################################################################

!define APP_NAME "Steam Customizer"
!define COMP_NAME "Blumont"
!define WEB_SITE "http://steamcustomizer.com/"
!define VERSION "1.00.00.00"
!define COPYRIGHT "Blumont © 2017"
!define DESCRIPTION "Application"
!define FILENAME "Application"
!define PUBLISHER "Application"
!define LICENSE_TXT "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\installer1\license.txt"
!define FILEDESCRIPTION "Application"
!define INSTALLER_NAME "I:\Users\User\Desktop\setup.exe"
!define MAIN_APP_EXE "SkinInstaller.exe"
!define INSTALL_TYPE "SetShellVarContext current"
!define REG_ROOT "HKCU"
!define REG_APP_PATH "Software\Microsoft\Windows\CurrentVersion\App Paths\${MAIN_APP_EXE}"
!define UNINSTALL_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
!include "FileAssociation.nsh"

!define NETVersion "3.5"
!define NETInstaller "dotNetFx35setup.exe"






RequestExecutionLevel admin


######################################################################

VIProductVersion  "${VERSION}"
VIAddVersionKey "ProductName"  "${APP_NAME}"
VIAddVersionKey "CompanyName"  "${COMP_NAME}"
VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
VIAddVersionKey "FileVersion"  "${VERSION}"

######################################################################

SetCompressor ZLIB
Name "${APP_NAME}"
Caption "${APP_NAME}"
OutFile "${INSTALLER_NAME}"
BrandingText "${APP_NAME}"
XPStyle on
InstallDirRegKey "${REG_ROOT}" "${REG_APP_PATH}" ""
InstallDir "$PROGRAMFILES\Steam Customizer"

######################################################################

!include "MUI.nsh"







!define MUI_ICON "icon.ico"
!define MUI_UNICON "un_icon.ico"


!define MUI_HEADERIMAGE
    !define MUI_HEADERIMAGE_BITMAP InstallerLogoHeader.bmp
!define MUI_WELCOMEFINISHPAGE_BITMAP InstallerLogo.bmp

!define MUI_WELCOMEPAGE_TITLE  'Steam Skin File Format'


!define MUI_WELCOMEPAGE_TEXT "This installer will create an association with stskin files so that you can install Steam Skins by double clicking them\n\nPress Next to begin"


!define MUI_ABORTWARNING
!define MUI_UNABORTWARNING

!insertmacro MUI_PAGE_WELCOME

!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Create desktop shortcut"
!define MUI_FINISHPAGE_RUN_FUNCTION "myfunction"

Function "myfunction"
CreateShortCut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
FunctionEnd



!ifdef LICENSE_TXT
!insertmacro MUI_PAGE_LICENSE "${LICENSE_TXT}"
!endif

!ifdef REG_START_MENU
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Steam Customizer"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${REG_ROOT}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${UNINSTALL_PATH}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${REG_START_MENU}"
!insertmacro MUI_PAGE_STARTMENU Application $SM_Folder
!endif

!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM

!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"



Section "MS .NET Framework v${NETVersion}" SecFramework
  IfFileExists "$WINDIR\Microsoft.NET\Framework\v${NETVersion}" NETFrameworkInstalled 0
  File /oname=$TEMP\${NETInstaller} ${NETInstaller}
 
  DetailPrint "Starting Microsoft .NET Framework v${NETVersion} Setup..."
  ExecWait "$TEMP\${NETInstaller}"
  Return
 
  NETFrameworkInstalled:
  DetailPrint "Microsoft .NET Framework is already installed!"
 
SectionEnd







######################################################################

Section -MainProgram
${INSTALL_TYPE}
SetOverwrite ifnewer
SetOutPath "$INSTDIR"
File "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\blank.jpg"
File "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\default.jpg"
File "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\about.jpg"
File "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\SkinInstaller.exe"
File "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\installer1\Read\README.txt"
File "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\installer1\Read\Example.stskin"
File /r "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\MUI"
File /r "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\extra"
File /r "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\bin"
File "I:\Users\User\Google Drive\Projects\SteamCustomizer\Steam Customizer\settings.ini"
SectionEnd

######################################################################



Section -Icons_Reg
SetOutPath "$INSTDIR"
WriteUninstaller "$INSTDIR\uninstall.exe"


SetShellVarContext all

!ifdef REG_START_MENU
!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
CreateDirectory "$SMPROGRAMS\$SM_Folder"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
CreateShortCut "$SMPROGRAMS\$SM_Folder\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"


!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!insertmacro MUI_STARTMENU_WRITE_END
!endif

!ifndef REG_START_MENU
CreateDirectory "$SMPROGRAMS\Steam Customizer"

CreateShortCut "$SMPROGRAMS\Steam Customizer\Skin Manager.lnk" "$INSTDIR\SkinInstaller.exe"
CreateShortCut "$SMPROGRAMS\Steam Customizer\README.lnk" "$INSTDIR\Readme.txt"
CreateShortCut "$SMPROGRAMS\Steam Customizer\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"
${registerExtension} "$PROGRAMFILES\Steam Customizer\SkinInstaller.exe" ".stskin" "Steam Skin File"

!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\Steam Customizer\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!endif

WriteRegStr ${REG_ROOT} "${REG_APP_PATH}" "" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayName" "${APP_NAME}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "UninstallString" "$INSTDIR\uninstall.exe"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayIcon" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayVersion" "${VERSION}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "Publisher" "${COMP_NAME}"

!ifdef WEB_SITE
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "URLInfoAbout" "${WEB_SITE}"
!endif
SectionEnd



######################################################################

Section Uninstall
${INSTALL_TYPE}
Delete "$INSTDIR\${MAIN_APP_EXE}"
Delete "$INSTDIR\uninstall.exe"
Delete "$INSTDIR\README.txt"
Delete "$INSTDIR\Example.stskin"
Delete "$INSTDIR\blank.jpg"
Delete "$INSTDIR\default.jpg"
Delete "$INSTDIR\about.jpg"
Delete "$INSTDIR\settings.ini"
Delete "$INSTDIR\template.ini"
Delete "$INSTDIR\SkinManager.exe"
RmDir /R /REBOOTOK "$INSTDIR\bin"
RmDir /R /REBOOTOK "$INSTDIR\extra"
RmDir /R /REBOOTOK "$INSTDIR\MUI"
${unregisterExtension} ".stskin" "Steam Skin File"
!ifdef WEB_SITE
Delete "$INSTDIR\${APP_NAME} website.url"
!endif
RmDir /R /REBOOTOK "$INSTDIR"




!ifdef REG_START_MENU
SetShellVarContext all
!insertmacro MUI_STARTMENU_GETFOLDER "Application" $SM_Folder
Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk"
Delete "$SMPROGRAMS\$SM_Folder\Uninstall ${APP_NAME}.lnk"
RmDir "$SMPROGRAMS\$SM_Folder"
!ifdef WEB_SITE
Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk"
Delete "$SMPROGRAMS\Steam Customizer\README.lnk" "$INSTDIR\Readme.txt"
RmDir "$SMPROGRAMS\$SM_Folder"
!endif
RmDir "$SMPROGRAMS\$SM_Folder"
!endif

!ifndef REG_START_MENU

SetShellVarContext all

Delete "$SMPROGRAMS\Steam Customizer\Skin Installer.lnk"
Delete "$SMPROGRAMS\Steam Customizer\Uninstall ${APP_NAME}.lnk"
RmDir "$SMPROGRAMS\$SM_Folder"
!ifdef WEB_SITE
Delete "$SMPROGRAMS\Steam Customizer\${APP_NAME} Website.lnk"
Delete "$SMPROGRAMS\Steam Customizer\README.lnk" 
Delete "$SMPROGRAMS\Steam Customizer\Skin Manager.lnk" 
Delete "$DESKTOP\${APP_NAME}.lnk"
RmDir "$SMPROGRAMS\$SM_Folder"
!endif
RmDir "$SMPROGRAMS\Steam Customizer"
!endif

DeleteRegKey ${REG_ROOT} "${REG_APP_PATH}"
DeleteRegKey ${REG_ROOT} "${UNINSTALL_PATH}"
SectionEnd

######################################################################

