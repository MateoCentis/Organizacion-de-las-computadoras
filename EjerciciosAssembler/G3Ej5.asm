.data
dato1: .word 87
dato2: .word 13
res: .space 4
mod: .space 4
.text
	#carga en t1 y t2 el dato 1 y 2
	lw t1,dato1
	lw t2,dato2
	#pone a0 y a1 en zero
	and a0,zero,zero
	and a1,zero,zero
	#si t2 == 0 va a finsi
si: beq t2,zero,finsi
	#si t2!=0
	
entonces:div a0,t1,t2 #a0=t1/t2
		rem a1,t1,t2#a1=t1 mod t2
		
finsi:	sw a0,res,t0 #guarda a0 en memoria en res
		sw a1,mod,t0 #guarda a1 en memoria en mod
		nop