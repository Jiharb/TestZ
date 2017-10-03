#include <File.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <FileOperations.au3>

$aFiles = _FileListToArray(@SystemDir, "*.*", 1)

GUICreate("Размер файлов")
$ListView = GUICtrlCreateListView("Файл|Размер", 5, 5, 385, 390, -1, $LVS_EX_FULLROWSELECT)
_GUICtrlListView_SetColumnWidth($ListView, 0, 280)
_GUICtrlListView_SetColumnWidth($ListView, 1, 70)
GUISetState()

For $i = 1 To $aFiles[0]
	GUICtrlCreateListViewItem($aFiles[$i] & "|" & _FO_ShortFileSize(FileGetSize(@SystemDir & '\' & $aFiles[$i])), $ListView)
Next

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE