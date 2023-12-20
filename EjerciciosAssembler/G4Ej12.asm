#dado un vector de caracteres cuente cuantas veces se repite un determinado caracter en el mismo
.data
cadena: .ascii "cadena0"
		.align 0
caracter: .ascii "n"
.text
la a0,cadena
lb a1,caracter
#poner contadores en 0
addi t0,zero,0 
addi t2,zero,0
do:
lb t1,(a0)
beq t1,zero,fin #termina cuándo lea 0
bne a1,t1,distinto
addi t2,t2,1
distinto:
#aumento contador y puntero
addi t0,t0,1
addi a0,a0,1	
j do
fin: addi t2,t2,-1
