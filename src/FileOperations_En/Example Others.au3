#include <Array.au3> ; for _ArrayDisplay
#include <FileOperations.au3>

; Folders + Files
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$List = _FO_FolderSearch(@WindowsDir & '\Web', '*', True, 0, 0, 0) & @CRLF & _FO_FileSearch(@WindowsDir & '\Web', '*', True, 0, 0, 0)
MsgBox(0, 'folders and files', $List)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!

; _FO_CorrectMask and Error
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$timer = TimerInit()
$FolderList = _FO_FileSearch(@SystemDir, _FO_CorrectMask('|*.log|*.txt   ..|*.avi..  |||*.log|*.bmp|*.log'))
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FolderList, $timer & ' - все папки')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
$FolderList = _FO_FileSearch(@SystemDir, _FO_CorrectMask('||||'))
If @error Then MsgBox(0, 'Сообщение', '@error=' & @error)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!

MsgBox(0, '|*.log|*.txt   ..|*.avi..  |||*.log|*.bmp|*.log', _FO_CorrectMask('|*.log|*.txt   ..|*.avi..  |||*.log|*.bmp|*.log'))
MsgBox(0, '*.avi..  |*|*.log', _FO_CorrectMask('*.avi..  |*|*.log'))

$e = _FO_CorrectMask('|..|  ..  | |')
If @error Then MsgBox(0, '|..|  ..  | |', $e & ' - @error=' & @error)