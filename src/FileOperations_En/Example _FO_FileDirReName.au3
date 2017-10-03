; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <FileOperations.au3>

_FO_FileDirReName('C:\file.txt', 'fileNewName.txt')
MsgBox(0, 'Message', '@error = ' & @error)