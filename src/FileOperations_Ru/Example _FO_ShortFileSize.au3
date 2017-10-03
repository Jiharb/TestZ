; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <FileOperations.au3>

$sRes = _FO_ShortFileSize(475) & @LF
$sRes &= _FO_ShortFileSize(2345) & @LF
$sRes &= _FO_ShortFileSize(10457) & @LF
$sRes &= _FO_ShortFileSize(334987) & @LF
$sRes &= _FO_ShortFileSize(4958283) & @LF
$sRes &= _FO_ShortFileSize(67856785) & @LF
$sRes &= _FO_ShortFileSize(5668769783) & @LF
$sRes &= _FO_ShortFileSize(65786786443) & @LF
$sRes &= _FO_ShortFileSize(876463256876) & @LF
MsgBox(0, 'Сообщение', $sRes)