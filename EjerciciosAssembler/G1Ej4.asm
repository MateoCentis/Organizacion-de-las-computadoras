.text 
	lui t0,0x12345#se carga en t0 el valor 0x12345
	sw	t0,(sp)
	lui a1,0x10010
	lw	t1,(sp)
	sw	t1,(a1)
	
	li	a7,10
	ecall
	
#a)el programa escribe en la memoria dos veces, una al principio y otra en un elemento de la pila.
#b)el valor de t0 se almacena en un lugar de la pila.
#c)Se asigna ese valor a a1 porque es la primera direccion de memoria a escribir, aqui se guarda luego el valor de t1.
