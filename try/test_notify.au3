#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_LV = False ; ��������� ClassName ������������ � ListView �������. ���������� True � ����������� ���������� �� ������� ��������, ����� ������� ��� ��� ��������

Global $hListView

_Main()

Func _Main()

    Local $GUI, $hImage
    $GUI = GUICreate("�������� ListView", 400, 300)

    $hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 394, 268)
    _GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))
    GUISetState()

    GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

    ; ��������� �����������
    $hImage = _GUIImageList_Create()
    _GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
    _GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
    _GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
    _GUICtrlListView_SetImageList($hListView, $hImage, 1)

    ; ��������� �������
    _GUICtrlListView_InsertColumn($hListView, 0, "������� 1", 100)
    _GUICtrlListView_InsertColumn($hListView, 1, "������� 2", 100)
    _GUICtrlListView_InsertColumn($hListView, 2, "������� 3", 100)

    ; ��������� ������
    _GUICtrlListView_AddItem($hListView, "��� 1: ��� 1", 0)
    _GUICtrlListView_AddSubItem($hListView, 0, "��� 1: ��� 2", 1)
    _GUICtrlListView_AddSubItem($hListView, 0, "��� 1: ��� 3", 2)
    _GUICtrlListView_AddItem($hListView, "��� 2: ��� 1", 1)
    _GUICtrlListView_AddSubItem($hListView, 1, "��� 2: ��� 2", 1)
    _GUICtrlListView_AddItem($hListView, "��� 3: ��� 1", 2)

    ; ���� �����������, ���� ���� �� ����� �������
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
;~                  ; ��� ������������ ��������
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
;~                  ; ��� ������������ ��������
;~              Case $LVN_BEGINSCROLL ; A scrolling operation starts, Minium OS WinXP
;~                  $tInfo = DllStructCreate($tagNMLVSCROLL, $ilParam)
;~                  _DebugPrint("$LVN_BEGINSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->DX:" & @TAB & DllStructGetData($tInfo, "DX") & @LF & _
;~                          "-->DY:" & @TAB & DllStructGetData($tInfo, "DY"))
;~                  ; ��� ������������ ��������
                Case $LVN_COLUMNCLICK ; ���� �� ��������� �������
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
                    ; ��� ������������ ��������
;~              Case $LVN_DELETEALLITEMS ; ��� ������ ���������� ���� �������
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
;~              Case $LVN_DELETEITEM ; ����� ���������� ���� ������
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
;~                  ; ��� ������������ ��������
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
;~              Case $LVN_ENDSCROLL ; ��������� ���������, ����������� OS WinXP
;~                  $tInfo = DllStructCreate($tagNMLVSCROLL, $ilParam)
;~                  _DebugPrint("$LVN_ENDSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode & @LF & _
;~                          "-->DX:" & @TAB & DllStructGetData($tInfo, "DX") & @LF & _
;~                          "-->DY:" & @TAB & DllStructGetData($tInfo, "DY"))
;~                  ; ��� ������������ ��������
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
;~                  ; ��� ������������ ��������
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
;~                  ; ��� ������������ ��������
;~              Case $LVN_HOTTRACK ; �������� � ListView, ����� ������������ ���������� ������ ���� ��� �������
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
;~                  Return 0 ; ��������� ListView ��������� ���� ������� ������������.
;~                  ;Return 1 ; ����� �� ����� ������.
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
;~                  ; ��� ������������ ��������
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
;~                  ; ��� ������������ ��������
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
                Case $LVN_KEYDOWN ; ������� ���� ������
                    $tInfo = DllStructCreate($tagNMLVKEYDOWN, $ilParam)
                    _DebugPrint("$LVN_KEYDOWN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode & @LF & _
                            "-->VKey:" & @tab & DllStructGetData($tInfo, "VKey") & @LF & _
                            "-->Flags:" & @tab & DllStructGetData($tInfo, "Flags"))
                    ; ��� ������������ ��������
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
;~                  ; ��� ������������ ��������
                Case $NM_CLICK ; ���������� ��������� ListView, ����� ������������ ������� ����� ����� ������� ����
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
                    ; ��� ������������ ��������
                Case $NM_DBLCLK ; ���������� ��������� ListView, ����� ������������ ������ ������� ���� �� ������ ����� ������� ����
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
                    ; ��� ������������ ��������
;~              Case $NM_HOVER ; Sent by a list-view control when the mouse hovers over an item
;~                  _DebugPrint("$NM_HOVER" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
;~                          "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
;~                          "-->Code:" & @TAB & $iCode)
;~                  Return 0 ; process the hover normally
;~                  ;Return 1 ; prevent the hover from being processed
                Case $NM_KILLFOCUS ; ������� ������� ����� �����
                    _DebugPrint("$NM_KILLFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode)
                    ; ��� ������������ ��������
                Case $NM_RCLICK ; ���������� ��������� ListView, ����� ������������ ������� ����� ������ ������� ����
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
                    ;Return 1 ; �� ��������� ��������� �� ���������
                    Return 0 ; ��������� ��������� �� ���������
                Case $NM_RDBLCLK ; ���������� ��������� ListView, ����� ������������ ������ ������� ���� �� ������ ������ ������� ����
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
                    ; ��� ������������ ��������
                Case $NM_RETURN ; ������� ����� ����� ����� � ������������ ����� ������� ENTER
                    _DebugPrint("$NM_RETURN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode)
                    ; ��� ������������ ��������
                Case $NM_SETFOCUS ; ������� ������� ����� �����
                    _DebugPrint("$NM_SETFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
                            "-->IDFrom:" & @TAB & $iIDFrom & @LF & _
                            "-->Code:" & @TAB & $iCode)
                    ; ��� ������������ ��������
            EndSwitch
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
    ConsoleWrite( _
            "!===========================================================" & @LF & _
            "+======================================================" & @LF & _
            "-->������(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
            "+======================================================" & @LF)
EndFunc   ;==>_DebugPrint