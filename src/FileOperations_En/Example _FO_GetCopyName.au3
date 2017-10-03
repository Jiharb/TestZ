; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <FileOperations.au3>

ShellExecute(@HomeDrive)
Sleep(400)
$iMode = 0
For $i = 1 To 6
	If $i > 3 Then $iMode = 1
	$sPath = _FO_GetCopyName(@HomeDrive & '\z_new_file.txt', $iMode)
	FileWrite($sPath, '1')
Next