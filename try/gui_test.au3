 #include <GUIConstantsEx.au3>
 #include <GuiListView.au3>

 Opt("GUIOnEventMode", 1)

MainGUI()

 ; ----- GUIs
Func MainGUI()
  Global $listview
  $listGUI = GUICreate("AutoIt list item GUI", 400, 200, 100, 200, -1)
  GUISetOnEvent($GUI_EVENT_CLOSE, "On_Close_Main")
  $listview = GUICtrlCreateListView("Users", 10, 10, 200, 150)
  _GUICtrlListView_SetColumnWidth($listview, 0, 150)

  GUICtrlCreateListViewItem("First Item", $listview)
  GUICtrlCreateListViewItem("Second Item", $listview)
  GUICtrlCreateListViewItem("Third Item", $listview)

  $BtnAdd = GUICtrlCreateButton("Add Item", 10, 165, 80, 30)
  GUICtrlSetOnEvent(-1, "Addi")
  $BtnSelect = GUICtrlCreateButton("Select", 100, 165, 80, 30)
  GUICtrlSetOnEvent(-1, "SelectItem")

  GUISetState()

  While 1
    Sleep(10)
  WEnd
EndFunc
 ; ///// Functions
Func Addi()
   $sToAdd = InputBox("Add", "Enter Item Name", "")
   GUICtrlCreateListViewItem($sToAdd, $listview)
EndFunc

Func SelectItem()
  $sItem = GUICtrlRead(GUICtrlRead($listview))
  $sItem = StringTrimRight($sItem, 1) ; Will remove the pipe "|" from the end of the string
  MsgBox(0, "Selected Item", $sItem)
EndFunc

Func On_Close_Main()
   Exit
EndFunc