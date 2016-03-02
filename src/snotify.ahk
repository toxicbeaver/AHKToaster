;-----------------------------------------------------------
;---                     SNotify v1.0                    ---
;---                                                     ---
;---                  2016, Adnan Topal                  ---
;---            github.com/adnantopal/snotify            ---
;-----------------------------------------------------------

SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance,Force
#Persistent

;-----------------------------------------------------------
;--- Watch for Title Changes of Spotify Every 1/2 Second ---
;-----------------------------------------------------------
WinTitle = Spotify
SetTimer, TitleChanged, 500

;-----------------------------------
;--- Modify System Tray and Menu ---
;-----------------------------------
Menu, Tray, NoStandard
Menu, Tray, Tip, SNotify
Menu, Tray, Add, About, AboutMenuHandler
Menu, Tray, Add, Settings, SettingsMenuHandler
Menu, Tray, Add
Menu, Tray, Add, Exit, Exit

;-----------------------------------------------------
;--- Retrieve Settings Data from settings.ini File ---
;-----------------------------------------------------
IniRead, S_GuiColor, settings.ini, Settings, vS_GuiColor
IniRead, S_GuiTransparency, settings.ini, Settings, vS_GuiTransparency
IniRead, S_SongColor, settings.ini, Settings, vS_SongColor
IniRead, S_SongFace, settings.ini, Settings, vS_SongFace
IniRead, S_SongSize, settings.ini, Settings, vS_SongSize
IniRead, S_SongWeight, settings.ini, Settings, vS_SongWeight
IniRead, S_ArtistColor, settings.ini, Settings, vS_ArtistColor
IniRead, S_ArtistFace, settings.ini, Settings, vS_ArtistFace
IniRead, S_ArtistSize, settings.ini, Settings, vS_ArtistSize
IniRead, S_ArtistWeight, settings.ini, Settings, vS_ArtistWeight
IniRead, S_BorderWidth, settings.ini, Settings, vS_BorderWidth
IniRead, S_BorderColor, settings.ini, Settings, vS_BorderColor
IniRead, S_BorderRadius, settings.ini, Settings, vS_BorderRadius
IniRead, S_BorderTransparency, settings.ini, Settings, vS_BorderTransparency
IniRead, S_ToastDuration, settings.ini, Settings, vS_ToastDuration
IniRead, S_ToastEnter, settings.ini, Settings, vS_ToastEnter
IniRead, S_ToastEnterSpeed, settings.ini, Settings, vS_ToastEnterSpeed
IniRead, S_ToastEnterHex, settings.ini, Settings, vS_ToastEnterHex
IniRead, S_ToastExit, settings.ini, Settings, vS_ToastExit
IniRead, S_ToastExitSpeed, settings.ini, Settings, vS_ToastExitSpeed
IniRead, S_ToastExitHex, settings.ini, Settings, vS_ToastExitHex
IniRead, S_HotkeyPlayPause, settings.ini, Settings, vS_HotkeyPlayPause
IniRead, S_HotkeyPrevTrack, settings.ini, Settings, vS_HotkeyPrevTrack
IniRead, S_HotkeyNextTrack, settings.ini, Settings, vS_HotkeyNextTrack
IniRead, S_HotkeyVolumeUp, settings.ini, Settings, vS_HotkeyVolumeUp
IniRead, S_HotkeyVolumeDown, settings.ini, Settings, vS_HotkeyVolumeDown

;--------------------
;--- Key Mappings ---
;--------------------
Hotkey, %S_HotkeyPlayPause%, HotkeyPlayPause
Hotkey, %S_HotkeyPrevTrack%, HotkeyPrevTrack
Hotkey, %S_HotkeyNextTrack%, HotkeyNextTrack
Hotkey, %S_HotkeyVolumeUp%, HotkeyVolumeUp
Hotkey, %S_HotkeyVolumeDown%, HotkeyVolumeDown
return

;------------------------------------------------
;--- Show Notification Whenever Title Changes ---
;------------------------------------------------
TitleChanged:
{
	DetectHiddenWindows, On
	WinGetTitle, ChangedTitle, ahk_class SpotifyMainWindow

	if (ChangedTitle = WinTitle) {
		return
	}

	WinTitle := ChangedTitle

	if (ChangedTitle = "Spotify") {
		trackName = Spotify
		artistName = Paused
		albumName = ...
		artwork = %A_ScriptDir%\snotify.ico
	} else {
		StringReplace, GuiText, ChangedTitle, &, and 
		split:= " - "
		StringReplace, GuiText, GuiText, %split%, *
		StringSplit, trackInfo, GuiText, *

		tempfile = %temp%\SNotifyData
		searchArtist := UriEncode(trackInfo1)
		searchTrack := UriEncode(trackInfo2)

		FileEncoding, UTF-8
		UrlDownloadToFile, https://itunes.apple.com/search?media=music&entity=musicArtist&term=%searchArtist%&entity=allTrack&term=%searchArtist%+%searchTrack%&limit=1, %tempfile%
		FileRead, SNotifyData, %tempfile%
		FileDelete, %tempfile%

		; Get Album Art
		artURL:= RegExReplace(SNotifyData, ".*""(artworkUrl60)"":""(.*?).jpg"".*","$2")
		IfInString, artURL, resultCount
		{
			artwork = %A_ScriptDir%\snotify.ico
		} else {	  
			UrlDownloadToFile, %artURL%.jpg, %tempfile%.jpg
			artwork = %tempfile%.jpg
		}

		; Get Track Name	  
		trackName:= RegExReplace(SNotifyData, ".*""(trackName)"":""(.*?)"".*","$2")
		IfInString, trackName, resultCount
		{
			trackName:= ReplaceAll(trackInfo2)
		} else {
			trackName:= ReplaceAll(trackName)
		}

		; Get Artist Name	  
		artistName:= RegExReplace(SNotifyData, ".*""(artistName)"":""(.*?)"".*","$2")
		IfInString, artistName, resultCount
		{
			artistName:= ReplaceAll(trackInfo1)
		} else {
			artistName:= ReplaceAll(artistName)
		}

		; Get Album Name	  
		albumName:= RegExReplace(SNotifyData, ".*""(collectionName)"":""(.*?)"".*","$2")
		IfInString, albumName, resultCount
		{
			albumName:= "-"
		} else {
			albumName:= ReplaceAll(albumName)
		}
	}

	Notify(trackName,artistName . "`n" . albumName, S_ToastDuration,"GC=" S_GuiColor " GT=" S_GuiTransparency " TC=" S_SongColor " TF=" S_SongFace " TS=" S_SongSize " TW=" S_SongWeight " MC=" S_ArtistColor " MF=" S_ArtistFace " MS=" S_ArtistSize " MW=" S_ArtistWeight " BW=" S_BorderWidth " BC=" S_BorderColor " GR=" S_BorderRadius " BR=" S_BorderRadius " BT=" S_BorderTransparency " AI=" S_ToastEnterHex " AO=" S_ToastExitHex " SI=" S_ToastEnterSpeed " ST=" S_ToastExitSpeed " IW=60 IH=60 Image=" . artwork)

	FileDelete, %tempfile%.jpg
	FileDelete, %tempfile%.png

	DetectHiddenWindows, Off
	return
}

;----------------
;--- Exit App ---
;----------------
Exit:
{
	ExitApp
	return
}

;------------------
;--- About Menu ---
;------------------
AboutMenuHandler:
{
	Gui AboutGui:New, -MinimizeBox -MaximizeBox
	Gui AboutGui:Color, White
	Gui AboutGui:Font, s12 w600 q5
	Gui AboutGui:Add, Text, x140 y25 w120 h23 Center +0x200, SNotify v1.0
	Gui AboutGui:Font
	Gui AboutGui:Font, s10 q5
	Gui AboutGui:Add, Text, x20 y60 w360 h40 Center, This is an open source project by Adnan Topal. Source code is available at following address:
	Gui AboutGui:Font
	Gui AboutGui:Font, s10 q5
	Gui AboutGui:Add, Link, x110 y110 w180 h23, <a href="https:/github.com/adnantopal/snotify">github.com/adnantopal/snotify</a>
	Gui AboutGui:Font
	Gui AboutGui:Show, w400 h160, About SNotify
	return
}

;------------------
;--- Play/Pause ---
;------------------
HotkeyPlayPause:
{
	Send {Media_Play_Pause}
	return
}

;----------------------
;--- Previous Track ---
;----------------------
HotkeyPrevTrack:
{
	Send {Media_Prev}
	return
}

;------------------
;--- Next Track ---
;------------------
HotkeyNextTrack:
{
	Send {Media_Next}
	return
}

;-----------------
;--- Volume Up ---
;-----------------
HotkeyVolumeUp:
{
	Send {Volume_Up}
	return
}

;-------------------
;--- Volume Down ---
;-------------------
HotkeyVolumeDown:
{
	Send {Volume_Down}
	return
}

ReplaceAll(Input){
	replace := {"&":"and","’":""}

	For what, with in replace
		StringReplace, Output, Input, %what%, %with%, All

	return Output
}

UriEncode(Uri, Enc = "UTF-8"){
	StrPutVar(Uri, Var, Enc)
	f := A_FormatInteger
	SetFormat, IntegerFast, H
	Loop
	{
		Code := NumGet(Var, A_Index - 1, "UChar")
		If (!Code)
			Break
		If (Code >= 0x30 && Code <= 0x39 ; 0-9
			|| Code >= 0x41 && Code <= 0x5A ; A-Z
			|| Code >= 0x61 && Code <= 0x7A) ; a-z
			Res .= Chr(Code)
		Else
			Res .= "%" . SubStr(Code + 0x100, -1)
	}
	SetFormat, IntegerFast, %f%
	Return, Res
}

StrPutVar(Str, ByRef Var, Enc = ""){
	Len := StrPut(Str, Enc) * (Enc = "UTF-16" || Enc = "CP1200" ? 2 : 1)
	VarSetCapacity(Var, Len, 0)
	Return, StrPut(Str, &Var, Enc)
}

#Include, notify.ahk
#Include, settings.ahk