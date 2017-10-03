; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <Array.au3> ; for _ArrayDisplay
#include <FileOperations.au3>

; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FolderList = _FO_SearchEmptyFolders(@UserProfileDir, 0, 0)
MsgBox(0, 'Время : ' & Round(TimerDiff($timer) / 1000, 2) & ' сек', $FolderList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FolderList = _FO_SearchEmptyFolders(@WindowsDir)
_ArrayDisplay($FolderList, 'Время : ' & Round(TimerDiff($timer) / 1000, 2) & ' сек')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!