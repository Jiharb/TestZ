; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <Array.au3> ; for _ArrayDisplay
#include <FileOperations.au3>

; Files
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FileList, $timer & ' - All Files')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'exe|dll', True, 0, 1, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
MsgBox(0, $timer & ' - exe|dll', $FileList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'exe|dll', False, 0, 0, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
MsgBox(0, $timer & ' - except exe|dll, relative paths', $FileList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'exe|dll', False, 0, 3, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
MsgBox(0, $timer & ' - except exe|dll, name without extension', $FileList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'tmp|bak|gid', True, 125, 0, 2)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FileList, $timer & ' - tmp|bak|gid, relative paths, $FileList[0]=file')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'tmp|bak|gid', True, 125, 2, 1, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FileList, $timer & ' - tmp|bak|gid')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$FileList = _FO_FileSearch('C:\WIN>DOWS', '*')
If @error Then MsgBox(0, 'Error', '@error =: ' & @error)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, '*.is?|s*.cp*')
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FileList, $timer & ' - *.is?|s*.cp*')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'shell*.*|config.*')
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FileList, $timer & ' - shell*.*|config.*')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, '*', True, 125, 1, 0)
$FileList = StringRegExp($FileList, '(?mi)^(.*\.(?:exe|dll))(?:\r|\z)', 3)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FileList, UBound($FileList) & ' - ' & $timer & ' - RegExp (End)')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!