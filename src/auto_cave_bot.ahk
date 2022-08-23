#include header.ahk

;keys
Global auto_use_rune_hk := ini_read("config.ini", "tibia_hotkeys", "use_rune")
Global ultimate_spell_hk := ini_read("config.ini", "tibia_hotkeys", "ultimate_spell")
Global script := ini_read("config.ini", "cave_bot", "script")

SetTimer, AttackFirstOnBattle, 1000
SetTimer, UseUltimate, 10000

AttackFirstOnBattle(){
    global found_x
    global found_y

    if window_active(main_char_window) and find_on_screen("battle", found_x, found_y)
        click_x := found_x + 50
        click_y := found_y + 50

        if has_on_screen_spec("targeting", found_x, found_y, found_x + 200, found_y + 300)
            UseRune()
        else
            ControlClick, x%click_x% y%click_y%, %main_char_window%        
}

UseUltimate(){
    if window_active(main_char_window) and find_on_screen("battle", found_x, found_y)
        send(ultimate_spell_hk,)
}

UseRune() {
    send(auto_use_rune_hk)
}