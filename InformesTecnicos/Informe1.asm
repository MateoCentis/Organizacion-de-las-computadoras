#bits 0 a 3 de 0x10000 se utilizan para controlar un decodificador 4 a 16 para activar las COLUMNAS de 
	#la matriz del teclado.
#bits 4 a 7 de 0x10000 se utilizan para controlar el encendido de los leds indicadores,
	#un estado l�gico (1) en cualquiera de estas lineas enciende el led correspondiente, mientras que el (0) lo apaga.
#bits 0 a 5 de 0x10001 se utilizan para leer las filas de la matriz del teclado, una fila por bit. 
	#una tecla esta apretada cu�ndo se lee un estado alto (1) en la fila correspondiente.
#bits 6 a 7 de 0x10001 se utiliza para leer el estado de los botones del trackball, se lee un estado l�gico alto (1)
	#cu�ndo el boton ha sido pulsado, en caso contrario se lee bajo (0)
#0x10002 y 0x10003 contienen la informaci�n del desplazamiento angular del trackball en X e Y.
.extern direccionRecepcion,1 #Puerto donde se va a escribir la tecla presionada

.data
pTeclaEsc: .asciz "El usuario presiono la tecla escape\n"
		  .align 2
pTeclaF1: .asciz "El usuario presiono la tecla F1\n"
		  .align 2
pTeclaF2: .asciz "El usuario presiono la tecla F2\n"
		  .align 2
pTeclaF3: .asciz "El usuario presiono la tecla F3\n"
		  .align 2
pTeclaF4: .asciz "El usuario presiono la tecla F4\n"
		  .align 2
pTeclaF5: .asciz "El usuario presiono la tecla F5\n"
		  .align 2
pTeclaF6: .asciz "El usuario presiono la tecla F6\n"
		  .align 2
pTeclaF7: .asciz "El usuario presiono la tecla F7\n"
		  .align 2
pTeclaF8: .asciz "El usuario presiono la tecla F8\n"
		  .align 2
pTeclaF9: .asciz "El usuario presiono la tecla F9\n"
		  .align 2
pTeclaF10: .asciz "El usuario presiono la tecla F10\n"
		  .align 2
pTeclaF11: .asciz "El usuario presiono la tecla F11\n"
		  .align 2
pTeclaF12: .asciz "El usuario presiono la tecla F12\n"
		  .align 2
pTeclaPrtScr: .asciz "El usuario presiono la tecla PtrScr\n"
		  .align 2
pTeclaPause: .asciz "El usuario presiono la tecla Pause\n"
		  .align 2
pTeclaElevado: .asciz "El usuario presiono la tecla ^\n"
		  .align 2
pTecla1: .asciz "El usuario presiono la tecla 1\n"
		  .align 2
pTecla2: .asciz "El usuario presiono la tecla 2\n"
		  .align 2
pTecla3: .asciz "El usuario presiono la tecla 3\n"
		  .align 2
pTecla4: .asciz "El usuario presiono la tecla 4\n"
		  .align 2
pTecla5: .asciz "El usuario presiono la tecla 5\n"
		  .align 2
pTecla6: .asciz "El usuario presiono la tecla 6\n"
		  .align 2
pTecla7: .asciz "El usuario presiono la tecla 7\n"
		  .align 2
pTecla8: .asciz "El usuario presiono la tecla 8\n"
		  .align 2
pTecla9: .asciz "El usuario presiono la tecla 9\n"
		  .align 2
pTecla0: .asciz "El usuario presiono la tecla 0\n"
		  .align 2
pTeclaBeta: .asciz "El usuario presiono la tecla ?\n"
		  .align 2
pTeclaTilde: .asciz "El usuario presiono la tecla tilde\n"
		  .align 2
pTeclaBackSpace: .asciz "El usuario presiono la tecla BackSpace\n"
		  .align 2
pTeclaHome: .asciz "El usuario presiono la tecla Home\n"
		  .align 2
pTeclaTab: .asciz "El usuario presiono la tecla Tab\n"
		  .align 2
pTeclaQ: .asciz "El usuario presiono la tecla q\n"
		  .align 2
pTeclaW: .asciz "El usuario presiono la tecla w\n"
		  .align 2
pTeclaE: .asciz "El usuario presiono la tecla e\n"
		  .align 2
pTeclaR: .asciz "El usuario presiono la tecla r\n"
		  .align 2
pTeclaT: .asciz "El usuario presiono la tecla t\n"
		  .align 2
pTeclaZ: .asciz "El usuario presiono la tecla z\n"
		  .align 2
pTeclaU: .asciz "El usuario presiono la tecla u\n"
		  .align 2
pTeclaI: .asciz "El usuario presiono la tecla i\n"
		  .align 2
pTeclaO: .asciz "El usuario presiono la tecla o\n"
		  .align 2
pTeclaP: .asciz "El usuario presiono la tecla p\n"
		  .align 2
pTeclaUDieresis: .asciz "El usuario presiono la tecla u dieresis\n"
		  .align 2
pTeclaMas: .asciz "El usuario presiono la tecla +\n"
		  .align 2
pTeclaEnter: .asciz "El usuario presiono la tecla Enter\n"
		  .align 2
pTeclaPgUp: .asciz "El usuario presiono la tecla PgUp\n"
		  .align 2
pTeclaCaps: .asciz "El usuario presiono la tecla Caps\n"
		  .align 2
pTeclaA: .asciz "El usuario presiono la tecla pTecla\n"
		  .align 2
pTeclaS: .asciz "El usuario presiono la tecla s\n"
		  .align 2
pTeclaD: .asciz "El usuario presiono la tecla d\n"
		  .align 2
pTeclaF: .asciz "El usuario presiono la tecla f\n"
		  .align 2
pTeclaG: .asciz "El usuario presiono la tecla g\n"
		  .align 2
pTeclaH: .asciz "El usuario presiono la tecla h\n"
		  .align 2
pTeclaJ: .asciz "El usuario presiono la tecla j\n"
		  .align 2
pTeclaK: .asciz "El usuario presiono la tecla k\n"
		  .align 2
pTeclaL: .asciz "El usuario presiono la tecla l\n"
		  .align 2
pTeclaODieresis: .asciz "El usuario presiono la tecla �\n"
		  .align 2
pTeclaADieresis: .asciz "El usuario presiono la tecla �\n"
		  .align 2
pTeclaNumeral: .asciz "El usuario presiono la tecla #\n"
		  .align 2
pTeclaPgDn: .asciz "El usuario presiono la tecla PgDn\n"
		  .align 2
pTeclaShiftIzq: .asciz "El usuario presiono la tecla shift izquierdo\n"
		  .align 2
pTeclaMenor: .asciz "El usuario presiono la tecla <\n"
		  .align 2
pTeclaY: .asciz "El usuario presiono la tecla y\n"
		  .align 2
pTeclaX: .asciz "El usuario presiono la tecla x\n"
		  .align 2
pTeclaC: .asciz "El usuario presiono la tecla c\n"
		  .align 2
pTeclaV: .asciz "El usuario presiono la tecla v\n"
		  .align 2
pTeclaB: .asciz "El usuario presiono la tecla b\n"
		  .align 2
pTeclaN: .asciz "El usuario presiono la tecla n\n"
		  .align 2
pTeclaM: .asciz "El usuario presiono la tecla m\n"
		  .align 2
pTeclaComa: .asciz "El usuario presiono la tecla ,\n"
		  .align 2
pTeclaPunto: .asciz "El usuario presiono la tecla .\n"
		  .align 2
pTeclaGuion: .asciz "El usuario presiono la tecla -\n"
		  .align 2
pTeclaShiftDer: .asciz "El usuario presiono la tecla shift derecho\n"
		  .align 2
pTeclaUpKey: .asciz "El usuario presiono la tecla upKey\n"
		  .align 2
pTeclaEnd: .asciz "El usuario presiono la tecla endKey\n"
		  .align 2
pTeclaFn: .asciz "El usuario presiono la tecla function\n"
		  .align 2
pTeclaCtrl: .asciz "El usuario presiono la tecla control\n"
		  .align 2
pTeclaAlt: .asciz "El usuario presiono la tecla alt\n"
		  .align 2
pTeclaSpace: .asciz "El usuario presiono la tecla espacio\n"
		  .align 2
pTeclaAltGr: .asciz "El usuario presiono la tecla alt Gr\n"
		  .align 2
pTeclaInsert: .asciz "El usuario presiono la tecla insert\n"
		  .align 2
pTeclaDelete: .asciz "El usuario presiono la tecla delete\n"
		  .align 2
pTeclaLeftKey: .asciz "El usuario presiono la tecla leftKey\n"
		  .align 2
pTeclaDownKey: .asciz "El usuario presiono la tecla downKey\n"
		  .align 2
pTeclaRightKey: .asciz "El usuario presiono la tecla rightKey\n"
		  .align 2
encendidoLedCaps: .asciz "El led de Caps esta encendido\n"
		  .align 2
encendidoLedNum: .asciz "El led de Num esta encendido\n"
		  .align 2
encendidoLedScroll: .asciz "El led de Scroll esta encendido\n"
		  .align 2
encendidoLedPad: .asciz "El led de Pad esta encendido\n"
		  .align 2
pBotonDerecho: .asciz "Se ha presionado el boton derecho del Trackball\n"
		  .align 2
pBotonIzquierdo: .asciz "Se ha presionado el boton izquierdo del Trackball\n"
		  .align 2
desplazamientoX: .asciz "El trackball se ha desplazado en X: "
		  .align 2
desplazamientoY: .asciz "\nEl trackball se ha desplazado en Y: "
		  .align 2
.extern colLeds,1
.extern filTrackball,1
.extern trackballX,1
.extern trackballY,1
.text
	li a7,4
	#carga de valores en memoria
	#fila 6:100000 columna:3 0110
	#Para tecla espacio: 0000000010000000 01100000 10110011
	#t3:00000000 t2:10000000 t1:01000100 t0:10110110
	#li t1,0x804486 #para tecla z
	li t1,0x8060B3 #para tecla espacio
	sw t1,colLeds,t2
	#recuperacion de valores en registros
	lb t0,colLeds
	lb t1,filTrackball
	lb t2,trackballX
	lb t3,trackballY
  #carga de la direccion
  la t6,direccionRecepcion
	#comparador por columna
	andi s2,t0,0xF
	#chequeo primero por filas
	#00111111
	andi s0,t1,0x3F
#---------------------------------------------------------primera fila---------------------------------------------------------------------
	#carga en registro para comparacion
	addi s1,zero,0x1
	bne s0,s1,segundaFila
      #tecla escape
      addi s1,zero,0x0
      bne s2,s1,teclaF1
      addi s9,zero,27
      sb s9,t6
      la a0,pTeclaEsc
      j leds
		teclaF1:
      addi s1,zero,0x1
      bne s2,s1,teclaF2
      addi s9,zero,112
      sb s9,t6
      la a0,pTeclaF1
      j leds
		teclaF2:
      addi s1,zero,0x2
      bne s2,s1,teclaF3
      addi s9,zero,113
      sb s9,t6
      la a0,pTeclaF2
      j leds
		teclaF3:
      addi s1,zero,0x3
      bne s2,s1,teclaF4
      addi s9,zero,114
      sb s9,t6
      la a0,pTeclaF3
      j leds
		teclaF4:
      addi s1,zero,0x4
      bne s2,s1,teclaF5
      addi s9,zero,115
      sb s9,t6
      la a0,pTeclaF4
      j leds
		teclaF5:
      addi s1,zero,0x5
      bne s2,s1,teclaF6
      addi s9,zero,116
      sb s9,t6
      la a0,pTeclaF5
      j leds
		teclaF6:
      addi s1,zero,0x6
      bne s2,s1,teclaF7
      addi s9,zero,117
      sb s9,t6
      la a0,pTeclaF6
      j leds
		teclaF7:
      addi s1,zero,0x7
      bne s2,s1,teclaF8
      addi s9,zero,118
      sb s9,t6
      la a0,pTeclaF7
      j leds
		teclaF8:
      addi s1,zero,0x8
      bne s2,s1,teclaF9
      addi s9,zero,119
      sb s9,t6
      la a0,pTeclaF8
      j leds
		teclaF9:
      addi s1,zero,0x9
      bne s2,s1,teclaF10
      addi s9,zero,120
      sb s9,t6
      la a0,pTeclaF9
      j leds
		teclaF10:
      addi s1,zero,0xA
      bne s2,s1,teclaF11
      addi s9,zero,121
      sb s9,t6
      la a0,pTeclaF10
      j leds
		teclaF11:
      addi s1,zero,0xB
      bne s2,s1,teclaF12
      addi s9,zero,122
      sb s9,t6
      la a0,pTeclaF11
      j leds
		teclaF12:
      addi s1,zero,0xC
      bne s2,s1,teclaPrtScr
      addi s9,zero,123
      sb s9,t6
      la a0,pTeclaF12
      j leds
		teclaPrtScr:#print screen
      addi s1,zero,0xD
      bne s2,s1,teclaPause
      addi s9,zero,44
      sb s9,t6
      la a0,pTeclaPrtScr
      j leds
		teclaPause:
      addi s1,zero,0xE
      bne s2,s1,segundaFila
      addi s9,zero,19
      sb s9,t6
      la a0,pTeclaPause
      j leds
#---------------------------------------------------------segunda fila---------------------------------------------------------------------
	segundaFila: 
	addi s1,zero,0x2
	bne s0,s1,terceraFila
		#teclaElevado:
			addi s1,zero,0x0
			bne s2,s1,tecla1
      addi s9,zero,11
      sb s9,t6
			la a0,pTeclaElevado
			j leds
		tecla1:
			addi s1,zero,0x1
			bne s2,s1,tecla2
      addi s9,zero,49
      sb s9,t6
			la a0,pTecla1
			j leds
		tecla2:
			addi s1,zero,0x2
			bne s2,s1,tecla3
      addi s9,zero,50
      sb s9,t6
			la a0,pTecla2
			j leds
		tecla3:
			addi s1,zero,0x3
			bne s2,s1,tecla4
      addi s9,zero,51
      sb s9,t6
			la a0,pTecla3
			j leds
		tecla4:
			addi s1,zero,0x4
			bne s2,s1,tecla5
      addi s9,zero,52
      sb s9,t6
			la a0,pTecla4
			j leds
		tecla5:
			addi s1,zero,0x5
			bne s2,s1,tecla6
      addi s9,zero,53
      sb s9,t6
			la a0,pTecla5
			j leds
		tecla6:
			addi s1,zero,0x6
			bne s2,s1,tecla7
      addi s9,zero,54
      sb s9,t6
			la a0,pTecla6
			j leds
		tecla7:
			addi s1,zero,0x7
			bne s2,s1,tecla8
      addi s9,zero,55
      sb s9,t6
			la a0,pTecla7
			j leds
		tecla8:
			addi s1,zero,0x8
			bne s2,s1,tecla9
      addi s9,zero,56
      sb s9,t6
			la a0,pTecla8
			j leds
		tecla9:
			addi s1,zero,0x9
			bne s2,s1,tecla0
      addi s9,zero,57
      sb s9,t6
			la a0,pTecla9
			j leds
		tecla0:
			addi s1,zero,0xA
			bne s2,s1,teclaBeta
      addi s9,zero,58
      sb s9,t6
			la a0,pTecla0
			j leds
		teclaBeta:
			addi s1,zero,0xB
			bne s2,s1,teclaTilde
      addi s9,zero,99
      sb s9,t6
			la a0,pTeclaBeta
			j leds
		teclaTilde:
			addi s1,zero,0xC
			bne s2,s1,teclaBackSpace
      addi s9,zero,1
      sb s9,t6
			la a0,pTeclaTilde
			j leds
		teclaBackSpace:
			addi s1,zero,0xD
			bne s2,s1,terceraFila
      addi s9,zero,8
      sb s9,t6
			la a0,pTeclaBackSpace
			j leds
#---------------------------------------------------------tecera fila---------------------------------------------------------------------
	#tercera fila 
  terceraFila:
	addi s1,zero,0x4
	bne s0,s1,cuartaFila
  #chequeo por columnas
    #estamos en tecla tab
    addi s1,zero,0x0
    bne s2,s1,teclaQ
    addi s9,zero,9
    sb s9,t6
    la a0,pTeclaTab
    j leds
  teclaQ:
    addi s1,zero,0x1
		bne s2,s1,teclaW
    addi s9,zero,81
    sb s9,t6
		la a0,pTeclaQ
		j leds
  teclaW:
    addi s1,zero,0x2
		bne s2,s1,teclaE
    addi s9,zero,87
    sb s9,t6
		la a0,pTeclaW
		j leds
  teclaE:
    addi s1,zero,0x3
		bne s2,s1,teclaR
    addi s9,zero,69
    sb s9,t6
		la a0,pTeclaE
		j leds
  teclaR:
    addi s1,zero,0x4
		bne s2,s1,teclaT
    addi s9,zero,82
    sb s9,t6
		la a0,pTeclaR
		j leds
  teclaT:
    addi s1,zero,0x5
		bne s2,s1,teclaZ
    addi s9,zero,84
    sb s9,t6
		la a0,pTeclaT
		j leds
  teclaZ:
    addi s1,zero,0x6
		bne s2,s1,teclaU
    addi s9,zero,90
    sb s9,t6
		la a0,pTeclaZ
		j leds
  teclaU:
    addi s1,zero,0x7
		bne s2,s1,teclaI
    addi s9,zero,85
    sb s9,t6
		la a0,pTeclaU
		j leds
  teclaI:
    addi s1,zero,0x8
		bne s2,s1,teclaO
    addi s9,zero,73
    sb s9,t6
		la a0,pTeclaI
		j leds
  teclaO:
    addi s1,zero,0x9
		bne s2,s1,teclaP
    addi s9,zero,79
    sb s9,t6
		la a0,pTeclaO
		j leds
  teclaP:
    addi s1,zero,0xA
		bne s2,s1,teclaUDieresis
    addi s9,zero,80
    sb s9,t6
		la a0,pTeclaP
		j leds
  teclaUDieresis:
    addi s1,zero,0xB
		bne s2,s1,teclaMas
    addi s9,zero,219
    sb s9,t6
		la a0,pTeclaUDieresis
		j leds
  teclaMas:
    addi s1,zero,0xC
		bne s2,s1,teclaEnter
    addi s9,zero,43
    sb s9,t6
		la a0,pTeclaMas
		j leds
  teclaEnter:
    addi s1,zero,0xD
		bne s2,s1,teclaPgUp
    addi s9,zero,13
    sb s9,t6
		la a0,pTeclaEnter
		j leds
  teclaPgUp:
    addi s1,zero,0xE
		bne s2,s1,cuartaFila
    addi s9,zero,33
    sb s9,t6
		la a0,pTeclaPgUp
		j leds
#---------------------------------------------------------cuarta fila---------------------------------------------------------------------   
  cuartaFila:
	addi s1,zero,0x8
	bne s0,s1,quintaFila
    #recorro por columnas
    addi s1,zero,0x0
    bne s2,s1,teclaA
    addi s9,zero,20
    sb s9,t6
    la a0,pTeclaCaps
    j leds
  teclaA:
    addi s1,zero,0x1
    bne s2,s1,teclaS
    addi s9,zero,65
    sb s9,t6
    la a0,pTeclaA
    j leds
  teclaS:
    addi s1,zero,0x2
    bne s2,s1,teclaD
    addi s9,zero,83
    sb s9,t6
    la a0,pTeclaS
    j leds
  teclaD:
    addi s1,zero,0x3
    bne s2,s1,teclaF
    addi s9,zero,68
    sb s9,t6
    la a0,pTeclaD
    j leds
  teclaF:
    addi s1,zero,0x4
    bne s2,s1,teclaG
    addi s9,zero,70
    sb s9,t6
    la a0,pTeclaF
    j leds
  teclaG:
    addi s1,zero,0x5
    bne s2,s1,teclaH
    addi s9,zero,71
    sb s9,t6
    la a0,pTeclaG
    j leds
  teclaH:
    addi s1,zero,0x6
    bne s2,s1,teclaJ
    addi s9,zero,72
    sb s9,t6
    la a0,pTeclaH
    j leds
  teclaJ:
    addi s1,zero,0x7
    bne s2,s1,teclaK
    addi s9,zero,74
    sb s9,t6
    la a0,pTeclaJ
    j leds
  teclaK:
    addi s1,zero,0x8
    bne s2,s1,teclaL
    addi s9,zero,75
    sb s9,t6
    la a0,pTeclaK
    j leds
  teclaL:
    addi s1,zero,0x9
    bne s2,s1,teclaODieresis
    addi s9,zero,76
    sb s9,t6
    la a0,pTeclaL
    j leds
  teclaODieresis:
    addi s1,zero,0xA
    bne s2,s1,teclaADieresis
    addi s9,zero,174
    sb s9,t6
    la a0,pTeclaODieresis
    j leds
  teclaADieresis:
    addi s1,zero,0xB
    bne s2,s1,teclaNumeral
    addi s9,zero,175
    sb s9,t6
    la a0,pTeclaADieresis
    j leds
  teclaNumeral:
    addi s1,zero,0xC
    bne s2,s1,teclaPgDn
    addi s9,zero,163
    sb s9,t6
    la a0,pTeclaNumeral
    j leds
  teclaPgDn:
    addi s1,zero,0xD
    bne s2,s1,quintaFila
    addi s9,zero,34
    sb s9,t6
    la a0,pTeclaPgDn
    j leds
#---------------------------------------------------------quinta fila---------------------------------------------------------------------
  quintaFila:
	addi s1,zero,0x10
	bne s0,s1,sextaFila
    addi s1,zero,0x0
    bne s2,s1,teclaMenor
    addi s9,zero,16
    sb s9,t6
    la a0,pTeclaShiftIzq
    j leds
  teclaMenor:
    addi s1,zero,0x1
    bne s2,s1,teclaY
    addi s9,zero,60
    sb s9,t6
    la a0,pTeclaMenor
    j leds
  teclaY:
    addi s1,zero,0x2
    bne s2,s1,teclaX
    addi s9,zero,89
    sb s9,t6
    la a0,pTeclaY
    j leds
  teclaX:
    addi s1,zero,0x3
    bne s2,s1,teclaC
    addi s9,zero,88
    sb s9,t6
    la a0,pTeclaX
    j leds
  teclaC:
    addi s1,zero,0x4
    bne s2,s1,teclaV
    addi s9,zero,67
    sb s9,t6
    la a0,pTeclaC
    j leds
  teclaV:
    addi s1,zero,0x5
    bne s2,s1,teclaB
    addi s9,zero,86
    sb s9,t6
    la a0,pTeclaV
    j leds
  teclaB:
    addi s1,zero,0x6
    bne s2,s1,teclaN
    addi s9,zero,66
    sb s9,t6
    la a0,pTeclaB
    j leds
  teclaN:
    addi s1,zero,0x7
    bne s2,s1,teclaM
    addi s9,zero,78
    sb s9,t6
    la a0,pTeclaN
    j leds
  teclaM:
    addi s1,zero,0x8
    bne s2,s1,teclaComa
    addi s9,zero,77
    sb s9,t6
    la a0,pTeclaM
    j leds
  teclaComa:
    addi s1,zero,0x9
    bne s2,s1,teclaPunto
    addi s9,zero,44
    sb s9,t6
    la a0,pTeclaComa
    j leds
  teclaPunto:
    addi s1,zero,0xA
    bne s2,s1,teclaGuion
    addi s9,zero,46
    sb s9,t6
    la a0,pTeclaPunto
    j leds
  teclaGuion:
    addi s1,zero,0xB
    bne s2,s1,teclaShiftDer
    addi s9,zero,45
    sb s9,t6
    la a0,pTeclaGuion
    j leds
  teclaShiftDer:
    addi s1,zero,0xC
    bne s2,s1,teclaUpKey
    addi s9,zero,16
    sb s9,t6
    la a0,pTeclaShiftDer
    j leds
  teclaUpKey:
    addi s1,zero,0xD
    bne s2,s1,teclaEnd
    addi s9,zero,38
    sb s9,t6
    la a0,pTeclaUpKey
    j leds
  teclaEnd:
    addi s1,zero,0xE
    bne s2,s1,sextaFila
    addi s9,zero,35
    sb s9,t6
    la a0,pTeclaEnd
    j leds
#---------------------------------------------------------sexta fila---------------------------------------------------------------------
  sextaFila:
	addi s1,zero,0x20
	bne s0,s1,leds
	teclaFn:
    addi s1,zero,0x0
    bne s2,s1,teclaCtrl
    addi s9,zero,159
    sb s9,t6
    la a0,pTeclaFn
    j leds
	teclaCtrl:
    addi s1,zero,0x1
    bne s2,s1,teclaAlt
    addi s9,zero,17
      sb s9,t6
    la a0,pTeclaCtrl
    j leds
	teclaAlt:
    addi s1,zero,0x2
    bne s2,s1,teclaSpace
    addi s9,zero,18
    sb s9,t6
    la a0,pTeclaAlt
    j leds
	teclaSpace:
    addi s1,zero,0x3
    bne s2,s1,teclaAltGr
    addi s9,zero,32
    sb s9,t6
    la a0,pTeclaSpace
    j leds
	teclaAltGr:
    addi s1,zero,0x4
    bne s2,s1,teclaInsert
    addi s9,zero,250
    sb s9,t6
    la a0,pTeclaAltGr
    j leds
	teclaInsert:
    addi s1,zero,0x5
    bne s2,s1,teclaDelete
    addi s9,zero,45
    sb s9,t6
    la a0,pTeclaInsert
    j leds
	teclaDelete:
    addi s1,zero,0x6
    bne s2,s1,teclaLeftKey
    addi s9,zero,46
    sb s9,t6
    la a0,pTeclaDelete
    j leds
	teclaLeftKey:
    addi s1,zero,0x7
    bne s2,s1,teclaDownKey
    addi s9,zero,37
    sb s9,t6
    la a0,pTeclaLeftKey
    j leds
	teclaDownKey:
    addi s1,zero,0x8
    bne s2,s1,teclaRightKey
    addi s9,zero,40
    sb s9,t6
    la a0,pTeclaDownKey
    j leds
	teclaRightKey:
    addi s1,zero,0x9
    addi s9,zero,39
    sb s9,t6
    bne s2,s1,leds
    la a0,pTeclaRightKey
    j leds

	leds:
    ecall
      addi s1,zero,0x80
      and s3,s1,t0
      bne s1,s3,eLedsNum
      addi s9,zero,230
      sb s9,t6
      la a0,encendidoLedCaps
      ecall
    eLedsNum: 
      addi s1,zero,0x40
      and s3,s1,t0
      bne s1,s3,eLedsPad
      addi s9,zero,231
      sb s9,t6
      la a0,encendidoLedNum
      ecall
    eLedsPad:
      addi s1,zero,0x20
      and s3,s1,t0
      bne s1,s3,eLedsScroll
      addi s9,zero,232
      sb s9,t6
      la a0,encendidoLedPad
      ecall
    eLedsScroll:
      addi s1,zero,0x10
      and s3,s1,t0
      bne s1,s3,botones
      addi s9,zero,233
      sb s9,t6
      la a0,encendidoLedScroll
      ecall

  botones:
      addi s3,zero,0x80
      and s1,s3,t1
      bne s1,s3,botonDerecho
      addi s9,zero,1
      sb s9,t6
      la a0,pBotonIzquierdo
      ecall
    botonDerecho:
      addi s3,zero,0x40
      and s1,s3,t1
      bne s1,s3,trackball
      addi s9,zero,2
      sb s9,t6
      la a0,pBotonDerecho
      ecall

  trackball:
  	  add a0,zero,zero
      la a0,desplazamientoX
      add s9,zero,a0
      sb s9,t6
      ecall
      li a7,1
      add a0,zero,t2
      ecall
      li a7,4
      la a0,desplazamientoY
      add s9,zero,a0
      sb s9,t6
      ecall
      li a7,1
      add a0,zero,t3
      ecall
