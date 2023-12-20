.data
cadena1: .asciz "hola" 
		 .align 0
cadena2: .asciz "holaYchau"
		 .align 0
.text
la a0,cadena1
la a1,cadena2

jal devuelveMayorCadena #pone en s1 el resultado (si s1 es 1 es mayor la primera sino la otra 2)
addi a7,zero,10
ecall

devuelveMayorCadena:
addi t0,zero,0
do:
lb t1,(a0)
lb t2,(a1)
beq t1,zero,fin1
beq t2,zero,fin2
addi a0,a0,1
addi a1,a1,1
fin1:
addi s1,zero,2
ret
fin2:
addi s1,zero,1
ret