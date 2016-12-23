;-----------------------------------------------------------
;---                   AHKToaster v1.0                   ---
;---                                                     ---
;---                2016, Damian Birkowski               ---
;---          github.com/toxicbeaver/AHKToaster          ---
;---                     forked from:                    ---
;---            github.com/adnantopal/snotify            ---
;-----------------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off

;-----------------------------------------------------
;--- Retrieve Settings Data from settings.ini File ---
;-----------------------------------------------------
IniRead, S_GuiColor, settings.ini, Settings, vS_GuiColor
IniRead, S_GuiTransparency, settings.ini, Settings, vS_GuiTransparency
IniRead, S_TitleColor, settings.ini, Settings, vS_TitleColor
IniRead, S_TitleFace, settings.ini, Settings, vS_TitleFace
IniRead, S_TitleSize, settings.ini, Settings, vS_TitleSize
IniRead, S_TitleWeight, settings.ini, Settings, vS_TitleWeight
IniRead, S_BodyColor, settings.ini, Settings, vS_BodyColor
IniRead, S_BodyFace, settings.ini, Settings, vS_BodyFace
IniRead, S_BodySize, settings.ini, Settings, vS_BodySize
IniRead, S_BodyWeight, settings.ini, Settings, vS_BodyWeight
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

;--------------------------------------------
;--- Read parameters passed to the script ---
;--------------------------------------------
title = %1%
body = %2%

;----------------------------
;--- Run the notification ---
;----------------------------
Notify(title,body, S_ToastDuration,"GC=" S_GuiColor " GT=" S_GuiTransparency " TC=" S_TitleColor " TF=" S_TitleFace " TS=" S_TitleSize " TW=" S_TitleWeight " MC=" S_BodyColor " MF=" S_BodyFace " MS=" S_BodySize " MW=" S_BodyWeight " BW=" S_BorderWidth " BC=" S_BorderColor " GR=" S_BorderRadius " BR=" S_BorderRadius " BT=" S_BorderTransparency " AI=" S_ToastEnterHex " AO=" S_ToastExitHex " SI=" S_ToastEnterSpeed " ST=" S_ToastExitSpeed)

;----------------
;--- Includes ---
;----------------
#Include, Notify.ahk