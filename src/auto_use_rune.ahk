#include header.ahk

tool_tip_id := 9

;keys
auto_use_rune_hk := ini_read("config.ini", "tibia_hotkeys", "auto_use_rune")

Hotkey, IfWinActive, %main_char_window%

SetTimer, TRY_USE_RUNE, -3000
return

SUSP:
    Suspend
    on_off_tooltip("Auto rune", main_char_window, tool_tip_id)
    if !is_suspended()
        SetTimer, TRY_USE_RUNE, -500
    Return

TRY_USE_RUNE:
    if is_suspended()
        SetTimer, TRY_USE_RUNE, Off
    else if !window_active(main_char_window)
        SetTimer, TRY_USE_RUNE, -3000
    else if use_rune()
        SetTimer, TRY_USE_RUNE, % -3000

    SetTimer, TRY_USE_RUNE, % -3000

    return

use_rune() {
    if has_on_screen("targeting")
    {
        send(auto_use_rune_hk)
        return true
    }
    
    Send, {F9}
    return false
}