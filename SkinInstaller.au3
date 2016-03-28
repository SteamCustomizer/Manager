#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=main.ico
#AutoIt3Wrapper_Icon_Add=manager.ico
#AutoIt3Wrapper_Outfile=SkinManager.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for SteamCustomizer.com
#AutoIt3Wrapper_Res_Description=Made for SteamCustomizer.com
#AutoIt3Wrapper_Res_Fileversion=1.0
#AutoIt3Wrapper_Res_LegalCopyright=Blumont Interactive 2016
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#RequireAdmin


#include <GuiConstantsEx.au3>
#include <File.au3>
#include <Array.au3>
#include <GUIConstants.au3>
#include <GUIListBox.au3>
#include "GUIHyperLink.au3"
#include <FontConstants.au3>
#include <string.au3>
#include <WinAPIFiles.au3>
#include "_Zip.au3"
#include <GuiConstants.au3>
#include <FileConstants.au3>


; Include wrapper script
#include <SteamCustomizer.au3>

OnAutoItExitRegister("ExitStuff")

; \$.*?SteamSkinLanguage", "
;Get Languages


Global $bNoBackup = True
Global $bActivate = True
Global $bRestart = True



$CurrentVersion="1.0"

$sLangRemember = FileReadLine("settings.ini", 1)



$sLanguageIni = @ProgramFilesDir & '\Steam Customizer\MUI\' & $sLangRemember & '.ini'
$sNoSkinsInstalled = IniRead($sLanguageIni, "SteamSkinLanguage", "sNoSkinsInstalled", "No Skins Installed, why not get one or make one on SteamCustomizer.com?")
$sApply = IniRead($sLanguageIni, "SteamSkinLanguage", "Apply", "Apply")
$sDelete = IniRead($sLanguageIni, "SteamSkinLanguage", "Delete", "Delete")
$sGetMoreSkins = IniRead($sLanguageIni, "SteamSkinLanguage", "GetMoreSkins", "Get more skins")
$sUnknown = IniRead($sLanguageIni, "SteamSkinLanguage", "Unknown", "Unknown")
$sSkin = IniRead($sLanguageIni, "SteamSkinLanguage", "Skin", "Skin")
$sNoDescription = IniRead($sLanguageIni, "SteamSkinLanguage", "NoDescription", "No Description")
$sWarning = IniRead($sLanguageIni, "SteamSkinLanguage", "Warning", "Warning")
$sCantDelete = IniRead($sLanguageIni, "SteamSkinLanguage", "CantDelete", "Can't")
$sSkinUsingConfirm = IniRead($sLanguageIni, "SteamSkinLanguage", "SkinUsingConfirm", "You are using this skin. Are you sure?")
$sDeleted = IniRead($sLanguageIni, "SteamSkinLanguage", "Deleted", "Deleted")
$sDeletedNotUsing = IniRead($sLanguageIni, "SteamSkinLanguage", "Deleted", "Skin deleted.")
$sDeletedUsing = IniRead($sLanguageIni, "SteamSkinLanguage", "DeletedUsing", "Skin deleted. Restarting Steam...")
$sNotSureIfRestart = IniRead($sLanguageIni, "SteamSkinLanguage", "NotSureIfRestart", "(if it didn't, restart manually)")
$sNothingSelected = IniRead($sLanguageIni, "SteamSkinLanguage", "NothingSelected", "Nothing selected.")
$sOverwriteWarning = IniRead($sLanguageIni, "SteamSkinLanguage", "OverwriteWarning", "This will overwrite your current skin. Are you sure?")
$sYes = IniRead($sLanguageIni, "SteamSkinLanguage", "Yes", "Yes")
$sNo = IniRead($sLanguageIni, "SteamSkinLanguage", "No", "No")
$sSkinApplied = IniRead($sLanguageIni, "SteamSkinLanguage", "SkinApplied", "Skin applied. Restarting Steam...")
$sSkinAppliedNeedRestart = IniRead($sLanguageIni, "SteamSkinLanguage", "SkinAppliedNeedRestart", "Skin applied. You need to restart Steam manually.")
$sSelectSkin = IniRead($sLanguageIni, "SteamSkinLanguage", "SelectSkin", "Select Skin")
$sAutoApply = IniRead($sLanguageIni, "SteamSkinLanguage", "AutoApply", "This will automatically apply the skin and restart steam")
$sInstallSkin = IniRead($sLanguageIni, "SteamSkinLanguage", "InstallSkin", "Install Skin")
$sSkinInstalled = IniRead($sLanguageIni, "SteamSkinLanguage", "SkinInstalled", "Skin Installed")
$sSkinInstalledManual= IniRead($sLanguageIni, "SteamSkinLanguage", "SkinInstalledManual", "SkinInstalledManual")
$sNoFileSelected = IniRead($sLanguageIni, "SteamSkinLanguage", "NoFileSelected", "NoFileSelected")
$sSkins = IniRead($sLanguageIni, "SteamSkinLanguage", "Skins", "Skins")
$sFile = IniRead($sLanguageIni, "SteamSkinLanguage", "File", "File")
$sOpen = IniRead($sLanguageIni, "SteamSkinLanguage", "Open", "Open")
$sExit = IniRead($sLanguageIni, "SteamSkinLanguage", "Exit", "Exit")
$sEdit = IniRead($sLanguageIni, "SteamSkinLanguage", "Edit", "Edit")
$sAbout = IniRead($sLanguageIni, "SteamSkinLanguage", "About", "About")
$sOptions = IniRead($sLanguageIni, "SteamSkinLanguage", "Options", "Options")
$sCheckForUpdates = IniRead($sLanguageIni, "SteamSkinLanguage", "CheckForUpdates", "Check for updates")
$sLanguage = IniRead($sLanguageIni, "SteamSkinLanguage", "Language", "Language")
$sApplied = IniRead($sLanguageIni, "SteamSkinLanguage", "Applied", "Applied")
$sSkinDeleted = IniRead($sLanguageIni, "SteamSkinLanguage", "SkinDeleted", "SkinDeleted")
$sDeleteAreYouSure = IniRead($sLanguageIni, "SteamSkinLanguage", "DeleteAreYouSure", "DeleteAreYouSure")

$sBrowseForStSkin = IniRead($sLanguageIni, "SteamSkinLanguage", "BrowseForStSkin", "Browse for *.stskin file")
$sBrowseForJpg = IniRead($sLanguageIni, "SteamSkinLanguage", "BrowseForJpg", "Browse for jpg file")
$sNoFileSelected = IniRead($sLanguageIni, "SteamSkinLanguage", "NoFileSelected", "No file selected")
$sInstallingThisNow = IniRead($sLanguageIni, "SteamSkinLanguage", "InstallingThisNow", "We're going to install this now:")
$sStSkinCreatedOnYourDesktop = IniRead($sLanguageIni, "SteamSkinLanguage", "StSkinCreatedOnYourDesktop", "StSkin file created, it's on your Desktop")
$sZipCreatedOnYourDesktop = IniRead($sLanguageIni, "SteamSkinLanguage", "ZipCreatedOnYourDesktop", "ZIP file created, it's on your Desktop")
$sFileDoesntExist = IniRead($sLanguageIni, "SteamSkinLanguage", "FileDoesntExist", "Can't export this skin as StSkin because it wasn't created using the Editor")
$sMetadata = IniRead($sLanguageIni, "SteamSkinLanguage", "Metadata", "Metadata")
$sRefresh = IniRead($sLanguageIni, "SteamSkinLanguage", "Refresh", "Refresh")
$sChangeMetadata = IniRead($sLanguageIni, "SteamSkinLanguage", "ChangeMetadata", "Change Metadata")
$sChangePreview = IniRead($sLanguageIni, "SteamSkinLanguage", "ChangePreview", "Change Preview")
$sExportStSkin = IniRead($sLanguageIni, "SteamSkinLanguage", "ExportStSkin", "Export *.stskin")
$sExportZip = IniRead($sLanguageIni, "SteamSkinLanguage", "ExportZip", "Export *.zip")
$sAutomaticallyRestartSteam = IniRead($sLanguageIni, "SteamSkinLanguage", "AutomaticallyRestartSteam", "This will automatically apply the skin and restart steam")

$sUpdates = IniRead($sLanguageIni, "SteamSkinLanguage", "Updates", "Updates")
$sUpToDate = IniRead($sLanguageIni, "SteamSkinLanguage", "UpToDate", "Your version is up to date.")
$sVersionIsReleased = IniRead($sLanguageIni, "SteamSkinLanguage", "VersionIsReleased", "version is released. Would you like to download it now?")

$sMetadataAdded = IniRead($sLanguageIni, "SteamSkinLanguage", "MetadataAdded", "Metadata added")
$sDownloadingUpdate = IniRead($sLanguageIni, "SteamSkinLanguage", "DownloadingUpdate", "Downloading Update...")
$sCriticalUpdate = IniRead($sLanguageIni, "SteamSkinLanguage", "CriticalUpdate", "You must update this app to continue using it")
$sDefaultSkin = IniRead($sLanguageIni, "SteamSkinLanguage", "DefaultSkin", "<default skin>")



_Main()

Func _Main()
	Local $sFilePath = ''
	If $CmdLine[0] > 0 Then
		$sFilePath = $CmdLine[1]
	 EndIf


GUICtrlCreateEdit(_GetFile($sFilePath), 10, 5, 350, 65) ; If a file was passed via commandline then random text will appear in the GUICtrlCreateEdit().
SteamCustomizer_Compile($CmdLine[1], Null, $bNoBackup, $bActivate, $bRestart)
Exit

EndFunc








Func _GetFile($sFilePath, $sFormat = 0)
	Local $hFileOpen = FileOpen($sFilePath, $sFormat)
	If $hFileOpen = -1 Then



Manager()
If @error Then
        ; Display the error message.
        MsgBox($MB_ICONERROR, "", $NoFileSelected)
        ; Change the working directory (@WorkingDir) back to the location of the script directory as FileOpenDialog sets it to the last accessed folder.
        FileChangeDir(@ScriptDir)
    Else
        ; Change the working directory (@WorkingDir) back to the location of the script directory as FileOpenDialog sets it to the last accessed folder.
        FileChangeDir(@ScriptDir)
        ; Replace instances of "|" with @CRLF in the string returned by FileOpenDialog.
        $sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)
        ; Display the list of selected files.
        MsgBox($MB_ICONINFORMATION, "", $SkinInstalled)
	    ShellExecute($sFileOpenDialog)
	EndIf
FileClose($hFileOpen)
Exit
	EndIf
	Local $sData = FileRead($hFileOpen)
	FileClose($hFileOpen)
	Return $sData
EndFunc



Func _SetFile($sString, $sFilePath, $iOverwrite = 0)
	Local $hFileOpen = FileOpen($sFilePath, $iOverwrite + 1)
	FileWrite($hFileOpen, $sString)
	FileClose($hFileOpen)
	If @error Then
		Return SetError(1, 0, $sString)
	EndIf
	Return $sString
 EndFunc   ;==>_SetFile






Func Manager()


$sLastOpened = FileReadLine("settings.ini", 2)
$sTodayTimeStamp = @YEAR & @MON & @MDAY

If $sTodayTimeStamp > $sLastOpened Then
   Update()
_FileWriteToLine("settings.ini", 2, $sTodayTimeStamp, True)
Else

_FileWriteToLine("settings.ini", 2, $sTodayTimeStamp, True)
EndIf

;GUI
Global $hGUI = GUICreate($sSkins, 760, 306)

;Menubar
Local $idFilemenu = GUICtrlCreateMenu($sFile)
Local $idOpen = GUICtrlCreateMenuItem($sOpen, $idFilemenu)
Local $idExportStSkin = GUICtrlCreateMenuItem($sExportStSkin, $idFilemenu)
Local $idExportZip = GUICtrlCreateMenuItem($sExportZip, $idFilemenu)
GUICtrlCreateMenuItem("", $idFilemenu, 2)
Local $idExit = GUICtrlCreateMenuItem($sExit, $idFilemenu)
Local $idEditmenu = GUICtrlCreateMenu($sEdit)
Local $idAddMetadata = GUICtrlCreateMenuItem($sChangeMetadata, $idEditmenu)
Local $idAddPreview = GUICtrlCreateMenuItem($sChangePreview, $idEditmenu)
GUICtrlCreateMenuItem("", $idEditmenu, 2)
Local $idRefresh = GUICtrlCreateMenuItem($sRefresh, $idEditmenu)
Local $idOptionsmenu = GUICtrlCreateMenu($sOptions)
Local $idUpdate = GUICtrlCreateMenuItem($sCheckForUpdates, $idOptionsmenu)
Local $idMetadatamenu = GUICtrlCreateMenuItem($sMetadata, $idOptionsmenu)
Local $idLangmenu = GUICtrlCreateMenu($sLanguage, $idOptionsmenu, 1)
Local $idLangitem1 = GUICtrlCreateMenuItem("English", $idLangmenu)
Local $idLangitem2 = GUICtrlCreateMenuItem("Русский", $idLangmenu)

Local $idAboutmenuM = GUICtrlCreateMenu("?")
Local $idAboutmenu = GUICtrlCreateMenuItem($sAbout, $idAboutmenuM)
;End Menubar



;Eng Languages

#Region Title
$label = GUICtrlCreateLabel($sSelectSkin, 505, 42, 150, 120)
GUICtrlSetFont(-1, 18, $FW_NORMAL, 'Segoe UI')
GUICtrlSetColor(-1, 0x8b8b8b)
$description = GUICtrlCreateLabel('', 505, 122, 220, 45)
GUICtrlSetFont(-1, 9, $FW_NORMAL)
GUICtrlSetColor(-1, 0x8b8b8b)
Local Const $sFont = "Wingdings"
$rating = GUICtrlCreateLabel('', 505, 102, 150, 15)
GUICtrlSetFont(-1, 9, $FW_NORMAL, $GUI_FONTNORMAL, $sFont)
GUICtrlSetColor(-1, 0x8b8b8b)
$verification1 = GUICtrlCreateLabel("", 670, 101, 80, 20)
$verification2 = GUICtrlCreateLabel("", 655, 101, 15, 15)
GUICtrlSetFont(-1, 9, $FW_NORMAL, $GUI_FONTNORMAL, $sFont)
Local $authormainurl = "http://steamcustomizer.com"



$hyperlink1 = _GUICtrlHyperLink_Create($sGetMoreSkins, 295, 250, 150, 20, 0x8b8b8b, 0x551A8B, _
	-1, 'http://steamcustomizer.com/', 'Author: '& 'http://steamcustomizer.com/' & @CRLF & 'http://steamcustomizer.com/', $hGUI) ;Intentionally set as google.com, will change later
$hyperlink2 = _GUICtrlHyperLink_Create('', 565, 101, 50, 20, 0x8b8b8b, 0x551A8B, _
	-1, $authormainurl, 'Visit skin link', $hGUI) ;Intentionally set as google.com, will change later
GUISetBkColor(0xFFFFFF)


Global $sVar = RegRead("HKEY_CURRENT_USER\Software\Valve\Steam", "SteamPath")





$mylist = GUICtrlCreateList("", 0, 0, 140, 286, BitOr($LBS_SORT,$WS_VSCROLL), 0)
GUISetBkColor(0xFFFFFF)




$apply= GUICtrlCreateButton($sApply, 500, 180, 100, 60)
GUICtrlSetFont(-1, 12, $FW_NORMAL, $GUI_FONTNORMAL)

Local $FileList = _FileListToArray($sVar & '\skins', "*.*", 2)

            If @error = 1 Then
								  $MyBox = MsgBox(1, "", $sNoSkinsInstalled)
								  If $MyBox == 1 Then
				  ShellExecute ("http://steamcustomizer.com/")
				  ElseIf $MyBox == 2 Then
				  Exit
				  EndIf

            EndIf
            If @error = 4 Then

				  $MyBox = MsgBox(1, "", $sNoSkinsInstalled)
				  If $MyBox == 1 Then
				  ShellExecute ("http://steamcustomizer.com/")
				  ElseIf $MyBox == 2 Then
				  Exit
				  EndIf
                Exit
            EndIf

            For $i = 1 To $FileList[0]
                GUICtrlSetData($mylist, $FileList[$i])
			 Next


 _GUICtrlListBox_AddString ($mylist, "<default skin>")

$delete= GUICtrlCreateButton($sDelete, 605, 180, 100, 60)
GUICtrlSetFont(-1, 12, $FW_NORMAL, $GUI_FONTNORMAL)



GUICtrlSetState($apply, $GUI_HIDE)
GUICtrlSetState($delete, $GUI_HIDE)

$myimage= GUICtrlCreatePic('blank.jpg', 180, 40, 300, 200)


GUISetState(@SW_SHOW)

While 1
    $msg = GUIGetMsg()
    Switch $msg
Case $idAboutmenu


About()
Case $idAddMetadata


				  $sSel = GUICtrlRead($mylist)
				  FileCopy ("template.ini", $sVar & '/skins/' & $sSel & '/metadata.ini',  $FC_NOOVERWRITE)
				  FileCopy ("blank.jpg", $sVar & '/skins/' & $sSel & '/thumb.jpg',  $FC_NOOVERWRITE)
				  ShellExecute("notepad.exe", $sVar & '/skins/' & $sSel & '/metadata.ini')

 Case $idAddPreview


						 Local Const $sMessage = $sBrowseForJpg
					  ; Display an open dialog to select a list of file(s).
					  Local $sFileOpenDialog = FileOpenDialog($sMessage, @WindowsDir & "\", "JPG Files (*.jpg)", $FD_FILEMUSTEXIST)
					  If @error Then
						  ; Display the error message.
						  ;MsgBox($MB_SYSTEMMODAL, "", $sNoFileSelected)
						  ; Change the working directory (@WorkingDir) back to the location of the script directory as FileOpenDialog sets it to the last accessed folder.
						  FileChangeDir(@ScriptDir)
					  Else
						  ; Change the working directory (@WorkingDir) back to the location of the script directory as FileOpenDialog sets it to the last accessed folder.
						  FileChangeDir(@ScriptDir)
						  ; Replace instances of "|" with @CRLF in the string returned by FileOpenDialog.
						  $sFileOpenDialogPreview = StringReplace($sFileOpenDialog, "|", @CRLF)



				  $sSel = GUICtrlRead($mylist)

						FileCopy ($sFileOpenDialogPreview, $sVar & '/skins/' & $sSel & '/thumb.jpg', $FC_OVERWRITE)
						FileCopy ("template.ini", $sVar & '/skins/' & $sSel & '/metadata.ini',  $FC_NOOVERWRITE)


					 _RestartProgram()

    EndIf




Case $idExportStSkin


	  $sSel = GUICtrlRead($mylist)
Local $iFileExists = FileExists($sVar & '/skins/' & $sSel &  "/skin.stskin")


 If $iFileExists Then




   FileCopy($sVar & '/skins/' & $sSel &  "/skin.stskin", @DesktopDir & '/' & $sSel & '.stskin', $FC_OVERWRITE + $FC_CREATEPATH)


MsgBox($MB_ICONINFORMATION, "", $sStSkinCreatedOnYourDesktop)



Else
MsgBox($MB_ICONERROR, "", $sFileDoesntExist)
    EndIf


;Need to add a way to ensure metadata name is the same as the folder


Case $idExportZip


$sSel = GUICtrlRead($mylist)
_Zip_Create(@DesktopDir & '\' & $sSel & '.zip')
$sItemAddPath = $sVar & '/skins/' & $sSel & ''
$sItemAddPathFixed = StringReplace($sItemAddPath,"/","\")
DirCopy($sVar & '/skins/' & $sSel & '', @ProgramFilesDir & '\Steam Customizer\skin_temp\Skin\', $FC_OVERWRITE)
_Zip_AddItem(@DesktopDir & '\' & $sSel & '.zip', @ProgramFilesDir & '\Steam Customizer\skin_temp\Skin\')
_Zip_AddItem(@DesktopDir & '\' & $sSel & '.zip', $sItemAddPathFixed & '\metadata.ini')
_Zip_AddItem(@DesktopDir & '\' & $sSel & '.zip', $sItemAddPathFixed & '\thumb.jpg')
FileMove(@DesktopDir & '\' & $sSel & '.zip', @DesktopDir & '\' & $sSel & '.zip', $FC_OVERWRITE + $FC_CREATEPATH)
DirRemove(@ProgramFilesDir & '\Steam Customizer\skin_temp\', 1)
MsgBox($MB_ICONINFORMATION, "", $sZipCreatedOnYourDesktop)

;Need to add a way to ensure metadata name is the same as the folder
Case $idExit
Exit

Case $idRefresh
_RestartProgram()

Case $idUpdate
 Update()

Case $idOpen
Local Const $sMessage = $sBrowseForStSkin
    ; Display an open dialog to select a list of file(s).
    Local $sFileOpenDialog = FileOpenDialog($sMessage, @WindowsDir & "\", "Steam Skin Files (*.stskin)", $FD_FILEMUSTEXIST)
    If @error Then
        ; Display the error message.
        ;MsgBox($MB_SYSTEMMODAL, "", $sNoFileSelected)
        ; Change the working directory (@WorkingDir) back to the location of the script directory as FileOpenDialog sets it to the last accessed folder.
        FileChangeDir(@ScriptDir)
    Else
        ; Change the working directory (@WorkingDir) back to the location of the script directory as FileOpenDialog sets it to the last accessed folder.
        FileChangeDir(@ScriptDir)
        ; Replace instances of "|" with @CRLF in the string returned by FileOpenDialog.
        $sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)
        ; Display the list of selected files.
        MsgBox($MB_SYSTEMMODAL, "", $sInstallingThisNow & @CRLF & $sFileOpenDialog)
	    ShellExecute($sFileOpenDialog)
		Exit
    EndIf



Case $idMetadatamenu
   MetaSkins()

Case $idLangitem1

_FileWriteToLine("settings.ini", 1, "English", True)
_RestartProgram()

Case $idLangitem2
_FileWriteToLine("settings.ini", 1, "Russian", True)
_RestartProgram()



	Case $mylist



   GUICtrlSetState($apply, $GUI_SHOW)
   GUICtrlSetState($delete, $GUI_SHOW)
   $sSel2 = GUICtrlRead($mylist)


   If $sSel2 = '<default skin>' Then

$FirstTrim = StringTrimLeft($sDefaultSkin, 1)
$SecondTrim = StringTrimRight($FirstTrim, 1)

	  GUICtrlSetData($label, $SecondTrim)
	  GUICtrlSetData($description, "The good old classic Steam Skin")
	  GUICtrlSetData($rating, "¡¡¡¡¡")
	  GUICtrlDelete($hyperlink2)
	  $sReadBGColor = 0x111114
	  $sReadTextColor = 0x8b8b8b
 GUICtrlSetImage($myimage, @ProgramFilesDir & '\Steam Customizer\default.jpg')
	  GUISetBkColor(0x111114)
	  ;GUICtrlSetBkColor($mylist, 0x111114)
	  ;GUICtrlSetColor($mylist, 0x8b8b8b)

	  GUICtrlSetColor($label, $sReadTextColor)
	  GUICtrlSetColor($description, $sReadTextColor)
	  GUICtrlSetColor($rating, $sReadTextColor)
	  GUICtrlSetColor($hyperlink1, $sReadTextColor)
	  GUICtrlSetColor($hyperlink2, $sReadTextColor)

   Else

	  $sFilePathMetadata = $sVar & '/skins/' & $sSel2 & "/metadata.ini"
	  $sReadThumbnail = IniRead($sFilePathMetadata, "Skin", "Thumbnail", "blank.jpg")
	  $sReadBGColor = IniRead($sFilePathMetadata, "Skin", "AccentColor", "0xFFFFFF")
	  $sReadTextColor = IniRead($sFilePathMetadata, "Skin", "AccentTextColor", "0x000000")
	  $sReadRating = IniRead($sFilePathMetadata, "Skin", "Rating", "¡¡¡¡¡")
	  $sReadAuthor = IniRead($sFilePathMetadata, "Template", "Author", $sUnknown)
	  $sReadAuthorURL = IniRead($sFilePathMetadata, "Template", "AuthorURL", "http://steamcustomizer.com")
	  $sReadSkinURL = IniRead($sFilePathMetadata, "Template", "SkinURL", "http://steamcustomizer.com")
	  $sReadReadDescription = IniRead($sFilePathMetadata, "Template", "Description", $sNoDescription)
	  $sReadVersion = IniRead($sFilePathMetadata, "Template", "Version", "?")


$sReadHash = IniRead($sFilePathMetadata, "SteamSkin", "Hash", "0")
$sReadHashOp1 = (((StringLen($sSel2) * StringLen($sReadAuthor) - 1)^3-371-$sReadAuthor+$sSel2)^2-465-$sReadAuthor)



	  GUICtrlSetData($label, $sSel2)
	  GUICtrlSetData($description, $sReadReadDescription)
	  GUICtrlSetData($rating, $sReadRating)
	  GUICtrlSetData($hyperlink2, $sReadAuthor)
	  GUICtrlSetColor($label, $sReadTextColor)
	  GUICtrlSetColor($description, $sReadTextColor)
	  GUICtrlSetColor($rating, $sReadTextColor)
	  GUICtrlSetColor($hyperlink1, $sReadTextColor)
	  GUICtrlSetColor($hyperlink2, $sReadTextColor)
	  Global $authormainurl = $sReadAuthorURL
	  GUICtrlDelete($hyperlink2)
	  $hyperlink3 = _GUICtrlHyperLink_Create($sReadAuthor, 565, 101, 100, 20, 0x8b8b8b, 0x551A8B, _
		  -1, $authormainurl, 'Visit skin link', $hGUI)
	  GUICtrlSetColor($hyperlink3, $sReadTextColor)


	  If $sReadHash = $sReadHashOp1 Then

  GUICtrlSetData($verification1, "Verified")
  GUICtrlSetColor($verification1, $sReadTextColor)
  GUICtrlSetData($verification2, "þ")
    GUICtrlSetColor($verification2, $sReadTextColor)

	  Else

GUICtrlSetData($verification1, "")
GUICtrlSetData($verification2, "")

	  EndIf


	  If $sReadThumbnail = 'blank.jpg' Then

		 GUICtrlSetImage($myimage, 'blank.jpg')
		 GUISetBkColor(0xFFFFFF)
		; GUICtrlSetBkColor($mylist, 0xFFFFFF)
		; GUICtrlSetColor($mylist, 0x000000)

	  Else

	   GUICtrlSetImage($myimage, $sVar & '/skins/' & $sSel2 & "/" & $sReadThumbnail)
	  GUISetBkColor($sReadBGColor)
	  ;GUICtrlSetBkColor($mylist, $sReadBGColor)
	 ; GUICtrlSetColor($mylist, $sReadTextColor)


	  EndIf
   EndIf



   Case $apply

	  $sSel = GUICtrlRead($mylist)
	  MsgBox(0, $sApplied, $sSkinApplied)
	  RegWrite("HKEY_CURRENT_USER\Software\Valve\Steam", "SkinV4", "REG_SZ", $sSel)
	  ProcessClose("Steam.exe")
	  Sleep(1000)
	  Run($sVar & "/Steam.exe")



   Case $delete

		 $CurrentSkin = RegRead("HKEY_CURRENT_USER\Software\Valve\Steam", "SkinV4")
		 $sSel = GUICtrlRead($mylist)

	  If $sSel = '<default skin>' Then
		 MsgBox(0, $sWarning, $sCantDelete)

		 ElseIf $sSel = $CurrentSkin Then


		 $t = MsgBox (4, $sWarning ,$sSkinUsingConfirm)
		 If $t = 6 Then
		 $z = _GUICtrlListBox_GetCurSel ($mylist)
	    _GUICtrlListBox_DeleteString ($mylist, $z)
	    MsgBox(0, $sDeleted, $sDeletedUsing)
	    DirRemove($sVar & '/skins/' & $sSel & '/', 1)
		RegWrite("HKEY_CURRENT_USER\Software\Valve\Steam", "SkinV4", "REG_SZ", "")
	    ProcessClose("Steam.exe")
        Sleep(1000)
	    Run($sVar & "/Steam.exe")

		 ElseIf $t = 7 Then

	  EndIf



	  ElseIf $sSel = '' Then
		 MsgBox(0, $sWarning, $sNothingSelected)
	  Else

	  $t = MsgBox (4, $sWarning ,$sDeleteAreYouSure)
	  If $t = 6 Then
	  $z = _GUICtrlListBox_GetCurSel ($mylist)
      _GUICtrlListBox_DeleteString ($mylist, $z)
	  MsgBox(0, $sDeleted, $sSkinDeleted)
	  DirRemove($sVar & '/skins/' & $sSel & '/', 1)

	  ElseIf $t = 7 Then

EndIf



EndIf
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
 WEnd

EndFunc   ;==>MyTestFunc


#Region --- Restart Program ---
    Func _RestartProgram(); Thanks UP_NORTH
        If @Compiled = 1 Then
            Run(FileGetShortName(@ScriptFullPath))
        Else
            Run(FileGetShortName(@AutoItExe) & " " & FileGetShortName(@ScriptFullPath))
        EndIf
        Exit
    EndFunc; ==> _RestartProgram
#EndRegion --- Restart Program ---



Func Update()

Global $GetVersion = InetGet("https://raw.githubusercontent.com/SteamCustomizer/Manager/master/update/up.dt", @TempDir & "\version.dt", 1, 1)
Do
Until InetGetInfo($GetVersion, 2)
InetClose($GetVersion)
Global $CurrentVersion = 1.0

Global $LatestVersion = IniRead(@TempDir & "\version.dt", "STSkinUpdates", "AppVersion", $CurrentVersion)
Global $DownloadLink = IniRead(@TempDir & "\version.dt", "STSkinUpdates", "AppDownloadURL", "")
Global $DownloadLinkAux = IniRead(@TempDir & "\version.dt", "STSkinUpdates", "AppDownloadAUX", "")
Global $ForceUpdate = IniRead(@TempDir & "\version.dt", "STSkinUpdates", "ForceUpdate", "0")
Global $SideNote = IniRead(@TempDir & "\version.dt", "STSkinUpdates", "SideNote", "")

FileDelete(@TempDir & "\version.dt")


If $LatestVersion > $CurrentVersion And $ForceUpdate = 0 Then

    $User = MsgBox(36, $sUpdates, $LatestVersion & " " & $sVersionIsReleased & @CRLF & $SideNote)
    If $User = 6 Then


DownloadIt()

	EndIf


ElseIf $LatestVersion > $CurrentVersion And $ForceUpdate = 1 Then

Dim $iMsgBoxAnswer
$iMsgBoxAnswer = MsgBox(49,"Critical Update Required","You must update this app to continue using it")
Select
Case $iMsgBoxAnswer = 1 ;OK
   DownloadIt()
Exit
   Case $iMsgBoxAnswer = 2 ;Cancel
Exit
EndSelect


Else

;No updates found

sleep(10)

EndIf

EndFunc


Func DownloadIt()

Global $UpdateGUI = GUICreate("Update", 300, 100)
$label = GUICtrlCreateLabel("Downloading Update...", 20, 20, 150, 25)
$Progress = GUICtrlCreateProgress(20, 50, 260, 25, 0x08, 0x2000)
GUICtrlSendMsg($Progress, 0x040A, 1, 10)
GUISetState()

AdlibRegister("Reverse_Dir", 1350)
AdlibRegister("CheckTime", 1000) ;Check every second
Global $Timer = TimerInit()
Global $MaxTime = 45 * 1000 ;10 Seconds

Local $GetUpdate = InetGet($DownloadLink, @TempDir & "\setup.exe", 1, 1)

Do
Until InetGetInfo($GetUpdate, 2)

  Local $iFileExists = FileExists(@TempDir & "\setup.exe")
  If $iFileExists Then
		ShellExecute(@TempDir & "\setup.exe")
		Exit
    Else
		ShellExecute($DownloadLinkAux)
		Exit
    EndIf
EndFunc ;==>DownloadIt


Func CheckTime()
     If TimerDiff($Timer) >= $MaxTime Then
		   ShellExecute($DownloadLinkAux)
		   Exit
     Else
          ConsoleWrite("Not Yet..." & @CRLF)
     EndIf
  EndFunc ;==>CheckTime




Func MetaSkins()
Msgbox(-1, $sMetadata,$sMetadataAdded)
$listOfSkins = _FileListToArray($sVar & '\skins', "*.*", 2)
_FileCreate("List.txt")
_FileWriteFromArray("List.txt", $listOfSkins)
Local $FileListSkins = _FileListToArray($sVar & '\skins', "*.*", 2)
            If @error = 1 Then
                MsgBox(0, "", $sNoSkinsInstalled)
            EndIf
            If @error = 4 Then
                MsgBox(0, "", $sNoSkinsInstalled)
                Exit
            EndIf
            For $i = 1 To $FileListSkins[0]
			If StringInStr($FileListSkins[$i], "WP7") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\WP7\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
		    ElseIf StringInStr($FileListSkins[$i], "Metro") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\MetroForSteam\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
			ElseIf StringInStr($FileListSkins[$i], "Air-For-Steam") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\AirForSteam\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
			ElseIf StringInStr($FileListSkins[$i], "Blue Pulse") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\BluePulse\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
			ElseIf StringInStr($FileListSkins[$i], "Compact") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\Compact\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
			ElseIf StringInStr($FileListSkins[$i], "Air-Classic") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\AirClassic\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
			ElseIf StringInStr($FileListSkins[$i], "Savvy") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\Savvy\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
			ElseIf StringInStr($FileListSkins[$i], "Minimal Steam") > 0 Then
			DirCopy(@ProgramFilesDir & '\Steam Customizer\extra\MinimalSteam\', $sVar & '\skins\' & $FileListSkins[$i] & '\', $FC_OVERWRITE)
Else
EndIf
Next
EndFunc


Func About()


$AboutWindow = GUICreate("About", 450, 385) ; will create a dialog box that when displayed is centered
GUISetBkColor(0x146495)

GUICtrlCreatePic('about.jpg', 0, 0, 0, 0)
GUICtrlSetState(Default, $GUI_DISABLE)



Local $sFont = "Courier New"
Local $sFont2 = "Segoe UI"
Local $iOldOpt = Opt("GUICoordMode", 2)
Local $iWidthCell = 420
GUICtrlSetDefBkColor($GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetDefColor(0xFFFFFF)
GUISetFont(9,  $FW_NORMAL, $GUI_FONTNORMAL, $sFont)
GUICtrlCreateLabel("    _                ___       _.--.      ", 10, 30, $iWidthCell) ; first cell 70 width
GUICtrlCreateLabel("    \`.|\..----...-'`   `-._.-'_.-'`    ", -1, -8) ; next line
GUICtrlCreateLabel("    /  ' `         ,       __.--'     ", -1, -8) ; next line
GUICtrlCreateLabel("    )/' _/     \   `-_,   /        WE'VE MADE MAJOR STRIDES", -1, -8) ; next line
GUICtrlCreateLabel("    `-'' `'\_  ,_.-;_.-\_ ',         ", -1, -8) ; next line
GUICtrlCreateLabel("        _.-'_./   {_.'   ; /   SINCE THEN. MAJOR STRIDES", -1, -8) ; next line
GUICtrlCreateLabel("       {_.-``-'         {_/   ", -1, -8) ; next line
GUISetFont(14,  $FW_BOLD, $GUI_FONTNORMAL, $sFont2)
GUICtrlCreateLabel("Created by fediaFedia and Lexizueel", -350, 20) ; next line
GUICtrlCreateLabel("___________________________________________", -1, 0) ; next line
GUISetFont(10,  $FW_NORMAL, $GUI_FONTNORMAL, $sFont2)
GUICtrlCreateLabel("                      You are Beta Tester #65123", -450, 20) ; next line
GUICtrlCreateLabel("                          You are doing very well", -1, -5) ; next line
GUICtrlCreateLabel("                 In fact, you're easily in the top 70.000", -1, -5) ; next line
GUICtrlCreateLabel("             I wouldn't go as far as top 65.122 though", -1, -5) ; next line
GUISetState(@SW_SHOW) ; will display an empty dialog box

Local $idHomepage = GUICtrlCreateButton("Homepage", -340, 20, 85, 25)
     GUICtrlSetColor(-1,0x000000)

Local $idEmail = GUICtrlCreateButton("Email us", 10, -1, 85, 25)
     GUICtrlSetColor(-1,0x000000)
    $iOldOpt = Opt("GUICoordMode", $iOldOpt)

While 1
        Switch GUIGetMsg()
            Case $idHomepage
                ; Run Notepad with the window maximized.
                ShellExecute("http://steamcustomizer.com/")
            Case $idEmail
                ; Run Notepad with the window maximized.
                ShellExecute("mailto:info@steamcustomizer.com")
Case $GUI_EVENT_CLOSE
			     GUIDelete($AboutWindow)
				 GUISetState(@SW_ENABLE, $hGUI)
				 Exit
				 ;Kinda wish we could close the about dialog without breaking the app
GUISetState(@SW_SHOW, $hGUI)

        EndSwitch
    WEnd
EndFunc




Func ExitStuff()

DirRemove(@ProgramFilesDir & '\Steam Customizer\skin_temp\', 1)
FileDelete (@TempDir & "\setup.exe")
EndFunc
