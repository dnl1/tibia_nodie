#include header.ahk

spell_keys := ini_read_array("config.ini", "tibia_hotkeys", "spell")
boots_keys := ini_read_array("config.ini", "tibia_hotkeys", "boots")
food_keys := ini_read_array("config.ini", "tibia_hotkeys", "food")
mana_waste_keys := ini_read_array("config.ini", "tibia_hotkeys", "mana_waste")

SetTimer, FOOD, % -random_k(0, 1)
;SetTimer, BOOTS, % -random_k(2, 3)
SetTimer, SPELL, % -random_k(6, 7)
SetTimer, MANA_WASTE, % -random_k(8, 9)
Return

FOOD:
    Loop 6
    {
        control_send_random_key_window(food_keys, main_char_window)
    }

    SetTimer, FOOD, % random_k(240, 360)
    Return

BOOTS:
    Critical
    control_send_random_key_window(boots_keys, main_char_window)
    SetTimer, BOOTS, % random_k(300, 450)
    Return

SPELL:
    control_send_random_key_window(spell_keys, main_char_window)
    if (random(1, 10) = 10)
        SetTimer, SPELL, % random(2, 5)
    Else
        SetTimer, SPELL, % random(70, 80)
    Return

MANA_WASTE:
    control_send_random_key_window(mana_waste_keys, main_char_window)
    SetTimer, MANA_WASTE, % random_k(100, 115)
    Return