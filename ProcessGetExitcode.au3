#include-once
; #FUNCTION# ====================================================================================================================
; Name...........: _ProcessOpenHandle
; Description ...: Get the process handle of a process to query
; Syntax.........: _ProcessOpenHandle($iPID)
; Parameters ....: $iPID - Process ID to get handle of to query
; Return values .: Success - Handle of the process
;                  Failure - 0
; Author ........: Michael Heath (MHz)
; Modified.......: 2013-06-21 Changes made to make more compatible with _WinAPI* functions
; Remarks .......: Uses PROCESS_QUERY_INFORMATION to call the Dll function OpenProcess. Use _WinAPI_OpenProcess for advanced use.
; Related .......: _ProcessCloseHandle, _ProcessGetExitcode
; Link ..........: 
; Example .......: Yes
; ===============================================================================================================================
Func _ProcessOpenHandle($iPID)
	; Get the process handle of the process to query\n Return: Success Handle as array. Failure 0
	Local Const $PROCESS_QUERY_INFORMATION = 0x400
	Local $hPID = DllCall('kernel32.dll', 'ptr', 'OpenProcess', 'int', $PROCESS_QUERY_INFORMATION, 'int', 0, 'int', $iPID)
	If @error Then Return SetError(@error, @extended, 0)
	Return $hPID[0]
EndFunc
; #FUNCTION# ====================================================================================================================
; Name...........: _ProcessGetExitcode
; Description ...: Get exitcode of a process
; Syntax.........: _ProcessGetExitcode($hPID)
; Parameters ....: $hPID - Handle returned from _ProcessOpenHandle or handle returned from _WinAPI_OpenProcess
; Return values .: Success - Exitcode of the closed process
;                  Failure - 0
; Author ........: Michael Heath (MHz)
; Modified.......: 2013-06-21 Changes made to make more compatible with _WinAPI* functions
; Remarks .......: Require process to be closed before calling this function
; Related .......: _ProcessOpenHandle, _ProcessCloseHandle
; Link ..........: 
; Example .......: Yes
; ===============================================================================================================================
Func _ProcessGetExitcode($hPID)
	; Get exitcode of the closed process\n Return: Success Exitcode as integer. Failure 0
	Local $vPlaceholder
	$hPID = DllCall('kernel32.dll', 'ptr', 'GetExitCodeProcess', 'ptr', $hPID, 'int*', $vPlaceholder)
	If @error Then Return SetError(@error, @extended, 0)
	Return $hPID[2]
EndFunc
; #FUNCTION# ====================================================================================================================
; Name...........: _ProcessCloseHandle
; Description ...: Close the handle of a process
; Syntax.........: _ProcessCloseHandle($hPID)
; Parameters ....: $hPID - Handle returned from _ProcessOpenHandle or handle returned from _WinAPI_OpenProcess
; Return values .: Success - 1
;                  Failure - 0
; Author ........: Michael Heath (MHz)
; Modified.......: 2013-06-21 Changes made to make more compatible with _WinAPI* functions
; Remarks .......: Use _WinAPI_CloseHandle for advanced use with @error 
; Related .......: _ProcessOpenHandle, _ProcessGetExitcode
; Link ..........: 
; Example .......: Yes
; ===============================================================================================================================
Func _ProcessCloseHandle($hPID)
	; Close the handle of a process\n Return: Success 1. Failure 0
	DllCall('kernel32.dll', 'ptr', 'CloseHandle', 'ptr', $hPID)
	If @error Then Return SetError(@error, @extended, 0)
	Return 1
EndFunc
