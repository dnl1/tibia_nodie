#include header.ahk

;SetTimer, RandomMov, 500
1:: ligarScript := !ligarScript

ligarScript := false

RandomMov(){
    if window_active(main_char_window)
        arr := ["w", "a", "s", "d"]
        Random, oVar, 1, 4						
        send % arr[oVar]
}