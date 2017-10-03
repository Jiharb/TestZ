; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <Array.au3> ; for _ArrayDisplay
#include <FileOperations.au3>

; Folders
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FolderList = _FO_FolderSearch(@SystemDir, '', True, 125)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FolderList, $timer & ' - All folder')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FolderList = _FO_FolderSearch(@SystemDir, '*', True, 1, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FolderList, $timer & ' - folder')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FolderList = _FO_FolderSearch(@UserProfileDir, '*', True, 0, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
MsgBox(0, $timer & ' - relative paths', $FolderList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!