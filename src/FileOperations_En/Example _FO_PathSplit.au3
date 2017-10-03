; AZJIO
; http://www.autoitscript.com/forum/topic/133224-filesearch-foldersearch/
#include <Array.au3> ; для _ArrayDisplay
#include <FileOperations.au3>

$aPath = _FO_PathSplit('C:\Program Files\AutoIt3\AutoIt3.exe')
_ArrayDisplay($aPath, '$aPath')

$aPath = _FO_PathSplit('C:\Program Files\AutoIt3')
_ArrayDisplay($aPath, '$aPath')

$aPath = _FO_PathSplit('Program Files\AutoIt3\AutoIt3.exe')
_ArrayDisplay($aPath, '$aPath')

$aPath = _FO_PathSplit('AutoIt3.exe')
_ArrayDisplay($aPath, '$aPath')