#include header.ahk

SetControlDelay -1
SetTimer, BaterVarinha, 5000
SetTimer, MandarSpell, 1000

;O QUE O SCRIPT FAZ: A CADA 5 SEGUNDOS O SCRIPT BATE VARINHA NO DUMMY E FICA RENOVANDO CONFORME FOR ACABANDO
;COMO UTILIZAR ESTE SCRIPT PARA BATER VARINHA:
;APERTE F1 NO LOCAL ONDE VC COLOCOU A HOTKEY DA VARINHA (PRECISA ESTAR NA BARRA DE HOTKEYS)
;APERTE F2 NO SQM ONDE ESTÁ O DUMMY
;APERTE F2 e F4 EM ALGUMA HOTKEY DE MAGIA QUE VC QUEIRA USAR DURANTE O TREINO
;APERTE F5 NA HOTKEY QUE VC COLOCOU A COMIDA
;APERTE 1 NO TECLADO NUMERICO PARA LIGAR/DESLIGAR O SCRIPT
;APERTA 8 NO TECLADO NUMERICO PARA PAUSAR O SCRIPT POR COMPLETO
;APERTE 9 NO TECLADO NUMERICO PARA FECHAR O SCRIT

; Hotkeys do teclado numerico
1:: ligarScript := !ligarScript

F1:: CoordenadaVarinha()
F2:: CoordenadaDummy()
F3:: CoordenadaMagia1()
F5:: CoordenadaComida()

coorXVarinha := 0
coorYVarinha := 0

coorXDummy := 0
coorYDummy := 0

coorXMagia1 := 0
coorYMagia1 := 0

coorXComida := 0
coorYComida := 0

ligarScript := false

BaterVarinha()
{
	global coorXVarinha
	global coorYVarinha
	global coorXDummy
	global cooryDummy
	global ligarScript
	
	if (ligarScript = true)
	{
		ControlClick, x%coorXVarinha% y%coorYVarinha%, %main_char_window%
		ControlClick, x%coorXDummy% y%coorYDummy%, %main_char_window%
	}
}

MandarSpell()
{
	global ligarScript
	global coorXMagia1
	global coorYMagia1
	global coorXComida
	global coorYComida
	
	if (ligarScript = true)
	{
		ControlClick, x%coorXMagia1% y%coorYMagia1%, %main_char_window% ; Magia 1
		ControlClick, x%coorXComida% y%coorYComida%, %main_char_window% ; Comida
	}
}

CoordenadaVarinha()
{
	global coorXVarinha
	global coorYVarinha

	MouseGetPos, MouseX, MouseY
	
	coorXVarinha := MouseX
	coorYVarinha := MouseY
}

CoordenadaDummy()
{
	global coorXDummy
	global cooryDummy

	MouseGetPos, MouseX, MouseY
	
	coorXDummy := MouseX
	coorYDummy := MouseY
}

CoordenadaMagia1()
{
	global coorXMagia1
	global cooryMagia1

	MouseGetPos, MouseX, MouseY
	
	coorXMagia1 := MouseX
	cooryMagia1 := MouseY
}

CoordenadaComida()
{
	global coorXComida
	global coorYComida

	MouseGetPos, MouseX, MouseY
	
	coorXComida := MouseX
	coorYComida := MouseY
}