#include <GUIConstantsEx.au3>
#include <ComboConstants.au3>
#include <FileOperations.au3>
#include <Array.au3>

Global $s = Chr(1)
Opt("GUIDataSeparatorChar", $s)
Opt("GUIOnEventMode", 1)
Global $Path0 = '$sPath', $ComboFileS0 = '_FO_FileSearch', $Mask0 = '*', $Include0 = True, $Level0 = 125, $Full0 = 1, $Arr0 = 1, $TypeMask0 = 1, $fileS = 1, $Locale0 = 0
; _FO_FileSearch($Path, $Mask = '*', $Include = True, $Level = 125, $Full = 1, $Arr = 1, $TypeMask = 1)

; En
$LngTitle = 'Set'
$LngFunc = 'Function'
$LngPath = 'Path'
$LngMask = 'Mask'
$LngInclude = 'Include'
$LngDepth = 'Depth'
$LngFull = 'Full'
$LngArr = 'result'
$LngTypeMask = 'TypeMask'
$LngFullH = '0 - relative' & @CRLF & '1 - full (Default)' & @CRLF & '2 - filenames with extension' & @CRLF & '3 - filenames without extension'
$LngFullH1 = '0 - relative' & @CRLF & '1 - full (Default)'
$LngArrH = '0 - list' & @CRLF & '1 - array, $a[0]=number (Default)' & @CRLF & '2 - array'
$LngTypeMaskH = '0 - auto detect' & @CRLF & '1 - mask= *.is?|s*.cp* (Default)' & @CRLF & '2 - Type= tmp|bak|gid'
$LngStB = 'StatusBar'
$LngTst = 'Test'

$LngPrA0 = 'Delimited list @CRLF'
$LngPrA1 = 'Array, where $iArray[0]=number of files'
$LngPrA2 = 'Array, where $iArray[0] contains the first file'
$LngPrF0 = 'relative'
$LngPrF1 = 'Full path (by default)'
$LngPrF2 = 'File names with extension'
$LngPrF3 = 'File names without extension'
$LngPrT0 = 'Auto detection (1 or 2)'
$LngPrT1 = 'Force the use of mask type: *.is?|s*.cp*'
$LngPrT2 = 'Force the use of mask type: tmp|bak|gid'
$LngLocale = 'Sensitivity'
$LngLocaleH = '0 - Not case sensitive (only for "A-z"), by default.' & @CRLF & '1 - Case sensitive (for any characters)' & @CRLF & '<symbols> - А-яЁё Not case sensitive of a specified range of Unicode.'
$LngPrL0 = 'Not case sensitive (only for "A-z"), by default'
$LngPrL1 = 'Case sensitive (for any characters)'
$LngPrL2 = 'А-яЁё Not case sensitive of a specified range of Unicode'

; Ru
; если русская локализация, то русский язык
If @OSLang = 0419 Then
	$LngTitle = 'Установки'
	$LngFunc = 'Функция'
	$LngPath = 'Путь'
	$LngMask = 'Маска'
	$LngInclude = 'Включение'
	$LngDepth = 'Вложенность'
	$LngFull = 'Полный'
	$LngArr = 'Результат'
	$LngTypeMask = 'Тип маски'
	$LngFullH = '0 - относительный' & @CRLF & '1 - полный путь (по умолчанию)' & @CRLF & '2 - имена файлов с расширением' & @CRLF & '3 - имена файлов без расширения'
	$LngFullH1 = '0 - относительный' & @CRLF & '1 - полный путь (по умолчанию)'
	$LngArrH = '0 - список' & @CRLF & '1 - массив с количеством элементов (по умолчанию)' & @CRLF & '2 - массив'
	$LngTypeMaskH = '0 - автоопределение' & @CRLF & '1 - маска вида *.is?|s*.cp* (по умолчанию)' & @CRLF & '2 - по типу tmp|bak|gid'
	$LngStB = 'Строка состояния'
	$LngTst = 'Тест'

	$LngPrA0 = 'список с разделителем @CRLF'
	$LngPrA1 = 'массив, в котором $array[0]=количество файлов'
	$LngPrA2 = 'массив, в котором $array[0] содержит первый файл'
	$LngPrF0 = 'относительный'
	$LngPrF1 = 'полный путь (по умолчанию)'
	$LngPrF2 = 'имена файлов с расширением'
	$LngPrF3 = 'имена файлов без расширения'
	$LngPrT0 = 'автоопределение типа маски 1 или 2'
	$LngPrT1 = 'принудительно использовать маску вида *.is?|s*.cp*'
	$LngPrT2 = 'принудительно маска вида tmp|bak|gid'
	$LngLocale = 'Регистр'
	$LngLocaleH = '0 - не учитывать регистр (только для латинских букв), по умолчанию.' & @CRLF & '1 - учитывать регистр (для любых символов)' & @CRLF & '<символы> - не учитывать регистр указанного диапазона символов ' & @CRLF & 'локального языка, включая латинские, например "А-яЁё".'
	$LngPrL0 = 'не учитывать регистр (только для латинских букв)'
	$LngPrL1 = 'учитывать регистр (для любых символов)'
	$LngPrL2 = 'А-яЁё не учитывать регистр указанного диапазона Unicode'
EndIf

$Gui = GUICreate($LngTitle & ' FileOperations', 700, 150)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

; GUICtrlCreateLabel($LngPath, 10, 40, 80, 17)
$InputPath = GUICtrlCreateCombo('', 10, 10, 655, 22)
GUICtrlSetData(-1, @WindowsDir & $s & @SystemDir & $s & @ProgramFilesDir & $s & @UserProfileDir & $s & @HomeDrive & $s & '$sPath', @WindowsDir)
$PathOpen = GUICtrlCreateButton("...", 664, 10, 26, 22)
GUICtrlSetFont(-1, 16)
GUICtrlSetOnEvent(-1, "_OpenFldr")

GUICtrlCreateLabel($LngFunc, 10, 44, 105, 17)
$ComboFileS = GUICtrlCreateCombo('', 10, 60, 135, 23, 0x3)
GUICtrlSetData(-1, '_FO_FileSearch' & $s & '_FO_FolderSearch', '_FO_FileSearch')

GUICtrlCreateLabel($LngMask, 150, 44, 180, 17)
$InputMask = GUICtrlCreateCombo('', 150, 60, 150)
GUICtrlSetData(-1, '*' & $s & '*.avi|*.mpg|*.vob|*.wmv|*.mkv|*.mp4' & $s & '*.mov|*.asf|*.asx|*.3gp|*.flv|*.bik' & $s & '*.mp3|*.wav|*.wma|*.ogg|*.ac3' & $s & '*.bak|*.gid|*.log|*.tmp' & $s & '*.htm|*.html|*.css|*.js|*.php' & $s & '*.bmp|*.gif|*.jpg|*.jpeg|*.png|*.tif|*.tiff' & $s & '*.exe|*.msi|*.scr|*.dll|*.cpl|*.ax' & $s & '*.com|*.sys|*.bat|*.cmd' & $s & 'avi|mpg|vob|wmv|mkv|mp4' & $s & 'mov|asf|asx|3gp|flv|bik' & $s & 'mp3|wav|wma|ogg|ac3' & $s & 'bak|gid|log|tmp' & $s & 'htm|html|css|js|php' & $s & 'bmp|gif|jpg|jpeg|png|tif|tiff' & $s & 'exe|msi|scr|dll|cpl|ax' & $s & 'com|sys|bat|cmd', '*')
GUICtrlSendMsg(-1, $CB_SETDROPPEDWIDTH, 250, 0)

GUICtrlCreateLabel($LngInclude, 310, 44, 60, 17)
$RadioTrue = GUICtrlCreateRadio('True', 320, 57, 40, 17)
GUICtrlSetState(-1, 1)
$RadioFalse = GUICtrlCreateRadio('False', 320, 72, 40, 17)

GUICtrlCreateLabel($LngDepth, 380, 44, 80, 17)
$ComboDepth = GUICtrlCreateCombo('', 380, 60, 55)
GUICtrlSetData(-1, '0' & $s & '1' & $s & '2' & $s & '3' & $s & '15' & $s & '70' & $s & '125', '125')

GUICtrlCreateLabel($LngFull, 460, 44, 60, 17)
$ComboFull = GUICtrlCreateCombo('', 460, 60, 50, -1, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, '0     ' & $LngPrF0 & $s & '1     ' & $LngPrF1 & $s & '2     ' & $LngPrF2 & $s & '3     ' & $LngPrF3, '1     ' & $LngPrF1)
GUICtrlSetTip(-1, $LngFullH)
GUICtrlSendMsg(-1, $CB_SETDROPPEDWIDTH, 200, 0)

GUICtrlCreateLabel($LngArr, 520, 44, 80, 17)
$ComboArr = GUICtrlCreateCombo('', 520, 60, 50, -1, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, '0     ' & $LngPrA0 & $s & '1     ' & $LngPrA1 & $s & '2     ' & $LngPrA2, '1     ' & $LngPrA1)
GUICtrlSetTip(-1, $LngArrH)
GUICtrlSendMsg(-1, $CB_SETDROPPEDWIDTH, 290, 0)

GUICtrlCreateLabel($LngTypeMask, 577, 44, 60, 17)
$ComboTypeMask = GUICtrlCreateCombo('', 580, 60, 50, -1, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, '0     ' & $LngPrT0 & $s & '1     ' & $LngPrT1 & $s & '2     ' & $LngPrT2, '1     ' & $LngPrT1)
GUICtrlSetTip(-1, $LngTypeMaskH)
GUICtrlSendMsg(-1, $CB_SETDROPPEDWIDTH, 290, 0)

GUICtrlCreateLabel($LngLocale, 640, 44, 60, 17)
$ComboLocale = GUICtrlCreateCombo('', 640, 60, 50, -1, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, '0     ' & $LngPrL0 & $s & '1     ' & $LngPrL1 & $s & $LngPrL2, '0     ' & $LngPrL0)
GUICtrlSetTip(-1, $LngLocaleH)
GUICtrlSendMsg(-1, $CB_SETDROPPEDWIDTH, 310, 0)

$InputPathOut = GUICtrlCreateInput('_FO_FileSearch($Path)', 10, 93, 680, 20)

$Test = GUICtrlCreateButton($LngTst, 620, 120, 70, 25)
GUICtrlSetOnEvent(-1, "_Test")
$StatusBar = GUICtrlCreateLabel($LngStB, 5, 130, 555, 17)

GUISetState()
GUIRegisterMsg(0x0111, "WM_COMMAND")
While 1
	Sleep(10000000)
WEnd

Func _OpenFldr()
	Local $sPath = GUICtrlRead($InputPath)
	If Not FileExists($sPath) Then $sPath = 'C:\'
	$sPath = FileSelectFolder('', '', 3, $sPath, $Gui)
	If @error Then Return
	GUICtrlSetData($InputPath, $sPath, $sPath)
	; GUICtrlSetData($InputPath, $Tmp&'|', $Tmp)
EndFunc   ;==>_OpenFldr

Func _Test()
	GUICtrlSetState($Test, $GUI_DISABLE)
	GUICtrlSetData($StatusBar, '...')
	$timer = TimerInit()
	If $fileS = 1 Then
		$FileList = _FO_FileSearch($Path0, _FO_CorrectMask($Mask0), $Include0, $Level0, $Full0, $Arr0, $TypeMask0, $Locale0)
	Else
		$FileList = _FO_FolderSearch($Path0, _FO_CorrectMask($Mask0), $Include0, $Level0, $Full0, $Arr0, $Locale0)
	EndIf
	$ErrorS = @error
	$timer = 't=' & Round(TimerDiff($timer) / 1000, 2) & ' sec'
	GUICtrlSetState($Test, $GUI_ENABLE)
	GUICtrlSetData($StatusBar, $timer)
	Switch $ErrorS
		Case 0
			If $Arr0 = 0 Then
				StringReplace($FileList, @CRLF, @CRLF)
				If MsgBox(1, 'all=' & @extended + 1 & ', ' & $timer & ', Enter=-->Clipboard', $FileList, 0, $Gui) = 1 Then ClipPut($FileList)
			Else
				GUISetState(@SW_DISABLE, $Gui)
				_ArrayDisplay($FileList, $timer)
				GUISetState(@SW_ENABLE, $Gui)
				WinActivate($Gui)
			EndIf
		Case 1
			MsgBox(16, 'Error', '@error=' & $ErrorS & ', Path=Error', 0, $Gui)
		Case 2
			MsgBox(16, 'Error', '@error=' & $ErrorS & ', Mask=Error', 0, $Gui)
		Case 3
			MsgBox(16, 'Error', '@error=' & $ErrorS & ', not found', 0, $Gui)
	EndSwitch
	; GUICtrlSetData($StatusBar,'Done')
EndFunc   ;==>_Test

Func _Exit()
	Exit
EndFunc   ;==>_Exit

Func WM_COMMAND($hWnd, $MsgID, $WParam, $LParam)
	Local $Tmp
	Local $iCode = BitShift($WParam, 16) ; старшее слово

	Do
		Switch BitAND($WParam, 0xFFFF)
			Case $InputPath
				$Tmp = GUICtrlRead($InputPath)
				If $Tmp <> $Path0 Then
					$Path0 = $Tmp
				Else
					ExitLoop
				EndIf
			Case $ComboFileS
				If $iCode = $CBN_SELCHANGE Then
					$ComboFileS0 = GUICtrlRead($ComboFileS)
					If $ComboFileS0 = '_FO_FileSearch' Then
						GUICtrlSetState($ComboTypeMask, $GUI_ENABLE)
						GUICtrlSetData($ComboFull, $s & '0     ' & $LngPrF0 & $s & '1     ' & $LngPrF1 & $s & '2     ' & $LngPrF2 & $s & '3     ' & $LngPrF3, GUICtrlRead($ComboFull))
						$fileS = 1
						GUICtrlSetTip($ComboFull, $LngFullH)
					Else
						GUICtrlSetState($ComboTypeMask, $GUI_DISABLE)
						$tmpF = GUICtrlRead($ComboFull)
						If StringLeft($tmpF, 1) > 1 Then $tmpF = '1     ' & $LngPrF1
						GUICtrlSetData($ComboFull, $s & '0     ' & $LngPrF0 & $s & '1     ' & $LngPrF1, $tmpF)
						$fileS = 0
						If $Full0 = 2 Or $Full0 = 3 Then $Full0 = 1
						GUICtrlSetTip($ComboFull, $LngFullH1)
					EndIf
				Else
					ExitLoop
				EndIf
			Case $InputMask
				Switch $iCode
					Case $CBN_SELCHANGE, $CBN_EDITUPDATE, $CBN_KILLFOCUS
						$Mask0 = GUICtrlRead($InputMask)
					Case Else
						ExitLoop
				EndSwitch
			Case $RadioTrue, $RadioFalse
				If GUICtrlRead($RadioTrue) = 1 Then
					$Include0 = True
				Else
					$Include0 = False
				EndIf
			Case $ComboDepth
				Switch $iCode
					Case $CBN_SELCHANGE, $CBN_EDITUPDATE, $CBN_KILLFOCUS
						$Level0 = Number(GUICtrlRead($ComboDepth))
					Case Else
						ExitLoop
				EndSwitch
			Case $ComboFull
				If $iCode = $CBN_SELCHANGE Then
					$Full0 = Number(StringLeft(GUICtrlRead($ComboFull), 1))
				Else
					ExitLoop
				EndIf
			Case $ComboArr
				If $iCode = $CBN_SELCHANGE Then
					$Arr0 = Number(StringLeft(GUICtrlRead($ComboArr), 1))
				Else
					ExitLoop
				EndIf
			Case $ComboTypeMask
				If $iCode = $CBN_SELCHANGE Then
					$TypeMask0 = Number(StringLeft(GUICtrlRead($ComboTypeMask), 1))
				Else
					ExitLoop
				EndIf
			Case $ComboLocale
				Switch $iCode
					Case $CBN_SELCHANGE, $CBN_EDITUPDATE, $CBN_KILLFOCUS
						$Tmp = GUICtrlRead($ComboLocale)
						If StringIsDigit(StringLeft($Tmp, 1)) Then
							$Locale0 = Number(StringLeft($Tmp, 1))
						Else
							$Tmp2 = StringRegExp($Tmp, '^([^A-z\h\d]+)', 1)
							If @error Then
								; $Tmp=StringRegExpReplace($Tmp, '[A-z\h\d]+', '')
								; GUICtrlSendMsg($ComboLocale, $EM_REPLACESEL, 0, 0)
								ExitLoop
							Else
								$Locale0 = $Tmp2[0]
							EndIf
						EndIf
					Case Else
						ExitLoop
				EndSwitch
		EndSwitch
		
		$Path1 = $Path0
		If StringLeft($Path0, 1) <> '$' Then $Path1 = '''' & $Path0 & ''''
		$del = 0
		If $fileS Then
			$String = '_FO_FileSearch(' & $Path1 & ', ''' & $Mask0 & ''', ' & $Include0 & ', ' & $Level0 & ', ' & $Full0 & ', ' & $Arr0 & ', ' & $TypeMask0 & ', ' & $Locale0
			If $Locale0 == '0' Then
				$del += 3
				If $TypeMask0 = 1 Then
					$del += 3
					If $Arr0 = 1 Then
						$del += 3
						If $Full0 = 1 Then
							$del += 3
							If $Level0 == '125' Then
								$del += 5
								If $Include0 Then
									$del += 6
									If $Mask0 == '*' Then
										$del += 5
									EndIf
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			$String = '_FO_FolderSearch(' & $Path1 & ', ''' & $Mask0 & ''', ' & $Include0 & ', ' & $Level0 & ', ' & $Full0 & ', ' & $Arr0 & ', ' & $Locale0
			If $Locale0 == '0' Then
				$del += 3
				If $Arr0 = 1 Then
					$del += 3
					If $Full0 = 1 Then
						$del += 3
						If $Level0 == '125' Then
							$del += 5
							If $Include0 Then
								$del += 6
								If $Mask0 == '*' Then
									$del += 5
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
		
		GUICtrlSetData($InputPathOut, StringTrimRight($String, $del) & ')')
	Until 1
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND