#include header.ahk

SetBatchLines, 7ms
tool_tip_id := 8

;Keys
Global auto_food_hk := ini_read("config.ini", "tibia_hotkeys", "auto_food")

Global general_suspend_hk := ini_read("config.ini", "control", "suspend")

Hotkey, IfWinActive, %main_char_window%
Hotkey, %general_suspend_hk%, SUSP

SetTimer, TRY_FOOD, -3000
return

SUSP:
    Suspend
    on_off_tooltip("Auto FOOD", main_char_window, tool_tip_id)
    SetTimer, REMOVE_TOOL_TIP, -2000
    if !is_suspended()
        SetTimer, TRY_FOOD, -500
    Return

REMOVE_TOOL_TIP:
    Tooltip,,,, %tool_tip_id%
    return

TRY_FOOD:
    if is_suspended()
        SetTimer, TRY_FOOD, Off        
    else if !window_active(main_char_window)
        SetTimer, TRY_FOOD, -3000
    else if do_food()
        SetTimer, TRY_FOOD, -3000
    
    SetTimer, TRY_FOOD, -3000
    return

do_food() {
    if has_status_condition("hungry")
    {
        tries := 10
        i := 0

        while (i < tries)
        {
            send(auto_food_hk)

            i := i + 1
            sleep(random_k(1, 2))
        }  
       return true
    }

    return false
}