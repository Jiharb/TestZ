#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=interact.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Include <EditConstants.au3>
#Include <GUIConstantsEx.au3>
#Include <GUIEdit.au3>
#Include <GUISlider.au3>
#Include <StaticConstants.au3>
#Include <WindowsConstants.au3>
#Include <Messages.au3>


If Not @compiled Then
    MsgBox(64, 'Messages UDF Library Demonstration', 'To run this script, you must first compile it and then run the (.exe) file.')
    Exit
EndIf

Opt('MustDeclareVars', 1)

If $CmdLine[0] = 0 Then
    ShellExecute(@ScriptFullPath, '1')
    ShellExecute(@ScriptFullPath, '2')
    ShellExecute(@ScriptFullPath, '3')
    Exit
EndIf

Global $Form, $Input1, $Input2, $Radio1, $Radio2, $Radio3, $ButtonSend, $Edit, $Slider, $Check

Switch $CmdLine[1]
    Case '1', '2', '3'
        _Main(Int($CmdLine[1]))
    Case Else

EndSwitch

Func _Main($Index)

    Local $GUIMsg, $nScript, $Data, $Timer = _MsgTimerInterval(0)

    $Form = GUICreate('Script' & $Index, 324, 384, (@DesktopWidth - 1018) / 2 + ($Index - 1) * 344, (@DesktopHeight - 440) / 2, BitOR($WS_CAPTION, $WS_SYSMENU), $WS_EX_TOPMOST)

    GUISetFont(8.5, 400, 0, 'Tahoma', $Form)

    GUICtrlCreateLabel('Message:', 14, 22, 48, 14)
    $Input1 = GUICtrlCreateInput('', 64, 19, 246, 20)
    GUICtrlCreateLabel('Send to:', 14, 56, 48, 14)

    GUIStartGroup()

    $Radio1 = GUICtrlCreateRadio('Script1', 64, 56, 56, 14)
    GUICtrlSetState(-1, $GUI_CHECKED)
    $Radio2 = GUICtrlCreateRadio('Script2', 130, 56, 56, 14)
    $Radio3 = GUICtrlCreateRadio('Script3', 196, 56, 56, 14)

    $ButtonSend = GUICtrlCreateButton('Send', 236, 88, 75, 23)
    GUICtrlSetState(-1, $GUI_DEFBUTTON)
    GUICtrlCreateLabel('', 14, 128, 299, 2, $SS_ETCHEDHORZ)
    GUICtrlCreateLabel('Received message:', 14, 142, 98, 14)
    $Edit = GUICtrlCreateEdit('', 14, 160, 296, 129, BitOR($ES_READONLY, $WS_VSCROLL, $WS_HSCROLL))
    GUICtrlSetBkColor(-1, 0xFFFFFF)
    GUICtrlCreateLabel('Timer interval (ms):', 14, 316, 98, 14)
    $Slider = GUICtrlCreateSlider(110, 312, 162, 26, BitOR($TBS_AUTOTICKS, $WS_TABSTOP))
    GUICtrlSetLimit(-1, 20, 1)
    GUICtrlSetData(-1, $Timer / 50)
    _GUICtrlSlider_SetTicFreq(-1, 1)
    $Input2 = GUICtrlCreateInput($Timer, 274, 313, 36, 20, $ES_READONLY)
    GUICtrlSetBkColor(-1, 0xFFFFFF)
    $Check = GUICtrlCreateCheckbox('Enable receiver', 14, 354, 96, 19)
    GUICtrlSetState(-1, $GUI_CHECKED)

    Opt('GUICloseOnESC', 0)

    GUISetState()

    _MsgRegister('Script' & $Index, '_Receiver')

    While 1
        $GUIMsg = GUIGetMsg()
        Select
            Case $GUIMsg = $GUI_EVENT_CLOSE
                Exit
            Case $GUIMsg = $ButtonSend
                For $i = $Radio1 To $Radio3
                    If GUICtrlRead($i) = $GUI_CHECKED Then
                        $nScript = 1 + $i - $Radio1
                        ExitLoop
                    EndIf
                Next
                $Data = GUICtrlRead($Input1)
                If StringStripWS($Data, 3) = '' Then
                    $Data = '(empty)'
                EndIf
                If _IsReceiver('Script' & $nScript) Then
                    _MsgSend('Script' & $nScript, 'From Script' & $Index & ':  ' & $Data)
                EndIf
            Case $GUIMsg = $Slider
                _MsgTimerInterval($Timer)
            Case $GUIMsg = $Check
                If GUICtrlRead($Check) = $GUI_CHECKED Then
                    _MsgRegister('Script' & $Index, '_Receiver')
                    GUICtrlSetState($Edit, $GUI_ENABLE)
                    GUICtrlSetBkColor($Edit, 0xFFFFFF)
                    GUICtrlSetState($Slider, $GUI_ENABLE)
                    GUICtrlSetState($Input2, $GUI_ENABLE)
                Else
                    _MsgRegister('Script' & $Index, '')
                    GUICtrlSetState($Edit, $GUI_DISABLE)
                    GUICtrlSetBkColor($Edit, $GUI_BKCOLOR_TRANSPARENT)
                    GUICtrlSetState($Slider, $GUI_DISABLE)
                    GUICtrlSetState($Input2, $GUI_DISABLE)
                EndIf
        EndSelect
        $Data = GUICtrlRead($Slider) * 50
        If BitXOR($Data, $Timer) Then
            GUICtrlSetData($Input2, $Timer)
            $Timer = $Data
        EndIf
    WEnd
EndFunc   ;==>_Main

Func _Receiver($sMessage)
    _GUICtrlEdit_AppendText($Edit, $sMessage & @CRLF)
    Return 0
EndFunc   ;==>_Receiver
