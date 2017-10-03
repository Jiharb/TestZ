; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <Array.au3> ; для _ArrayDisplay
#include <FileOperations.au3>

; Папки
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; все папки в папке WINDOWS в виде массива
$timer = TimerInit()
$FolderList = _FO_FolderSearch(@SystemDir, '', True, 125)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FolderList, $timer & ' - все папки')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; все папки в папке WINDOWS в виде массива, относительные пути, уровень 1
$timer = TimerInit()
$FolderList = _FO_FolderSearch(@SystemDir, '*', True, 1, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FolderList, $timer & ' - все папки')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; корневые папки в папке WINDOWS в виде сообщения
$timer = TimerInit()
$FolderList = _FO_FolderSearch(@UserProfileDir, '*', True, 0, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
MsgBox(0, $timer & ' - относительные пути', $FolderList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!