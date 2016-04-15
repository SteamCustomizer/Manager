#include <Constants.au3>
#include "ProcessGetExitcode.au3"

Global $SC_COMPILER_PATH = "bin\compiler.exe"
Global $SC_STEAM_HKEY_PATH = "HKEY_CURRENT_USER\Software\Valve\Steam"
;Global $iExitCode

Func SteamCustomizer_Compile($sSkinFile, $sSteamPath = Null, $sBasePath = Null, $bNoBackup = False, $bActivate = True, $bRestart = False)
	If Not $sSteamPath Then $sSteamPath = RegRead($SC_STEAM_HKEY_PATH, "SteamPath")
	$sLaunchCmd = $SC_COMPILER_PATH & ' --file "' & $sSkinFile & '" --steam "' & $sSteamPath & '"' & ($sBasePath = Null ? '' : ' --base "' & $sBasePath & '"') & ($bNoBackup = True ? ' --nobackup' : '') & ($bActivate = True ? ' --activate' : '');
	$iPid = Run($sLaunchCmd, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	$hHandle = _ProcessOpenHandle($iPid)
	
	$stdout = ""
	Do
		Sleep(10)
		$stdout &= StdOutRead($iPid)
	Until @error
	
	ProcessWaitClose($iPid)
	
	$iExitCode = _ProcessGetExitCode($hHandle)
	_ProcessCloseHandle($hHandle)

	;MsgBox(0x40000, @ScriptName, _
    ;'$exitcode: ' & $iExitCode & @CRLF & _
    ;'$stdout: ' & $stdout _
	;)

	;Return False
	
	$sActiveSkinName = FileReadLine($sSteamPath & "/skins/.active");
	If StringLen($sActiveSkinName) Then
		SteamCustomizer_Steam_SetSkin($sActiveSkinName)
		If $bRestart Then
			SteamCustomizer_Steam_Restart()
		EndIf
	EndIf
	Return $iExitCode == 0 ? True : False
EndFunc

Func SteamCustomizer_Steam_Launch()
	$sSteamExe = SteamCustomizer_Steam_GetProperty("SteamExe")
	If StringLen($sSteamExe) Then
		ShellExecute($sSteamExe)
	EndIf
EndFunc

Func SteamCustomizer_Steam_Close()
	$iSteamPID = SteamCustomizer_Steam_GetPID()
	If $iSteamPID Then
		ProcessClose($iSteamPID)
	EndIf
EndFunc

Func SteamCustomizer_Steam_Restart($iDelay = 2500)
	SteamCustomizer_Steam_Close()
	Sleep($iDelay)
	SteamCustomizer_Steam_Launch()
EndFunc

Func SteamCustomizer_Steam_SetSkin($sSkinName = Null)
	RegWrite($SC_STEAM_HKEY_PATH, "SkinV4", "REG_SZ", $sSkinName)
EndFunc

Func SteamCustomizer_Steam_GetSkin()
	Return SteamCustomizer_Steam_GetProperty("SkinV4")
EndFunc

Func SteamCustomizer_Steam_GetPID()
	Return ProcessExists("steam.exe")
EndFunc

Func SteamCustomizer_Steam_GetProperty($sPropertyName)
	Return RegRead($SC_STEAM_HKEY_PATH, $sPropertyName)
EndFunc