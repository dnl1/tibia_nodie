#include api_misc.ahk

Global activate_chat_key := ini_read("config.ini", "tibia_hotkeys", "activate_chat")
Global activate_npc_channel_key := ini_read("config.ini", "tibia_hotkeys", "activate_npc_channel")

run_tibia() {

    SetTitleMatchMode, 1

    if !window_exist("Tibia")
    {
        SetTitleMatchMode, 3
        RunWait, safebra.exe, C:\Safebra\Safebra 04-03\bin\
        sleep(random_k(9, 12))
    }

    SetTitleMatchMode, 3
}

activate_npc_channel() {

    send_sleep(activate_chat_key, random(75, 115))
    send_sleep(activate_npc_channel_key, random(75, 115))
    send_string("hi")
}

trade() {

    activate_npc_channel()
    send_string("trade")
}

travel(byRef city) {

    activate_npc_channel()
    send_string(city)
    if (city = darashia) send_string("yes")
    send_string("yes")
}

equipment_has_image(image_file_name)
{

    return find_image(image_file_name)
}

logged_in() {

    SetTitleMatchMode, 1

    logged := window_exist("Tibia - ")

    SetTitleMatchMode, 3

    return logged
}

wait_logged_in() {


    tries := 10
    i := 0

    while (i < tries)
    {

        if logged_in()
            return true

        i := i + 1
        sleep(random_k(1, 2))
    }

    return false
}

;If it is not working use window spy to get new coordinates of tibia's status condition bar
Global status_box_x_beg := 1750
Global status_box_x_end := 1858
Global status_box_y_beg := 264
Global status_box_y_end := 272 ;first layer only

has_status_condition(byref status_condition) {

    folder := "img/"
    extension := ".png"
    status_condition_image := folder . status_condition . extension

    return find_image_in(status_condition_image, status_box_x_beg, status_box_y_beg, status_box_x_end, status_box_y_end)
}

;If it is not working use window spy to get new coordinates of tibia's status condition bar
Global screen_box_x_beg := 177
Global screen_box_x_end := 1378
Global screen_box_y_beg := 58
Global screen_box_y_end := 797 ;main screen
has_on_screen(byref item) {

    folder := "img/"
    extension := ".png"
    status_condition_image := folder . item . extension

    return find_image_in(status_condition_image, screen_box_x_beg, screen_box_y_beg, screen_box_x_end, screen_box_y_end)
}

has_on_screen_spec(byref item, byref x_beg, byref y_beg, byref x_end, byref y_end) {

    folder := "img/"
    extension := ".png"
    status_condition_image := folder . item . extension

    return find_image_in(status_condition_image, x_beg, y_beg, x_end, y_end)
}


find_on_screen(byref item, byref found_x = 0, byref found_y = 0) {

    folder := "img/"
    extension := ".png"
    status_condition_image := folder . item . extension

    return find_image_in(status_condition_image, 0, 0, A_ScreenWidth, A_ScreenHeight, found_x, found_y)
}

