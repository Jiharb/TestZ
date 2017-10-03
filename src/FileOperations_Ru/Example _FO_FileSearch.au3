; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <Array.au3> ; для _ArrayDisplay
#include <FileOperations.au3>

; Файлы
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; все файлы папки WINDOWS в виде массива
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FileList, $timer & ' - все файлы')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; только файлы exe и dll папки WINDOWS в виде списка
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'exe|dll', True, 0, 1, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
MsgBox(0, $timer & ' - exe;dll', $FileList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; все файлы, кроме exe и dll папки WINDOWS в виде списка с относительными путями
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'exe|dll', False, 0, 0, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
MsgBox(0, $timer & ' - кроме exe|dll, относит. пути', $FileList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; все файлы, кроме exe и dll папки WINDOWS в виде списка с именами файлов без расширения
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'exe|dll', False, 0, 3, 0, 0)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
MsgBox(0, $timer & ' - кроме exe|dll, имя без расширения', $FileList)
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; только файлы tmp и bak и gid папки WINDOWS в виде массива с относительными путями, массив без указания количества файлов
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'tmp|bak|gid', True, 125, 0, 2)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FileList, $timer & ' - tmp|bak|gid, относит. пути, первый эл. файл')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; только файлы tmp и bak и gid папки WINDOWS в виде массива с именами файлов c расширения
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'tmp|bak|gid', True, 125, 2)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FileList, $timer & ' - tmp|bak|gid, имена с расширением')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; Недопустимый символ в пути
$FileList = _FO_FileSearch('C:\WIN>DOWS', '*')
If @error Then
	MsgBox(0, 'Ошибка', 'Код ошибки: ' & @error)
	; Exit
EndIf
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; только файлы по маске *.is?|s*.cp* папки WINDOWS в виде массива
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, '*.is?|s*.cp*')
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FileList, $timer & ' - *.is?|s*.cp*')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; только файлы по маске shell*.*;config.* папки WINDOWS в виде массива
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, 'shell*.*|config.*')
$timer = Round(TimerDiff($timer) / 1000, 2) & ' сек'
_ArrayDisplay($FileList, $timer & ' - shell*.*|config.*')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!
; только файлы exe и dll папки WINDOWS в массив с помощью регулярного выражения
$timer = TimerInit()
$FileList = _FO_FileSearch(@WindowsDir, '*', True, 125, 1, 0)
$FileList = StringRegExp($FileList, '(?mi)^(.*\.(?:exe|dll))(?:\r|\z)', 3)
$timer = Round(TimerDiff($timer) / 1000, 2) & ' sec'
_ArrayDisplay($FileList, UBound($FileList) & ' - ' & $timer & ' - RegExp (Конец)')
; i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!i!