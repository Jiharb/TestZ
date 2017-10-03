; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <FileOperations.au3>

ShellExecute(@HomeDrive) ; открываем диск для просмотра создания новых файлов
Sleep(400)
$iMode = 0
For $i = 1 To 6
	If $i > 3 Then $iMode = 1
	; создаёт на диске 6 копий файлов. По 3 копии используя два режима
	$sPath = _FO_GetCopyName(@HomeDrive & '\я_новый файл.txt', $iMode)
	FileWrite($sPath, '1') ; создаём файл
Next