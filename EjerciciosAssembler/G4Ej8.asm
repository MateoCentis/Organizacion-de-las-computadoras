#Programa modificado para cambiar las letras A por las letras X
.data
cadena: .asciz "ORGANIZACION DE LAS COMPUTADORAS CON RISC V"
		.align 2
caract: .ascii "A"
caracterX: .ascii "x"
.text 
	la a0,cadena #carga en a0 la direccion en memoria que apunta a cadena
	lb t1,caract #se carga la A en t1 
	lb s1,caracterX
ini: lb t0,(a0) #carga en t0 el primer valor de la cadena (vector de caracteres)
	bne t0,t1,distin #Si t0 es distinto a t1, es decir, no es una A salte a distin
	sb s1,(a0)  #Piso el valor con la x
distin: beq t0,zero,fin #si t0 es igual a 0 termina 
	addi a0,a0,1 #aumenta la posicion del puntero
	j ini
fin:
	la a0,cadena #puntero que apunta a la cadena
	li a7,4 
	ecall
	ori a7,zero,10
	ecall


