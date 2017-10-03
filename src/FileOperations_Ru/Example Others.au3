; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <Array.au3> ; для _ArrayDisplay
#include <FileOperations.au3>

; Папки и файлы
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; папки и файлы в корне каталога WINDOWS, вывод в виде сообщения
; $timer = TimerInit()
$List = _FO_FolderSearch(@WindowsDir & '\Web', '*', True, 0, 0, 0) & @CRLF & _FO_FileSearch(@WindowsDir & '\Web', '*', True, 0, 0, 0)
; $timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
MsgBox(0, 'папки и файлы', $List)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!

; Обработка ошибок
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; все папки в папке WINDOWS в виде массива
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