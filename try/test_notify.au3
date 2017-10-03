#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_LV = False ; Проверяет ClassName передаваемый в ListView функции. Установите True и используйте дескриптор от другого элемента, чтобы увидеть как это работает

Global $hListView

_Main()

Func _Main()

    Local $GUI, $hImage
    $GUI = GUICreate("Создание ListView", 400, 300)

    $hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 394, 268)
    _GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))
    GUISetState()

    GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

    ; Загружает изображения
    $hImage = _GUIImageList_Create()
    _GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
    _GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
    _GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
    _GUICtrlListView_SetImageList($hListView, $hImage, 1)

    ; Добавляет колонки
    _GUICtrlListView_InsertColumn($hListView, 0, "Колонка 1", 100)
    _GUICtrlListView_InsertColumn($hListView, 1, "Колонка 2", 100)
    _GUICtrlListView_InsertColumn($hListView, 2, "Колонка 3", 100)

    ; Добавляет пункты
    _GUICtrlListView_AddItem($hListView, "Стр 1: Кол 1", 0)
    _GUICtrlListView_AddSubItem($hListView, 0, "Стр 1: Кол 2", 1)
    _GUICtrlListView_AddSubItem($hListView, 0, "Стр 1: Кол 3", 2)
    _GUICtrlListView_AddItem($hListView, "Стр 2: Кол 1", 1)
    _GUICtrlListView_AddSubItem($hListView, 1, "Стр 2: Кол 2", 1)
    _GUICtrlListView_AddItem($hListView, "Стр 3: Кол 1", 2)

    ; Цикл выполняется, пока окно не будет закрыто
    Do
    Until GUIGetMsg() = $GUI_EVENT_CLOSE
    GUIDelete()
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
    #forceref $hWnd, $iMsg, $iwParam
    Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
;~  Local $tBuffer
    $hWndListView = $hListView
    If Not IsHWnd($hListView) Then $hWndListView = GUICtrlGetHandle($hListView)

    $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
    $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
    $iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
    $iCode = DllStructGetData($tNMHDR, "Code")
    Switch $hWndFrom
        Case $hWndListView
            Switch $iCode
;~              Case $LVN_BEGINDRAG ; A drag-and-drop operation involving the left mouse button is being initiated
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_BEGINDRAG" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_BEGINLABELEDIT ; Start of label editing for an item
;~                  $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam)
;~                  _DebugPrint("$LVN_BEGINLABELEDIT" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->State:" & @TAB & DllStructGetData($tInfo, "State") & @LF & _
;~                          "-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF & _
;~                          "-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF & _
;~                          "-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF & _
;~                          "-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF & _
;~                          "-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF & _
;~                          "-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~                  Return False ; Allow the user to edit the label
;~                  ;Return True  ; Prevent the user from editing the label
;~              Case $LVN_BEGINRDRAG ; A drag-and-drop operation involving the right mouse button is being initiated
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_BEGINRDRAG" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_BEGINSCROLL ; A scrolling operation starts, Minium OS WinXP
;~                  $tInfo = DllStructCreate($tagNMLVSCROLL, $ilParam)
;~                  _DebugPrint("$LVN_BEGINSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->DX:" & @TAB & DllStructGetData($tInfo, "DX") & @LF & _
;~                          "-->DY:" & @TAB & DllStructGetData($tInfo, "DY"))
;~                  ; Нет возвращаемых значений
                Case $LVN_COLUMNCLICK ; Клик на заголовке колонки
                    $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
                    _DebugPrint("$LVN_COLUMNCLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode & @LF & _
                            "-->Item:" & @tab & DllStructGetData($tInfo, "Item") & @LF & _
                            "-->SubItem:" & @tab & DllStructGetData($tInfo, "SubItem") & @LF & _
                            "-->NewState:" & @tab & DllStructGetData($tInfo, "NewState") & @LF & _
                            "-->OldState:" & @tab & DllStructGetData($tInfo, "OldState") & @LF & _
                            "-->Changed:" & @tab & DllStructGetData($tInfo, "Changed") & @LF & _
                            "-->ActionX:" & @tab & DllStructGetData($tInfo, "ActionX") & @LF & _
                            "-->ActionY:" & @tab & DllStructGetData($tInfo, "ActionY") & @LF & _
                            "-->Param:" & @tab & DllStructGetData($tInfo, "Param"))
                    ; Нет возвращаемых значений
;~              Case $LVN_DELETEALLITEMS ; Все пункты собираются быть удалены
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_DELETEALLITEMS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  Return True ; To suppress subsequent $LVN_DELETEITEM messages
;~                  ;Return False ; To receive subsequent $LVN_DELETEITEM messages
;~              Case $LVN_DELETEITEM ; Пункт собирается быть удален
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_DELETEITEM" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_ENDLABELEDIT ; The end of label editing for an item
;~                  $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam)
;~                  $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~                  _DebugPrint("$LVN_ENDLABELEDIT" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->State:" & @TAB & DllStructGetData($tInfo, "State") & @LF & _
;~                          "-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF & _
;~                          "-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF & _
;~                          "-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF & _
;~                          "-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF & _
;~                          "-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF & _
;~                          "-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF & _
;~                          "-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF & _
;~                          "-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~                  ; If Text is not empty, return True to set the item's label to the edited text, return false to reject it
;~                  ; If Text is empty the return value is ignored
;~                  Return True
;~              Case $LVN_ENDSCROLL ; Прокрутка завершена, Минимальная OS WinXP
;~                  $tInfo = DllStructCreate($tagNMLVSCROLL, $ilParam)
;~                  _DebugPrint("$LVN_ENDSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->DX:" & @TAB & DllStructGetData($tInfo, "DX") & @LF & _
;~                          "-->DY:" & @TAB & DllStructGetData($tInfo, "DY"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_GETDISPINFO ; Provide information needed to display or sort a list-view item
;~                  $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam)
;~                  $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~                  _DebugPrint("$LVN_GETDISPINFO" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->State:" & @TAB & DllStructGetData($tInfo, "State") & @LF & _
;~                          "-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF & _
;~                          "-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF & _
;~                          "-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF & _
;~                          "-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF & _
;~                          "-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF & _
;~                          "-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF & _
;~                          "-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF & _
;~                          "-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_GETINFOTIP ; Sent by a large icon view list-view control that has the $LVS_EX_INFOTIP extended style
;~                  $tInfo = DllStructCreate($tagNMLVGETINFOTIP, $ilParam)
;~                  $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~                  _DebugPrint("$LVN_GETINFOTIP" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags") & @LF & _
;~                          "-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF & _
;~                          "-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_HOTTRACK ; Высылает в ListView, когда пользователь перемещает курсор мыши над пунктом
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_HOTTRACK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  Return 0 ; Позволяет ListView выполнить свою процесс отслеживания.
;~                  ;Return 1 ; Пункт не будет выбран.
;~              Case $LVN_INSERTITEM ; A new item was inserted
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_INSERTITEM" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_ITEMACTIVATE ; Sent by a list-view control when the user activates an item
;~                  $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
;~                  _DebugPrint("$LVN_ITEMACTIVATE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @LF & _
;~                          "-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
;~                  Return 0
;~              Case $LVN_ITEMCHANGED ; An item has changed
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_ITEMCHANGED" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  ; Нет возвращаемых значений
;~              Case $LVN_ITEMCHANGING ; An item is changing
;~                  $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
;~                  _DebugPrint("$LVN_ITEMCHANGING" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
;~                          "-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
;~                          "-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
;~                          "-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
;~                          "-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~                  Return True ; prevent the change
;~                  ;Return False ; allow the change
                Case $LVN_KEYDOWN ; Клавиша была нажата
                    $tInfo = DllStructCreate($tagNMLVKEYDOWN, $ilParam)
                    _DebugPrint("$LVN_KEYDOWN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode & @LF & _
                            "-->VKey:" & @tab & DllStructGetData($tInfo, "VKey") & @LF & _
                            "-->Flags:" & @tab & DllStructGetData($tInfo, "Flags"))
                    ; Нет возвращаемых значений
;~              Case $LVN_MARQUEEBEGIN ; A bounding box (marquee) selection has begun
;~                  _DebugPrint("$LVN_MARQUEEBEGIN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode)
;~                  Return 0 ; accept the message
;~                  ;Return 1 ; quit the bounding box selection
;~              Case $LVN_SETDISPINFO ; Update the information it maintains for an item
;~                  $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam)
;~                  $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~                  _DebugPrint("$LVN_SETDISPINFO" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF & _
;~                          "-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
;~                          "-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
;~                          "-->State:" & @TAB & DllStructGetData($tInfo, "State") & @LF & _
;~                          "-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF & _
;~                          "-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF & _
;~                          "-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF & _
;~                          "-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF & _
;~                          "-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF & _
;~                          "-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF & _
;~                          "-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF & _
;~                          "-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF & _
;~                          "-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~                  ; Нет возвращаемых значений
                Case $NM_CLICK ; Высылается элементом ListView, когда пользователь кликает пункт левой кнопкой мыши
                    $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
                    _DebugPrint("$NM_CLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode & @LF & _
                            "-->Index:" & @tab & DllStructGetData($tInfo, "Index") & @LF & _
                            "-->SubItem:" & @tab & DllStructGetData($tInfo, "SubItem") & @LF & _
                            "-->NewState:" & @tab & DllStructGetData($tInfo, "NewState") & @LF & _
                            "-->OldState:" & @tab & DllStructGetData($tInfo, "OldState") & @LF & _
                            "-->Changed:" & @tab & DllStructGetData($tInfo, "Changed") & @LF & _
                            "-->ActionX:" & @tab & DllStructGetData($tInfo, "ActionX") & @LF & _
                            "-->ActionY:" & @tab & DllStructGetData($tInfo, "ActionY") & @LF & _
                            "-->lParam:" & @tab & DllStructGetData($tInfo, "lParam") & @LF & _
                            "-->KeyFlags:" & @tab & DllStructGetData($tInfo, "KeyFlags"))
                    ; Нет возвращаемых значений
                Case $NM_DBLCLK ; Высылается элементом ListView, когда пользователь делает двойной клик на пункте левой кнопкой мыши
                    $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
                    _DebugPrint("$NM_DBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode & @LF & _
                            "-->Index:" & @tab & DllStructGetData($tInfo, "Index") & @LF & _
                            "-->SubItem:" & @tab & DllStructGetData($tInfo, "SubItem") & @LF & _
                            "-->NewState:" & @tab & DllStructGetData($tInfo, "NewState") & @LF & _
                            "-->OldState:" & @tab & DllStructGetData($tInfo, "OldState") & @LF & _
                            "-->Changed:" & @tab & DllStructGetData($tInfo, "Changed") & @LF & _
                            "-->ActionX:" & @tab & DllStructGetData($tInfo, "ActionX") & @LF & _
                            "-->ActionY:" & @tab & DllStructGetData($tInfo, "ActionY") & @LF & _
                            "-->lParam:" & @tab & DllStructGetData($tInfo, "lParam") & @LF & _
                            "-->KeyFlags:" & @tab & DllStructGetData($tInfo, "KeyFlags"))
                    ; Нет возвращаемых значений
;~              Case $NM_HOVER ; Sent by a list-view control when the mouse hovers over an item
;~                  _DebugPrint("$NM_HOVER" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode)
;~                  Return 0 ; process the hover normally
;~                  ;Return 1 ; prevent the hover from being processed
                Case $NM_KILLFOCUS ; Элемент потерял фокус ввода
                    _DebugPrint("$NM_KILLFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode)
                    ; Нет возвращаемых значений
                Case $NM_RCLICK ; Высылается элементом ListView, когда пользователь кликает пункт правой кнопкой мыши
                    $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
                    _DebugPrint("$NM_RCLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode & @LF & _
                            "-->Index:" & @tab & DllStructGetData($tInfo, "Index") & @LF & _
                            "-->SubItem:" & @tab & DllStructGetData($tInfo, "SubItem") & @LF & _
                            "-->NewState:" & @tab & DllStructGetData($tInfo, "NewState") & @LF & _
                            "-->OldState:" & @tab & DllStructGetData($tInfo, "OldState") & @LF & _
                            "-->Changed:" & @tab & DllStructGetData($tInfo, "Changed") & @LF & _
                            "-->ActionX:" & @tab & DllStructGetData($tInfo, "ActionX") & @LF & _
                            "-->ActionY:" & @tab & DllStructGetData($tInfo, "ActionY") & @LF & _
                            "-->lParam:" & @tab & DllStructGetData($tInfo, "lParam") & @LF & _
                            "-->KeyFlags:" & @tab & DllStructGetData($tInfo, "KeyFlags"))
                    ;Return 1 ; не разрешает обработку по умолчанию
                    Return 0 ; разрешает обработку по умолчанию
                Case $NM_RDBLCLK ; Высылается элементом ListView, когда пользователь делает двойной клик на пункте правой кнопкой мыши
                    $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
                    _DebugPrint("$NM_RDBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode & @LF & _
                            "-->Index:" & @tab & DllStructGetData($tInfo, "Index") & @LF & _
                            "-->SubItem:" & @tab & DllStructGetData($tInfo, "SubItem") & @LF & _
                            "-->NewState:" & @tab & DllStructGetData($tInfo, "NewState") & @LF & _
                            "-->OldState:" & @tab & DllStructGetData($tInfo, "OldState") & @LF & _
                            "-->Changed:" & @tab & DllStructGetData($tInfo, "Changed") & @LF & _
                            "-->ActionX:" & @tab & DllStructGetData($tInfo, "ActionX") & @LF & _
                            "-->ActionY:" & @tab & DllStructGetData($tInfo, "ActionY") & @LF & _
                            "-->lParam:" & @tab & DllStructGetData($tInfo, "lParam") & @LF & _
                            "-->KeyFlags:" & @tab & DllStructGetData($tInfo, "KeyFlags"))
                    ; Нет возвращаемых значений
                Case $NM_RETURN ; Элемент имеет фокус ввода и пользователь нажал клавишу ENTER
                    _DebugPrint("$NM_RETURN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode)
                    ; Нет возвращаемых значений
                Case $NM_SETFOCUS ; Элемент получил фокус ввода
                    _DebugPrint("$NM_SETFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode)
                    ; Нет возвращаемых значений
            EndSwitch
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
    ConsoleWrite( _
            "!===========================================================" & @LF & _
            "+======================================================" & @LF & _
            "-->Строка(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
            "+======================================================" & @LF)
EndFunc   ;==>_DebugPrint