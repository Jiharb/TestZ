; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <FileOperations.au3>
Exit
$bSuccess = _FO_CreateFile('C:\temp\file.tmp', 'строка', 0)
MsgBox(0, 'Успешно?', $bSuccess)
DirRemove('C:\temp', 1)