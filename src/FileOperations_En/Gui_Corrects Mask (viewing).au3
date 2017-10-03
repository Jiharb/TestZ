#include <FileOperations.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

; En
$LngTitle = 'Corrects Mask (If ''|'' Then @error=2)'
$LngCol1 = 'not correct'
$LngCol2 = 'after _FO_CorrectMask'

; Ru
; если русская локализация, то русский язык
If @OSLang = 0419 Then
	$LngTitle = 'Коррекция маски (Если ''|'', то @error=2)'
	$LngCol1 = 'not correct'
	$LngCol2 = 'after _FO_CorrectMask'
EndIf

$sep = Chr(1)
Opt("GUIDataSeparatorChar", $sep)

$aMask = StringSplit( _
		'|*.log|*.txt   ..|*.avi..  |||*.log|***.bmp|*.log}' & _
		'|log|txt   ..|avi..  |||log|bmp|log}' & _
		'|| .||. ||  ..  ..||}' & _
		'||||||||}' & _
		'|*.log|*.txt   ..|*.avi..  |||*.log|*.bmp|*.log}' & _
		'*|*|*|*|}' & _
		'*.avi..  |*|*.log}' _
		, '}')

GUICreate($LngTitle, 670, 400)
$ListView = GUICtrlCreateListView($LngCol1 & $sep & $LngCol2, 5, 5, 660, 390, -1, $LVS_EX_FULLROWSELECT+$WS_EX_CLIENTEDGE+$LVS_EX_GRIDLINES)
_GUICtrlListView_SetColumnWidth($ListView, 0, 330)
_GUICtrlListView_SetColumnWidth($ListView, 1, -1)
_GUICtrlListView_SetColumnWidth($ListView, 1, -2)
GUISetState()

For $i = 1 To $aMask[0]
	GUICtrlCreateListViewItem($aMask[$i] & $sep & _FO_CorrectMask($aMask[$i]), $ListView)
	If Mod($i, 2) Then GUICtrlSetBkColor(-1, 0xF0F0F0) ; 0xFFFFAA
Next

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE