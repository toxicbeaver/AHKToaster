;-----------------------
;--- Settings Window ---
;-----------------------
SettingsMenuHandler:
{
	DDLSongFace := PopulateSelect("Arial|Calibri|Lucida Sans Unicode|Segoe UI|Tahoma|Verdana", S_SongFace)
	DDLSongWeight := PopulateSelect("100|200|300|400|500|600|700|800|900", S_SongWeight)
	DDLArtistFace := PopulateSelect("Arial|Calibri|Lucida Sans Unicode|Segoe UI|Tahoma|Verdana", S_ArtistFace)
	DDLArtistWeight := PopulateSelect("100|200|300|400|500|600|700|800|900", S_ArtistWeight)
	DDLToastEnter := PopulateSelect("Roll Left to Right|Roll Right to Left|Roll Top to Bottom|Roll Bottom to Top|Slide Left to Right|Slide Right to Left|Slide Top to Bottom|Slide Bottom to Top|Zoom In|Fade In", S_ToastEnter)
	DDLToastExit := PopulateSelect("Roll Left to Right|Roll Right to Left|Roll Top to Bottom|Roll Bottom to Top|Slide Left to Right|Slide Right to Left|Slide Top to Bottom|Slide Bottom to Top|Zoom Out|Fade Out", S_ToastExit)

	Gui SettingsGui:New, -MinimizeBox -MaximizeBox
	Gui SettingsGui:Font,, Segoe UI
	Gui SettingsGui:Color, White
	Gui SettingsGui:Add, GroupBox, x16 y15 w648 h118, Toast Style
	Gui SettingsGui:Add, Text, x35 y40 w150 h14, Toast Duration (second):
	Gui SettingsGui:Add, Edit, vS_ToastDuration x200 y36 w120 h21, %S_ToastDuration%
	Gui SettingsGui:Add, Text, x360 y40 w150 h14, Toast Background Color:
	Gui SettingsGui:Add, Edit, vS_GuiColor x525 y36 w59 h21, %S_GuiColor%
	Gui SettingsGui:Add, Button, x586 y35 w59 h23 gC_GuiColor, Change
	Gui SettingsGui:Add, Text, x35 y70 w150 h14, Toast Transparency:
	Gui SettingsGui:Add, Slider, vS_GuiTransparency x194 y64 w132 h23 Range1-255 ToolTipTop, %S_GuiTransparency%
	Gui SettingsGui:Add, Text, x360 y70 w150 h14, Toast Border Width:
	Gui SettingsGui:Add, Edit, vS_BorderWidth x525 y66 w120 h21, %S_BorderWidth%
	Gui SettingsGui:Add, Text, x35 y100 w150 h14, Toast Border Color:
	Gui SettingsGui:Add, Edit, vS_BorderColor x200 y96 w59 h21, %S_BorderColor%
	Gui SettingsGui:Add, Button, x261 y95 w59 h23 gC_BorderColor, Change
	Gui SettingsGui:Add, Text, x360 y100 w150 h14, Toast Border Radius:
	Gui SettingsGui:Add, Edit, vS_BorderRadius x525 y96 w120 h21, %S_BorderRadius%
	Gui SettingsGui:Add, GroupBox, x16 y244 w322 h148, Song Text Style
	Gui SettingsGui:Add, GroupBox, x342 y244 w322 h148, Artist/Album Text Style
	Gui SettingsGui:Add, Text, x35 y269 w150 h14, Song Font Color:
	Gui SettingsGui:Add, Edit, vS_SongColor x200 y265 w59 h21, %S_SongColor%
	Gui SettingsGui:Add, Button, x261 y264 w59 h23 gC_SongColor, Change
	Gui SettingsGui:Add, Text, x35 y299 w150 h14, Song Font Face:
	Gui SettingsGui:Add, DropDownList, vS_SongFace x200 y295 w120, %DDLSongFace%
	Gui SettingsGui:Add, Text, x35 y329 w150 h14, Song Font Size:
	Gui SettingsGui:Add, Edit, vS_SongSize x200 y325 w120 h21, %S_SongSize%
	Gui SettingsGui:Add, Text, x35 y359 w150 h14, Song Font Weight:
	Gui SettingsGui:Add, DropDownList, vS_SongWeight x200 y355 w120, %DDLSongWeight%
	Gui SettingsGui:Add, GroupBox, x16 y145 w648 h88, Toast Animation
	Gui SettingsGui:Add, Text, x35 y170 w150 h14, Toast Enter Effect:
	Gui SettingsGui:Add, DropDownList, vS_ToastEnter x200 y166 w120, %DDLToastEnter%
	Gui SettingsGui:Add, Text, x360 y170 w150 h14, Toast Enter Effect Speed (ms):
	Gui SettingsGui:Add, Edit, vS_ToastEnterSpeed x525 y166 w120 h21, %S_ToastEnterSpeed%
	Gui SettingsGui:Add, Text, x35 y200 w150 h14, Toast Exit Effect:
	Gui SettingsGui:Add, DropDownList, vS_ToastExit x200 y196 w120, %DDLToastExit%
	Gui SettingsGui:Add, Text, x360 y200 w150 h14, Toast Exit Effect Speed (ms):
	Gui SettingsGui:Add, Edit, vS_ToastExitSpeed x525 y196 w120 h21, %S_ToastExitSpeed%
	Gui SettingsGui:Add, Text, x360 y269 w150 h14, Artist/Album Font Color:
	Gui SettingsGui:Add, Edit, vS_ArtistColor x525 y265 w59 h21, %S_ArtistColor%
	Gui SettingsGui:Add, Button, x586 y264 w59 h23 gC_ArtistColor, Change
	Gui SettingsGui:Add, Text, x360 y299 w150 h14, Artist/Album Font Face:
	Gui SettingsGui:Add, DropDownList, vS_ArtistFace x525 y295 w120, %DDLArtistFace%
	Gui SettingsGui:Add, Text, x360 y329 w150 h14, Artist/Album Font Size:
	Gui SettingsGui:Add, Edit, vS_ArtistSize x525 y325 w120 h21, %S_ArtistSize%
	Gui SettingsGui:Add, Text, x360 y359 w150 h14, Artist/Album Font Size:
	Gui SettingsGui:Add, DropDownList, vS_ArtistWeight x525 y355 w120, %DDLArtistWeight%
	Gui SettingsGui:Add, GroupBox, x16 y403 w648 h84, Hotkeys
	Gui SettingsGui:Add, Text, x35 y428 w107 h14, Play/Pause:
	Gui SettingsGui:Add, Hotkey, vS_HotkeyPlayPause x35 y448 w107 h21, %S_HotkeyPlayPause%
	Gui SettingsGui:Add, Text, x161 y428 w107 h14, Previous Track:
	Gui SettingsGui:Add, Hotkey, vS_HotkeyPrevTrack x161 y448 w107 h21, %S_HotkeyPrevTrack%
	Gui SettingsGui:Add, Text, x286 y428 w107 h14, Next Track:
	Gui SettingsGui:Add, Hotkey, vS_HotkeyNextTrack x286 y448 w107 h21, %S_HotkeyNextTrack%
	Gui SettingsGui:Add, Text, x411 y428 w107 h14, Volume Up:
	Gui SettingsGui:Add, Hotkey, vS_HotkeyVolumeUp x411 y448 w107 h21, %S_HotkeyVolumeUp%
	Gui SettingsGui:Add, Text, x536 y428 w107 h14, Volume Up:
	Gui SettingsGui:Add, Hotkey, vS_HotkeyVolumeDown x536 y448 w107 h21, %S_HotkeyVolumeDown%
	Gui SettingsGui:Add, Button, Default x564 y504 w100 h30 gSubmitSettings, Save Settings

	Gui SettingsGui:Show, w680 h550, SNotify Settings
	WinGet, Settings_ID, ID, A
	return
}

;-----------------------------
;--- Settings Save Handler ---
;-----------------------------
SubmitSettings:
{
	Gui, SettingsGui:Submit, NoHide

	S_ToastEnterHex := ReturnEnterAnimateHex(S_ToastEnter)
	S_ToastExitHex := ReturnExitAnimateHex(S_ToastExit)

	;--- Write Settings Data to settings.ini File ---
	IniWrite, %S_GuiColor%, settings.ini, Settings, vS_GuiColor
	IniWrite, %S_GuiTransparency%, settings.ini, Settings, vS_GuiTransparency
	IniWrite, %S_SongColor%, settings.ini, Settings, vS_SongColor
	IniWrite, %S_SongFace%, settings.ini, Settings, vS_SongFace
	IniWrite, %S_SongSize%, settings.ini, Settings, vS_SongSize
	IniWrite, %S_SongWeight%, settings.ini, Settings, vS_SongWeight
	IniWrite, %S_ArtistColor%, settings.ini, Settings, vS_ArtistColor
	IniWrite, %S_ArtistFace%, settings.ini, Settings, vS_ArtistFace
	IniWrite, %S_ArtistSize%, settings.ini, Settings, vS_ArtistSize
	IniWrite, %S_ArtistWeight%, settings.ini, Settings, vS_ArtistWeight
	IniWrite, %S_BorderWidth%, settings.ini, Settings, vS_BorderWidth
	IniWrite, %S_BorderColor%, settings.ini, Settings, vS_BorderColor
	IniWrite, %S_BorderRadius%, settings.ini, Settings, vS_BorderRadius
	IniWrite, %S_BorderTransparency%, settings.ini, Settings, vS_BorderTransparency
	IniWrite, %S_ToastDuration%, settings.ini, Settings, vS_ToastDuration
	IniWrite, %S_ToastEnter%, settings.ini, Settings, vS_ToastEnter
	IniWrite, %S_ToastEnterSpeed%, settings.ini, Settings, vS_ToastEnterSpeed
	IniWrite, %S_ToastExit%, settings.ini, Settings, vS_ToastExit
	IniWrite, %S_ToastExitSpeed%, settings.ini, Settings, vS_ToastExitSpeed
	IniWrite, %S_ToastEnterHex%, settings.ini, Settings, vS_ToastEnterHex
	IniWrite, %S_ToastExitHex%, settings.ini, Settings, vS_ToastExitHex
	IniWrite, %S_HotkeyPlayPause%, settings.ini, Settings, vS_HotkeyPlayPause
	IniWrite, %S_HotkeyPrevTrack%, settings.ini, Settings, vS_HotkeyPrevTrack
	IniWrite, %S_HotkeyNextTrack%, settings.ini, Settings, vS_HotkeyNextTrack
	IniWrite, %S_HotkeyVolumeUp%, settings.ini, Settings, vS_HotkeyVolumeUp
	IniWrite, %S_HotkeyVolumeDown%, settings.ini, Settings, vS_HotkeyVolumeDown

	MsgBox, ,Saved, Your settings have been successfully saved.
	IfMsgBox, OK
		Reload
	return
}

;-----------------------------------------------
;--- Color Picker for Toast Background Color ---
;-----------------------------------------------
C_GuiColor:
{
	P_GuiColor := ColorPicker(0,Settings_ID)
	GuiControl,, S_GuiColor, % MakeRGB(P_GuiColor)
	return
}

;-------------------------------------------
;--- Color Picker for Toast Border Color ---
;-------------------------------------------
C_BorderColor:
{
	P_BorderColor := ColorPicker(0,Settings_ID)
	GuiControl,, S_BorderColor, % MakeRGB(P_BorderColor)
	return
}

;-----------------------------------
;--- Color Picker for Song Color ---
;-----------------------------------
C_SongColor:
{
	P_SongColor := ColorPicker(0,Settings_ID)
	GuiControl,, S_SongColor, % MakeRGB(P_SongColor)
	return
}

;-------------------------------------------
;--- Color Picker for Artist/Album Color ---
;-------------------------------------------
C_ArtistColor:
{
	P_ArtistColor := ColorPicker(0,Settings_ID)
	GuiControl,, S_ArtistColor, % MakeRGB(P_ArtistColor)
	return
}

;----------------------------------------------------------------------
;--- Function to Populate Items to DropDownList and Pre-select Item ---
;----------------------------------------------------------------------
PopulateSelect(Options, SelectedOption){
	result := ""
	splitted := StrSplit(Options,`|)
	Loop, parse, Options, `|
	{
		if (A_Index = splitted.MaxIndex()) {
			result .= A_LoopField
		} else {
			result .= A_LoopField "|"
		}

		if (A_LoopField = SelectedOption) {
			result .= "|"
		}
	}

	return result
}

;--------------------------------------------------------
;--- Function to Return Hex Code for Enter Animations ---
;--------------------------------------------------------
ReturnEnterAnimateHex(Name){
	Animations := Object("Roll Left to Right", "0x20001", "Roll Right to Left", "0x20002", "Roll Top to Bottom", "0x20004", "Roll Bottom to Top", "0x20008", "Slide Left to Right", "0x40001", "Slide Right to Left", "0x40002", "Slide Top to Bottom", "0x40004", "Slide Bottom to Top", "0x40008", "Zoom In", "0x16", "Fade In", "0xA0000")

	for Key, Value in Animations
	    if (Key = Name)
	    	return Value
}

;-------------------------------------------------------
;--- Function to Return Hex Code for Exit Animations ---
;-------------------------------------------------------
ReturnExitAnimateHex(Name){
	Animations := Object("Roll Left to Right", "0x10001", "Roll Right to Left", "0x10002", "Roll Top to Bottom", "0x10004", "Roll Bottom to Top", "0x10008", "Slide Left to Right", "0x50001", "Slide Right to Left", "0x50002", "Slide Top to Bottom", "0x50004", "Slide Bottom to Top", "0x50008", "Zoom Out", "0x10010", "Fade Out", "0x90000")

	for Key, Value in Animations
	    if (Key = Name)
	    	return Value
}

;---------------------------------------
;--- Function to Render Color Picker ---
;---------------------------------------
ColorPicker(Color,Window_ID){
	static
	VarSetCapacity(CUSTOM,16*A_PtrSize,0),cc:=1,size:=VarSetCapacity(CHOOSECOLOR,9*A_PtrSize,0)
	NumPut(size,CHOOSECOLOR,0,"UInt"),NumPut(Window_ID,CHOOSECOLOR,A_PtrSize,"UPtr")
	,NumPut(Color,CHOOSECOLOR,3*A_PtrSize,"UInt"),NumPut(3,CHOOSECOLOR,5*A_PtrSize,"UInt")
	,NumPut(&CUSTOM,CHOOSECOLOR,4*A_PtrSize,"UPtr")
	ret:=DllCall("comdlg32\ChooseColor","UPtr",&CHOOSECOLOR,"UInt")
	if !ret
	exit
	Color:=NumGet(CHOOSECOLOR,3*A_PtrSize,"UInt")
	return Color
}

;------------------------------------------
;--- Function to Convert Decimal to Hex ---
;------------------------------------------
MakeRGB(c){
	setformat,IntegerFast,H
	c:=(c&255)<<16|(c&65280)|(c>>16),c:=SubStr(c,1)
	SetFormat,IntegerFast,D
	return c
}