.data
cadena: .asciz "ORGANIZACION DE LAS COMPUTADORAS CON RISC V"
		.align 2
cant:	.byte -1
		.align 2
caract: .ascii "A"
.text 
	la a0,cadena #carga en a0 la direccion en memoria que apunta a cadena
	lb t1,caract #se carga la A en t1 
	ori a1,zero,0 #contador 
ini: lb t0,0(a0) #carga en t0 el primer valor de la cadena (vector de caracteres)
	bne t0,t1,distin #hasta que t0 sea distinto a la A
	addi a1,a1,1 #aumento el contador de A's
distin: beq t0,zero,fin #si t0 es igual a 0 termina 
	addi a0,a0,1 #aumenta la posicion del puntero
	j ini
fin: sw a1,cant,t6 #Guarda la cantidad de A's en memoria en la direccion 0x10200.. +c (a y b)

	la a0,cadena #puntero que apunta a la cadena
	li a7,4 
	ecall
	ori a7,zero,10
	ecall


